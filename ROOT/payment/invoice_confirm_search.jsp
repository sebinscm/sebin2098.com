<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="java.text.*" %>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@ include file="/admin/login_check.jsp" %>
<!-%@ page errorPage="/error.jsp" %-->
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";

int iRet = 0;
Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
MatrixDataSet matrix3 = null;
DataProcess dataProcess = null;

String outS = "";
String sql = "";

// for creating invoice
String inv_no = request.getParameter("inv_no");
String ag_supplier = request.getParameter("ag_supplier");
String ag_buyer = request.getParameter("ag_buyer");
String ag_po_no = request.getParameter("ag_po_no");
String ag_orderby = request.getParameter("ag_orderby");
String chk_status = request.getParameter("chk_status");
if (ag_buyer == null) ag_buyer = "";
if (ag_po_no == null) ag_po_no = "";
if (ag_orderby == null) ag_orderby = "1";

String actionFlag = request.getParameter("actionFlag");
if (ag_supplier == null) ag_supplier = "";
if (actionFlag == null) actionFlag = "";


try {

  matrix = new dbconn.MatrixDataSet();
  matrix2 = new dbconn.MatrixDataSet();
  matrix3 = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  // if this is for Adding POs then set the brand as the same value in the current invoice.
  // read brand info
  //out.println(actionFlag);
  if (actionFlag.equals("AP")) {
    // fix brand
   }

  // read data
 // sql = " select  a.order_no, a.buyer,concat(a.sgr,a.style), a.sup_stock_code, a.total_qty, "
 //     + "         date_format(a.ex_factory_date, '%Y/%m/%d'), a.vendor_price, a.vendor_price * a.total_qty "
//      + " from    purchase_order a "
//      + " where   a.backorder_flag = 'N' "
//      + " and     a.supplier = '" + ag_supplier + "' "
//      + (ag_po_no.equals("") ? "" : " and     a.order_no = " + ag_po_no)
//      + " and     a.order_status between '75' and '85' "
//      + " and     a.buyer = '" + ag_buyer + "' "
//      + " order by a.order_no ";

sql =  " select a.order_no, a.buyer,concat(a.sgr,a.style), a.sup_stock_code, a.total_qty, date_format(a.ex_factory_date, '%Y/%m/%d'), "
        + "  a.vendor_price, a.vendor_price * a.total_qty, ifnull(b.order_qty,0), ifnull(b.total_amount,0)  "
        + " from purchase_order a LEFT OUTER JOIN shipment_02t b on ( a.order_no = b.po_no and a.buyer = b.buyer_id ) "
        + " where a.backorder_flag = 'N' and a.order_status between '75' and '85' "
        + " and     a.supplier = '" + ag_supplier + "' "
        + " and       a.buyer = '" + ag_buyer + "' "
        + " order by a.order_no ";

//out.println(sql);
//if (true) return;
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  // read user info
  sql = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'B' "
      + " and     delete_yn = 'N' "
      + " order by id ";

  dataProcess.RetrieveData(sql, matrix2, conn);

 sql = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'S' "
      + " and     delete_yn = 'N' "
      + " order by id ";

  dataProcess.RetrieveData(sql, matrix3, conn);

} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception invoice_confirm_search : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

