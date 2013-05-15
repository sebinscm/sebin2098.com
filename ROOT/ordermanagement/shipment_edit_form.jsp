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
<%@ include file="/common/calendar/calendar.htm" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";

String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");

String ag_month = request.getParameter("ag_month");
String ag_year = request.getParameter("ag_year");
String ag_invoice_no = request.getParameter("ag_invoice_no");
String ag_po_no = request.getParameter("ag_po_no");
String invoice_no = request.getParameter("invoice_no");
String supplier_id = request.getParameter("supplier_id");
String buyer_id = request.getParameter("buyer_id");
if (ag_month == null) ag_month = "";
if (ag_year == null) ag_year = "";
if (ag_invoice_no == null) ag_invoice_no = "";
if (ag_po_no == null) ag_po_no = "";
if (invoice_no == null) invoice_no = "";
if (supplier_id == null) supplier_id = "";
if (buyer_id == null) buyer_id = "";

String supplier_name = "";
String buyer_name = "";
String issue_date = "";
String shipping_port = "";
String handover_date = "";
String shipping_type = "";
String nominated_forwarder = "";
String bl_filename = "";
String iv_filename = "";
String pl_filename = "";
String shippingPortOptions = "";
String nominatedForwarderOptions = "";
String shippingTypeOptions = "";

int total_order_qty = 0;
double total_amount = 0.0;

int iRet = 0;
Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
MatrixDataSet matrix3 = null;
MatrixDataSet matrix4 = null;
MatrixDataSet matrix5 = null;
DataProcess dataProcess = null;

String outS = "";
String sql = "";

