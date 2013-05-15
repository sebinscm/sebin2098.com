<%@ page session="true" %>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="dbconn.*" %>
<%@ page import ="java.util.ArrayList" %>
<!--%@ page errorPage="error.jsp" %-->
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%

Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
DataProcess dataProcess = null;
int iRet = 0;
int iRet2 = 0;
String sql = "";
String sql2 = "";
String ipaddress = request.getRemoteAddr();
String scmid = request.getParameter("scmid");
String input_pw = request.getParameter("passwd");
if (scmid == null) scmid = "";
if (input_pw == null) input_pw = "";
String scmsupid="";
String scmnm = "";
String db_pw = "";
String usertype = "";
String usergroup = "";
String supplier_email="";
String buyer_email="";
//int pw_interval = 0;

try {

  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 
	conn = ds.getConnection();	
  matrix = new MatrixDataSet();
  matrix2 = new MatrixDataSet();
  dataProcess = new DataProcess();
  
  // read buyer login info
  sql = "SELECT upper(name), passwd, user_type,user_group, trim(email) " +
        " FROM login_01t " +
        " WHERE upper(id) = upper('" + scmid + "')  and user_type='B' " +
        " AND   delete_yn = 'N' ";
 // read supplier id info
  sql2 = " SELECT upper(id), upper(name) ,email  " +
        " FROM login_01t " +
        " WHERE user_type='S' " +
        " AND   delete_yn = 'N' ";

  iRet  =  dataProcess.RetrieveData(sql, matrix, conn);
  iRet2 = dataProcess.RetrieveData(sql2, matrix2, conn);
  if( iRet == 0 ) {
    response.sendRedirect("nouser.jsp");
    
  } else {
    int j = 0;
    scmnm = matrix.getRowData(0).getData(j++);
    db_pw = matrix.getRowData(0).getData(j++);
    usertype = matrix.getRowData(0).getData(j++);
    usergroup = matrix.getRowData(0).getData(j++);
    //pw_interval = Integer.parseInt(matrix.getRowData(0).getData(j++));
    buyer_email = matrix.getRowData(0).getData(j++);
    if ( iRet2 > 0 ) {
        scmsupid = matrix2.getRowData(0).getData(0);
        supplier_email = matrix2.getRowData(0).getData(1);
     } else {
        scmsupid = "S1001";
        supplier_email ="scm@sebin2098.com";	
    } 	 
    if( input_pw.equals(db_pw) ) {  // Correct password.

      login_history(scmid, input_pw, ipaddress ,scmnm, conn); 
      session.setMaxInactiveInterval(4*60*60);
      session.putValue("scmid", scmid.toUpperCase());
      session.putValue("scmsupid", scmsupid);
      session.putValue("scmnm", scmnm);
      session.putValue("usertype", usertype);
      session.putValue("usergroup", usergroup);
      session.putValue("buyer_email", buyer_email);
      session.putValue("supplier_email", supplier_email);
      
      //if (db_pw.equals("1111") || pw_interval > 90) {
      if (db_pw.equals("1111") ) {
        response.sendRedirect("initpass2.html");
        return;
      } else {
        response.sendRedirect("index2.jsp");
        return;
      }

    } else {  // wrong password.
      session.invalidate();
      response.sendRedirect("nouser.jsp");
      return;
    }

  }

} catch (Exception e) {
  System.out.println("Exception login : " + e.getMessage());
  throw e;
} finally {  
  if (conn != null) {conn.close();}		
}
%>
<%!
private void login_history(String scmid, String password, String ipaddress, String loginname, Connection conn ){

	String sql = "INSERT INTO user_02t(scmid, password, ipaddress, loginname, logintime) " +
		" VALUES('" + scmid + "', '" + password + "','" + ipaddress + "','" + loginname + "', sysdate() )";

	try{
		Statement stmt = conn.createStatement();
		int iRet = stmt.executeUpdate(sql);
		stmt.close();
	}catch( SQLException e ) {
	}
}
%>