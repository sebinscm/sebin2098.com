<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="dbconn.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

request.setCharacterEncoding("euc-kr"); 
String adminId = request.getParameter("adminId");
String adminName = request.getParameter("adminName");
String password = request.getParameter("password");
String adminType = request.getParameter("adminType");
String adminGroup = request.getParameter("adminGroup");
String approval = request.getParameter("approval");
String adminClass = request.getParameter("adminClass");
String email = request.getParameter("email");
String actionFlag = request.getParameter("actionFlag");

String sql = "";
int iCnt = 0;
boolean isSucceeded = false;
String strMsg = "";
Connection conn = null;
PreparedStatement pstmt = null;

try {

  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  // insert/update/delete ó��...
  int idx = 1;
  conn.setAutoCommit(false);

  // actionFlag�� ���� ó����.
  if (actionFlag.equals("I")) {

    // insert...
    sql = " insert into admin_01t "
        + " ( "
        + "   adminid, adminname, password, admintype, admingroup, approval, adminclass,email "
        + " ) "
        + " values "
        + " ( "
        + "   ?, ?, ?, ?, ?, ?, ?,? "
        + " ) ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, adminId);
    pstmt.setString(idx++, adminName);
    pstmt.setString(idx++, password);
    pstmt.setString(idx++, adminType);
    pstmt.setString(idx++, adminGroup);
    pstmt.setString(idx++, approval);
    pstmt.setString(idx++, adminClass);
    pstmt.setString(idx++, email);

  } else if (actionFlag.equals("U")) {

    // update..
    sql = " update  admin_01t "
        + " set "
        + "   adminname = ?, "
        + "   admintype = ?, "
        + "   admingroup = ?, "
        + "   approval = ?, "
        + "   email = ?, "
        + "   adminclass = ? "
        + " where   adminid = ? ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, adminName);
    pstmt.setString(idx++, adminType);
    pstmt.setString(idx++, adminGroup);
    pstmt.setString(idx++, approval);
    pstmt.setString(idx++, email);
    pstmt.setString(idx++, adminClass);
    pstmt.setString(idx++, adminId);

  } else if (actionFlag.equals("D")) {

    // delete..
    sql = " delete  from admin_01t "
        + " where   adminid = ? ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, adminId);

  } else if (actionFlag.equals("P")) {

    // initialize password..
    sql = " update  admin_01t "
        + " set     password = '1111' "
        + " where   adminid = ? ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, adminId);

  } else {

    throw new UserDefinedException("The action is unknown.");

  }

  // execute ...
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

// ��� �޽��� ó��
if (isSucceeded) strMsg = "The data are successfully processed.";
else strMsg = "The operation failed.\\n" + strMsg;
%>
<html>
<head>
<title></title>
</head>
<body>
<form name="form1" method="post" action="./list.jsp">
</form>
<script language="javascript">
  alert('<%= strMsg %>');
  document.form1.submit();
</script>
</body>
</html>
