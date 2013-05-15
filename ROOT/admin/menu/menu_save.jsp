<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
request.setCharacterEncoding("euc-kr"); 

String actionFlag = request.getParameter("actionFlag");
String menuType = request.getParameter("menuType");
String seqNo = request.getParameter("seqNo");
String userGroup = request.getParameter("userGroup");
String parentNo = request.getParameter("parentNo");
String menuName = request.getParameter("menuName").trim();
String menuUrl = request.getParameter("menuUrl").trim();
String sortNo = request.getParameter("sortNo").trim();

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
  conn.setAutoCommit(false);
  int idx = 1;

  // actionFlag에 따라 처리함.
  if (actionFlag.equals("I")) {

    // insert Order Detail ...
    sql = " insert into menu_t "
        + " (    menu_type,        user_group,     menuname,       menuurl,        sort_no, "
        + "   parent_no,      staffid,          input_date,     modifyid,       modify_date ) "
        + " values ( "
        + "     ?,  ?,  ?,  ?,  ?,  ?,  ?, sysdate(),  ?, sysdate() ) ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, menuType);
    pstmt.setString(idx++, userGroup);
    pstmt.setString(idx++, menuName);
    pstmt.setString(idx++, menuUrl);
    pstmt.setString(idx++, sortNo);
    pstmt.setLong(idx++, Long.parseLong(parentNo));
    pstmt.setString(idx++, _adminid);
    pstmt.setString(idx++, _adminid);

  } else if (actionFlag.equals("U")) {

    // update..
    sql = " update  menu_t "
        + " set "
        + "         user_group = ?, "
        + "         menuname = ?, "
        + "         menuurl = ?, "
        + "         sort_no = ?, "
        + "         parent_no = ?, "
        + "         modifyid = ?, "
        + "         modify_date = sysdate() "
        + " where   seqno = ? ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, userGroup);
    pstmt.setString(idx++, menuName);
    pstmt.setString(idx++, menuUrl);
    pstmt.setString(idx++, sortNo);
    pstmt.setLong(idx++, Long.parseLong(parentNo));
    pstmt.setString(idx++, _adminid);
    pstmt.setLong(idx++, Long.parseLong(seqNo));

  } else if (actionFlag.equals("D")) {

    // delete..
    sql = " delete  from menu_t "
        + " where   seqno = ? ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setLong(idx++, Long.parseLong(seqNo));

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
  try {
      conn.rollback();
  } catch (Exception ex) {}

  isSucceeded = false;
  strMsg = ue.getMessage();
} catch (SQLException se) {
  try {
      conn.rollback();
  } catch (Exception ex) {}
  System.out.println("SQLException menu_save : " + se.getMessage());

  isSucceeded = false;
  strMsg = StringUtil.replace(se.getMessage(), "\n", "\\n");
} catch (Exception e) {
  try {
      conn.rollback();
  } catch (Exception ex) {}
  System.out.println("Exception menu_save : " + e.getMessage());

  throw e;
} finally {
  try {
    if (pstmt != null) { pstmt.close(); }
  } catch (Exception e) {}

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
<form name="form1" method="post" action="./menu_list.jsp">
<input type="hidden" name="menuType" value="<%= menuType %>">
</form>
<script language="javascript">
  alert("<%= strMsg %>");
  document.form1.submit();
</script>
</body>
</html>
