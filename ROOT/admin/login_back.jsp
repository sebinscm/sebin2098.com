<%@ page session="true" %>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="dbconn.*" %>
<%@ page import ="java.util.ArrayList" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/common/CommonVars.jsp" %>
<%
Connection conn = null;
dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;
int iRet = 0;
String sql = "";

String ipaddress = request.getRemoteAddr();
String adminid = request.getParameter("adminid");
String input_pw = request.getParameter("passwd");
if (adminid == null) adminid = "";
if (input_pw == null) input_pw = "";

String adminname = "";
String db_pw_enc = "";
String input_pw_enc = "";
String db_pw = "";
String admintype = "";
String admingroup = "";
int pw_interval = 0;
String approval = "";
String adminclass = "";
String admin_email="";
try {
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();

  //////////////////////////////////////////////////////////////////////////
  // check id, pw from admin ID
  sql = " select  password "
      + " from    admin_01t "
      + " where   adminid = '" + adminid + "' ";

  //out.println(sql);
  //if (true) return; 
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  if (iRet <= 0) {
    response.sendRedirect("nouser.html");
    return;
  }

  int j = 0;
  db_pw_enc = matrix.getRowData(0).getData(j++);
  if (!db_pw_enc.equals(input_pw)) {
    response.sendRedirect("./pw_error.html");
    return;
  }


  sql = " SELECT adminname, admintype, admingroup, approval, adminclass,email " +
        " FROM admin_01t " +
        " WHERE adminid = '" + adminid + "' " ;


  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  if (iRet <= 0) {
    response.sendRedirect("nouser.html");
    return;
  }

  j = 0;
  adminname = matrix.getRowData(0).getData(j++);
  admintype = matrix.getRowData(0).getData(j++);
  admingroup = matrix.getRowData(0).getData(j++);
  approval= matrix.getRowData(0).getData(j++);
  adminclass = matrix.getRowData(0).getData(j++);
  admin_email = matrix.getRowData(0).getData(j++);
  login_history(adminid, input_pw, ipaddress ,adminname, conn);  
  session.setMaxInactiveInterval(4*60*60);
  session.putValue("adminid", adminid);
  session.putValue("adminname", adminname);
  session.putValue("admintype", admintype);
  session.putValue("admingroup", admingroup);
  session.putValue("approval", approval);
  session.putValue("adminclass", adminclass);
  session.putValue("admin_email", admin_email);
  response.sendRedirect("index2.jsp");

} catch (Exception e) {
  System.out.println("Exception login : " + e.getMessage());
  throw e;
} finally {  
		if (conn != null) {conn.close();}		
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