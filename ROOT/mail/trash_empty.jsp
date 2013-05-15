<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="dbconn.*" %>
<%@ include file="login_check.jsp" %>

<%
DBConnManager dbPool = null;
boolean connState = false;
int iRet = 0;

// String userid = (String) session.getAttribute("userid");
String sql ="DELETE FROM mail_02t WHERE userid = '" + userid +
		"' AND del_flag = '1'";

dbPool = DBConnManager.getInstance();
Connection conn = dbPool.getConnection("intranet");
if( conn == null ) {
	connState = false;
} else {
	connState = true;
}

// Receiver's table
if( connState ) {
	Statement stmt = conn.createStatement();
	iRet = stmt.executeUpdate(sql);
	stmt.close();
	dbPool.freeConnection("intranet", conn);
	connState = false;
}

response.sendRedirect("mail_trash.jsp");
%>
