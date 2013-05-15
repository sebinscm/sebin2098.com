<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="dbconn.*" %>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_confirm_status = request.getParameter("ag_confirm_status");
String ag_month = request.getParameter("ag_month");
String ag_year = request.getParameter("ag_year");
String ag_invoice_no = request.getParameter("ag_invoice_no");
String ag_po_no = request.getParameter("ag_po_no");
String invoice_no = request.getParameter("invoice_no");
String buyer_id = request.getParameter("buyer_id");

int iCnt = 0;
int iRet = 0;
String sql = "";
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
Connection conn = null;
PreparedStatement pstmt = null;
boolean isSucceeded = false;
String strMsg = "";

try {

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();

  // check shipment  
  sql = " select  confirm_status, bl_filename, iv_filename, pl_filename "
      + " from    shipment_01t "
      + " where   invoice_no = '" + invoice_no + "' "
      + " and     buyer_id = '" + buyer_id + "' ";

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  if (iRet < 1) {
    throw new UserDefinedException("Cannot find this shipment. Check your data.");
  }
  
  int j = 0;
  String confirmStatus = matrix.getRowData(0).getData(j++);
  String blFilename = matrix.getRowData(0).getData(j++);
  String ivFilename = matrix.getRowData(0).getData(j++);
  String plFilename = matrix.getRowData(0).getData(j++);

  if (confirmStatus.equals("Y")) {
    throw new UserDefinedException("Cannot update this shipment. This shipment has been already confirmed. Check your data.");
  }

  // delete shipment info
  conn.setAutoCommit(false);

  // update shipment po list
  sql = " update  shipment_01t  set confirm_status='Y', confirm_date=sysdate(), confirm_id=? "
      + " where   invoice_no = ? "
      + " and     buyer_id = ? ";

  j = 0;
  pstmt = conn.prepareStatement(sql);
  pstmt.setString(++j, buyer_id);
  pstmt.setString(++j, invoice_no);
  pstmt.setString(++j, buyer_id);
  pstmt.executeUpdate();
  pstmt.close();
  pstmt = null;

  
  conn.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  strMsg = ue.getMessage();
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  System.out.println("Exception shipment_delete : " + e.getMessage());
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

// result message
String nextUrl = "";

if (isSucceeded) {
  strMsg = "The data has been successfully processed.";
  nextUrl = "./buyer_shipment_list.jsp";
} else {
  strMsg = "The operation failed.\\n" + strMsg;
  nextUrl = "./buyer_shipment_view.jsp";
}
%>
<HTML>
<head>
</head>
<body>
<form name='form1' method='post'>
<input type='hidden' name='ag_from_date' value='<%= ag_from_date %>'>
<input type='hidden' name='ag_to_date' value='<%= ag_to_date %>'>
<input type='hidden' name='ag_confirm_status' value='<%= ag_confirm_status %>'>	
<input type='hidden' name='ag_month' value='<%= ag_month %>'>
<input type='hidden' name='ag_year' value='<%= ag_year %>'>
<input type='hidden' name='ag_invoice_no' value='<%= ag_invoice_no %>'>
<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
<input type='hidden' name='invoice_no' value='<%= invoice_no %>'>
<input type='hidden' name='buyer_id' value='<%= buyer_id %>'>
</form>
<script language='javascript'>
alert("<%= strMsg %>");
form1.action = '<%= nextUrl %>';
form1.submit();
</script>
</BODY>
</HTML>
