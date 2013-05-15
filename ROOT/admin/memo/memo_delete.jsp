<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="dbconn.*" %>
<%@ include file="/admin/login_check.jsp" %>
<!--%@ page errorPage="../../error.jsp" %-->
<%@ include file="../bottom_line.jsp" %>

<%
String seqno = "";
String title = "";
String content = "";

seqno = request.getParameter("seqno");
title = request.getParameter("title");
content = request.getParameter("content");

boolean isSucceeded = false;
String strMsg = "";
int iRet = 0;

Connection conn = null;

String sql2 = "";
String sql = "UPDATE t_memo_01t " +
        "SET dflag=? " +
        " WHERE seqno = '" + seqno + "'";

String outS ="";
PreparedStatement pstmt = null;
PreparedStatement pstmt1 = null;
try {

        Context ic = new InitialContext(); 
	      DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	      conn = ds.getConnection();
	    conn.setAutoCommit(false); 
        pstmt = conn.prepareStatement(sql);
        pstmt.setString( 1, "1" );
        iRet = pstmt.executeUpdate();
        if( iRet > 0 ) {                
            sql2  = " UPDATE s_memo_03t " +
                    "   SET dflag=? " +
                    " WHERE seqno = '" + seqno + "'";
             pstmt1 = conn.prepareStatement(sql2);
             pstmt1.setString( 1, "1" );
             pstmt1.executeUpdate();
             pstmt1.close();
        } else {
                throw new UserDefinedException("Check your data.");
        }        
        pstmt.close();
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
  if (pstmt1 != null) {
    try { pstmt1.close(); } catch (Exception e) {}
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