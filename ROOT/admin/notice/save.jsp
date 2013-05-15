<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="common.*" %>
<%@page import="common.util.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<%@page import="com.namo.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
request.setCharacterEncoding("euc-kr"); 
boolean isSucceeded = false;
String strMsg = "";

HashMap params = new HashMap();               // parameter 저장 임시 변수
List oldAttachedFiles = new ArrayList();         // attachedFile 저장 임시 변수
List attachedFiles = new ArrayList();           // attachFile 저장 임시 변수
String savePath = application.getRealPath(_ManagementNoticeUploadUrl) + File.separator;   // file path

// Jakarta Commons 프로젝트의 FileUpload 모듈을 사용함.
// -> http://jakarta.apache.org/commons/fileupload/
DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setRepository(new File(_uploadPath2));                 // Set factory constraints
ServletFileUpload upload = new ServletFileUpload(factory);    // Create a new file upload handler
upload.setSizeMax(_maxFileSize);                              // Set overall request size constraint
List items = upload.parseRequest(request);                    // Parse the request

try {

  // Process the uploaded items
  Iterator iter = items.iterator();

  while (iter.hasNext()) {

    FileItem item = (FileItem) iter.next();

    if (item.isFormField()) {

      // Process a regular form field
      String name = item.getFieldName();

      if (name.equals("oldAttachedFile")) {
        oldAttachedFiles.add(item.getString());
      } else {
        params.put(name, item.getString());
      }

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
      String[] fileNames = {attachFileName, attachRealFileName};
      attachedFiles.add(fileNames);
      item.write(writeFile);

    }

  } // end of while

  isSucceeded = true;

} catch (Exception e) {
  isSucceeded = false;
  strMsg = e.getMessage();
}

// Parameter Setting
String curPage = (String) params.get("curPage");
String pageSize = (String) params.get("pageSize");
String seqNo = (String) params.get("seqNo");
String searchCategory = (String) params.get("searchCategory");
String searchKeyword = (String) params.get("searchKeyword");
String title = (String) params.get("title");
String content = (String) params.get("content");

//out.println(title);
//if (true) return;

// Database 처리
if (isSucceeded) {

  String sql = "";
  
  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;
  DataProcess dataProcess = null;
  PreparedStatement pstmt = null;
  PreparedStatement pstmt2 = null;
  PreparedStatement pstmt3 = null;

  // Namo Content 처리  ///////////////////////////////////////////////////
  // MIME 디코딩 하기
  NamoMime mime = new NamoMime();
  mime.setSaveURL(request.getScheme() + "://" + request.getHeader("Host") + _ManagementNoticeUploadUrl);
  mime.setSavePath(savePath);
  mime.decode(content);					// MIME 디코딩
  mime.saveFile();						// 포함한 파일 저장하기
  content = mime.getBodyContent();
  //////////////////////////////////////////////////////////////////////////

  try {

    dataProcess = new dbconn.DataProcess();
     Context ic = new InitialContext(); 
	 DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	 conn = ds.getConnection();

    int idx = 0;
    conn.setAutoCommit(false);

    if (seqNo != null && seqNo.length() > 0) {

      // update ...
      sql = " update  scm_notice_01t "
          + " set     title = ?, "
          + "         content = ?, "
          + "        	modify_date = sysdate() "
          + " where   seqno = ? "
          + " and     admin_id = ? ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setString(++idx, convert_to_ascii(title));
      pstmt.setString(++idx, convert_to_ksc(content));
      pstmt.setLong(++idx, Long.parseLong(seqNo));
      pstmt.setString(++idx, _adminid);

    } else {

      // select seqno
      //sql = " select  notice_seq.nextval from dual ";
      //stmt = conn.createStatement();
      //rs = stmt.executeQuery(sql);
      //if (rs.next()) seqNo = rs.getString(1);
      //rs.close();
      //stmt.close();

      // insert ...
      sql = " insert  into scm_notice_01t "
          + " ( "
          + "  	 input_date,     admin_id,       admin_name,     title, "
          + "  	content,        read_cnt,       modify_id,      modify_date "
          + " ) "
          + " values "
          + " ( sysdate(), ?, ?, ?, ?, 0, ?, sysdate() ) ";

      pstmt = conn.prepareStatement(sql);
      //pstmt.setLong(++idx, Long.parseLong(seqNo));
      pstmt.setString(++idx, _adminid);
      pstmt.setString(++idx, _adminname);
      pstmt.setString(++idx, convert_to_ksc(content));
      pstmt.setString(++idx, title.trim() );
      pstmt.setString(++idx, _adminid);

    }

    // execute ...
    pstmt.executeUpdate();

    // update CLOB type content
    //sql = " select  content "
    //    + " from    scm_notice_01t "
    //    + " where   seqno = " + seqNo
    //    + " and     admin_id = '" + _adminid + "' "
    //    + " for update ";

    //stmt = conn.createStatement();
    //rs = stmt.executeQuery(sql);

  	//if (rs.next()) {
  //		oracle.sql.CLOB tmpContent = (oracle.sql.CLOB) rs.getObject(1);
  //		Writer contentWriter = tmpContent.getCharacterOutputStream();
  //		contentWriter.write(convert_to_ksc(content));
  //		contentWriter.flush();
  //		contentWriter.close();
   // }

    //rs.close();

    // processing attach files ...
    // attached files DB delete ..
    int size = oldAttachedFiles.size();
    if (size > 0) {
      String seqNoes = "";
      for (int i = 0; i < size; i++) {
        String oldAttachedFile = (String) oldAttachedFiles.get(i);
        seqNoes += oldAttachedFile.substring(0, oldAttachedFile.indexOf("/"));
        if (i < (size - 1)) seqNoes += ",";
      }

      sql = " delete  from scm_notice_02t "
          + " where   notice_seqno = ? "
          + " and     seqno in (" + seqNoes + ") ";

      pstmt2 = conn.prepareStatement(sql);
      pstmt2.setLong(1, Long.parseLong(seqNo));
      pstmt2.executeUpdate();
    }

    // attach files db insert ..
    size = attachedFiles.size();
    if (size > 0) {
      // read max file seqno
      int fileSeqNo = 1;

      sql = " select  ifnull(max(seqno) + 1, 1) "
          + " from    scm_notice_02t "
          + " where   notice_seqno = " + seqNo;

      rs = stmt.executeQuery(sql);

      if (rs.next()) {
        fileSeqNo = rs.getInt(1);
      }

      sql = " insert  into scm_notice_02t "
          + " ( notice_seqno, seqno, attach_file, attach_real_file ) "
          + " values ( ?,  ?,  ?,  ? ) ";

      pstmt3 = conn.prepareStatement(sql);

      for (int i = 0; i < size; i++) {
        String[] fileNames = (String[]) attachedFiles.get(i);

        idx = 0;
        pstmt3.setLong(++idx, Long.parseLong(seqNo));
        pstmt3.setInt(++idx, fileSeqNo++);
        pstmt3.setString(++idx, fileNames[0]);
        pstmt3.setString(++idx, fileNames[1]);
        pstmt3.executeUpdate();
      }
    }

    conn.commit();

  } catch (SQLException se) {
    try { conn.rollback(); } catch (Exception ex) {}

    isSucceeded = false;
    strMsg = "Check your data. " + se.getMessage();
    System.out.println("Exception save : " + se.getMessage());
    //throw se;
  } catch (Exception e) {
    try { conn.rollback(); } catch (Exception ex) {}

    isSucceeded = false;
    strMsg = "Error occurred. " + e.getMessage();
    System.out.println("Exception save : " + e.getMessage());
    throw e;
  } finally {
    if (rs != null) {
      try { rs.close(); } catch (Exception e) {}
    }

    if (pstmt != null) {
      try { pstmt.close(); } catch (Exception e) {}
    }

    if (pstmt2 != null) {
      try { pstmt2.close(); } catch (Exception e) {}
    }

    if (pstmt3 != null) {
      try { pstmt3.close(); } catch (Exception e) {}
    }

    if (conn != null) {
      try { conn.setAutoCommit(true); } catch (Exception e) {}
       conn.close();
    }
  }

}