for (int i = 0; i < iRet; i++) {
  int j = 0;
  String po_no = matrix.getRowData(i).getData(j++);
  String buyer = matrix.getRowData(i).getData(j++);
  String style_no = matrix.getRowData(i).getData(j++);
  String supplierStkcd = matrix.getRowData(i).getData(j++);
  int recTtlQty = Integer.parseInt(matrix.getRowData(i).getData(j++));
  String giDate = matrix.getRowData(i).getData(j++);
  double vendor_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  double total_amount = Double.parseDouble(matrix.getRowData(i).getData(j++));
  int shipQty = Integer.parseInt(matrix.getRowData(i).getData(j++));
  double ship_amount = Double.parseDouble(matrix.getRowData(i).getData(j++));

  outS += "<tr align=center bgcolor='" + (i%2 == 0 ? "#FFFFF0" : "#EEEEE0") + "'>" +
//        "<td>" + (chkNew.equals("0") ? "" : "<IMG src='../board/images/new_6.gif' border='0'>" ) + "</td>" +
          "<td><input type='checkbox' name='po_no' value='" + po_no + "'></td>" +
          "<td>" + (i+1) + "</td>" +
          "<td> " + buyer + "</td>" +
          "<td> " + supplierStkcd + "</td>" +
          "<td><a href=\"javascript:fnView('" + po_no + "')\">" + po_no + "</td>" +
          "<td> " + style_no + "</td>" +
          "<td><font color='red'>" + giDate + "</font></td>" +
          "<td align=right> " + StringUtil.formatNumber(vendor_price, MONEY_FORMAT) + " </td>" +    
          "<td align=right> " + StringUtil.formatNumber(recTtlQty, QTY_FORMAT) + " </td>" +          
          "<td align=right> " + StringUtil.formatNumber(total_amount, MONEY_FORMAT) + " </td>" +
          "<td align=right><input type='hidden' name='shipQty' value='" + shipQty + "'>" + StringUtil.formatNumber(shipQty, QTY_FORMAT) + " </td>" +          
          "<td align=right> " + StringUtil.formatNumber(ship_amount, MONEY_FORMAT) + " </td>" +
          "</tr>" ;
}

// print month year options
String monthYearOptions = "";
java.util.Date tmpDate = new java.util.Date();

/*
for (int i = 0; i < 12; i++) {
  String tmpMonthYear = DateUtil.getFmtDateString(DateUtil.getRelativeDate(tmpDate, 0, -i, 0), "MM/yyyy");
  monthYearOptions += "<option value='" + tmpMonthYear + "' "
                    + (ag_month_year.equals(tmpMonthYear) ? "selected" : "")
                    + ">" + tmpMonthYear + "</option>";
}
*/

// print user Buyer options
String userBuyerOptions = "";

for (int i = 0; i < matrix2.getRowCount(); i++) {
  int j = 0;
  String code = matrix2.getRowData(i).getData(j++);
  String codeName = matrix2.getRowData(i).getData(j++);

  userBuyerOptions += "<option value='" + code + "'"
                    + (ag_buyer.equals(code) ? " selected" : "") + ">" + codeName + " : "+code+"</option>";                    
}
// print user Supplier options
String userSupOptions = "";

for (int i = 0; i < matrix3.getRowCount(); i++) {
  int j = 0;
  String code = matrix3.getRowData(i).getData(j++);
  String codeName = matrix3.getRowData(i).getData(j++);

  userSupOptions += "<option value='" + code + "'"
                    + (ag_supplier.equals(code) ? " selected" : "") + ">" + codeName + "</option>";
}
%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE=JavaScript>

function Confirm(form)
{
  var isChecked = false;
   var isChecked2 = false;
  if (form.po_no) {
    if (form.po_no.length) {
      for (var i = 0; i < form.po_no.length; i++) {
        if (form.po_no[i].checked) {        	 
        	 if(form.shipQty[i].value != 0) {        	 	
               isChecked = true;
               isChecked2 = true;
               break;
            } else {
               isChecked2 = false;	
           }	  
        }
      }
    } else {
      if (form.po_no.checked) isChecked = true;
      
    }
  }
  if (!isChecked2) {
    alert('If selected PO with 0 Shipment Qty or no Shipment information then the invoice cannot be created!');
    return;
  }
  if (!isChecked) {
    alert('Select POs you want to add to invoice.');
    return;
  }

  if (confirm('Do you want to add the shipment into the Invoice from the selected PO?')) {
<%
if (actionFlag.equals("AP")) {
%>
    form.target = opener.name;
    form.action = './invoice_edit_save.jsp';
    form.submit();
    top.close();
<%
} else {
%>
    form.action = "./invoice.jsp";
    form.submit();
<%
}
%>
  }
}

function submit()
{
  frmMain.submit();
}

