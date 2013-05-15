<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<%@page import="common.util.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/common/calendar/calendar.htm" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";
String today = DateUtil.getToday("yyyy/MM/dd");

int iRet = 0;
Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
MatrixDataSet matrix3 = null;
MatrixDataSet matrix4 = null;
DataProcess dataProcess = null;
String outS = "";
String sql = "";

String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_buyer = request.getParameter("ag_buyer");
String ag_po_no = request.getParameter("ag_po_no");
String[] po_no = request.getParameterValues("po_no");
if (ag_from_date == null) ag_from_date = "";
if (ag_to_date == null) ag_to_date = "";
String buyer_id=request.getParameter("buyer_id");
String buyer_nm="";
String supplier_id="";
String supplier_nm="";
int total_order_qty = 0;
double grand_total_amount = 0.0;

//out.println("buyer="+buyer_id);

String tmp_po_noes = "";
for (int i = 0; i < po_no.length; i++) {
  if (i > 0) tmp_po_noes += ",";
  tmp_po_noes += "'" + po_no[i] + "'";
}
// read data
sql = " select  a.order_no, "
    + "         a.style, "
    + "         a.season, "
    + "         date_format(a.ex_factory_date, '%Y/%m/%d'), "
    + "         a.trans_type, "    
    + "         a.total_qty, "
    + "         (a.total_qty * a.vendor_price) po_amount ,"
    + "         format(a.vendor_price,2), a.buyer, a.buyer_name,a.supplier,a.supplier_name "
    + " from    purchase_order a " 
    + " where   a.backorder_flag = 'N' "
    + " and     a.order_status between '73' and '73' "
    + " and     a.trans_type = 'FOB' "
    + (!buyer_id.equals("") ? " and    a.buyer='" + buyer_id + "' " : "")
    + (!ag_from_date.equals("") ? " and     a.ex_factory_date >= str_to_date('" + ag_from_date + "', '%Y/%m/%d') " : "")
    + (!ag_to_date.equals("") ? " and     a.ex_factory_date <= str_to_date('" + ag_to_date + "', '%Y/%m/%d') " : "")
    + " and    a.order_no in (" + tmp_po_noes + ") " 
    + " order by a.order_no ";

//out.println(sql);


try {

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();

  // read po list
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  //conn.commit();

  matrix2 = new MatrixDataSet();
  matrix3 = new MatrixDataSet();
  matrix4 = new MatrixDataSet();

  // read shipping port list
  sql = " select  a.code, a.code_name, b.code_name "
      + " from    vg_common_code a "
      + "         left outer join vg_common_code b "
      + "           on ( a.related_code = b.code "
      + "           and b.type = 'COUNTRY_CODE' ) "
      + " where   a.type = 'SHIPPING_PORT' "
      + " and     a.use_yn = 'Y' "
      + " order by b.code_name, a.code_name ";

  dataProcess.RetrieveData(sql, matrix2, conn);

  // read nominated forwarder list
  sql = " select  a.code, a.code_name, b.code_name "
      + " from    vg_common_code a "
      + "         left outer join vg_common_code b "
      + "           on ( a.related_code = b.code "
      + "           and b.type = 'COUNTRY_CODE') "
      + " where   a.type = 'FORWARDER' "
      + " and     a.use_yn = 'Y' "
      + " order by case when a.code = '99' then 1 else 0 end, b.code_name, a.code_name ";

  dataProcess.RetrieveData(sql, matrix3, conn);

  // read trans type list
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'TRANS_TYPE' "
      + " and     use_yn = 'Y' "
      + " order by code_name ";

  dataProcess.RetrieveData(sql, matrix4, conn);

} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception shipment_issue_form : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }  
}