// attached files 삭제
// isSucceeded == true -> oldAttached files 삭제
// isSucceeded == false -> attached files 삭제
int size = 0;

if (isSucceeded) {

  size = oldAttachedFiles.size();
  if (size > 0) {
    for (int i = 0; i < size; i++) {
      String oldAttachedFile = (String) oldAttachedFiles.get(i);
      String fileName = oldAttachedFile.substring(oldAttachedFile.indexOf("/") + 1);

      try {
        File file = new File(savePath + fileName);
        if (file.exists()) { file.delete(); }
      } catch (Exception e) {}
    }
  }

} else {

  size = attachedFiles.size();
  if (size > 0) {
    for (int i = 0; i < size; i++) {
      String[] fileNames = (String[]) attachedFiles.get(i);

      try {
        File file = new File(savePath + fileNames[1]);
        if (file.exists()) { file.delete(); }
      } catch (Exception e) {}
    }
  }

}

// 결과 메시지 처리
if (isSucceeded) strMsg = "The data are successfully processed.";
else strMsg = "The operation failed.\\n" + StringUtil.replace(StringUtil.replace(strMsg, "\"", "\\\""), "\n", "\\n");
%>

<%!
private String convert_to_ksc(String str) {
		String result = null;
		try {
			byte[] rawBytes = str.getBytes("8859_1");
			result = new String(rawBytes, "KSC5601");
		} catch(UnsupportedEncodingException e) {
			System.err.println(e.toString());
		}
		return result;
	}
private String convert_to_ascii(String str) {		
		String result = null;
		try {
			byte[] kscBytes = str.getBytes("KSC5601");
			result = new String(kscBytes, "8859_1");
		} catch(UnsupportedEncodingException e) {
			System.err.println(e.toString());
		}
		return result;
	}	
%>
<html>
<head>
<title></title>
</head>
<body>
<form name="form1" method="post" action="./list.jsp">
<input type="hidden" name="curPage" value="<%= curPage %>">
<input type="hidden" name="pageSize" value="<%= pageSize %>">
<input type="hidden" name="searchCategory" value="<%= searchCategory %>">
<input type="hidden" name="searchKeyword" value="<%= searchKeyword %>">
</form>
<script language="javascript">
  alert("<%= strMsg %>");
  document.form1.submit();
</script>
</body>
</html>
