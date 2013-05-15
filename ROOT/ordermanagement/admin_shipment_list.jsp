<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<%@page import="common.util.*" %>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/calendar/calendar.htm" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

int iRet = 0;
Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
DataProcess dataProcess = null;

String outS = "";
String sql = "";

String ag_buyer_id = request.getParameter("ag_buyer_id");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_confirm_status = request.getParameter("ag_confirm_status");
String ag_invoice_no = request.getParameter("ag_invoice_no");
String ag_po_no = request.getParameter("ag_po_no");
if (ag_buyer_id == null) ag_buyer_id = "";
if (ag_from_date == null || ag_to_date == null) {
  ag_from_date = DateUtil.getRelativeDateString(new java.util.Date(), 0, 0, -60, "yyyy/MM/dd");
  ag_to_date = DateUtil.getToday("yyyy/MM/dd");
}
if (ag_confirm_status == null || ag_confirm_status.equals("") ) ag_confirm_status = "All";
if (ag_invoice_no == null || ag_invoice_no.equals("")) ag_invoice_no = "";
if (ag_po_no == null || ag_po_no.equals("") ) ag_po_no = "";

// set sql
sql = " select  h.buyer_id, l.name, h.confirm_status, date_format(h.confirm_date, '%Y/%m/%d'), "
    + "         date_format(h.issue_date, '%Y/%m/%d'), "
    + "         h.invoice_no, c2.code_name, c1.code_name, date_format(h.handover_date, '%Y/%m/%d'), "
    + "         c4.code_name, c3.code_name, h.shipping_type, h.bl_filename, h.iv_filename, h.pl_filename, h.supplier_id "
    + " from    shipment_01t h "
    + "         left outer join login_01t l "
    + "           on ( h.buyer_id = l.id ) "
    + "         left outer join vg_common_code c1 "
    + "           on ( h.shipping_port = c1.code "
    + "           and c1.type = 'SHIPPING_PORT' ) "
    + "         left outer join vg_common_code c2 "
    + "           on ( c1.related_code = c2.code  "
    + "           and c2.type = 'COUNTRY_CODE' )  "
    + "         left outer join vg_common_code c3 "
    + "           on ( h.nominated_forwarder = c3.code "
    + "           and c3.type = 'FORWARDER' ) "
    + "         left outer join vg_common_code c4 "
    + "           on ( c3.related_code = c4.code "
    + "           and c4.type = 'COUNTRY_CODE' ) "
    + " where   1=1 ";

if (!ag_invoice_no.equals("") || !ag_po_no.equals("")) {
  if (!ag_invoice_no.equals("")) {
    sql += " and     h.invoice_no = '" + ag_invoice_no + "' ";
  }

  if (!ag_po_no.equals("")) {
    sql += " and     (h.invoice_no, h.buyer_id) in ( "
         + "           select  invoice_no, buyer_id "
         + "           from    shipment_02t "
         + "           where   po_no = '" + ag_po_no + "' "
         + "         ) ";
  }
} else {
  sql += " and     h.issue_date between str_to_date('" + ag_from_date + "', '%Y/%m/%d') and str_to_date('" + ag_to_date + "', '%Y/%m/%d') "
       + (!ag_buyer_id.equals("") ? " and     h.buyer_id = '" + ag_buyer_id + "' " : "" )
       + (!ag_confirm_status.equals("All") ? " and    h.confirm_status = '" + ag_confirm_status + "' " : "");
}

sql += " order by h.issue_date, l.name, h.invoice_no ";
//out.println(sql);

