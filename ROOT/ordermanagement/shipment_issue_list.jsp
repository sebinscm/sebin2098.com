<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@page import="dbconn.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
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
int iRet = 0;
int iRet2 = 0;
Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
DataProcess dataProcess = null;
String outS = "";
String sql = "";

// for creating a delivery note
String ag_buyer = request.getParameter("ag_buyer");

String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_po_no = request.getParameter("ag_po_no");
if (ag_buyer == null || ag_buyer.equals("")  ) ag_buyer = "-";
if (ag_from_date == null) ag_from_date = "";
if (ag_to_date == null) ag_to_date = "";
if (ag_po_no == null) ag_po_no = "";

//out.println("buyer="+ag_from_date);

// adding POs
String fromUrl = request.getParameter("fromUrl");
String ag_month = request.getParameter("ag_month");
String ag_year = request.getParameter("ag_year");
String ag_invoice_no = request.getParameter("ag_invoice_no");
String invoice_no = request.getParameter("invoice_no");
//String buyer_id = request.getParameter("buyer_id");
//String supplier_id = request.getParameter("supplier_id");
String actionFlag = request.getParameter("actionFlag");
if (fromUrl == null) fromUrl = request.getHeader("Referer");
if (ag_month == null) ag_month = "";
if (ag_year == null) ag_year = "";
if (ag_invoice_no == null) ag_invoice_no = "";
if (invoice_no == null) invoice_no = "";
//if (supplier_id == null) supplier_id = "";
//if (ag_buyer == null) ag_buyer = "";
if (actionFlag == null) actionFlag = "";

// variables
String sql_po_no = "";
String buyer_id="";
if (!ag_po_no.equals("")) {
  sql_po_no = "'" + ag_po_no.replaceAll(",", "','") + "'";
}

// read data
sql = " select  a.order_no, "
    + "         a.style, "
    + "         a.season, "
    + "         date_format(a.ex_factory_date, '%Y/%m/%d'),  "
    + "         a.trans_type, "    
    + "         a.total_qty, "
    + "         (a.total_qty * a.vendor_price) po_amount ,"
    + "         format(a.vendor_price,2), a.buyer,a.buyer_name,a.sgr "
    + " from    purchase_order a " 
    + " where   a.backorder_flag = 'N' "
    + " and     a.order_status between '73' and '73' "
    + " and     a.trans_type = 'FOB' "
    + (!ag_buyer.equals("") ? " and    a.buyer='" + ag_buyer + "' " : "")
    + (!ag_from_date.equals("") ? " and     a.ex_factory_date >= str_to_date('" + ag_from_date + "', '%Y/%m/%d') " : "")
    + (!ag_to_date.equals("") ? " and     a.ex_factory_date <= str_to_date('" + ag_to_date + "', '%Y/%m/%d') " : "")
    + (!ag_po_no.equals("") ? " and    upper(a.order_no) in upper(" + ag_po_no + ") " : "")
    + " order by a.order_no ";
//out.println(sql);
// query for buyer list
String sql2 = " select id, name from login_01t  where user_type = 'B' order by id ";

try {

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  matrix2 = new MatrixDataSet();
  dataProcess = new DataProcess();

  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  //conn.commit();
  // buyer list
  iRet2 = dataProcess.RetrieveData(sql2, matrix2, conn);

} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception shipment_issue_list : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}	
}