for (int i = 0; i < iRet; i++) {
  int j = 0;
  String tmp_po_no = matrix.getRowData(i).getData(j++);
  String style_no = matrix.getRowData(i).getData(j++);
  String season = matrix.getRowData(i).getData(j++);
  String shipping_date = matrix.getRowData(i).getData(j++);
  String trans_type = matrix.getRowData(i).getData(j++);
  int order_qty = Integer.parseInt(matrix.getRowData(i).getData(j++));
   double total_amount = Double.parseDouble(matrix.getRowData(i).getData(j++));
   double unit_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  String buyer = matrix.getRowData(i).getData(j++);
  String buyer_name = matrix.getRowData(i).getData(j++);
  String supplier = matrix.getRowData(i).getData(j++);
  String supplier_name = matrix.getRowData(i).getData(j++);
  buyer_id =buyer;
  buyer_nm=buyer_name;   
  supplier_id = supplier;
  supplier_nm = supplier_name;
  total_order_qty += order_qty;
  grand_total_amount += total_amount;

  outS += "<tr align=center bgcolor='" + (i%2 == 0 ? "#FFFFF0" : "#EEEEE0") + "'>" +
          "<td>" + (i+1) + "</td>" +
          "<td>" + tmp_po_no + "<input type='hidden' name='po_no' value='" + tmp_po_no + "'></td>" +
          "<td>" + style_no + "<input type='hidden' name='style_no' value='" + style_no + "'></td>" +
          "<td>" + season + "<input type='hidden' name='season' value='" + season + "'></td>" +
          " <td>" + shipping_date + "<input type='hidden' name='shipping_date' value='" + shipping_date + "'></td>" +
          "<td>" + trans_type + "<input type='hidden' name='trans_type' value='" + trans_type + "'></td>" +
          " <td align='right'> " + StringUtil.formatNumber(unit_price, MONEY_FORMAT) +
          "<td align='right'>" + StringUtil.formatNumber(order_qty, QTY_FORMAT) +
          "<td align='right'>" + StringUtil.formatNumber(total_amount, MONEY_FORMAT) +
          "<td align='right'><input type='text' size='10' maxlength='10' onblur='extractNumber(this,2,false);' onkeyup='extractNumber(this,2,false);' onkeypress='return blockNonNumbers(this, event, true, false);' name='unit_price' class='input_text_right' value='" + unit_price + "'></td>" + 
          "<td align='right'><input type='text' size='10' maxlength='10' onblur='extractNumber(this,2,false);' onkeyup='extractNumber(this,2,false);' onkeypress='return blockNonNumbers(this, event, true, false);' name='order_qty' class='input_text_right' value='" + order_qty + "'></td>" +
          "<td align='right'><input type='text' size='10' maxlength='10' onblur='extractNumber(this,2,false);' onkeyup='extractNumber(this,2,false);' onkeypress='return blockNonNumbers(this, event, true, false);' name='total_amount' class='input_text_right' value='" + total_amount + "'></td>" +
          "</tr>" ;
}

// set shipping port as select option
String shippingPortOptions = "<option value=''></option>";

for (int i = 0; i < matrix2.getRowCount(); i++) {
  int j = 0;
  String code = matrix2.getRowData(i).getData(j++);
  String portName = matrix2.getRowData(i).getData(j++);
  String countryName = matrix2.getRowData(i).getData(j++);

  shippingPortOptions += "<option value='" + code + "'>" + countryName + " - " + portName + "</option>";
}

// set nominated forwarder as select option
String nominatedForwarderOptions = "<option value=''></option>";

for (int i = 0; i < matrix3.getRowCount(); i++) {
  int j = 0;
  String code = matrix3.getRowData(i).getData(j++);
  String forwarderName = matrix3.getRowData(i).getData(j++);
  String countryName = matrix3.getRowData(i).getData(j++);

  nominatedForwarderOptions += "<option value='" + code + "'>" + countryName + " - " + forwarderName + "</option>";
}

// set shipping type as select option
String shippingTypeOptions = "<option value=''></option>";

