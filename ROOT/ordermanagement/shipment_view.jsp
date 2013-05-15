<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<%@page import="common.util.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";

String ag_supplier_id = request.getParameter("ag_supplier_id");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_confirm_status = request.getParameter("ag_confirm_status");
String ag_month = request.getParameter("ag_month");
String ag_year = request.getParameter("ag_year");
String ag_invoice_no = request.getParameter("ag_invoice_no");
String invoice_no = request.getParameter("invoice_no");
String buyer_id = request.getParameter("buyer_id");
String supplier_id = request.getParameter("supplier_id");
String ag_po_no = request.getParameter("ag_po_no");
if (ag_supplier_id == null) ag_supplier_id = "";
if (ag_from_date == null) ag_from_date = "";
if (ag_to_date == null) ag_to_date = "";
if (ag_confirm_status == null) ag_confirm_status = "";
if (ag_month == null) ag_month = "";
if (ag_year == null) ag_year = "";
if (ag_invoice_no == null) ag_invoice_no = "";
if (ag_po_no == null) ag_po_no = "";
if (invoice_no == null) invoice_no = "";
if (supplier_id == null) supplier_id = "";
if (buyer_id == null) buyer_id = "";

String confirm_status = "";
String confirm_date = "";
String supplier_name = "";
String buyer_name = "";
String issue_date = "";
String shipping_port_name = "";
String shipping_port_country_name = "";
String handover_date = "";
String shipping_type = "";
String nominated_forwarder = "";
String nominated_forwarder_name = "";
String nominated_forwarder_country_name = "";
String bl_filename = "";
String iv_filename = "";
String pl_filename = "";

int total_order_qty = 0;
double total_amount = 0.0;
boolean isEditable = false;

int iRet = 0;
Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
DataProcess dataProcess = null;

String outS = "";
String sql = "";