try {

  matrix = new dbconn.MatrixDataSet();
  matrix2 = new dbconn.MatrixDataSet();
  matrix3 = new dbconn.MatrixDataSet();
  matrix4 = new dbconn.MatrixDataSet();
  matrix5 = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  // read shipment header info
  sql = " select  l.name, date_format(s.issue_date, '%Y/%m/%d'), "
      + "         s.shipping_port, date_format(s.handover_date, '%Y/%m/%d'), s.shipping_type, "
      + "         s.nominated_forwarder, s.bl_filename, s.iv_filename, s.pl_filename, m.name "
      + " from    shipment_01t s "
      + "         left outer join login_01t l "
      + "           on ( s.supplier_id = l.id ) "
      + "         left outer join login_01t m " 
      + "           on ( s.buyer_id = m.id )  "   
      + " where   s.invoice_no = '" + invoice_no + "' "
      + " and     s.buyer_id = '" + buyer_id + "' ";
  //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  // read shipment details
  sql = " select  po_no, style_no, season, trans_type, order_qty,total_amount "
      + " from    shipment_02t "
      + " where   invoice_no = '" + invoice_no + "' "
      + " and     buyer_id = '" + buyer_id + "' "
      + " order by po_no ";
  //out.println(sql);
  dataProcess.RetrieveData(sql, matrix2, conn);

  // read shipping port list
  sql = " select  a.code, a.code_name, b.code_name "
      + " from    vg_common_code a "
      + "         left outer join vg_common_code b "
      + "           on ( a.related_code = b.code "
      + "           and b.type = 'COUNTRY_CODE' ) "
      + " where   a.type = 'SHIPPING_PORT' "
      + " and     a.use_yn = 'Y' "
      + " order by b.code_name, a.code_name ";

  dataProcess.RetrieveData(sql, matrix3, conn);

  // read nominated forwarder list
  sql = " select  a.code, a.code_name, b.code_name "
      + " from    vg_common_code a "
      + "         left outer join vg_common_code b "
      + "           on ( a.related_code = b.code "
      + "           and b.type = 'COUNTRY_CODE' ) "
      + " where   a.type = 'FORWARDER' "
      + " and     a.use_yn = 'Y' "
      + " order by case when a.code = '99' then 1 else 0 end, b.code_name, a.code_name ";

  dataProcess.RetrieveData(sql, matrix4, conn);

  // read trans type list
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'DELIVERY_TYPE' "
      + " and     use_yn = 'Y' "
      + " order by code_name ";

  dataProcess.RetrieveData(sql, matrix5, conn);

} catch (Exception e) {
  System.out.println("Exception shipment_edit_form : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

// set shipment header info
if (iRet > 0) {
  int j = 0;
  supplier_name = matrix.getRowData(0).getData(j++);
  issue_date = matrix.getRowData(0).getData(j++);
  shipping_port = matrix.getRowData(0).getData(j++);
  handover_date = matrix.getRowData(0).getData(j++);
  shipping_type = matrix.getRowData(0).getData(j++);
  nominated_forwarder = matrix.getRowData(0).getData(j++);
  bl_filename = matrix.getRowData(0).getData(j++);
  iv_filename = matrix.getRowData(0).getData(j++);
  pl_filename = matrix.getRowData(0).getData(j++);
  buyer_name = matrix.getRowData(0).getData(j++);
  // set shipping port options
  boolean isFound = false;
  
  for (int i = 0; i < matrix3.getRowCount(); i++) {
    int k = 0;
    String code = matrix3.getRowData(i).getData(k++);
    String portName = matrix3.getRowData(i).getData(k++);
    String countryName = matrix3.getRowData(i).getData(k++);
  
    if (!isFound && shipping_port.equals(code)) {
      shippingPortOptions += "<option value='" + code + "' selected>" + countryName + " - " + portName + "</option>";
      isFound = true;
    } else {
      shippingPortOptions += "<option value='" + code + "'>" + countryName + " - " + portName + "</option>";
    }
  }
  
  if (!isFound) {
    shippingPortOptions += "<option value='" + shipping_port + "' selected>" + shipping_port + "</option>";
  }
  
  // set nominated forwarder options
  isFound = false;
  
  for (int i = 0; i < matrix4.getRowCount(); i++) {
    int k = 0;
    String code = matrix4.getRowData(i).getData(k++);
    String forwarderName = matrix4.getRowData(i).getData(k++);
    String countryName = matrix4.getRowData(i).getData(k++);
  
    if (!isFound && nominated_forwarder.equals(code)) {
      nominatedForwarderOptions += "<option value='" + code + "' selected>" + countryName + " - " + forwarderName + "</option>";
      isFound = true;
    } else {
      nominatedForwarderOptions += "<option value='" + code + "'>" + countryName + " - " + forwarderName + "</option>";
    }
  }
  
  if (!isFound) {
    nominatedForwarderOptions += "<option value='" + nominated_forwarder + "' selected>" + nominated_forwarder + "</option>";
  }
  
  // set shipping type options
  isFound = false;
  
  for (int i = 0; i < matrix5.getRowCount(); i++) {
    int k = 0;
    String code = matrix5.getRowData(i).getData(k++);
    String codeName = matrix5.getRowData(i).getData(k++);
  
    if (!isFound && shipping_type.equals(code)) {
      shippingTypeOptions += "<option value='" + code + "' selected>" + codeName + "</option>";
      isFound = true;
    } else {
      shippingTypeOptions += "<option value='" + code + "'>" + codeName + "</option>";
    }
  }
  
  if (!isFound) {
    shippingTypeOptions += "<option value='" + shipping_type + "' selected>" + shipping_type + "</option>";
  }
}

// set shipment details
for (int i = 0; i < matrix2.getRowCount(); i++) {
  int j = 0;
  String po_no = matrix2.getRowData(i).getData(j++);
  String style_no = matrix2.getRowData(i).getData(j++);
  String brand = matrix2.getRowData(i).getData(j++);
  String trans_type = matrix2.getRowData(i).getData(j++);
  int order_qty = Integer.parseInt(matrix2.getRowData(i).getData(j++));
  double t_amount = Double.parseDouble(matrix2.getRowData(i).getData(j++));

  total_order_qty += order_qty;
  total_amount += t_amount;

  outS += "<tr align='center' bgcolor='" + (i%2 == 0 ? "#FFFFF0" : "#EEEEE0") + "'>" +
          //"<td><input type='checkbox' name='po_no' value='" + po_no + "'></td>" +
          "<input type='hidden' name='po_no' value='" + po_no + "'>" +
          "<td>" + (i+1) + "</td>" +
          "<td>" + po_no + "</td>" +
          "<td>" + style_no + "</td>" +
          "<td>" + brand + "</td>" +
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
function fnAddPOs(frm) {
  var winAddPOs = window.open("","winAddPOs", "toolbar=no,menubar=no,resizable=no,scrollbars=yes,width=860,height=700");

  if (winAddPOs) {
    frm.target = winAddPOs.name;
    frm.actionFlag.value = 'AP';
    frm.action = './shipment_issue_list.jsp';
    frm.submit();
    winAddPOs.focus();
  }
}

function fnDeletePOs(frm) {
  if (frm.po_no) {
    var isSelected = false;
    
    if (frm.po_no.length) {
      for (var i = 0; i < frm.po_no.length; i++) {
        if (frm.po_no[i].checked) {
          isSelected = frm.po_no[i].checked;
          break;
        }
      }
    } else {
      isSelected = frm.po_no.checked;
    }
    
    if (!isSelected) {
      alert('Select POs you want to delete.');
      return;
    }

    if (confirm('Do you want to delete the selected POs from this shipment?')) {
      frm.target = self.name;
      frm.actionFlag.value = 'DP';
      frm.action = './shipment_po_update.jsp';
      frm.submit();
    }
  }
}

function fnUpdateHeader(frm)
{
  if (confirm('Do you want to update this shipment?')) {
    frm.target = self.name;
    frm.action = './shipment_header_update.jsp';
    frm.submit();
  }
}

function fnSelect(frm) {
  if (frm.po_no) {
    if (frm.po_no.length) {
      for (var i = 0; i < frm.po_no.length; i++) {
        frm.po_no[i].checked = frm.tmpCheck.checked;
      }
    } else {
      frm.po_no.checked = frm.tmpCheck.checked;
    }
  }
}

function fnBack(frm) {
  frm.target = self.name;
  frm.action = 'shipment_view.jsp';
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
  <td width="*" class="left_title">Modify Shipment </td>
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
  <td width="100%"><b>Shipment Header Info.</b></td>
</tr>
</table>
<TABLE WIDTH='99%' border="0" cellspacing="1" cellpadding="0" align="center" class="table_bg">
<FORM NAME='frmMain' METHOD='POST' enctype='multipart/form-data'>
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
  <TD class='table_header_center'>Shipping Port(*)</TD>
  <TD class='table_bg_bright'><select name='shipping_port'><%= shippingPortOptions %></select></TD>
  <TD class='table_header_center'>Handover Date(*)</TD>
  <TD class='table_bg_bright'><input type='text' name='handover_date' value='<%= handover_date %>' size='10' value='' style='cursor:hand' readonly
    onclick="javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);"></TD>
</TR>
<TR>
  <TD class='table_header_center'>Shipping Type(*)</TD>
  <TD class='table_bg_bright'><select name='shipping_type'><%= shippingTypeOptions %></select></TD>
  <TD class='table_header_center'>Nominated Forwarder(*)</TD>
  <TD class='table_bg_bright'><select name='nominated_forwarder'><%= nominatedForwarderOptions %></select></TD>
  <TD class='table_header_center'>&nbsp;</TD>
  <TD class='table_bg_bright'>&nbsp;</TD>
</TR>
<TR>
  <TD class='table_header_center'>B/L or AWB File(*)</TD>
  <TD class='table_bg_bright' colspan='2'><a href="javascript:fnDownload('<%= bl_filename %>');"><%= bl_filename %></a></TD>
  <TD class='table_bg_bright' colspan='3'><input type='file' name='bl_filename' size='50' maxlength='300'></TD>
</TR>
<TR>
  <TD class='table_header_center'>Invoice File(*)</TD>
  <TD class='table_bg_bright' colspan='2'><a href="javascript:fnDownload('<%= iv_filename %>');"><%= iv_filename %></a></TD>
  <TD class='table_bg_bright' colspan='3'><input type='file' name='iv_filename' size='50' maxlength='300'></TD>
</TR>
<TR>
  <TD class='table_header_center'>Packing List File(*)</TD>
  <TD class='table_bg_bright' colspan='2'><a href="javascript:fnDownload('<%= pl_filename %>');"><%= pl_filename %></a></TD>
  <TD class='table_bg_bright' colspan='3'><input type='file' name='pl_filename' size='50' maxlength='300'></TD>
</TR>
<TR>
	<TD width='15%' class='table_header_center'>Supplier Name</TD>
  <TD width='18%' class='table_bg_bright'><%= supplier_name %></TD>
  <TD width='18%' class='table_header_center'>Supplier ID</TD>
  <TD width='22%' class='table_bg_bright'><%= supplier_id %></TD>
</TR>	
</form>
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
<form name='formDetail' method='post'>
<input type='hidden' name='ag_month' value='<%= ag_month %>'>
<input type='hidden' name='ag_year' value='<%= ag_year %>'>
<input type='hidden' name='ag_invoice_no' value='<%= ag_invoice_no %>'>
<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
<input type='hidden' name='invoice_no' value='<%= invoice_no %>'>
<input type='hidden' name='supplier_id' value='<%= supplier_id %>'>
<input type='hidden' name='buyer_id' value='<%= buyer_id %>'>
<input type='hidden' name='actionFlag'>
<input type='hidden' name='ag_from_date' value='<%= ag_from_date %>'>
<input type='hidden' name='ag_to_date' value='<%= ag_to_date %>'>
<TR class='table_header_center'>
  <TD width='4%'><!--input type='checkbox' name='tmpCheck' onclick='fnSelect(this.form);'--></TD>
  <TD width='6%'>No</TD>
  <TD width='15%'>PO No.</TD>
  <TD width='15%'>Style No.</TD>
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
    <input type='button' value='Shipment Header¼öÁ¤' onclick='fnUpdateHeader(document.frmMain);'>
    <input type='button' value=' Back ' onclick='fnBack(this.form);'>
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
