<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="java.text.*" %>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@ include file="/admin/login_check.jsp" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/common/calendar/calendar.htm" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

String imgUrl = "<font color=red>Image<br>Not Ready</font>";
String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";
String ag_supplier = request.getParameter("ag_supplier");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_status = request.getParameter("ag_status");
String ag_orderby = request.getParameter("ag_orderby");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");


String search_pono = request.getParameter("po_no_selected");

String fromUrl = request.getParameter("fromUrl");


MatrixDataSet matrix = null;
DataProcess dataProcess = null;
Connection conn = null;

String sql = "";
int iRet = 0;

String outS = "";

// query for po list
sql = " select  date_format(a.updated, '%Y/%m/%d'),user_name,a.order_no, "
    + "             a.style, "
    + "             a.season, "
    + "          date_format(a.order_date, '%Y/%m/%d') ,"
    + "          a.buyer_name, "
    + "         a.supplier_name, "
    + "         a.order_status, "
    + "         date_format(a.created, '%Y/%m/%d'),ifnull(a.total_qty,0) ,b.code_name,a.sgr, ifnull(a.vendor_price,0),  (a.total_qty * a.vendor_price) total_amount  "
    + " from   purchase_order_history a LEFT OUTER JOIN vg_common_code b ON (  a.order_status = b.code and type='ORDER_STATUS' and b.use_yn='Y'  )  "
    + " where  a.backorder_flag = 'N'  and a.order_no ='"+search_pono+"' and a.amend_date is not null order by updated" ; 


//out.println(sql);

try {

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();

  // po list
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
   
} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception in admin_po_status : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
     conn.close();
  }
}

// print po list
for (int i = 0; i < iRet; i++) {
  int j = 0;
  String po_updated = matrix.getRowData(i).getData(j++);
  String updated_user = matrix.getRowData(i).getData(j++);
  String po_no = matrix.getRowData(i).getData(j++);
  String style_no  = matrix.getRowData(i).getData(j++);
  String season   = matrix.getRowData(i).getData(j++);
  String order_date = matrix.getRowData(i).getData(j++);
  String buyer = matrix.getRowData(i).getData(j++);
  String supplier = matrix.getRowData(i).getData(j++);
  String po_status = matrix.getRowData(i).getData(j++);
  String created_date = matrix.getRowData(i).getData(j++); 
  double total_qty = Double.parseDouble(matrix.getRowData(i).getData(j++));   
  String po_status_nm = matrix.getRowData(i).getData(j++);
  String sgr = matrix.getRowData(i).getData(j++);
  double unit_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  double total_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  String colour_code = "";
  if (i%2 == 0) {
    colour_code = "#FFFFF0";
  } else {
    colour_code = "#EEEEE0";
  }
 // set item imagae
    File imgFile = new File(application.getRealPath(_styleImgURL) + File.separator + style_no.toLowerCase() + ".jpg");
	if (imgFile.exists()) {
	  imgUrl = "<img src='" + _styleImgURL + "/" + style_no.toLowerCase() + ".jpg' width='50' height='70'>";
	} else {
		  imgUrl = "<img src='" + _styleImgURL + "/noimage.jpg' width='50' height='70'>";
	}	
  
  outS += "<tr align='center' bgcolor='" + colour_code + "'>"
        + " <td>" + (i+1) + "</td>"
        + " <td>" + po_updated + "</td>"
        + " <td>" + updated_user + "</td>"
        + " <td>" + po_no + "</td>"
        + " <td>" + sgr + "</td>"
        + " <td>" + style_no + "</td>"
        + " <td>" + season + "</td>"
        + " <td>" + StringUtil.formatNumber(unit_price, MONEY_FORMAT)  + "</td>"
        + " <td>" + StringUtil.formatNumber(total_qty, QTY_FORMAT) + "</td>"
        + " <td>" + StringUtil.formatNumber(total_price, MONEY_FORMAT) + "</td>"
        + " <td>" + order_date + "</td>"
        + " <td>" + buyer + "</td>"
        + " <td>" + supplier + "</td>"
        + " <td>" + po_status + "</td>"
        + " <td>" + po_status_nm + "</td>" 
        + " <td>" + created_date + "</td>"
        + "  <td><a href=\"javascript:fnViewPoline('" + po_no + "')\"> View by Color/Size </a></td>"  
 //       + " <td>" + imgUrl + "</td>"
        + "</tr>";
}


%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<SCRIPT LANGUAGE=JavaScript>
function fnSubmit(frm)
{
  frm.ag_po_no.value = jf_AllTrim(frm.ag_po_no.value);
  frm.ag_style_no.value = jf_AllTrim(frm.ag_style_no.value);
  frm.action = "./admin_order_history_list.jsp"
  frm.submit();
}

function fnViewPoline(po_no_selected) {
  frmMain.po_no_selected.value = po_no_selected;
  frmMain.action = "./order_amend_poline_updated_history.jsp";
  frmMain.submit();
}

function fnBack(frm) {
  frm.action = "<%= fromUrl %>";
  frm.submit();
}

function fnExcel(frm) {
  if (confirm("Do you want to download these data as an excel file?"))
  {
    frm.action="./po_list_excel.jsp";
    frm.target = hidenFrame.name;
    frm.submit();
  }
}
</SCRIPT>
</HEAD>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/btnCategories.gif"></td>
  <td width="*" class="left_title">PO Amend History</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td>
<TABLE width='99%' border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<form name='frmMain' method='post'>
<input type='hidden' name='po_no_selected'>
<input type='hidden' name='fromUrl' value='<%= fromUrl %>'>		
<input type='hidden' name='ag_orderby' value='<%= ag_orderby %>'>
<input type='hidden' name='ag_status' value='<%= ag_status %>'>
<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
<input type='hidden' name='ag_style_no' value='<%= ag_style_no %>'>
<input type='hidden' name='ag_supplier' value='<%= ag_supplier %>'>
<input type='hidden' name='ag_from_date' value='<%= ag_from_date %>'>
<input type='hidden' name='ag_to_date' value='<%= ag_to_date %>'>		
<TR class='table_header_center'>
  <TD>No</TD>
  <TD>Date</TD>
  <TD>User</TD> 
  <TD>PO No.</TD>
  <TD>SGR</TD>
  <TD>Style No.</TD>
  <TD>Season</TD>
  <TD>Unit Price</TD>
  <TD>Total Qty</TD>
  <TD>Total Price</TD>
  <TD>Order Date</TD>
  <TD>Buyer</TD>
  <TD>Supplier</TD>
  <TD>Status Code</TD>
  <TD>Status</TD>
  <TD>Create Date</TD>
  <TD>Qty by Color/Size</TD>
</TR>
<%= outS %>
</TABLE>
</td></tr></table>
<br>
<table width='1000' border='0'  cellspacing='0' cellpadding='0'>
<tr>
	<td align=center>
    <input type='button' value='Go Back' onclick='fnBack(this.form);' class="button_default">
   </td>
</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
<iframe width="0" height="0" name="hidenFrame"></iframe>
</form>
</BODY>
</HTML>
