<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="dbconn.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%
String password = request.getParameter("password");
String fromURL = request.getParameter("fromURL");
String oldPassword = "";

String sql = "";
int iCnt = 0;
boolean isSucceeded = false;
String strMsg = "";
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
PreparedStatement pstmt = null;

String targetUrl = "";

try {

  if (password.equals("1111")) {
    throw new UserDefinedException("The new password is not acceptable. Change your password.");
  }

  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();

  sql = " select  password "
      + " from    admin_01t "
      + " where   adminid = '" + _adminid + "' ";

  iCnt = dataProcess.RetrieveData(sql, matrix, conn);

  if (iCnt > 0) {
    oldPassword = matrix.getRowData(0).getData(0);
  } else {
    throw new UserDefinedException("Can't find User Information.");
  }

  if (password.equals(oldPassword)) {
    throw new UserDefinedException("The new password is not acceptable. Change your password.");
  }

  // update 처리...
  int idx = 0;
  conn.setAutoCommit(false);

  sql = " update  admin_01t "
      + " set     password = ?, pw_date = sysdate() "
      + " where   adminid = ? ";

  pstmt = conn.prepareStatement(sql);
  pstmt.setString(++idx, password);
  pstmt.setString(++idx, _adminid);

  iCnt = pstmt.executeUpdate();

  if (iCnt != 1) {
    throw new UserDefinedException("Password update failed.");
  }

  conn.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  strMsg = ue.getMessage();
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  System.out.println("Exception /admin/resetAdminPasswd : " + e.getMessage());
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

// 결과 메시지 처리
if (isSucceeded) {
  // where to go?
  if (fromURL.equals("menu")) {
    targetUrl = "";
  } else {
    targetUrl = "/admin/index2.jsp";
  }
  strMsg = "The data are successfully processed.";
} else {
  strMsg = "The operation failed.\\n" + strMsg;
  targetUrl = "/admin/resetAdminPasswdForm.jsp";
}
%>
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
<form name="form1" method="post" action="<%= targetUrl %>">
<input type='hidden' name='fromURL' value='<%= fromURL %>'>
</form>
<script language="javascript">
<% if (targetUrl.length() > 0) { %>
  alert('<%= strMsg %>');
  document.form1.submit();
<% } %>
</script>
<table width='840' border='0' cellspacing='0' cellpadding='0'><tr><td>

<table width='99%' border='0' cellspacing='0' cellpadding='0'>
<tr>
  <td height='15' colspan='2'></td>
</tr>
<tr>
  <td width='3%'><img src='/img/title_icon.gif'></td>
  <td width='*' class='left_title'>Password Change</td>
</tr>
<tr>
  <td width='100%' height='2' colspan='2'><hr width='100%'></td>
</tr>
<tr>
  <td height='10' colspan='2'></td>
</tr>
</table>

<table width='90%' border='0' cellspacing='0' cellpadding='0' align='center'>
<tr>
  <td width='100%' align='center'><img border="0" src="/img/pass.jpg">
    <br><br>
    <b>The Password has been changed successfully.</b></td>
</tr>
</table>
<%
out.println(CopyRightLogo());
%>
</tr></td></table>
</body>
</html>