function fnView(po_no_selected) {
	var win = window.open('', "winPrint", "toolbar=no, menubar=no, resizable=no, scrollbars=yes, width=1000, height=900");
    frmMain.po_no_selected.value = po_no_selected;
    if (win) {
	    frmMain.action = "/ordermanagement/po_detail_popup.jsp";
	    frmMain.target = win.name;
	    frmMain.submit();
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
  <td width="3%"><img src="/img/title_icon.gif"></td>
  <td width="*" class="left_title">Create Invoice Step-1 : Search target PO</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<TABLE WIDTH=90% border="0" cellspacing="0" cellpadding="0" align="center">
<FORM NAME=frmMain ACTION="invoice_confirm_search.jsp" METHOD=POST>
<input type='hidden' name='actionFlag' value='<%= actionFlag %>'>
<input type='hidden' name='po_no_selected'>
<input type='hidden' name='inv_no' value='<%= inv_no %>'>
<input type='hidden' name='sup_id' value='<%= ag_supplier %>'>
<input type='hidden' name='buyer_id' value='<%= ag_buyer %>'>
<input type='hidden' name='chk_status' value='<%= chk_status %>'>
<TR>
  <TD><font color=blue size=2 >* Invoiceable PO target's Order status should be either Create Shipment(75), Ship Item(80), Item Arrive(85). Also, the shipment mube be creatd. </font></TD>
</TR>
</TABLE>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>
<TABLE WIDTH=900 border="0" cellspacing="1" cellpadding="0" align="center" class="table_bg">
<TR>
  <TD width='12%' class='table_header_center'>Buyer</TD>
  <TD width='17%' class='table_bg_bright'><SELECT NAME=ag_buyer <%= actionFlag.equals("AP") ? "disabled" : "" %>><%= userBuyerOptions %></SELECT></TD>
  <TD width='12%' class='table_header_center'>Supplier</TD>
  <TD width='17%' class='table_bg_bright'><SELECT NAME=ag_supplier <%= actionFlag.equals("AP") ? "disabled" : "" %>><%= userSupOptions %></SELECT></TD>
  <TD width='12%' class='table_header_center'>PO#</TD>
  <TD width='17%' class='table_bg_bright'><input type=text name=ag_po_no value='<%= ag_po_no %>'></TD>
  <TD width='12%' class='table_header_center'>Order by </TD>
  <TD width='17%' class='table_bg_bright'>
    <SELECT NAME=ag_orderby >
    <OPTION value="1"  <% if(ag_orderby.equals("1")) out.print("SELECTED");  %>> PO No.</OPTION>
    </SELECT></TD>
  <td width='13%' class='table_bg_bright_center'><INPUT TYPE=BUTTON VALUE="Search" ONCLICK=submit(this.form)></TD>
</TR>
</TABLE>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>

<TABLE width=900 border=0 CELLPADDING=0 CELLSPACING=1 align=center class="table_bg">
<TR class='table_header_center'>
<TD align=center bgcolor="e6e6fa">&nbsp;</TD>
<TD align=center bgcolor="e6e6fa">No.</TD>
<TD align=center bgcolor="e6e6fa">Buyer</TD>
<TD align=center bgcolor="e6e6fa">Ref#</TD>
<TD align=center bgcolor="e6e6fa">PO No.</TD>
<TD align=center bgcolor="e6e6fa">Style No.</TD>
<TD align=center bgcolor="e6e6fa"><font color='red'>Shipping Date</font></TD>
<TD align=center bgcolor="e6e6fa">Unit Price</TD>
<TD align=center bgcolor="e6e6fa">P.O Total Qty</TD>
<TD align=center bgcolor="e6e6fa">P.O Sum Price</TD>
<TD align=center bgcolor="e6e6fa">Shipment Total Qty</TD>
<TD align=center bgcolor="e6e6fa">Shipment Sum Price</TD>
</TR>
<%= outS %>
</TABLE>
<table border="0" cellspacing="0" cellpadding="0" align='center'>
<tr>
  <td width="100%" height="15"></td>
</tr>
<tr>
  <td width="100%" align='center'><INPUT TYPE=BUTTON VALUE="Add to invoice" ONCLICK="Confirm(this.form)"></td>
</tr>
</FORM>
</table>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
</BODY>
</HTML>