try {

  matrix = new dbconn.MatrixDataSet();
  matrix2 = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
   Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  
  // read buyer list
  sql = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'B' "
      + " order by name ";

  dataProcess.RetrieveData(sql, matrix2, conn);

} catch (Exception e) {
  System.out.println("Exception admin_shipment_list : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

// print list
for (int i = 0; i < iRet; i++) {
  int j = 0;
  String buyerId = matrix.getRowData(i).getData(j++);
  String buyerName = matrix.getRowData(i).getData(j++);
  String confirmStatus = matrix.getRowData(i).getData(j++);
  String confirmDate = matrix.getRowData(i).getData(j++);
  String issueDate = matrix.getRowData(i).getData(j++);
  String invoiceNo = matrix.getRowData(i).getData(j++);
  String portCountryName = matrix.getRowData(i).getData(j++);
  String shippingPortName = matrix.getRowData(i).getData(j++);
  String handoverDate = matrix.getRowData(i).getData(j++);
  String forwarderCountryName = matrix.getRowData(i).getData(j++);
  String forwarderName = matrix.getRowData(i).getData(j++);
  String shippingType = matrix.getRowData(i).getData(j++);
  String blFilename = matrix.getRowData(i).getData(j++);
  String ivFilename = matrix.getRowData(i).getData(j++);
  String plFilename = matrix.getRowData(i).getData(j++);
  String supplierId = matrix.getRowData(i).getData(j++);
  outS += "<tr align=center bgcolor='" + (i%2 == 0 ? "#FFFFF0" : "#EEEEE0") + "'>" +
          "<td>" + (i+1) + "</td>" +
          "<td>" + buyerId + "</td>" +
          "<td>" + buyerName + "</td>" +
          "<td>" + confirmStatus + "</td>" +
          "<td>" + confirmDate + "</td>" +
          "<td>" + issueDate + "</td>" +
          "<td><a href=\"javascript:fnView('" + invoiceNo + "', '" + buyerId + "','" + supplierId + "')\">" + invoiceNo + "</a></td>" +
          "<td>" + portCountryName + " - " + shippingPortName + "</td>" +
          "<td>" + handoverDate + "</td>" +
          "<td>" + forwarderCountryName + " - " + forwarderName + "</td>" +
          "<td>" + shippingType + "</td>" +
          "<td><a href=\"javascript:fnDownload('" + blFilename + "');\">" + blFilename + "</a></td>" +
          "<td><a href=\"javascript:fnDownload('" + ivFilename + "');\">" + ivFilename + "</a></td>" +
          "<td><a href=\"javascript:fnDownload('" + plFilename + "');\">" + plFilename + "</a></td>" +
          "</tr>";
}

// print buyer options
String buyerOptions = "<option value='' " + (ag_buyer_id.equals("") ? "selected" : "") + ">All</option>";

for (int i = 0; i < matrix2.getRowCount(); i++) {
  int j = 0;
  String buyerId = matrix2.getRowData(i).getData(j++);
  String buyerName = matrix2.getRowData(i).getData(j++);

  buyerOptions += "<option value='" + buyerId + "' " + (ag_buyer_id.equals(buyerId) ? "selected" : "")
                   + ">" + buyerId + "-" + buyerName + "</option>";
}
%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<SCRIPT LANGUAGE=JavaScript>
function fnSearch(frm)
{
  frm.ag_invoice_no.value = jf_AllTrim(frm.ag_invoice_no.value);
  frm.ag_po_no.value = jf_AllTrim(frm.ag_po_no.value);
  frm.action = './admin_shipment_list.jsp';
  frm.submit();
}

function fnView(invoice_no, buyer_id,supplier_id) {
  frmMain.invoice_no.value = invoice_no;
  frmMain.buyer_id.value = buyer_id;
  frmMain.supplier_id.value = supplier_id;
  frmMain.action = "./shipment_view.jsp";
  frmMain.submit();
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
  <td width="*" class="left_title">Shipment List</td>
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
  <td width="100%" height="15"></td>
</tr>
</table>

<TABLE WIDTH='99%' border="0" cellspacing="1" cellpadding="0" align="center" class="table_bg">
<FORM NAME='frmMain' METHOD='POST'>
<input type='hidden' name='invoice_no'>
<input type='hidden' name='buyer_id'>
<input type='hidden' name='supplier_id'>
<TR>
  <TD width='15%' class='table_header_center'>Buyer</TD>
  <TD width='35%' class='table_bg_bright'><select name='ag_buyer_id'><%= buyerOptions %></select></TD>
  <TD width='15%' class='table_header_center'>Invoice No.</TD>
  <TD width='20%' class='table_bg_bright'><input type='text' name='ag_invoice_no' value='<%= ag_invoice_no %>' size='20' maxlength='20'></TD>
  <td width='15%' class='table_bg_bright_center' rowspan='3'><INPUT TYPE='BUTTON' VALUE="Search" ONCLICK='fnSearch(this.form)'></TD>
</TR>
<TR>
  <TD class='table_header_center'>Issue Date</TD>
  <TD class='table_bg_bright'><input type='text' name='ag_from_date' size='10' value='<%= ag_from_date %>' style='cursor:hand' readonly
    onclick="javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);">
    ~
    <input type='text' name='ag_to_date' size='10' value='<%= ag_to_date %>' style='cursor:hand' readonly
    onclick="javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);"></TD>
  <TD class='table_header_center'>PO No.</TD>
  <TD class='table_bg_bright'><input type='text' name='ag_po_no' value='<%= ag_po_no %>' size='20' maxlength='20'></TD>
</TR>
<TR>
  <TD class='table_header_center'>Confirm Status</TD>
  <TD class='table_bg_bright'><select name='ag_confirm_status'>
    <option value='' <%= ag_confirm_status.equals("A") ? "selected" : "" %>>All</option>
    <option value='Y' <%= ag_confirm_status.equals("Y") ? "selected" : "" %>>Y</option>
    <option value='N' <%= ag_confirm_status.equals("N") ? "selected" : "" %>>N</option>
    </select></TD>
  <TD class='table_header_center'>&nbsp;</TD>
  <TD class='table_bg_bright'>&nbsp;</TD>
</TR>
</TABLE>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>
</td></tr></table>

<table width="1600" border="0" cellspacing="0" cellpadding="3"><tr><td>
<TABLE width='99%' border=0 CELLPADDING=0 CELLSPACING=1 align=center class="table_bg">
<TR class='table_header_center'>
  <TD width='1%'>No.</TD>
  <TD width='4%'>Buyer ID</TD>
  <TD width='10%'>Buyer Name</TD>
  <TD width='3%'>Confirm<br>Y/N</TD>
  <TD width='4%'>Confirm<br>Date</TD>
  <TD width='4%'>Issue<br>Date</TD>
  <TD width='8%'>Invoice No.</TD>
  <TD width='10%'>Shipping Port</TD>
  <TD width='4%'>Handover<br>Date</TD>
  <TD width='10%'>Nominated Forwarder</TD>
  <TD width='3%'>Shipping<br>Type</TD>
  <TD width='13%'>B/L or AWB File</TD>
  <TD width='13%'>Invoice File</TD>
  <TD width='13%'>Packing List File</TD>
</TR>
<%= outS %>
</TABLE>
<table border="0" cellspacing="0" cellpadding="0" align='center'>
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
</td></tr></table>

<table width="840" border="0" cellspacing="0" cellpadding="0"><tr><td>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
<iframe name='hiddenFrm' src='' width='0' height='0' frameborder='0'></iframe>
</BODY>
</HTML>