for (int i = 0; i < matrix4.getRowCount(); i++) {
  int j = 0;
  String code = matrix4.getRowData(i).getData(j++);
  String codeName = matrix4.getRowData(i).getData(j++);

  shippingTypeOptions += "<option value='" + code + "'>" + codeName + "</option>";
}
%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<script language="javaScript" src="/common/js/validate2.js"></script>
<SCRIPT LANGUAGE=JavaScript>
function fnSave(frm)
{
  frm.invoice_no.value = jf_AllTrim(frm.invoice_no.value);
  
  if (!frm.invoice_no.value) {
    alert('Enter Invoice No.');
    frm.invoice_no.focus();
    return;
  }

  var fmt = /[/\\?*:|"<>]+/;
  if (fmt.test(frm.invoice_no.value)) {
    alert('Invoice No cannot contain any of the following characters:\n' + '/ \\ ? * : | " < >\n' + 'Check your Invoice No.');
    frm.invoice_no.select();
    return;
  }

  if (!frm.shipping_port.value) {
    alert('Enter Shipping Port.');
    frm.shipping_port.focus();
    return;
  }

  if (!frm.handover_date.value) {
    alert('Enter Handover Date.');
    frm.handover_date.focus();
    return;
  }

  if (!frm.shipping_type.value) {
    alert('Enter Shipping Type.');
    frm.shipping_type.focus();
    return;
  }

  if (!frm.nominated_forwarder.value) {
    alert('Enter Nominated Forwarder.');
    frm.nominated_forwarder.focus();
    return;
  }

  if (!frm.bl_filename.value) {
    alert('Enter B/L or AWB File.');
    return;
  }

  if (!frm.iv_filename.value) {
    alert('Enter Invoice File.');
    return;
  }

  if (!frm.pl_filename.value) {
    alert('Enter Packing List File.');
    return;
  }

  // count sea and air trans type.
  var trans_msg = "";
  var trans_sea_cnt = 0;
  var trans_air_cnt = 0;

  if (frm.po_no) {
    if (frm.trans_type.length) {
      for (var i = 0; i < frm.trans_type.length; i++) {
        if (frm.trans_type[i].value == 'SEA') trans_sea_cnt++;
        else if (frm.trans_type[i].value == 'AIR') trans_air_cnt++;
      }
    } else {
      if (frm.trans_type.value == 'SEA') trans_sea_cnt++;
      else if (frm.trans_type.value == 'AIR') trans_air_cnt++;
    }
  }

  if (trans_sea_cnt > 0 && trans_air_cnt > 0) {
    trans_msg = "There are both SEA and AIR Trans Type in this shipment. Make sure this is correct.\n";
  }

  if (confirm(trans_msg + 'Do you want to create this shipment?')) {
    frm.action = './shipment_issue_save.jsp'
    frm.submit();
  }
}

function fnBack(frm) {
  frm.action = './shipment_issue_list.jsp';
  frm.submit();
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
  <td width="3%"><img src="/img/btnCategories.gif"></td>
  <td width="*" class="left_title">Shipment Creation Step 2</td>
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
  <td><font color=blue>* Shipment Creation Step 2 - To attach related docs for Shipping.</font></td>
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
<FORM NAME='frmMain' METHOD='POST' enctype='multipart/form-data'>
<input type='hidden' name='ag_from_date' value='<%= ag_from_date %>'>
<input type='hidden' name='ag_to_date' value='<%= ag_to_date %>'>
<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
<input type='hidden' name='supplier_id' value='<%= supplier_id %>'>
<input type='hidden' name='buyer_id' value='<%= buyer_id %>'>
<TR>
  <TD width='15%' class='table_header_center'>Buyer Name</TD>
  <TD width='18%' class='table_bg_bright'><%= buyer_nm %></TD>
  <TD width='18%' class='table_header_center'>Buyer ID</TD>
  <TD width='22%' class='table_bg_bright'><%= buyer_id %></TD>
  <TD width='15%' class='table_header_center'>Issue Date</TD>
  <TD width='12%' class='table_bg_bright'><%= today %><input type='hidden' name='issue_date' value='<%= today %>'></TD>
</TR>
<TR>
  <TD class='table_header_center'>Invoice No(*)</TD>
  <TD class='table_bg_bright'><input type='text' name='invoice_no' value='' size='20' maxlength='20'></TD>
  <TD class='table_header_center'>Shipping Port(*)</TD>
  <TD class='table_bg_bright'><select name='shipping_port'><%= shippingPortOptions %></select></TD>
  <TD class='table_header_center'>Handover Date(*)</TD>
  <TD class='table_bg_bright'><input type='text' name='handover_date' size='10' value='' style='cursor:hand' readonly
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
  <TD class='table_bg_bright' colspan='5'><input type='file' name='bl_filename' size='60' maxlength='300'></TD>
</TR>
<TR>
  <TD class='table_header_center'>Invoice File(*)</TD>
  <TD class='table_bg_bright' colspan='5'><input type='file' name='iv_filename' size='60' maxlength='300'></TD>
</TR>
<TR>
  <TD class='table_header_center'>Packing List File(*)</TD>
  <TD class='table_bg_bright' colspan='5'><input type='file' name='pl_filename' size='60' maxlength='300'></TD>
</TR>
<TR>
  <TD width='15%' class='table_header_center'>Supplier Name</TD>
  <TD width='18%' class='table_bg_bright'><%= supplier_nm %></TD>
  <TD width='18%' class='table_header_center'>Supplier ID</TD>
  <TD width='22%' class='table_bg_bright'><%= supplier_id %></TD><input type='hidden' name='supplier_id' value='<%= supplier_id %>'>
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
<TABLE WIDTH='99%' border="0" cellspacing="1" cellpadding="0" align="center">
<TR>
  <td><font color=blue>* For about order quantity of PO, actual shipment qty and price should be input on [Actual].</font></td>
</TR>
</TABLE>
<TABLE width='99%' border=0 CELLPADDING=0 CELLSPACING=1 align=center class="table_bg">
<TR class='table_header_center'>
  <TD width='5%'>No</TD>
  <TD width='10%'>PO No.</TD>
  <TD width='5%'>Style No.</TD>
  <TD width='12%'>Season</TD>
  <TD width='10%'>Shipping Date</TD>
  <TD width='10%'>Trans. Type</TD>
   <TD width='5%'>Order Unit Price</TD>
  <TD width='5%'>Order Total Qty</TD>
  <TD width='10%'>Order Total Amount</TD>
  <TD width='5%'>Actual Unit Price</TD>
  <TD width='5%'>Actual Total Qty</TD>
  <TD width='10%'>Actual Total Amount</TD>
</TR>
<%= outS %>
<tr class='table_header_center'>
  <td colspan='7'>TOTAL</td>
  <td align='right'><%= StringUtil.formatNumber(total_order_qty, QTY_FORMAT) %></td>
  <td align='right'><%= StringUtil.formatNumber(grand_total_amount, MONEY_FORMAT) %></td>
</tr>
</TABLE>

<table border="0" cellspacing="0" cellpadding="0" align='center'>
<tr>
  <td width="100%" height="10"></td>
</tr>
<tr>
  <td width="100%">
    <input type='button' value='Save' onclick='fnSave(this.form);'>
    <input type='reset' value='Reset'>
    <input type='button' value='Back' onclick='fnBack(document.form2);'>
  </td>
</tr>
<tr>
  <td width="100%" height="10"></td>
</tr>
</FORM>
<form name='form2' method='post'>
<input type='hidden' name='ag_from_date' value='<%= ag_from_date %>'>
<input type='hidden' name='ag_to_date' value='<%= ag_to_date %>'>
<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
</form>
</table>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
</BODY>
</HTML>
