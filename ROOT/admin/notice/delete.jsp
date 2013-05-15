<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

String curPage = request.getParameter("curPage");
String pageSize = request.getParameter("pageSize");
String searchCategory = request.getParameter("searchCategory");
String searchKeyword = request.getParameter("searchKeyword");
String seqNo = request.getParameter("seqNo");

boolean isSucceeded = false;
String strMsg = "";

int iRet = 0;
int iCnt = 0;
String sql = "";

Connection conn = null;
PreparedStatement pstmt = null;
PreparedStatement pstmt2 = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;

try {

    dataProcess = new dbconn.DataProcess();
     Context ic = new InitialContext(); 
	 DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	 conn = ds.getConnection();

  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();

  conn.setAutoCommit(false);

  // delete notice ...
  sql = " delete  from scm_notice_01t "
      + " where   seqno = ? "
      + " and     admin_id = ? ";

  pstmt = conn.prepareStatement(sql);
  pstmt.setLong(1, Long.parseLong(seqNo));
  pstmt.setString(2, _adminid);
  iCnt = pstmt.executeUpdate();

  if (iCnt == 0) {
    throw new UserDefinedException("Cannot find data. Check the seqNo. " + seqNo);
  }

  // read attach files
  sql = " select  attach_real_file "
      + " from    scm_notice_02t "
      + " where   notice_seqno = " + seqNo;

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  // delete attach files if they exist
  if (iRet > 0) {
    sql = " delete  from scm_notice_02t "
        + " where   notice_seqno = ? ";

    pstmt2 = conn.prepareStatement(sql);
    pstmt2.setLong(1, Long.parseLong(seqNo));
    pstmt2.executeUpdate();
  }

  conn.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  strMsg = ue.getMessage();
  System.out.println("Exception delete save : " + ue.getMessage());
} catch (SQLException se) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  strMsg = "Check your data. " + se.getMessage();
  System.out.println("Exception delete : " + se.getMessage());
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  strMsg = "Error occurred. " + e.getMessage();
  System.out.println("Exception delete : " + e.getMessage());
  throw e;
} finally {
  if (pstmt != null) {
    try { pstmt.close(); } catch (Exception e) {}
  }

  if (pstmt2 != null) {
    try { pstmt2.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
  }
}

// attached files 삭제
if (isSucceeded) {
  if (iRet > 0) {
    String savePath = application.getRealPath(_ManagementNoticeUploadUrl) + File.separator;

    for (int i = 0; i < iRet; i++) {
      String fileName = matrix.getRowData(i).getData(0);

      try {
        File file = new File(savePath + fileName);
        if (file.exists()) { file.delete(); }
      } catch (Exception e) {}
    }
  }
}

// 결과 메시지 처리
if (isSucceeded) strMsg = "The data are successfully processed.";
else strMsg = "The operation failed.\\n" + StringUtil.replace(StringUtil.replace(strMsg, "\"", "\\\""), "\n", "\\n");
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
