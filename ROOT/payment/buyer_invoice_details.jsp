<%@page import="java.sql.*" %>
<%@page import="dbconn.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";

int iRet = 0;
Connection conn = null;
Connection connVGMain = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
String outS = "";
String sql = "";

String ag_supplier = request.getParameter("ag_supplier");
String ag_supplier_type = request.getParameter("ag_supplier_type");
String ag_month = request.getParameter("ag_month");
String ag_year = request.getParameter("ag_year");
String ag_search_inv_no = request.getParameter("ag_search_inv_no");
String inv_no = request.getParameter("inv_no");
String sup_id = request.getParameter("sup_id");
//String buyer_id = request.getParameter("buyer_id");
String buyer_id = scmid;

if (ag_supplier == null) ag_supplier = "";
if (ag_supplier_type == null) ag_supplier_type = "";
if (ag_month == null) ag_month = "";
if (ag_year == null) ag_year = "";
if (ag_search_inv_no == null) ag_search_inv_no = "";
if (inv_no == null) inv_no = "";
if (sup_id == null) sup_id = "";

String issue_date = "";
String attached_file = "";
String update_date = "";
int total_qty = 0;
double total_net_price_sum = 0d;
double total_air_price_sum = 0d;
double total_amount = 0d;
boolean isEditable = false;

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  // check whether this invoice can be editable
  int iCnt = 0;
 
  sql = " select  count(b.po_no) "
      + " from    invoice_01t a "
      + "         inner join invoice_02t b "
      + "           on ( a.invoice_no = b.invoice_no "
      + "           and a.sup_id = b.sup_id "
      + "           and a.buyer_id = b.buyer_id ) "
      + " where   a.invoice_no = '" + inv_no + "' "
      + " and     a.sup_id = '" + sup_id + "' "
      + " and     a.buyer_id = '" + buyer_id + "' " 
      + " and     b.po_no in ( "
      + "           select  order_no "
      + "           from    purchase_order "
      + "           where   order_status = '92' " //대금청구 상태 - 미수신
      + "         ) ";

 //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  if (iRet > 0) {
    iCnt = Integer.parseInt(matrix.getRowData(0).getData(0));
    if (iCnt > 0) isEditable = true;
  }

  // read invoice header info
  sql = " select date_format(invoice_date,'%Y/%m/%d'), " +
        "        file_name, " +
        "        date_format(updated,'%Y/%m/%d') " +
        "   from invoice_01t " +
        "  where invoice_no = '" + inv_no + "'" +
        "    and buyer_id = '" + buyer_id   + "'" +        
        "    and sup_id = '" + sup_id   + "'";

  //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  if (iRet > 0) {
    int j = 0;
    issue_date = matrix.getRowData(0).getData(j++);
    attached_file = matrix.getRowData(0).getData(j++);
    update_date = matrix.getRowData(0).getData(j++);
  }

  // read invoice details info
  sql = " select po_no, " +
        "        style_no, " +
        "        qty, " +
        "        price, " +
        "        qty * price, seq " +
        "   from invoice_02t " +
        "  where invoice_no = '" + inv_no + "'"  +
        "    and buyer_id = '" + buyer_id   + "'" +   
        "    and sup_id = '" + sup_id   + "'"  +
        "  order by po_no asc ";

  //out.println(sql); if (true) return;
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception invoice_edit_form : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

for (int i = 0; i < iRet; i++) {
  int j = 0;
  String po_no = matrix.getRowData(i).getData(j++);
  String style_no = matrix.getRowData(i).getData(j++);
  int qty = Integer.parseInt(matrix.getRowData(i).getData(j++));
  double unit_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  double total_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  String seqno = matrix.getRowData(i).getData(j++);

  total_qty += qty;
  total_amount += total_price;

  outS += "<tr align='right' bgcolor='" + (i%2 == 0 ? "#FFFFF0" : "#EEEEE0") + "'>" +
          "<td align='center'>" + seqno + "</td>" +
          "<td align='center'>" + po_no + "</td>" +
          "<td align='center'>" + style_no + "</td>" +
          "<td>" + StringUtil.formatNumber(qty, QTY_FORMAT) + "</td>" +
          "<td>$" + StringUtil.formatNumber(unit_price, MONEY_FORMAT) + "</td>" +
          "<td>$" + StringUtil.formatNumber(total_price, MONEY_FORMAT) + "</td>" +
          "</tr>" ;
}
%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE=JavaScript>

function fnSendInv(frm)
{
  if (confirm('해당 Invoice번호를 수신처리를 하시겠습니다?')) {
    frm.target = self.name;
    frm.action = './buyer_invoice_update.jsp';
    frm.actionFlag.value = 'RCV';
    frm.submit();
  }
}

