<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="dbconn.*" %>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
request.setCharacterEncoding("euc-kr"); 
String adminId = request.getParameter("adminId");
String adminName = request.getParameter("adminName");

String password = request.getParameter("password");
String adminType = request.getParameter("adminType");
String adminGroup = request.getParameter("adminGroup");
String brand = request.getParameter("brand");
String adminClass = request.getParameter("adminClass");
String actionFlag = request.getParameter("actionFlag");
//out.println(adminName);
//if (true) return;
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

  // insert/update/delete 처리...
  int idx = 1;
  conn.setAutoCommit(false);

  // actionFlag에 따라 처리함.
  if (actionFlag.equals("I")) {

    // insert...
    sql = " insert into admin_01t "
        + " ( "
        + "   adminid, adminname, password, admintype, admingroup, brand, adminclass "
        + " ) "
        + " values "
        + " ( "
        + "   ?, ?, ?, ?, ?, ?, ? "
        + " ) ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, adminId);
    pstmt.setString(idx++, adminName);
    pstmt.setString(idx++, password);
    pstmt.setString(idx++, adminType);
    pstmt.setString(idx++, adminGroup);
    pstmt.setString(idx++, brand);
    pstmt.setString(idx++, adminClass);

  } else if (actionFlag.equals("U")) {

    // update..
    sql = " update  admin_01t "
        + " set "
        + "   adminname = ?, "
        + "   admintype = ?, "
        + "   admingroup = ?, "
        + "   brand = ?, "
        + "   adminclass = ? "
        + " where   adminid = ? ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, adminName);
    pstmt.setString(idx++, adminType);
    pstmt.setString(idx++, adminGroup);
    pstmt.setString(idx++, brand);
    pstmt.setString(idx++, adminClass);
    pstmt.setString(idx++, adminId);

  } else if (actionFlag.equals("D")) {

    // delete..
    sql = " delete from admin_01t "
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

// 결과 메시지 처리
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
