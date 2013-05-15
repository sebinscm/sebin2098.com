<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="dbconn.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
request.setCharacterEncoding("euc-kr"); 
String suppId = request.getParameter("suppId");
String suppName = request.getParameter("suppName");
String password = request.getParameter("password");
String email = request.getParameter("email");
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String fax = request.getParameter("fax");
String contact = request.getParameter("contact");
String addr1 = request.getParameter("addr1");
String addr2 = request.getParameter("addr2");
String postcode = request.getParameter("postcode");
String surburb = request.getParameter("surburb");
String state = request.getParameter("state");
String country = request.getParameter("country");
String user_type = "B"; //Buyer type
String user_group = request.getParameter("user_group");
String supplier_class = request.getParameter("supplier_class");
String use_yn = request.getParameter("use_yn");
String ship_port = request.getParameter("ship_port");
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
    sql = " insert into login_01t "
        + " ( "
        + "   id, name, passwd, email, phone1, phone2, fax, contact , addr1, addr2, postcode, surburb, state,country,"
        + "   user_type, user_group, supplier_class, delete_yn, ship_port, regdate "
        + " ) "
        + " values "
        + " ( "
        + "   ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?,?,?,?,?,?, sysdate() "
        + " ) ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, suppId);
    pstmt.setString(idx++, suppName);
    pstmt.setString(idx++, password);
    pstmt.setString(idx++, email);
    pstmt.setString(idx++, phone1);
    pstmt.setString(idx++, phone2);
    pstmt.setString(idx++, fax);
    pstmt.setString(idx++, contact);
    pstmt.setString(idx++, addr1);
    pstmt.setString(idx++, addr2);
    pstmt.setString(idx++, postcode);
    pstmt.setString(idx++, surburb);
    pstmt.setString(idx++, state);
    pstmt.setString(idx++, country);
    pstmt.setString(idx++, user_type);
    pstmt.setString(idx++, user_group);
    pstmt.setString(idx++, supplier_class);
    pstmt.setString(idx++, use_yn);
    pstmt.setString(idx++, ship_port);


  } else if (actionFlag.equals("U")) {

    // update..
    sql = " update  login_01t "
        + " set "
        + "   name = ? , "
        + "   email = ? , "
        + "   phone1 = ? , "
        + "   phone2 = ? , "
        + "   fax = ? ,"
        + "   contact = ? ,"
        + "   addr1 = ? , "
        + "   addr2 = ? , "
        + "   postcode = ? , "
        + "   surburb = ? , "
        + "   state = ? , "
        + "   country = ? , "
        + "   user_type = ? , "
        + "   user_group = ? , "
        + "   supplier_class = ? , "
        + "   delete_yn = ? , " 
        + "   ship_port = ? , " 
        + "   updated = sysdate() "        
        + " where   id = ? ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, suppName);
    pstmt.setString(idx++, email);
    pstmt.setString(idx++, phone1);
    pstmt.setString(idx++, phone2);
    pstmt.setString(idx++, fax);
    pstmt.setString(idx++, contact);
    pstmt.setString(idx++, addr1);
    pstmt.setString(idx++, addr2);
    pstmt.setString(idx++, postcode);
    pstmt.setString(idx++, surburb);
    pstmt.setString(idx++, state);
    pstmt.setString(idx++, country);
    pstmt.setString(idx++, user_type);
    pstmt.setString(idx++, user_group);
    pstmt.setString(idx++, supplier_class);
    pstmt.setString(idx++, use_yn);
    pstmt.setString(idx++, ship_port);  
    pstmt.setString(idx++, suppId);

  } else if (actionFlag.equals("D")) {

    // delete..
    sql = " delete from login_01t "
        + " where   id = ? ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, suppId);

  } else if (actionFlag.equals("P")) {

    // initialize password..
    sql = " update  login_01t "
        + " set     passwd = '1111' "
        + " where   id = ? ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, suppId);

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

  System.out.println("Exception /admin/account/save : " + e.getMessage());
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
<form name="form1" method="post" action="./supplier.jsp">
</form>
<script language="javascript">
  alert('<%= strMsg %>');
  document.form1.submit();
</script>
</body>
</html>