try {

  matrix = new dbconn.MatrixDataSet();
  matrix2 = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  // read shipment header info
  sql = " select  s.confirm_status, date_format(s.confirm_date, '%Y/%m/%d'), l.name, date_format(s.issue_date, '%Y/%m/%d'), "
      + "         c1.code_name, c2.code_name,  date_format(s.handover_date, '%Y/%m/%d'), s.shipping_type, "
      + "         c3.code_name, c4.code_name, s.bl_filename, s.iv_filename, s.pl_filename, m.name "
      + " from    shipment_01t s "
      + "         left outer join login_01t l "
      + "           on ( s.buyer_id = l.id )"
      + "         left outer join login_01t m "
      + "           on ( s.supplier_id = m.id )"
      + "         left outer join vg_common_code c1 "
      + "           on ( s.shipping_port = c1.code "
      + "           and c1.type = 'SHIPPING_PORT' )"
      + "         left outer join vg_common_code c2 "
      + "           on ( c1.related_code = c2.code "
      + "           and c2.type = 'COUNTRY_CODE' ) "
      + "         left outer join vg_common_code c3 "
      + "           on ( s.nominated_forwarder = c3.code "
      + "           and c3.type = 'FORWARDER'  ) "
      + "         left outer join vg_common_code c4 "
      + "           on ( c3.related_code = c4.code "
      + "           and c4.type = 'COUNTRY_CODE')  "
      + " where   s.invoice_no = '" + invoice_no + "' "
      + " and     s.buyer_id = '" + buyer_id + "' ";

  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  //out.println(sql);
  // read shipment details
  sql = " select  po_no, style_no, season, trans_type, order_qty, total_amount "
      + " from    shipment_02t "
      + " where   invoice_no = '" + invoice_no + "' "
      + " and     buyer_id = '" + buyer_id + "' "
      + " order by po_no ";

  dataProcess.RetrieveData(sql, matrix2, conn);
  //out.println(sql);
} catch (Exception e) {
  System.out.println("Exception shipment_view : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

// set shipment header info
if (iRet > 0) {
  int j = 0;
  confirm_status = matrix.getRowData(0).getData(j++);
  confirm_date = matrix.getRowData(0).getData(j++);
  buyer_name = matrix.getRowData(0).getData(j++);
  issue_date = matrix.getRowData(0).getData(j++);
  shipping_port_name = matrix.getRowData(0).getData(j++);
  shipping_port_country_name = matrix.getRowData(0).getData(j++);
  handover_date = matrix.getRowData(0).getData(j++);
  shipping_type = matrix.getRowData(0).getData(j++);
  nominated_forwarder_name = matrix.getRowData(0).getData(j++);
  nominated_forwarder_country_name = matrix.getRowData(0).getData(j++);
  bl_filename = matrix.getRowData(0).getData(j++);
  iv_filename = matrix.getRowData(0).getData(j++);
  pl_filename = matrix.getRowData(0).getData(j++);
  supplier_name = matrix.getRowData(0).getData(j++);

  if (!confirm_status.equals("Y")) {
    isEditable = true;
    confirm_date = "";
  }
}

// set shipment details
for (int i = 0; i < matrix2.getRowCount(); i++) {
  int j = 0;
  String po_no = matrix2.getRowData(i).getData(j++);
  String style_no = matrix2.getRowData(i).getData(j++);
  String season = matrix2.getRowData(i).getData(j++);
  String trans_type = matrix2.getRowData(i).getData(j++);
  int order_qty = Integer.parseInt(matrix2.getRowData(i).getData(j++));
  double t_amount = Double.parseDouble(matrix2.getRowData(i).getData(j++));

  total_order_qty += order_qty;
  total_amount += t_amount;

  outS += "<tr align='center' bgcolor='" + (i%2 == 0 ? "#FFFFF0" : "#EEEEE0") + "'>" +
          "<td>" + (i+1) + "</td>" +
          "<td>" + po_no + "</td>" +
          "<td>" + style_no + "</td>" +
          "<td>" + season + "</td>" +
          "<td>" + trans_type + "</td>" +
          "<td align='right'>" + StringUtil.formatNumber(order_qty, QTY_FORMAT) + "</td>" +
          "<td align='right'>" + StringUtil.formatNumber(total_amount, MONEY_FORMAT) + "</td>" +
          "</tr>";
}
%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<SCRIPT LANGUAGE=JavaScript>
<%
if (isEditable && _adminid != null) {
%>
function fnEdit(frm)
{
  frm.action = './shipment_edit_form.jsp';
  frm.submit();
}

function fnDelete(frm)
{
  if (confirm('Do you want to delete this shipment?')) {
    frm.action = './shipment_delete.jsp';
    frm.submit();
  }
}
<%
}
%>

function fnList(frm) {
  frm.action = './<%= (_adminid != null ? "admin_" : "") %>shipment_list.jsp';
  frm.submit();
}

function fnDownload(file) {
  with (document.form2) {
    attachFile.value = file;
    attachRealFile.value = file;
    action = '/common/download.jsp';
    target = 'hiddenFrm';
    submit();
  }
}
</SCRIPT>
</HEAD>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="840" border="0" cellspacing="0" cellpadding="0">
<tr><td>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/title_icon.gif"></td>
  <td width="*" class="left_title">Shipment Details</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<TABLE WIDTH='99%' border="0" cellspacing="1" cellpadding="0" align="center">
<TR>
  <td><font color=blue></font></td>
</TR>
</TABLE>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
  <td width="100%" height="10"></td>
</tr>
</table>
<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%"><b>Shipment Header</b></td>
</tr>
</table>
<TABLE WIDTH='99%' border="0" cellspacing="1" cellpadding="0" align="center" class="table_bg">
<FORM NAME='frmMain' METHOD='POST'>
<input type='hidden' name='ag_supplier_id' value='<%= ag_supplier_id %>'>
<input type='hidden' name='ag_from_date' value='<%= ag_from_date %>'>
<input type='hidden' name='ag_to_date' value='<%= ag_to_date %>'>
<input type='hidden' name='ag_confirm_status' value='<%= ag_confirm_status %>'>
<input type='hidden' name='ag_month' value='<%= ag_month %>'>
<input type='hidden' name='ag_year' value='<%= ag_year %>'>
<input type='hidden' name='ag_invoice_no' value='<%= ag_invoice_no %>'>
<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
<input type='hidden' name='invoice_no' value='<%= invoice_no %>'>
<input type='hidden' name='supplier_id' value='<%= supplier_id %>'>
<input type='hidden' name='buyer_id' value='<%= buyer_id %>'>
<TR>
  <TD width='15%' class='table_header_center'>Buyer Name</TD>
  <TD width='18%' class='table_bg_bright'><%= buyer_name %></TD>
  <TD width='18%' class='table_header_center'>Buyer ID</TD>
  <TD width='22%' class='table_bg_bright'><%= buyer_id %></TD>
  <TD width='15%' class='table_header_center'>Issue Date</TD>
  <TD width='12%' class='table_bg_bright'><%= issue_date %></TD>
</TR>
<TR>
  <TD class='table_header_center'>Invoice No</TD>
  <TD class='table_bg_bright'><%= invoice_no %></TD>
  <TD class='table_header_center'>Shipping Port</TD>
  <TD class='table_bg_bright'><%= shipping_port_country_name + " - " + shipping_port_name %></TD>
  <TD class='table_header_center'>Handover Date</TD>
  <TD class='table_bg_bright'><%= handover_date %></TD>
</TR>
<TR>
  <TD class='table_header_center'>Shipping Type</TD>
  <TD class='table_bg_bright'><%= shipping_type %></TD>
  <TD class='table_header_center'>Nominated Forwarder</TD>
  <TD class='table_bg_bright'><%= nominated_forwarder_country_name + " - " + nominated_forwarder_name %></TD>
  <TD class='table_header_center'>Confirm Date</TD>
  <TD class='table_bg_bright'><%= confirm_date %></TD>
</TR>
<TR>
  <TD class='table_header_center'>B/L or AWB File</TD>
  <TD class='table_bg_bright' colspan='5'><a href="javascript:fnDownload('<%= bl_filename %>');"><%= bl_filename %></a></TD>
</TR>
<TR>
  <TD class='table_header_center'>Invoice File</TD>
  <TD class='table_bg_bright' colspan='5'><a href="javascript:fnDownload('<%= iv_filename %>');"><%= iv_filename %></a></TD>
</TR>
<TR>
  <TD class='table_header_center'>Packing List File</TD>
  <TD class='table_bg_bright' colspan='5'><a href="javascript:fnDownload('<%= pl_filename %>');"><%= pl_filename %></a></TD>
</TR>
<TR>
<TD width='15%' class='table_header_center'>Supplier Name</TD>
  <TD width='18%' class='table_bg_bright'><%= supplier_name %></TD>
  <TD width='18%' class='table_header_center'>Supplier ID</TD>
  <TD width='22%' class='table_bg_bright'><%= supplier_id %></TD>	
</TR>	
</TABLE>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%"><b>Shipment PO List</b></td>
</tr>
</table>
<TABLE width='99%' border=0 CELLPADDING=0 CELLSPACING=1 align=center class="table_bg">
<TR class='table_header_center'>
  <TD width='10%'>No</TD>
  <TD width='15%'>PO No.</TD>
  <TD width='15%'>Style No.</TD>
  <TD width='15%'>Brand</TD>
  <TD width='15%'>Trans. Type</TD>
  <TD width='15%'>Order Qty</TD>
  <TD width='15%'>Total Amount</TD>
</TR>
<%= outS %>
<tr class='table_header_center'>
  <td colspan='5'>TOTAL</td>
  <td align='right'><%= StringUtil.formatNumber(total_order_qty, QTY_FORMAT) %></td>
  <td align='right'><%= StringUtil.formatNumber(total_amount, MONEY_FORMAT) %></td>
</tr>
</TABLE>

<table border="0" cellspacing="0" cellpadding="0" align='center'>
<tr>
  <td width="100%" height="10"></td>
</tr>
<tr>
  <td width="100%">
<%
if (isEditable && _adminid != null) {
%>
    <input type='button' value='Shipment Edit' onclick='fnEdit(this.form);'>
    <input type='button' value='Shipment Delete' onclick='fnDelete(this.form);'>
<%
}
%>
    <input type='button' value='Go To List' onclick='fnList(this.form);'>
  </td>
</tr>
<tr>
  <td width="100%" height="10"></td>
</tr>
</FORM>
<form name='form2' method='post'>
<input type='hidden' name='attachPath' value='<%= _shipmentFileUrl %>'>
<input type='hidden' name='attachFile'>
<input type='hidden' name='attachRealFile'>
</form>
</table>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
<iframe name='hiddenFrm' src='' width='0' height='0' frameborder='0'></iframe>
</BODY>
</HTML>
