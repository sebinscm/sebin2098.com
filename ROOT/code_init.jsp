<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="dbconn.*" %>
<%@ page errorPage="error.jsp" %>
<%@ include file="login_check.jsp" %>
<%
String password = request.getParameter("password");
String oldPassword = "";
String goURL="";
String sql = "";
boolean isSucceeded = false;
String strMsg = "";
int iCnt = 0;

Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
PreparedStatement pstmt = null;

try {

  if (password.equals("1111")) {
    throw new UserDefinedException("The new password is not acceptable. Please try again!");
  }

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 
  conn = ds.getConnection();	
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  // read old password
  sql = " select  passwd "
      + " from    login_01t "
      + " where   id = '" + scmid + "' ";
  
  iCnt = dataProcess.RetrieveData(sql, matrix, conn);

  if (iCnt > 0) {
    oldPassword = matrix.getRowData(0).getData(0);
  } else {
    throw new UserDefinedException("Buyer information not found!");
  }

  if (password.equals(oldPassword)) {
    throw new UserDefinedException("The new password is not acceptable. Please try again!");
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
    throw new UserDefinedException("Password update failed.");
  }

  conn.commit();
  isSucceeded = true;  

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}
  strMsg = ue.getMessage();
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}
  strMsg = "System error occured. Ask to the system administrator.";
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
 
if (isSucceeded) {
  strMsg = "your new password has been changed successfully!";
  goURL="/index2.jsp";
} else {
  strMsg = " New password error! Please check your new password! \\n" + strMsg;	
   goURL = "/initpass2.html";
}	
%>

<html>
<head>
<title></title>
</head>
<body>
<form name="form1" method="post" action='<%= goURL %>' >
<input type='hidden' name='ag_id' value='<%= scmid %>'>	
</form>
<script language="javascript">
  alert('<%= strMsg %>');
  document.form1.submit();
</script>
</body>
</html>