for (int i = 0; i < iRet; i++) {
  int j = 0;
  String po_no = matrix.getRowData(i).getData(j++);
  String style_no = matrix.getRowData(i).getData(j++);
  String season = matrix.getRowData(i).getData(j++);
  String shipping_date = matrix.getRowData(i).getData(j++);
  String trans_type = matrix.getRowData(i).getData(j++);
  int order_qty = Integer.parseInt(matrix.getRowData(i).getData(j++));
   double total_amount = Double.parseDouble(matrix.getRowData(i).getData(j++));
   double unit_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  String buyer = matrix.getRowData(i).getData(j++);
  String buyer_name = matrix.getRowData(i).getData(j++);
  String sgr = matrix.getRowData(i).getData(j++);
  buyer_id = buyer;
  String link_po_no = "<a href=\"javascript:fnView('" + po_no + "')\">" + po_no + "</a>";
  if (fromUrl.indexOf("shipment_edit_form.jsp") >= 0) {
    link_po_no = po_no;
  }

  outS += "<tr align=center bgcolor='" + (i%2 == 0 ? "#FFFFF0" : "#EEEEE0") + "'>" +
          " <td><input type='checkbox' name='po_no' value='"+ po_no + "'>" +
          " <td>" + (i+1) + "</td>" +
          " <td>" + buyer + "</td><input type='hidden' name='buyer_id' value='"+buyer_id+"'>" +
          " <td>" + buyer_name + "</td>" +        
          " <td>" + link_po_no + "</td>" +
          " <td>" + sgr+ "</td>" +
          " <td>" + style_no + "</td>" +
          " <td>" + season + "</td>" +
          " <td>" + shipping_date + "</td>" +
          " <td>" + trans_type + "</td>" +
          " <td align='right'> " + StringUtil.formatNumber(unit_price, MONEY_FORMAT) + " </td>" +   
          " <td align='right'> " + StringUtil.formatNumber(order_qty, QTY_FORMAT) + " </td>" +
          " <td align='right'> " + StringUtil.formatNumber(total_amount, MONEY_FORMAT) + " </td>" +
          "</tr>";
}

// print buyer list
//String buyerList = "<option value=''>-</option>";
String buyerList = "";
for (int i = 0; i < iRet2; i++) {
  int j = 0;
  String buyerid = matrix2.getRowData(i).getData(j++);
  String buyernm = matrix2.getRowData(i).getData(j++);

  buyerList += "<option value='"+ buyerid + "'" 
                + (ag_buyer.equals(buyerid) ? " selected" : "") + ">" 
                + buyerid + "-" + buyernm + "</option>";
}
%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<SCRIPT LANGUAGE=JavaScript>
function fnSubmit(frm)
{
  frm.ag_po_no.value = jf_SkipSpaces(frm.ag_po_no.value);
  frm.action = './shipment_issue_list.jsp'
  frm.submit();
}

function fnClearDate(obj)
{
  obj.value = '';
}

function fnView(po_no) {
  var win = window.open('', "winPrint", "toolbar=no, menubar=no, resizable=no, scrollbars=yes, width=1000, height=900");
    frmMain.po_no_selected.value = po_no;
    if (win) {
	    frmMain.action = "./po_detail_popup.jsp";
	    frmMain.target = win.name;
	    frmMain.submit();	
	 }
  //frmMain.po_no_selected.value = po_no;
  //frmMain.action = "./po_detail_popup.jsp";
  //frmMain.submit();
}

function fnIssue(frm) {
  var isChecked = false;

  if (frm.po_no) {
    if (frm.po_no.length) {
      for (var i = 0; i < frm.po_no.length; i++) {
        if (frm.po_no[i].checked) {
          isChecked = true;
          break;
        }
      }
    } else {
      if (frm.po_no.checked) isChecked = true;
    }
  }

  if (!isChecked) {
    alert('Select PO to create Shipment!');
    return;
  }

  if (confirm('Do you want to add the selected POs to shipment?')) {
<%
if (fromUrl != null && fromUrl.indexOf("shipment_edit_form.jsp") >= 0) {
%>
    frm.target = opener.name;
    frm.action = './shipment_po_update.jsp';
    frm.submit();
    top.close();
<%
} else {
%>
    frm.action = './shipment_issue_form.jsp';
    frm.submit();
<%
}
%>
  }
}
</SCRIPT>
</HEAD>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="900" border="0" cellspacing="0" cellpadding="0">
<tr><td>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/btnCategories.gif"></td>
  <td width="*" class="left_title">Create Shipment - Step 1</td>
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
  <td><font color=blue>* Create Shipment - Step 1 : Select target PO first to create Shipment. </font></td>
</TR>
<TR>
  <td><font color=blue>1)To create Shipment, please select target PO then click "Create" button. </font></td>
