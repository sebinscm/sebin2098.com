<%@page import="java.sql.*" %>
<%@page import="common.*" %>
<%@page import="dbconn.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%
String ag_id = request.getParameter("ag_id");

String sql = "";
int iRet = 0;
int iCnt = 0;
boolean isSucceeded = false;
String strMsg = "";
Connection conn = null;
PreparedStatement pstmt = null;

try {

  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  conn.setAutoCommit(false);

  // init password
  sql = " update  login_01t "
      + " set     passwd = '1111' "
      + " where   id = ? ";

  int idx = 0;
  pstmt = conn.prepareStatement(sql);
  pstmt.setString(++idx, ag_id);
  iCnt = pstmt.executeUpdate();

  if (iCnt != 1) {
    throw new UserDefinedException("Check your data.");
  }

  conn.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  strMsg = ue.getMessage();
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  System.out.println("Exception /account/init_password : " + e.getMessage());
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
if (isSucceeded) strMsg = "The data are successfully processed.";
else strMsg = "The operation failed.\\n" + strMsg;
%>
<html>
<head>
<title></title>
</head>
<body>
<form name="form1" method="post" action="./supplier_view.jsp">
<input type='hidden' name='ag_id' value='<%= ag_id %>'>
</form>
<script language="javascript">
  alert('<%= strMsg %>');
  document.form1.submit();
</script>
</body>
</html>
