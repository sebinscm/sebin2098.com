<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="oracle.sql.CLOB" %>
<%@page import="javax.naming.*"%>
<%@page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<%@page import="com.namo.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<!--%@ page errorPage="../../error.jsp" %-->
<%@ include file="../bottom_line.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
boolean isSucceeded = false;
request.setCharacterEncoding("euc-kr"); 
HashMap params = new HashMap();               // parameter 저장 임시 변수
String savePath = application.getRealPath(_memoDataUrl) + File.separator;   // file path

// Jakarta Commons 프로젝트의 FileUpload 모듈을 사용함.
// -> http://jakarta.apache.org/commons/fileupload/
DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setRepository(new File(_uploadPath));                 // Set factory constraints
ServletFileUpload upload = new ServletFileUpload(factory);    // Create a new file upload handler
upload.setSizeMax(_maxFileSize);                              // Set overall request size constraint
List items = upload.parseRequest(request);                    // Parse the request

// Process the uploaded items
Iterator iter = items.iterator();

while (iter.hasNext()) {

  FileItem item = (FileItem) iter.next();

  if (item.isFormField()) {

    // Process a regular form field
    params.put(item.getFieldName(), item.getString());

  } else {

    // Process a file upload
    String fieldName = item.getFieldName();
    String fileName = item.getName();
    long sizeInBytes = item.getSize();

    // File Size가 0인 경우 무시함.
    if (sizeInBytes == 0) {
      continue;
    }

    int pos = fileName.lastIndexOf("\\");
    if (pos < 0) fileName.lastIndexOf("/");

    String attachFileName = fileName.substring(pos+1);
    String attachRealFileName = attachFileName;
    String name = "";
    String ext = "";
    int i = 0;

    File writeFile = new File(savePath + attachRealFileName);

    pos = attachRealFileName.lastIndexOf(".");
    if (pos < 0) {
      name = attachRealFileName;
    } else {
      name = attachRealFileName.substring(0, pos);
      ext = attachRealFileName.substring(pos);
    }

    while(writeFile.exists())
    {
      attachRealFileName = name + "[" + (i++) + "]" + ext;
      writeFile = new File(savePath + attachRealFileName);
    }

    // File 정보 저장
    item.write(writeFile);
    params.put(fieldName, attachRealFileName);

  }

} // end of while

// Database 처리
// Parameter Setting
String receiver_list = (String) params.get("receiver");
String title = (String) params.get("title");
String contents = (String) params.get("contents");
String f_name = (String) params.get("file_name");

boolean check = false;
int r_count = 0;
int next_line = 0;
String result = "";
String outS = "";
String sql = "";

Connection conn = null;