</TR>
<TR>
  <td><font color=blue>2)Following PO list are able to create Shipment. (PO status '73:Production Complete'). When the shipment has been created, PO status will be changed to '75: shipment created' and will be discarded from the list autocatically. </font></td>
</TR>
</TABLE>
1) Search Query
<table border="0" cellspacing="0" cellpadding="0">
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>
<TABLE WIDTH='99%' border="0" cellspacing="1" cellpadding="0" align="center" class="table_bg">
<form NAME='frmMain' METHOD='POST'>
<input type='hidden' name='po_no_selected'>
<TR>
  <TD width='5%' class='table_header_center'>Buyer</TD>
  <TD width='20%' class='table_bg_bright' >
    <SELECT NAME='ag_buyer'>
      <%= buyerList %>
    </SELECT>    
  </td>	
  <TD width='15%' class='table_header_center'>Shipping Date</TD>
  <TD width='25%' class='table_bg_bright'><input type='text' name='ag_from_date' size='10' value='<%= ag_from_date %>' style='cursor:hand' readonly
    onclick="javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);"><a href="javascript:fnClearDate(frmMain.ag_from_date)">X</a>
    ~
    <input type='text' name='ag_to_date' size='10' value='<%= ag_to_date %>' style='cursor:hand' readonly
    onclick="javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);"><a href="javascript:fnClearDate(frmMain.ag_to_date)">X</a></TD>
</TR>
<TR>    	
  <TD width='15%' class='table_header_center'>PO No.</TD>
  <TD width='25%' class='table_bg_bright'><input type=text name='ag_po_no' value='<%= ag_po_no %>' size='30' maxlength='200'></TD>
  <td  class='table_bg_bright_center' colspan='3'><INPUT TYPE=BUTTON VALUE="Search" ONCLICK="fnSubmit(this.form)">
    <input type='reset' value='Reset'></TD>
</TR>
</form>
</TABLE>
<table border="0" cellspacing="0" cellpadding="0">
<form name='form2' method='post'>	
<input type='hidden' name='fromUrl' value='<%= fromUrl %>'>
<input type='hidden' name='ag_month' value='<%= ag_month %>'>
<input type='hidden' name='ag_year' value='<%= ag_year %>'>
<input type='hidden' name='ag_invoice_no' value='<%= ag_invoice_no %>'>
<input type='hidden' name='buyer_id' value='<%= buyer_id %>'>
<input type='hidden' name='invoice_no' value='<%= invoice_no %>'>
<input type='hidden' name='actionFlag' value='<%= actionFlag %>'>
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" align='center'>
<tr>
  <td width="100%"><input type='button' value='<%= fromUrl.indexOf("shipment_edit_form.jsp") >= 0 ? "PO add to Shipment" : "Create Shipment" %>' onclick='fnIssue(this.form);'></td>
</tr>
<tr>
  <td width="100%" height="10"></td>
</tr>
</table>
2) Shipment target PO list
<TABLE width='99%' border=0 CELLPADDING=0 CELLSPACING=1 align=center class="table_bg">
<TR class='table_header_center'>
  <TD>&nbsp;</TD>
  <TD>No</TD>
   <TD>Buyer Code</TD>
  <TD>Buyer Name</TD>
  <TD>PO No.</TD>
    <TD>SGR</TD>
  <TD>Style No.</TD>
  <TD>Season</TD>
  <TD>Shipping Date</TD>
  <TD>Trans. Type</TD>
   <TD>Unit Price</TD>
  <TD>Order Qty</TD>
  <TD>Total Amount</TD>
</TR>
<%= outS %>
</TABLE>
<table border="0" cellspacing="0" cellpadding="0" align='center'>
<tr>
  <td width="100%" height="10"></td>
</tr>
<tr>
  <td width="100%"><input type='button' value='<%= fromUrl.indexOf("shipment_edit_form.jsp") >= 0 ? "PO add to Shipment " : "Create Shipment" %>' onclick='fnIssue(this.form);'></td>
</tr>
<tr>
  <td width="100%" height="10"></td>
</tr>
</form>
</table>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
</BODY>
</HTML>
