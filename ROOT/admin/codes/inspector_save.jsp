<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="dbconn.*" %>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/apess/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%
String inspectorId = request.getParameter("inspectorId").trim();
String inspectorName = request.getParameter("inspectorName").trim();
//String userType = request.getParameter("userType");
//String origin = request.getParameter("origin");
String useYn = request.getParameter("useYn");
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

  // insert/update/delete 처리...
  int idx = 0;
  conn.setAutoCommit(false);

  // actionFlag에 따라 처리함.
  if (actionFlag.equals("I")) {

    // insert...
    sql = " insert into VG_INSPECTOR "
        + " ( "
        + "   code, name,  use_yn, creator, create_date "
        + " ) "
        + " values "
        + " ( "
        + "   ?, ?, ?, ?, sysdate, ? "
        + " ) ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(++idx, inspectorId);
    pstmt.setString(++idx, inspectorName);
 //   pstmt.setInt(++idx, Integer.parseInt(origin));
    pstmt.setString(++idx, useYn);
    pstmt.setString(++idx, (_adminid != null ? _adminid : _adminid));
//    pstmt.setString(++idx, userType);

  } else if (actionFlag.equals("U")) {

    // update..
    sql = " update  VG_INSPECTOR "
        + " set "
        + "   name = ?, "
  //      + "   origin = ?, "
        + "   use_yn = ?, "
        + "   creator = ?, "
        + "   create_date = sysdate "
  //      + "   user_type = ? "
        + " where   code = ? ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(++idx, inspectorName);
//    pstmt.setInt(++idx, Integer.parseInt(origin));
    pstmt.setString(++idx, useYn);
    pstmt.setString(++idx, (_adminid != null ? _adminid : _adminid));
//    pstmt.setString(++idx, userType);
    pstmt.setString(++idx, inspectorId);

  } else if (actionFlag.equals("D")) {

    // delete..
    sql = " delete  VG_INSPECTOR "
        + " where   code = ? ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(++idx, inspectorId);

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

  System.out.println("Exception /apess/inspector_save : " + e.getMessage());
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
<form name="form1" method="post" action="./inspector_list.jsp">
</form>
<script language="javascript">
  alert('<%= strMsg %>');
  document.form1.submit();
</script>
</body>
</html>