// Namo Content 처리  ///////////////////////////////////////////////////
// MIME 디코딩 하기
NamoMime mime = new NamoMime();
mime.setSaveURL(request.getScheme() + "://" + request.getHeader("Host") + _memoDataUrl);
mime.setSavePath(savePath);
mime.decode(contents);					// MIME 디코딩
mime.saveFile();						// 포함한 파일 저장하기
contents = mime.getBodyContent();
//////////////////////////////////////////////////////////////////////////
//out.println("1"+receiver_list+"2"+title+"3"+contents+"4"+f_name);
//out.println(_adminid+"-"+_adminname+"-"+conn);
//if (true) return;
try {
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
  conn.setAutoCommit(false);   // CLOB를 업데이트 하는 동안 다른 process의 접근을 막기 위해 반드시 설정을 해야 한다.
 
  int seqno = insert_send( _adminid, _adminname, title, contents, conn, f_name );
  StringTokenizer id_token = new StringTokenizer( receiver_list, ";");
  
  while( id_token.hasMoreElements() ) {
    String id_name = (String) id_token.nextElement();
    String[] strArr = id_name.split("\\^", 2);
  
    check = insert_recv( seqno, strArr[0], strArr[1], title, conn );
    if (check) {
      r_count++;
      next_line++;
      outS += "<TD><font size=2>" + strArr[1] + "</font></TD>\n";
      if( next_line == 4 ) {
        next_line = 0;
        outS +="</TR><TR>";
      }
    }
  }

  conn.commit();
  isSucceeded = true;
  if( r_count > 0 ) {
    result = "작성된 공지사항이 아래 선택된 회사로 성곡적으로 처리가 되었습니다!";
  }
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}
  throw e;
} finally {
  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}   
    conn.close();
  }
}
%>
<%!
private int insert_send(String userid, String username, String title, 
  String contents, Connection conn, String f_name) throws Exception
{

  int iRet = 0;
  int seqno = 0;

  // Sender's table
  String sql ="";
  Statement stmt = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  sql = "SELECT max(seqno) " +
              "  FROM t_memo_01t " +
        " WHERE seqno < 999999 " +
              " ORDER BY seqno desc" ;  
  try {    
    stmt = conn.createStatement();    
    rs = stmt.executeQuery(sql);        
    if( rs.next() )
      seqno = rs.getInt(1) + 1;
    else
      seqno = 1;
            
    // Receiver table;
    sql = "INSERT INTO t_memo_01t( SEQNO, ADMINID, ADMINNAME, IDATE, DFLAG, TITLE, AFNAME, CONTENTS ) " +
          "VALUES( ?, ?, ?, sysdate,'0', ?, ?, EMPTY_CLOB() )";
    
    pstmt = conn.prepareStatement(sql);

    pstmt.setInt(1, seqno);
    pstmt.setString(2, userid);
    pstmt.setString(3, username);
    pstmt.setString(4, title);
    pstmt.setString(5, f_name);

    iRet = pstmt.executeUpdate();    
    pstmt.close();
  	// CLOB update
  	sql = " SELECT CONTENTS FROM T_MEMO_01T WHERE SEQNO = " + seqno + " FOR UPDATE ";
  	stmt = conn.createStatement();
  	rs = stmt.executeQuery(sql);
  
  	BufferedWriter writer = null;
	  if (rs. next()) {
			     CLOB clob = (CLOB)rs.getObject("CONTENTS");              //------>중요			     
			     writer = new BufferedWriter(clob.getCharacterOutputStream());
			     writer.write(contents);
			     //writer.flush();
			     writer.close();
			     writer = null;
	  }	
		 
  	
  	// for oracle 10g used
  	//if (rs.next()) {
  	//	oracle.sql.CLOB tmpContent = (oracle.sql.CLOB)rs.getObject(1);
  	//	Writer contentWriter = tmpContent.getCharacterOutputStream();
  	//	contentWriter.write(contents);
  	//	contentWriter.flush();
  	//	contentWriter.close();
    //}
  
  	rs.close();
  
  	if( iRet == 0 ) {
  		return 0;
  	} else {
  		return seqno;
  	}
  } finally {
    if (rs != null) {
      try { rs.close(); } catch (Exception e) {}
    }
  
    if (stmt != null) {
      try { stmt.close(); } catch (Exception e) {}
    }
  
    if (pstmt != null) {
      try { pstmt.close(); } catch (Exception e) {}
    }
  }

} // end of insert_send

private boolean insert_recv(int seqno, String comid, String comnm,
  String title,  Connection conn) throws SQLException
{

  int iRet = 0;
  PreparedStatement pstmt = null;
  
  // Receiver's table
  String sql = "INSERT INTO S_MEMO_03T( SEQNO, COMNAME, IDATE, DFLAG, TITLE, COMID ) " +
    "VALUES(?, ?, sysdate, '0', ?, ?)";

  try {
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, seqno);
    pstmt.setString(2, comnm);
    pstmt.setString(3, title);
    pstmt.setString(4, comid);
    iRet = pstmt.executeUpdate();
    pstmt.close();

    return ((iRet > 0) ? true : false);  
  } finally {
    if (pstmt != null) {
      try { pstmt.close(); } catch (Exception e) {}
    }
  }

}
if (isSucceeded) strMsg = "공지사항이 성공적으로 처리 되었습니다.";
else strMsg = "The operation failed.\\n" + strMsg;
%>
<html>
<head>
<title></title>
</head>
<body>
<form name="form1" method="post" action="./index.jsp">
</form>
<script language="javascript">
  alert('<%= strMsg %>');
  document.form1.submit();
</script>
</body>
</html>
