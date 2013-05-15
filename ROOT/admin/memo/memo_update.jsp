<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%--<%@page import="oracle.sql.CLOB" %>--%>
<%@page import="dbconn.*" %>
<%@page import="com.namo.*" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="../bottom_line.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%

String savePath = application.getRealPath(_memoDataUrl) + File.separator;   // file path

String seqno = request.getParameter("seqno");
String title = request.getParameter("title");
String contents = request.getParameter("contents");
title = new String(title.getBytes("8859_1"),"KSC5601");
contents = new String(contents.getBytes("8859_1"),"KSC5601");
boolean isSucceeded = false;
String strMsg = "";

Connection conn = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
int iRet = 0;
String sql  = "";
String outS = "";

// Namo Content 처리  ///////////////////////////////////////////////////
// MIME 디코딩 하기
NamoMime mime = new NamoMime();
mime.setSaveURL(request.getScheme() + "://" + request.getHeader("Host") + _memoDataUrl);
mime.setSavePath(savePath);
mime.decode(contents);					// MIME 디코딩
mime.saveFile();						// 포함한 파일 저장하기
contents = mime.getBodyContent();
//////////////////////////////////////////////////////////////////////////

try {

  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  conn.setAutoCommit(false);

  // update t_memo_01t
  sql = " update  t_memo_01t "
      + " set     title = ?, "
      + "         contents  = ? "
      + " where   seqno = ? ";

  pstmt = conn.prepareStatement(sql);
  pstmt.setString(1, title);
  pstmt.setString(2, contents);
  pstmt.setInt(3, Integer.parseInt(seqno));
  iRet = pstmt.executeUpdate();
  pstmt.close();

  if (iRet > 0) {
    // CLOB update
    //sql = " select contents from t_memo_01t where seqno = " + seqno + " for update ";
    //stmt = conn.createStatement();
    //rs = stmt.executeQuery(sql);
    //BufferedWriter writer = null;
    //if (rs. next()) {
	//		     CLOB clob = (CLOB)rs.getObject("CONTENTS");              //------>중요			     
	//		     writer = new BufferedWriter(clob.getCharacterOutputStream());
	//		     writer.write(contents);
	//		     writer.flush();
	//		     writer.close();
	//		     writer = null;
	// }	
    //rs.close();
    
    

    // update s_memo_03t
    sql = " update  s_memo_03t "
        + " set     title = ? "
        + " where   seqno = ? ";
        
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setInt(2, Integer.parseInt(seqno));
    pstmt.executeUpdate();
    
    conn.commit(); 
    isSucceeded = true;   
  } else {
    conn.rollback();    
  }

} catch (Exception e) {
  System.out.println("Exception /admin/memo/memo_update : " + e.getMessage());
  throw e;
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

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
     conn.close();
  }
}
// 결과 메시지 처리
if (isSucceeded) strMsg = "The data are successfully processed.";
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