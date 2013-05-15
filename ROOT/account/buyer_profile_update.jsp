<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="dbconn.*" %>
<%@page import="org.apache.commons.mail.SimpleEmail" %>
<%@ page errorPage="../error.jsp" %>
<%@ include file="/login_check.jsp" %>
<%@ include file="../bottom_line.jsp" %>
<%
String id       = request.getParameter("id");
String name     = request.getParameter("name");
String email    = request.getParameter("email").trim();
String phone1   = request.getParameter("phone1").trim();
String phone2   = request.getParameter("phone2").trim();
String fax      = request.getParameter("fax").trim();
String contact  = request.getParameter("contact").trim();
String addr1    = request.getParameter("addr1").trim();
String addr2    = request.getParameter("addr2").trim();
String postcode = request.getParameter("postcode").trim();
String surburb  = request.getParameter("surburb").trim();
String state    = request.getParameter("state").trim();
String country    = request.getParameter("country").trim();

String before_email    = "";
String before_phone1   = "";
String before_phone2   = "";
String before_fax      = "";
String before_contact  = "";
String before_addr1    = "";
String before_addr2    = "";
String before_postcode = "";
String before_surburb  = "";
String before_state    = "";
String before_country    = "";
String sql = "";
int iCnt = 0;
int iRet = 0;
boolean isSucceeded = false;
String strMsg = "";
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
Connection conn = null;
PreparedStatement pstmt = null;
String outS ="";

try {

  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();

  // read profile information
  sql = "select email,"+
        "       phone1,"+
        "       phone2,"+
        "       fax,"+
        "       contact,"+
        "       addr1,"+
        "       addr2,"+
        "       postcode,"+
        "       surburb,"+
        "       state,country "+
        "  from login_01t " +
        " where id = '" + id + "'" ;

  iRet = dataProcess.RetrieveData(sql, matrix, conn);            
  
  if (iRet > 0) {
    int j = 0;
    before_email    = matrix.getRowData(0).getData(j++);
    before_phone1   = matrix.getRowData(0).getData(j++);
    before_phone2   = matrix.getRowData(0).getData(j++);
    before_fax      = matrix.getRowData(0).getData(j++);
    before_contact  = matrix.getRowData(0).getData(j++);
    before_addr1    = matrix.getRowData(0).getData(j++);
    before_addr2    = matrix.getRowData(0).getData(j++);
    before_postcode = matrix.getRowData(0).getData(j++);
    before_surburb  = matrix.getRowData(0).getData(j++);
    before_state    = matrix.getRowData(0).getData(j++);
    before_country    = matrix.getRowData(0).getData(j++);
  }

  // update profile information
  sql = " update login_01t " +
        "   set email      = ?," +
        "       phone1     = ?," +
        "       phone2     = ?," +
        "       fax        = ?," +
        "       contact    = ?," +
        "       addr1      = ?," +
        "       addr2      = ?," +
        "       postcode   = ?," +
        "       surburb    = ?," +
        "       state      = ?," +
        "       country      = ?," +
        "       updated    = sysdate() " +
        " where id         = ?";

  int idx = 0;
  conn.setAutoCommit(false);
  pstmt = conn.prepareStatement(sql);
  pstmt.setString(++idx, email);
  pstmt.setString(++idx, phone1);
  pstmt.setString(++idx, phone2);
  pstmt.setString(++idx, fax);
  pstmt.setString(++idx, contact);
  pstmt.setString(++idx, addr1);
  pstmt.setString(++idx, addr2);
  pstmt.setString(++idx, postcode);
  pstmt.setString(++idx, surburb);
  pstmt.setString(++idx, state);
  pstmt.setString(++idx, country);
  pstmt.setString(++idx, id);
  iCnt = pstmt.executeUpdate();
  pstmt.close();
  pstmt = null;

  if (iCnt != 1) {
    throw new UserDefinedException("Check your data.");
  }
  
  // log email if it is changed
  if (!before_email.equals(email)) {
    sql = " insert  into login_03t (supplier_id, change_date, action_id, old_value, new_value) "
        + " values  (?, sysdate(), ?, ?, ?) ";

    idx = 0;
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(++idx, id);
    pstmt.setString(++idx, scmid);
    pstmt.setString(++idx, before_email);
    pstmt.setString(++idx, email);
    pstmt.executeUpdate();
  }

  conn.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  System.out.println("Exception /account/profile_update : " + ue.getMessage());
  throw ue;
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  System.out.println("Exception /account/profile_update : " + e.getMessage());
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
<form name="form1" method="post" action="./view_profile.jsp">
</form>
<script language="javascript">
  alert('<%= strMsg %>');
  document.form1.submit();
</script>
</body>
</html>
