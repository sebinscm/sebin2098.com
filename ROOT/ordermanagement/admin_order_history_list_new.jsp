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
String fromUrl = "admin_order_history_list.jsp";

if (ag_supplier == null) ag_supplier = "";

if (ag_from_date == null && ag_to_date == null) {
   ag_from_date = DateUtil.getRelativeDateString(new java.util.Date(), 0, 0, -60, "yyyy/MM/dd");
   ag_to_date = DateUtil.getToday("yyyy/MM/dd");
}


if (ag_status == null || ag_status==""  ) ag_status = "";
if (ag_orderby == null) ag_orderby = "1";
if (ag_po_no == null) ag_po_no = "";
if (ag_style_no == null) ag_style_no = "";

MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
MatrixDataSet matrix3 = null;
DataProcess dataProcess = null;
Connection conn = null;

String sql = "";
String sql2 = "";
int iRet = 0;
int iRet2 = 0;
int iRet3 = 0;
String outS = "";

// query for po list
sql = " select  a.order_no, "
    + "             a.style, "
    + "             a.season, "
    + "          date_format(a.order_date, '%Y/%m/%d') ,"
    + "          a.buyer_name, "
    + "         a.supplier_name, "
    + "         a.order_status, "
    + "         date_format(a.created, '%Y/%m/%d'),ifnull(a.total_qty,0) ,b.code_name,a.sgr, ifnull(a.vendor_price,0),  (a.total_qty * a.vendor_price) total_amount  "
    + " from   purchase_order a LEFT OUTER JOIN vg_common_code b ON (  a.order_status = b.code and type='ORDER_STATUS' and b.use_yn='Y'  )  "
    + " where  a.backorder_flag = 'N' " ;
 

if (ag_po_no.length() > 0 || ag_style_no.length() > 0) {
  if (ag_po_no.length() > 0) {
    sql += " and    a.order_no like '" + ag_po_no + "%' " ;
  }

  if (ag_style_no.length() > 0) {
    sql += " and    a.style like '" + ag_style_no + "%' " ;
  }
} else {
  if (!ag_supplier.equals("")) {
      sql += " and    a.buyer = '" + ag_supplier + "' ";
    }

  sql += " and    a.created between str_to_date('" + ag_from_date + "', '%Y/%m/%d') and str_to_date('" + ag_to_date + "', '%Y/%m/%d') ";

  if (!ag_status.equals("")) {    
      sql += " and    a.order_status = '" + ag_status + "' ";
  } 

}

if ( ag_orderby.equals("1"))  {
   sql += " order by order_date ";
} 
else if ( ag_orderby.equals("2"))  {
   sql += " order by buyer  ";
}
else if ( ag_orderby.equals("3"))  {
   sql += " order by order_no ";
}
else if ( ag_orderby.equals("4"))  {
   sql += " order by delivery_date ";
}
else if ( ag_orderby.equals("5"))  {
   sql += " order by created ";
}
//out.println(sql);

// query for buyer list
sql2 = " select id, name from login_01t  where user_type = 'B' order by name ";
// ORDER STATUS
String sql3 = " select code,code_name  from vg_common_code " +
                   " where type='ORDER_STATUS' and use_yn='Y' and code  between '35' and '999' order by sort_order ";
