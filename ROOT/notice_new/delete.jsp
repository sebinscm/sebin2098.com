<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="common.*" %>
<%@page import="dbconn.*" %>
<%@page import="com.namo.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

String curPage = request.getParameter("curPage");
String pageSize = request.getParameter("pageSize");
String noticeType = request.getParameter("noticeType");
String searchCategory = request.getParameter("searchCategory");
String searchKeyword = request.getParameter("searchKeyword");
String seqno = request.getParameter("seqno");

boolean isSucceeded = false;
String strMsg = "";

int iRet = 0;
int iCnt = 0;
String sql = "";
Connection conn = null;
PreparedStatement pstmt = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;

try {

  Context ic = new InitialContext(); 
    DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
    conn = ds.getConnection();
  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();

  conn.setAutoCommit(false);

  // notice delete ...
  sql = " delete  from notice_01t "
      + " where   seqno = ? "
      + " and     type = ? " 
      + " and     user_id = ? ";

  int idx = 0;
  pstmt = conn.prepareStatement(sql);
  pstmt.setLong(++idx, Long.parseLong(seqno));
  pstmt.setInt(++idx, Integer.parseInt(noticeType));
  pstmt.setString(++idx, _adminid);
  iCnt = pstmt.executeUpdate();
  pstmt.close();

  if (iCnt > 0) {
    // 첨부파일 정보를 읽어온다.
    sql = " select  attach_real_file "
        + " from    notice_02t "
        + " where   notice_seqno = " + seqno;
  
    iRet = dataProcess.RetrieveData(sql, matrix, conn);
  
    // 첨부파일이 있으면 DB에서 삭제함.
    if (iRet > 0) {
      sql = " delete  from notice_02t "
          + " where   notice_seqno = ? ";
  
      pstmt = conn.prepareStatement(sql);
      pstmt.setLong(1, Long.parseLong(seqno));
      pstmt.executeUpdate();
    }
  }

  conn.commit();
  isSucceeded = true;

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

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
  }
}

// attached files 삭제
if (isSucceeded) {
  if (iRet > 0) {
    String savePath = application.getRealPath(_noticeDataUrl) + File.separator;

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
else strMsg = "The operation failed.\\n" + strMsg;
%>
<html>
<head>
<title></title>
</head>
<body>
<form name="form1" method="post" action="./list.jsp">
<input type="hidden" name="curPage" value="<%= curPage %>">
<input type="hidden" name="pageSize" value="<%= pageSize %>">
<input type="hidden" name="noticeType" value="<%= noticeType %>">
<input type="hidden" name="searchCategory" value="<%= searchCategory %>">
<input type="hidden" name="searchKeyword" value="<%= searchKeyword %>">
</form>
<script language="javascript">
  alert("<%= strMsg %>");
  document.form1.submit();
</script>
</body>
</html>
