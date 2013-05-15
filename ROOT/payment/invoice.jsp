<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="dbconn.*" %>
<%@page import="common.util.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/common/calendar/calendar.htm" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";

//for go back list
String ag_buyer = request.getParameter("ag_buyer");
String ag_supplier = request.getParameter("ag_supplier");
String ag_po_no = request.getParameter("ag_po_no");
String ag_orderby = request.getParameter("ag_orderby");

String po_no[] = request.getParameterValues("po_no");
String inv_no = request.getParameter("inv_no");
String sdate = DateUtil.getToday("yyyy/MM/dd");

String po_nos = "";
if (po_no != null) {
  for (int i = 0; i < po_no.length; i++) {
    if (i > 0) po_nos += ",";
    po_nos += "'" + po_no[i] + "'";
  }
}

int tot_qty = 0;
//double tot_price_amt = 0.0d;
//double tot_air_price_amt = 0.0d;
double tot_amt = 0.0d;

Statement stmt = null;
ResultSet rs   = null;
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;

String sql  = "";
int iRet = 0;
String outS = "";

// set sql
//sql = " select  a.order_no, concat(a.sgr,a.style) , a.vendor_price,  "
//    + "         a.trans_type, a.total_qty, a.total_qty * a.vendor_price, po_type  "
//    + " from    purchase_order a "
//    + " where   a.backorder_flag = 'N' "
//    + " and     a.order_no in (" + po_nos + ") "
//    + " and     a.buyer = '" + ag_buyer + "' "
//    + " and     a.supplier = '" + ag_supplier + "' "
//    + " and     a.order_status between '75' and '90' "
//    + " order by a.order_no ";
sql =  " select a.order_no, concat(a.sgr,a.style) , a.vendor_price,  "
        + "  a.trans_type, b.order_qty, b.total_amount, a.po_type  "
        + " from purchase_order a LEFT OUTER JOIN shipment_02t b on ( a.order_no = b.po_no and a.buyer = b.buyer_id ) "
        + " where a.backorder_flag = 'N' and a.order_status between '75' and '85' "
        + " and     a.order_no in (" + po_nos + ") "
        + " and     a.supplier = '" + ag_supplier + "' "
        + " and       a.buyer = '" + ag_buyer + "' "
        + " order by a.order_no ";

//out.println(sql);

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception invoice : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

// print out
for (int i = 0; i < iRet; i++) {
  int j = 0;
  String check_pono = matrix.getRowData(i).getData(j++);
  String style_no = matrix.getRowData(i).getData(j++);
  double vendor_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  String trans_type = matrix.getRowData(i).getData(j++);
   int total_qty = Integer.parseInt(matrix.getRowData(i).getData(j++));
   double total_amount = Double.parseDouble(matrix.getRowData(i).getData(j++));
   String deltype = matrix.getRowData(i).getData(j++); 
  //double net_price = vendor_price - disc_price;
  //double net_price_sum = net_price*total_qty;
  //double air_price_sum = air_cost*total_qty;
  //double amount_sum = (net_price_sum + air_price_sum)*1.1;

  tot_qty += total_qty;
  //tot_price_amt += net_price_sum;
  //tot_air_price_amt += air_price_sum;
  tot_amt += total_amount;

  outS += "<tr class='table_bg_bright'>"
        + " <td align=center><INPUT readonly TYPE=TEXT SIZE=2 NAME=seq VALUE=' "+ (i+1) +"' ></td>"
        + " <td align=center><INPUT readonly TYPE=TEXT SIZE=20 NAME=check_pono VALUE='" + check_pono + "'></td>"
        + " <td align=center><input readonly TYPE=TEXT SIZE=15 NAME=a_style_no VALUE='" + style_no + "'></td>"
        + " <td align=center><INPUT readonly TYPE=TEXT SIZE=5 NAME=a_qty VALUE='" + total_qty + "'></td>"
        + " <td align=right ><INPUT readonly TYPE=TEXT SIZE=8 NAME=a_price VALUE='" + StringUtil.formatNumber(vendor_price, MONEY_FORMAT) + "'></td>"
        + " <td align=center><INPUT readonly TYPE=TEXT SIZE=5 NAME=trans_type VALUE='"+trans_type+"'></td>"
        + " <td align=center><INPUT readonly TYPE=TEXT SIZE=5 NAME=del_type VALUE='"+deltype+"'></td>"
        + " <td align=right >"+"$" + StringUtil.formatNumber(total_amount, MONEY_FORMAT) + "</td>"
        + "</tr>";
}

