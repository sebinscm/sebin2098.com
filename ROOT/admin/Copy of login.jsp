<%@ page session="true" %>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="dbconn.*" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%
dbconn.DBConnManager dbPool = null;
Connection conn = null;
Connection connLogin = null;
dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;
int iRet = 0;
String sql = "";

String ipaddress = request.getRemoteAddr();
String adminid = request.getParameter("adminid");
String input_pw = request.getParameter("password");
if (adminid == null) adminid = "";
if (input_pw == null) input_pw = "";

String adminname = "";
String db_pw_enc = "";
String input_pw_enc = "";
String db_pw = "";
String admintype = "";
String admingroup = "";
int pw_interval = 0;
String brand = "";
String adminclass = "";

try {
  
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();

  //////////////////////////////////////////////////////////////////////////
  // check id, pw from intranet
  sql = " select  password, password('" + input_pw + "') "
      + " from    user_01t "
      + " where   userid = '" + adminid + "' "
      + " and     status in ('A', 'D') ";
  //out.println(sql);

  Class.forName(_mysqlJdbcDriver);
  connLogin = DriverManager.getConnection(_urlLogin, _userLogin, _pwLogin);

  iRet = dataProcess.RetrieveData(sql, matrix, connLogin);

  if (iRet <= 0) {
    response.sendRedirect("nouser.html");
    return;
  }

  int j = 0;
  db_pw_enc = matrix.getRowData(0).getData(j++);
  input_pw_enc = matrix.getRowData(0).getData(j++);

  if (!db_pw_enc.equals(input_pw_enc)) {
    response.sendRedirect("./pw_error.html");
    return;
  }
  //////////////////////////////////////////////////////////////////////////

  // check user info in SCM
  dbPool = dbconn.DBConnManager.getInstance();
  conn = dbPool.getConnection("intranet");

  sql = " SELECT adminname, admintype, admingroup, brand, adminclass " +
        " FROM admin_01t " +
        " WHERE adminid = '" + adminid + "' " +
        " AND   admintype = 'H' ";

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  if (iRet <= 0) {
    response.sendRedirect("nouser.html");
    return;
  }

  j = 0;
  adminname = matrix.getRowData(0).getData(j++);
  admintype = matrix.getRowData(0).getData(j++);
  admingroup = matrix.getRowData(0).getData(j++);
  brand = matrix.getRowData(0).getData(j++);
  adminclass = matrix.getRowData(0).getData(j++);

  login_history(adminid, input_pw, ipaddress ,adminname, conn);  
  session.setMaxInactiveInterval(4*60*60);
  session.putValue("adminid", adminid);
  session.putValue("adminname", adminname);
  session.putValue("admintype", admintype);
  session.putValue("admingroup", admingroup);
  session.putValue("brand", brand);
  session.putValue("adminclass", adminclass);

  response.sendRedirect("index2.jsp");

} catch (Exception e) {
  System.out.println("Exception login : " + e.getMessage());
  throw e;
} finally {
  if (connLogin != null) {
    try { connLogin.close(); } catch (Exception e) {}
  }

  if (conn != null) { dbPool.freeConnection("intranet", conn); }
}
%>
<%!
private void login_history(String adminid, String password, String ipaddress, String loginname, Connection conn ){

	String sql = "INSERT INTO user_02t(scmid, password, ipaddress, loginname, logintime) " +
		" VALUES('" + adminid + "', '" + password + "','" + ipaddress + "','" + loginname + "', sysdate )";

	try{
		Statement stmt = conn.createStatement();
		int iRet = stmt.executeUpdate(sql);
		stmt.close();
	}catch( SQLException e ) {
	}
}
%>