function fnList(frm) {
  frm.target = self.name;
  frm.action = './buyer_invoice_search.jsp';
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
  <td width="*" class="left_title">Invoice Details & 수신처리</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%"><b>Invoice Header</b></td>
</tr>
</table>
<%
if (!isEditable) {
%>
    <font color=red>** 해당 Invoice가 이미 수신처리되었거나 수신처리 대상이 아닙니다.</font>
<%
}
%>
<TABLE WIDTH='95%' border="0" cellspacing="1" cellpadding="0" align="center" class="table_bg">
<FORM NAME='frmMain' METHOD='POST' enctype="multipart/form-data">
<input type='hidden' name='ag_buyer' value='<%= buyer_id %>'>
<input type='hidden' name='ag_supplier' value='<%= sup_id %>'>
<input type='hidden' name='ag_supplier_type' value='<%= ag_supplier_type %>'>
<input type='hidden' name='ag_month' value='<%= ag_month %>'>
<input type='hidden' name='ag_year' value='<%= ag_year %>'>
<input type='hidden' name='ag_search_inv_no' value='<%= ag_search_inv_no %>'>
<input type='hidden' name='inv_no' value='<%= inv_no %>'>
<input type='hidden' name='sup_id' value='<%= sup_id %>'>
<input type='hidden' name='buyer_id' value='<%= buyer_id %>'>
<TR>
  <TD width='150' class='table_header_center'>Invoice번호</TD>
  <TD width='*' class='table_bg_bright'><%= inv_no %></TD>
  <TD width='100' class='table_header_center'>Issue Date</TD>
  <TD width='100' class='table_bg_bright'><%= issue_date %></TD>
</TR>
<TR>
  <TD class='table_header_center'>청구된 Invoice File</TD>
  <TD class='table_bg_bright'><a href="javascript:fnDownload('<%= attached_file %>');"><%= attached_file %></a></TD>
  <TD class='table_header_center'>Updated</TD>
  <TD class='table_bg_bright'><%= update_date %></TD>
</TR>
</FORM>
</TABLE>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>
** 해당 Invoice에 대해서 수신확인 처리를 하려면 '수신확인' 버튼을 누르세요. <br>
   주) Invocie수신처리가 되어야 Payment처리가 가능합니다.
<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%"><b>Invoice Detail List</b></td>
</tr>
</table>
<TABLE width='95%' border=0 CELLPADDING=0 CELLSPACING=1 align=center class="table_bg">
<form name='form1' method='post'>
<input type='hidden' name='ag_supplier' value='<%= sup_id %>'>
<input type='hidden' name='ag_buyer' value='<%= buyer_id %>'>
<input type='hidden' name='ag_supplier_type' value='<%= ag_supplier_type %>'>
<input type='hidden' name='ag_month' value='<%= ag_month %>'>
<input type='hidden' name='ag_year' value='<%= ag_year %>'>
<input type='hidden' name='ag_search_inv_no' value='<%= ag_search_inv_no %>'>
<input type='hidden' name='inv_no' value='<%= inv_no %>'>
<input type='hidden' name='sup_id' value='<%= sup_id %>'>
<input type='hidden' name='buyer_id' value='<%= buyer_id %>'>
<input type='hidden' name='actionFlag'>
<TR class='table_header_center'>  
  <TD>Seq.</TD>
  <TD>PO No.</TD>
  <TD>Style No.</TD>
  <TD>Qty</TD>
  <TD>Unit Price</TD>
  <TD>Amount </TD>
</TR>
<%= outS %>
<tr class='table_header_center'>
  <td colspan='3'>Total</td>
  <td align='right'><%= StringUtil.formatNumber(total_qty, QTY_FORMAT) %></td>
  <TD>&nbsp;</TD>
  <td align='right'>$<%= StringUtil.formatNumber(total_amount, MONEY_FORMAT) %></td>
</tr>
</TABLE>

<table border="0" cellspacing="0" cellpadding="0" align='center'>
<tr>
  <td width="100%" height="10"></td>
</tr>
<tr>
  <td width="100%">
<%
if (isEditable) {
%>
    <input type='button' value='수신확인' onclick='fnSendInv(this.form);'>
<%
}
%>
  <input type='button' value='Go To List' onclick='fnList(this.form);'>
  </td>
</tr>
<tr>
  <td width="100%" height="10"></td>
</tr>
</form>
<form name='form2' method='post'>
<input type='hidden' name='attachPath' value='<%= _invoiceFileUrl %>'>
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
