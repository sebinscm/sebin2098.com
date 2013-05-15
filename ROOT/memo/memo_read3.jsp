<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="dbconn.*" %>>
<%@ page errorPage="../error.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ include file="../login_check.jsp" %>
<%
String seqno = request.getParameter("seqno");
int iCnt = 0;
boolean isSucceeded = false;
String strMsg = "";

Connection conn = null;
PreparedStatement pstmt = null;
try {

  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  // insert/update/delete 처리...
  conn.setAutoCommit(false);
	 
 String sql = "INSERT INTO s_memo_02t(SEQNO, COMNAME, STAFFID, STAFFNAME, RDATE) " +
			"VALUES(" + seqno + ",'" + scmnm.replaceAll("'", "''") + "','" + scmid + "','" +
				scmnm.replaceAll("'", "''") + "',sysdate()) ";
	pstmt = conn.prepareStatement(sql);

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

  System.out.println("Exception /admin/adminuser/save : " + e.getMessage());
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
if (isSucceeded) strMsg = "Received Successfully.";
else strMsg = "The operation failed.\\n" + strMsg;
%>
<html>
<head>
<title></title>
</head>
<body>
<form name="form1" method="post" action="./memo.jsp">
	<input type="hidden" name="seqno" value="<%= seqno %>">
</form>
<script language="javascript">
  alert("<%= strMsg %>");
  document.form1.submit();
</script>
</body>
</html>