outS += "<tr class='table_bg_bright'> " +
        "<td bgcolor=e6e6fa align=center > Total </td>" +
        "<td bgcolor=e6e6fa align=center >&nbsp;</td>" +
        "<td bgcolor=e6e6fa align=center >&nbsp;</td>" +
        "<td bgcolor=e6e6fa align=center > " + StringUtil.formatNumber(tot_qty, QTY_FORMAT)   + "</td>" +
        "<td bgcolor=e6e6fa align=right  >&nbsp;</td>" +
        "<td bgcolor=e6e6fa align=right  >&nbsp;</td>" +
        "<td bgcolor=e6e6fa align=right  >&nbsp;</td>" +
        "<td bgcolor=e6e6fa align=right  >"+"$" + StringUtil.formatNumber(tot_amt, MONEY_FORMAT) + "</td>" +
        "</tr>";
%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<SCRIPT LANGUAGE=JavaScript>
function fnClearDate(obj)
{
  obj.value = '';
}	
function Save(form)
{
  if (!form.invoice_no.value) {
    alert('Input Invoice No.');
    form.invoice_no.focus();
    return;
  }

  if (!form.filename.value) {
    alert('Input valid Attached Invoice File.');
    return;
  }

  var idx;
  var fName = form.filename.value;

  idx = fName.lastIndexOf("\\");
  if (idx < 0) idx = fName.lastIndexOf("/");

  fName = fName.substr(idx+1);
  idx = fName.lastIndexOf(".");
  if (idx >= 0) fName = fName.substring(0, idx);

  if (form.invoice_no.value.toUpperCase() != fName.toUpperCase()) {
    alert('첨부된 Invoice화일이름과 Invoice번호가 같아야 합니다!.\첨부화일 이름을 체크하세요!');
    return;
  }

  if (confirm('Invoice를 생성 하시겠습니까?')) {
    form.action = 'invoice_update.jsp';
    form.submit();
  }
}

function ValidateCharacters(Value)
{
  bRetVal=true;

  for (i=0; i<Value.length; i++)
  {
    if ('1234567890.'.lastIndexOf(Value.substr(i,1))==-1)
    {
      bRetVal=false;
    }
  }

  return bRetVal;
}

function Back(form)
{
  form.action  = "invoice_confirm_search.jsp";
  form.submit();
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
  <td width="*" class="left_title">Invoice생성 2단계 - Invoice생성 및 발송</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center" >
<FORM NAME=frmMain METHOD=POST enctype="multipart/form-data">
<input type='hidden' name='ag_buyer' value='<%= ag_buyer %>'>	
<input type='hidden' name='ag_supplier' value='<%= ag_supplier %>'>	
<tr>
  <td width="100%" ><font color=red>* 첨부할 Invoice file의 이름은 반드시 Invoice번호와 동일하게 만들어 첨부하세요.
    <br> 주) Invoice번호나 이름에는 중간에 공란을 허용하지 않습니다.
    <br>예) Invoice Number &quot;00018201&quot; - File name &quot;00018201.pdf&quot;.
   </td>
</tr>
</table>

<TABLE width=95% border=0 align='center' class="table_bg">
<tr>
<TD width='21%' class='table_header_center'>Invoice No </TD>
<td width='29%' class='table_bg_bright'><INPUT TYPE=TEXT size=15 maxlength='15' NAME='invoice_no' VALUE=''>
  <font color='red'>(Max Length : 15)</font></td>
<TD width='25%' class='table_header_center'>Issue Date</TD>
<td width='30%' class='table_bg_bright'>
    <input type='text' name='invoice_date' size='10' value='<%= sdate %>' style='cursor:hand' readonly
    onclick="javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);">
 </td>   
</tr>
<tr>
<td class='table_header_center'> Invoice File첨부</td>
<td colspan="3" class='table_bg_bright'><INPUT TYPE=FILE  NAME=filename SIZE=60></td>
</tr>
</TABLE>
<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="10"></td>
</tr>
</table>
<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center" class="table_bg">
<tr>
  <td width="100%" class='table_bg_bright'>Invoice 상세내역 List</td>
</tr>
</table>
<TABLE width=95% border=0 CELLPADDING=0 CELLSPACING=1 align=center class="table_bg">
<TR class='table_header_center'>
<TD align=center >Seq</TD>
<TD align=center >PO#</TD>
<TD align=center >Item#</TD>
<TD align=center >Qty</TD>
<TD align=center > Unit Price </TD>
<TD align=center >Shipping Type</TD>
<TD align=center >Delivery Type</TD>
<TD align=center > Amount (GST Inc) </TD>
</TR>
<%=outS%>
<tr> <td colspan=12  class='table_bg_bright' align=center>
<INPUT TYPE=BUTTON VALUE=' Invoice 생성 '   ONCLICK=JavaScript:Save(document.frmMain)>
<INPUT TYPE=BUTTON VALUE='Back'   ONCLICK=JavaScript:Back(document.form1)>
</td></tr>
</TABLE>
</FORM>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
<form name='form1' method='post'>
<input type='hidden' name='ag_buyer' value='<%= ag_buyer %>'>
<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
<input type='hidden' name='ag_orderby' value='<%= ag_orderby %>'>
</form>
</BODY>
</HTML>
