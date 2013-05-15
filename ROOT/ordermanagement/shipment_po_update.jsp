<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="dbconn.*" %>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String ag_month = request.getParameter("ag_month");
String ag_year = request.getParameter("ag_year");
String ag_invoice_no = request.getParameter("ag_invoice_no");
String invoice_no = request.getParameter("invoice_no");
String ag_po_no = request.getParameter("ag_po_no");
String supplier_id = request.getParameter("supplier_id");
String buyer_id = request.getParameter("buyer_id");
String actionFlag = request.getParameter("actionFlag");
String[] po_no = request.getParameterValues("po_no");

int iCnt = 0;
int iRet = 0;
String sql = "";
String sql2 = "";
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
  sql = " select  confirm_status "
      + " from    shipment_01t "
      + " where   invoice_no = '" + invoice_no + "' "
      + " and     supplier_id = '" + supplier_id + "' "
      + " and     buyer_id = '" + buyer_id + "' ";
  //out.println(sql);
  //if (true) return;
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  if (iRet < 1) {
    throw new UserDefinedException("Cannot find this shipment. Check your data.");
  }
  
  String confirmStatus = matrix.getRowData(0).getData(0);

  if (confirmStatus.equals("Y")) {
    throw new UserDefinedException("Cannot update this shipment. This shipment has been already confirmed. Check your data.");
  }

  // set po list
  String tmp_po_no = "";
  if (po_no != null) {
    for (int i = 0; i < po_no.length; i++) {
      if (i > 0) tmp_po_no += ",";
      tmp_po_no += "'" + po_no[i] + "'";
    }
  }

  // insert or delete pos to shipment
  int j = 0;
  conn.setAutoCommit(false);

  if (actionFlag.equals("AP")) {
  
    // check POs whether they are already invoiced.
    sql = " select  count(*) "
        + " from    shipment_02t "
        + " where   po_no in (" + tmp_po_no + ") ";
  
    iRet = dataProcess.RetrieveData(sql, matrix, conn);
  
    if (iRet > 0) {
      iCnt = Integer.parseInt(matrix.getRowData(0).getData(0));
    }

    if (iCnt > 0) {
      throw new UserDefinedException("One of the POs has been already included in shipment.\\nCheck your data.");
    }

    // add POs to shipment
    sql = " insert into shipment_02t "
        + " ( "
        + "   po_no, style_no, invoice_no, supplier_id, season, "
        + "   trans_type, order_qty, total_amount, input_date, input_id,buyer_id "
        + " ) "
        + " select  a.order_no, a.style, ?, ?, a.season, "
        + "            a.shipping_type, a.total_qty, (a.total_qty * a.vendor_price) po_amount, sysdate(), ?, ? "
        + " from    purchase_order a "         
        + " where   a.backorder_flag = 'N' "
        + " and     a.order_no in (" + tmp_po_no.replaceAll("'", "") + ") "
        +  " and   not exists ( select  1 "
        + "                                from    shipment_02t c "
        + "                                where   c.po_no = a.po_no ) " 
        + " and     a.order_status between '73' and '73' "
        + " and     a.trans_type = 'FOB' "
//     + " and    a.ex_factory_date >= str_to_date('2010/12/12', 'yyyy/mm/dd') "
        + " order by a.order_no ";
    
   // out.println(sql);
   // if (true) return;
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(++j, invoice_no);
    pstmt.setString(++j, supplier_id);
    pstmt.setString(++j, _adminid);
    pstmt.setString(++j, buyer_id);
    pstmt.executeUpdate();
    pstmt.close();
    pstmt = null;

  } else if (actionFlag.equals("DP")) {
    
    // delete POs from delivery note
    sql = " delete  from shipment_02t "
        + " where   po_no in (" + tmp_po_no + ") "
        + " and     invoice_no = ? "
        + " and     supplier_id = ? "
        + " and     buyer_id = ?  ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(++j, invoice_no);
    pstmt.setString(++j, supplier_id);
    pstmt.setString(++j, buyer_id);
    pstmt.executeUpdate();
    // PO status Update 75->73=ShipmemntÀÛ¼º
    sql2 = " update purchase_order set order_status = '73' "
            +  " where order_no in ( "+ tmp_po_no + ") " 
            +  "     and buyer = '" + buyer_id + "' "
            + "      and supplier = '" + supplier_id + "' " ;
    pstmt.executeUpdate(sql2);        
    pstmt.close();
    pstmt = null;

  } else {

    throw new UserDefinedException("The action is unknown.");

  }

  conn.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  strMsg = ue.getMessage();
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  System.out.println("Exception shipment_po_update : " + e.getMessage());
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
String nextUrl = "./shipment_edit_form.jsp";

if (isSucceeded) {
  strMsg = "The data has been successfully processed.\\nYou must update all attached files as well.";
} else {
  strMsg = "The operation failed.\\n" + strMsg;
}
%>
<HTML>
<head>
</head>
<body>
<form name='form1' method='post'>
<input type='hidden' name='ag_month' value='<%= ag_month %>'>
<input type='hidden' name='ag_year' value='<%= ag_year %>'>
<input type='hidden' name='ag_invoice_no' value='<%= ag_invoice_no %>'>
<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
<input type='hidden' name='invoice_no' value='<%= invoice_no %>'>
<input type='hidden' name='supplier_id' value='<%= supplier_id %>'>
<input type='hidden' name='buyer_id' value='<%= buyer_id %>'>
</form>
<script language='javascript'>
alert("<%= strMsg %>");
form1.action = '<%= nextUrl %>';
form1.submit();
</script>
</BODY>
</HTML>