try {

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  matrix2 = new MatrixDataSet();
  matrix3 = new MatrixDataSet();
  dataProcess = new DataProcess();

  // po list
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  //conn.commit();

  // supplier list
  iRet2 = dataProcess.RetrieveData(sql2, matrix2, conn);
  
  // order status
  iRet3 = dataProcess.RetrieveData(sql3, matrix3, conn);

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
  if(po_status_nm.equals("Requested PO-Confirm")){
    colour_code = "#D8F0F8";
  }
  else if(po_status_nm.equals("Shipping Out")){
      colour_code = "#5EAE9E";
  }
  else if(po_status_nm.equals("CANCEL ORDER")){
      colour_code = "#FF7373";
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
        + " <td><a href=\"javascript:fnView('" + po_no + "')\">" + po_no + "</td>"
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
        + "  <td><a href=\"javascript:fnViewPT('" + po_no + "')\">  View PT# detail </a></td>"  
        + "  <td><a href=\"javascript:fnViewComments('" + po_no + "')\">  View Comment History </a></td>"  
        + "  <td><a href=\"javascript:fnViewHistory('" + po_no + "')\">  View edit history </a></td>"  
        + " <td>" + imgUrl + "</td>"
        + "</tr>";
}

// print supplier list
String supplierList = "<option value=''>All</option>";

for (int i = 0; i < iRet2; i++) {
  int j = 0;
  String supplier_id = matrix2.getRowData(i).getData(j++);
  String supplier_name = matrix2.getRowData(i).getData(j++);

  supplierList += "<option value='"+ supplier_id + "'" 
                + (ag_supplier.equals(supplier_id) ? " selected" : "") + ">" 
                + supplier_id + "-" + supplier_name + "</option>";
}
// order status list
String statusList = "<option value=''>All</option>";

for (int i = 0; i < iRet3; i++) {
  int j = 0;
  String code = matrix3.getRowData(i).getData(j++);
  String code_name = matrix3.getRowData(i).getData(j++);

  statusList += "<option value='"+ code + "'" 
                + (ag_status.equals(code) ? " selected" : "") + ">" 
                + code + "-" + code_name + "</option>";
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

function fnView(po_no_selected) {
  frmMain.po_no_selected.value = po_no_selected;
  frmMain.action = "./admin_po_details_screen.jsp";
  frmMain.submit();
}
function fnViewComments(po_no_selected) {
  frmMain.po_no_selected.value = po_no_selected;
  frmMain.action  = "./admin_po_comments_list.jsp";
  frmMain.submit();
}
function fnViewHistory(po_no_selected) {
  frmMain.po_no_selected.value = po_no_selected;
  frmMain.action  = "./admin_po_updated_history_list.jsp";
  frmMain.submit();
}
function fnViewPT(po_no_selected) {
  frmMain.po_no_selected.value = po_no_selected;
  frmMain.action  = "./pt_view.jsp";
  frmMain.submit();
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
<table width="840" border="0" cellspacing="0" cellpadding="0">
<tr><td>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/btnCategories.gif"></td>
  <td width="*" class="left_title">Purchase Order History</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<TABLE WIDTH=99% border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<FORM name='frmMain'  METHOD=POST>
<input type='hidden' name='po_no_selected'>
<input type='hidden' name='fromUrl' value='<%= fromUrl %>'>	
<TR>
  <TD width='10%' class='table_header_center'>Buyer</TD>
  <TD width='60%' class='table_bg_bright' colspan='3'>
    <SELECT NAME='ag_supplier'>
      <%= supplierList %>
    </SELECT>    
  </td>
  <TD width='30%' class='table_bg_bright_center' colspan='2'><INPUT TYPE=BUTTON VALUE="Search" ONCLICK='fnSubmit(this.form)'></td>
</TR>
<TR>
  <td width='10%' class='table_header_center'>PO creation date</td>
  <td width='30%' class='table_bg_bright'>
    <input type="text" name="ag_from_date" size="10" value="<%= ag_from_date %>" >
    <img src="/img/calendar.gif" style="cursor:hand" align="absmiddle" onclick="javascript:popFrame.fPopCalendar(this, document.frmMain.ag_from_date, document.all['popCal'], 'RIGHT', event);">
    ~
    <input type="text" name="ag_to_date" size="10" value="<%= ag_to_date %>" >
    <img src="/img/calendar.gif" style="cursor:hand" align="absmiddle" onclick="javascript:popFrame.fPopCalendar(this, document.frmMain.ag_to_date, document.all['popCal'], 'RIGHT', event);">
  </td>
  <TD width='10%'class='table_header_center'>PO Status</TD>
  <TD width='20%' class='table_bg_bright'>
    <SELECT NAME='ag_status'>
      <%= statusList %>
    </SELECT>
  </td>
  <TD width='10%'class='table_header_center'>Order by</TD>
  <TD width='20%' class='table_bg_bright'>
    <SELECT NAME='ag_orderby'>
    <OPTION value="1" <% if(ag_orderby.equals("1")) out.print("SELECTED"); %>> Order Date </OPTION>
    <OPTION value="2" <% if(ag_orderby.equals("2")) out.print("SELECTED"); %>> Buyer </OPTION>
    <OPTION value="3" <% if(ag_orderby.equals("3")) out.print("SELECTED"); %>> PO No. </OPTION>
    <OPTION value="4" <% if(ag_orderby.equals("4")) out.print("SELECTED"); %>> Delivery Date </OPTION>
    <OPTION value="5" <% if(ag_orderby.equals("5")) out.print("SELECTED"); %>> Created. Date </OPTION>
    </SELECT></TD>
</tr>
<TR>  
  <TD class='table_header_center'>PO#</TD>
  <TD class='table_bg_bright'><input type=text name='ag_po_no' value='<%= ag_po_no %>' size='10' maxlength='6'></TD>
  <TD class='table_header_center'>Style#</TD>
  <TD class='table_bg_bright'><input type=text name='ag_style_no' value='<%= ag_style_no %>' size='10' maxlength='6'></TD>
  <TD colspan="2" class='table_bg_bright_center'><input type='button' value='Save as Excel' onclick='fnExcel(document.form2);'></td>
</TR>
</FORM>
</TABLE>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>
</td></tr></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td>
<TABLE width='99%' border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<form name='form2' method='post'>
<input type='hidden' name='ag_orderby' value='<%= ag_orderby %>'>
<input type='hidden' name='ag_status' value='<%= ag_status %>'>
<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
<input type='hidden' name='ag_style_no' value='<%= ag_style_no %>'>
<input type='hidden' name='ag_supplier' value='<%= ag_supplier %>'>
<input type='hidden' name='ag_from_date' value='<%= ag_from_date %>'>
<input type='hidden' name='ag_to_date' value='<%= ag_to_date %>'>		
<TR class='table_header_center'>
  <TD>No</TD>
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
  <TD>Creation Date</TD>
  <TD>PT# Detail</TD>
  <TD>Comments</TD>
  <TD>Amend History</TD>
  <TD>Image</TD>
</TR>
<%= outS %>
</form>
</TABLE>
</td></tr></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
<iframe width="0" height="0" name="hidenFrame"></iframe>
</BODY>
</HTML>
