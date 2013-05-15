<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="dbconn.*" %>
<%@ page errorPage="error.jsp" %>
<%@ include file="/login_check.jsp" %>
<%

if (scmid != null) scmid = request.getParameter("id");

String password = request.getParameter("password");
String oldPassword = "";

String sql = "";
int iCnt = 0;
String strMsg = "";
boolean isSucceeded = false;
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
PreparedStatement pstmt = null;

try {

  if (password.equals("1111")) {
    throw new UserDefinedException("<font color=red>변경할 수 없는 비밀번호입니다! 다시 입력하세요.</font>");
  }

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 
  conn = ds.getConnection();	
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();

  // read old password
  sql = " select  passwd "
      + " from    login_01t "
      + " where   upper(id) = upper('" + scmid + "') ";
  
  iCnt = dataProcess.RetrieveData(sql, matrix, conn);

  if (iCnt > 0) {
    oldPassword = matrix.getRowData(0).getData(0);
  } else {
    throw new UserDefinedException("Can't find Supplier Information.");
  }

  if (password.equals(oldPassword)) {
    throw new UserDefinedException("<font color=red>변경할 수 없는 비밀번호입니다! 새로운 비밀번호로 다시 입력하세요.</font>");
  }

  // update
  int idx = 0;
  conn.setAutoCommit(false);

  sql = " update  login_01t "
      + " set     passwd = ?, pw_date = sysdate() "
      + " where   id = ? ";

  pstmt = conn.prepareStatement(sql);
  pstmt.setString(++idx, password);
  pstmt.setString(++idx, scmid);

  iCnt = pstmt.executeUpdate();

  if (iCnt != 1) {
    throw new UserDefinedException("<font color=red>비밀번호 변경이 실패되었습니다!</font>");
  }

  conn.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}
  strMsg = ue.getMessage();
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}
  strMsg = "System error! Please check your login ID and password again!";
  System.out.println("Exception code_initpass : " + e.getMessage());
} finally {
  if (pstmt != null) {
    try { pstmt.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
  }
}
if (isSucceeded) strMsg = "The data are successfully processed.";
else strMsg = "The operation failed.\\n" + strMsg;

%>

<html>
<head>
<title></title>
</head>
<body>
<form name="form1" method="post" action="/account/view_profile.jsp" >
	<input type='hidden' name='ag_id' value='<%= scmid %>'>
</form>
<script language="javascript">
  alert('<%= strMsg %>');
  document.form1.submit();
</script>
</body>
</html>

<HTML>
<HEAD>
<script language="javascript">
function Back()
{
  document.form1.action = '/account/view_profile.jsp';
  document.form1.submit();
}
</script>
</HEAD>

