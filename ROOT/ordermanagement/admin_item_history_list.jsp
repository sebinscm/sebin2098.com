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
String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_orderby = request.getParameter("ag_orderby");
String ag_style_no = request.getParameter("ag_style_no");
String fromUrl = "admin_item_history_list.jsp";
String imgUrl = "<font color=red>Image<br>Not Ready</font>";

if (ag_from_date == null && ag_to_date == null) {
   ag_from_date = DateUtil.getRelativeDateString(new java.util.Date(), 0, 0, -60, "yyyy/MM/dd");
   ag_to_date = DateUtil.getToday("yyyy/MM/dd");
}

if (ag_orderby == null) ag_orderby = "1";
if (ag_style_no == null) ag_style_no = "";

MatrixDataSet matrix = null;
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
    + "         date_format(a.created, '%Y/%m/%d') ,ifnull(a.total_qty,0) ,b.code_name,a.sgr, ifnull(a.vendor_price,0),  (a.total_qty * a.vendor_price) total_amount,  "
    + "         date_format(a.delivery_date, '%Y/%m/%d') "
    + " from   purchase_order a LEFT OUTER JOIN vg_common_code b  "
    + "             ON (a.order_status = b.code and type='ORDER_STATUS' and b.use_yn='Y' ) " 
    + " where  a.backorder_flag = 'N' " ;
;
 

if ( ag_style_no.length() > 0) {
  
  if (ag_style_no.length() > 0) {
    sql += " and    a.style like '" + ag_style_no + "%' " ;
  }
} else {  
  sql += " and   a.created  between str_to_date('" + ag_from_date + "', '%Y/%m/%d') and str_to_date('" + ag_to_date + "', '%Y/%m/%d') ";


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
   sql += " order by style ";
}
//out.println(sql);


try {

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();

  dataProcess = new DataProcess();

  // po list
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  //conn.commit();

  
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
  String delivery_date = matrix.getRowData(i).getData(j++); 
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
        + " <td>" + po_no + "</td>"
        + " <td>" + sgr + "</td>"
        + " <td><a href=\"javascript:fnView('"  + style_no + "')\">" +style_no+ "</td>"
        + " <td>" + season + "</td>"
        + " <td>" + StringUtil.formatNumber(unit_price, MONEY_FORMAT)  + "</td>"
        + " <td>" + StringUtil.formatNumber(total_qty, QTY_FORMAT) + "</td>"
        + " <td>" + StringUtil.formatNumber(total_price, MONEY_FORMAT) + "</td>"
        + " <td>" + order_date + "</td>"
        + " <td>" + delivery_date + "</td>" 
        + " <td>" + buyer + "</td>"
        + " <td>" + supplier + "</td>"
        + " <td>" + po_status + "</td>"
        + " <td>" + po_status_nm + "</td>" 
        + " <td>" + created_date + "</td>"
        + " <td>" + imgUrl + "</td>"
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
  frm.ag_style_no.value = jf_AllTrim(frm.ag_style_no.value);
  frm.action = "./admin_item_history_list.jsp"
  frm.submit();
}

function fnView(style_no_selected) {
  frmMain.style_no_selected.value = style_no_selected;
  frmMain.action = "./product_info.jsp";
  frmMain.submit();
}
function fnExcel(frm) {
  if (confirm("Do you want to download these data as an excel file?"))
  {
    frm.action="./po_list_excel.jsp";
    //frm.target = hidenFrame.name;
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
  <td width="*" class="left_title">Item History</td>
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
<input type='hidden' name='style_no_selected'>
<INPUT TYPE=HIDDEN NAME=fromUrl VALUE= '<%= fromUrl %>' >
<TR>
  <td width='10%' class='table_header_center'>PO Date</td>
  <td width='30%' class='table_bg_bright'>
    <input type="text" name="ag_from_date" size="10" value="<%= ag_from_date %>" >
    <img src="/img/calendar.gif" style="cursor:hand" align="absmiddle" onclick="javascript:popFrame.fPopCalendar(this, document.frmMain.ag_from_date, document.all['popCal'], 'RIGHT', event);">
    ~
    <input type="text" name="ag_to_date" size="10" value="<%= ag_to_date %>" >
    <img src="/img/calendar.gif" style="cursor:hand" align="absmiddle" onclick="javascript:popFrame.fPopCalendar(this, document.frmMain.ag_to_date, document.all['popCal'], 'RIGHT', event);">
  </td>
  <TD width='10%'class='table_header_center'>Style Number</TD>
  <TD class='table_bg_bright'><input type=text name='ag_style_no' value='<%= ag_style_no %>' size='10' maxlength='6'></TD>  
    <TD colspan="2" rowspan="2" class='table_bg_bright_center'><input type='button' value='Save as Excel' onclick='fnExcel(document.form2);'></td>
</tr>
<TR>   
  <TD width='10%'class='table_header_center'>Order by</TD>
  <TD width='20%' class='table_bg_bright'>
    <SELECT NAME='ag_orderby'>
    <OPTION value="1" <% if(ag_orderby.equals("1")) out.print("SELECTED"); %>> Order Date </OPTION>
    <OPTION value="2" <% if(ag_orderby.equals("2")) out.print("SELECTED"); %>> Buyer </OPTION>
    <OPTION value="3" <% if(ag_orderby.equals("3")) out.print("SELECTED"); %>> PO No. </OPTION>
    <OPTION value="4" <% if(ag_orderby.equals("4")) out.print("SELECTED"); %>> Delivery Date </OPTION>
    <OPTION value="5" <% if(ag_orderby.equals("5")) out.print("SELECTED"); %>> Style </OPTION>
    </SELECT></TD>
  <TD width='30%' class='table_bg_bright_center' colspan='2'><INPUT TYPE=BUTTON VALUE="Search" ONCLICK='fnSubmit(this.form)'></td>
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
<input type='hidden' name='ag_style_no' value='<%= ag_style_no %>'>
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
  <TD>Delivery Date</TD> 
  <TD>Buyer</TD>
  <TD>Supplier</TD>
  <TD>Status Code</TD>
  <TD>Status</TD>
  <TD>Date</TD>
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
