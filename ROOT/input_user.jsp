<%@ page session="true" %>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="dbconn.*" %>
<%@ page errorPage="error.jsp" %>

<%

dbconn.DBConnManager dbPool = null;
boolean connState = false;
int iRet = 0;

String staffid = request.getParameter("staffid");
String staffname = request.getParameter("staffname");
String manager = request.getParameter("manager");
String passwd = request.getParameter("passwd1");
String detail = request.getParameter("detail");

dbPool = dbconn.DBConnManager.getInstance();
Connection conn = dbPool.getConnection("intranet");
if( conn == null ) {
        connState = false;
} else {
        connState = true;
}

String sql = "INSERT INTO USER_01T( STAFFID, STAFFNAME, PASSWD, IDATE, MANAGER, DETAIL) "+
	"VALUES('" + staffid + "','" + staffname + "','" + passwd + "',sysdate,'" +
		manager + "',?)";

if( connState ) {
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, detail);
	iRet = pstmt.executeUpdate();
	pstmt.close();
}
dbPool.freeConnection("intranet", conn);
connState = false;

if( iRet == 0 ) {
	response.sendRedirect("user_error.html"); // User not found.
}else if( iRet == 1 ) {
		response.sendRedirect("index.jsp");
}else { // System error
	response.sendRedirect("system_error.html");
}

%>
<%=manager%>
