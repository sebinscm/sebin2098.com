<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@ include file="/admin/login_check.jsp" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/common/calendar/calendar.htm" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";
String fromUrl="/payment/admin_payment_search.jsp";
String imgUrl = "<font color=red>Image<br>Not Ready</font>";
String ag_supplier = request.getParameter("ag_supplier");
String ag_inv_no = request.getParameter("ag_inv_no");
String ag_date_type = request.getParameter("ag_date_type");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");
String ag_orderby = request.getParameter("ag_orderby");
String ag_buyer = request.getParameter("ag_buyer");
if (ag_supplier == null  || ag_supplier.equals("")) ag_supplier = "";
if (ag_inv_no == null || ag_inv_no.equals("")) ag_inv_no = "";
if (ag_date_type == null || ag_date_type.equals("")) ag_date_type = "CD";

if (ag_from_date == null || ag_to_date == null) {
   ag_from_date = DateUtil.getRelativeDateString(new java.util.Date(), 0, 0, -30, "yyyy/MM/dd");
   ag_to_date = DateUtil.getToday("yyyy/MM/dd");
}

if (ag_po_no == null || ag_po_no.equals("") ) ag_po_no = "";
if (ag_style_no == null || ag_style_no.equals("") ) ag_style_no = "";
if (ag_orderby == null) ag_orderby = "6";
if (ag_buyer == null || ag_buyer.equals("") ) ag_buyer = "";

Connection conn = null;

MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
MatrixDataSet matrix3 = null;

DataProcess dataProcess = null;
String sql = "";
String sql2 = "";
String sql3 = "";

int iRet = 0;
int iRet2 = 0;
int iRet3 = 0;

String outS = "";


// query for po list
sql = " select  ifnull(a.payment_no,'Not Invoiced'),a.order_no, "
    + "             a.style, "
    + "             a.season, "
    + "          a.order_date, "
    + "          a.buyer_name, "
    + "         a.supplier_name, "
    + "         b.code_name, "
    + "         date_format(a.created, '%Y/%m/%d'),a.vendor_price,a.total_qty, "
    + "         a.total_qty * a.vendor_price, "
    + "         date_format(a.order_date, '%Y/%m/%d'),sgr,date_format(a.arrival_date, '%Y/%m/%d'),date_format(a.received_date, '%Y/%m/%d'), "
    + "         supplier,buyer "
    + " from   purchase_order a, vg_common_code b "
    + " where   a.backorder_flag = 'N' and a.order_status = b.code and b.type='ORDER_STATUS' and b.use_yn='Y' " ;

if (ag_po_no.length() > 0 || ag_style_no.length() > 0) {
  if (ag_po_no.length() > 0) {
    String sql_po_no = "'" + ag_po_no.replaceAll(",", "','") + "'";
    sql += " and    upper(order_no)  in upper(" + sql_po_no + ") " ;
  }

  if (ag_style_no.length() > 0) {
    sql += " and    upper(style) like upper('" + ag_style_no + "%' )" ;
  }
  
} else {
  if (!ag_supplier.equals("")) {
    sql += " and    supplier = '" + ag_supplier + "' ";
  }

  if (!ag_inv_no.equals("")) {
    sql += " and    upper(payment_no) = upper('" + ag_inv_no + "') ";
  }

  if (!ag_buyer.equals("")) {
    sql += " and    buyer = '" + ag_buyer + "' ";
  }
  
  String tmpDate = "";
  if (ag_date_type.equals("DD")) {
    tmpDate = "delivery_date";
  } else if (ag_date_type.equals("AD")) {
    tmpDate = "arrival_date";
  } else if (ag_date_type.equals("CD")) {
    tmpDate = "created";
  } else if (ag_date_type.equals("OD")) {
    tmpDate = "order_date";
  }

  sql += " and " + tmpDate + "  BETWEEN  str_to_date('" + ag_from_date + "', '%Y/%m/%d') "
       + " and  str_to_date('" + ag_to_date + "',  '%Y/%m/%d') ";
}

sql += " order by ";

if ( ag_orderby.equals("1"))  {
  sql += " order_no ";
}
else if ( ag_orderby.equals("2"))  {
  sql += " supplier, order_no ";
}
else if ( ag_orderby.equals("3"))  {
  sql += " buyer, order_no ";
}
else if ( ag_orderby.equals("4"))  {
  sql += " arrival_date, order_no " ;
}
else if ( ag_orderby.equals("5"))  {
  sql += " delivery_date, order_no " ;
}
else if ( ag_orderby.equals("6"))  {
  sql += " delivery_date,supplier, order_no " ;
}
//out.println(sql);

// query for supplier list
sql2 = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'S' "
      + " order by id asc";

// query for buyer list
sql3 = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'B' "
      + " order by id asc";

          
 

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
  // supplier list
  
  iRet2 = dataProcess.RetrieveData(sql2, matrix2, conn);

  // buyer list
  iRet3 = dataProcess.RetrieveData(sql3, matrix3, conn);

  
} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception in admin_delivery_status_list : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
 
}

// print po list
int editableCnt = 0;

for (int i = 0; i < iRet; i++) {
  int j = 0;  
  String inv_no = matrix.getRowData(i).getData(j++);
  String po_no = matrix.getRowData(i).getData(j++);
  String style_no  = matrix.getRowData(i).getData(j++);
  String season   = matrix.getRowData(i).getData(j++);
  String order_date = matrix.getRowData(i).getData(j++);
  String buyer = matrix.getRowData(i).getData(j++);
  String supplier = matrix.getRowData(i).getData(j++);
  String po_status = matrix.getRowData(i).getData(j++);
  String created_date = matrix.getRowData(i).getData(j++); 
  double vendor_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  int total_qty = Integer.parseInt(matrix.getRowData(i).getData(j++));
  double total_amt = Double.parseDouble(matrix.getRowData(i).getData(j++));
  String ord_date = matrix.getRowData(i).getData(j++);
 String  sgr = matrix.getRowData(i).getData(j++);
 String out_date = matrix.getRowData(i).getData(j++);
 String rcv_date = matrix.getRowData(i).getData(j++);
 String sup_id = matrix.getRowData(i).getData(j++);
 String buyer_id = matrix.getRowData(i).getData(j++);
  String colour_code = "#FFFFF0";
   // PO Status list
  // set item imagae
    File imgFile = new File(application.getRealPath(_styleImgURL) + File.separator + style_no.toLowerCase() + ".jpg");
	if (imgFile.exists()) {
	  imgUrl = "<img src='" + _styleImgURL + "/" + style_no.toLowerCase() + ".jpg' width='50' height='70'>";
	} else {
		  imgUrl = "<img src='" + _styleImgURL + "/noimage.jpg' width='50' height='70'>";
	}	
 
  outS += "<tr align='center' bgcolor='" + colour_code + "'>"
           + " <td>" + (i+1) + "</td>" ;
  if ( !inv_no.equals("Not Invoiced") ) {     
     outS   +=  " <td><a href=\"javascript:fnView('" + inv_no + "', '" + sup_id + "', '" + buyer_id + "')\">" + inv_no + "</font></td>" ;
   } else {
   	  outS   +=  " <td><font color=red>" + inv_no + "</font></td>" ;   
   	}  
  outS  +=  " <td><a href=\"javascript:fnPOView('" + po_no + "')\">" + po_no + "</td>"
               + " <td>" + sgr + "</td>"
		        + " <td>" + style_no + "</td>"
		        + " <td>" + season + "</td>"
		        + " <td>" + buyer + "</td>"
		        + " <td>" + supplier + "</td>"
		        + " <td>" + StringUtil.formatNumber(vendor_price, MONEY_FORMAT) + "</td>"         
		        + " <td>" + StringUtil.formatNumber(total_qty, QTY_FORMAT) + "</td>"
		        + " <td>" + StringUtil.formatNumber(total_amt, MONEY_FORMAT) + "</td>" 
		        + " <td>" + po_status + "</td>" 
		        + " <td>" + ord_date + "</td>" 
		        + " <td>" + out_date+ "</td>" 
		        + " <td>" + rcv_date + "</td>" ;


     

    editableCnt++;


  outS += "<td>" + imgUrl + "</td></tr>";
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

// print buyer list
String buyerList = "<option value=''>All</option>";
for (int i = 0; i < iRet3; i++) {
  int j = 0;
  String buyer_id = matrix3.getRowData(i).getData(j++);
  String buyer_name = matrix3.getRowData(i).getData(j++);

  buyerList += "<option value='"+ buyer_id + "'" 
             + (ag_buyer.equals(buyer_id) ? " selected" : "") + ">" 
             + buyer_name + " : "+buyer_id+"</option>";
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
  frm.submit();
}

function fnView(inv_no, sup_id,buyer_id) {
  frmMain.inv_no.value = inv_no;
  frmMain.sup_id.value = sup_id;
  frmMain.buyer_id.value = buyer_id;
  frmMain.action = './admin_payment_details.jsp';
  frmMain.submit();
}
function fnPOView(po_no_selected) {
  frmMain.po_no_selected.value = po_no_selected;
  frmMain.action = "/ordermanagement/admin_po_details_screen.jsp";
  frmMain.submit();
}
</SCRIPT>
</HEAD>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="850" border="0" cellspacing="0" cellpadding="0">
<tr><td>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/icon_tasks.jpg"></td>
  <td width="*" class="left_title">Payement Search</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<table width="99%" border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<FORM name='frmMain' ACTION="admin_payment_search.jsp" METHOD=POST>
 <input type='hidden' name='inv_no'>
<input type='hidden' name='sup_id'>
<input type='hidden' name='buyer_id'>
<input type='hidden' name='po_no_selected'>
<input type='hidden' name='fromUrl' value='<%= fromUrl %>'>	
	
<tr>
  <td width="10%" class="table_header_center">Supplier</td>
  <td width="32%" class="table_bg_bright"><SELECT NAME='ag_supplier'><%= supplierList %></SELECT></td>
  <td width="10%" class="table_header_center">Invoice No.</td>
  <td width="20%" class="table_bg_bright"><input type='text' name='ag_inv_no' size='20' maxlength='20' class='input_text'></td>
  <td width="28%" class="table_bg_bright_center" colspan='2' rowspan='2'><INPUT TYPE='BUTTON' VALUE="Search" ONCLICK='fnSubmit(this.form)'>
    <!--input type='button' value='Save as Excel' onclick='fnExcel(document.form2);'></td-->
</tr>
<tr>
  <td class="table_header_center">Search Date</td>
  <td class="table_bg_bright"><select name='ag_date_type'>
  	 <option value='CD' <%= ag_date_type.equals("CD") ? "selected" : "" %>>Created Date</option>
    <option value='OD' <%= ag_date_type.equals("OD") ? "selected" : "" %>>Order Date</option>
    <option value='DD' <%= ag_date_type.equals("DD") ? "selected" : "" %>>Delivery Date</option>
    <option value='AD' <%= ag_date_type.equals("AD") ? "selected" : "" %>>Arrival Date</option>    
    </select><br>From
    <input type='text' name='ag_from_date' size='10' value='<%= ag_from_date %>' style='cursor:hand' readonly  onclick="javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);">
     To
    <input type='text' name='ag_to_date' size='10' value='<%= ag_to_date %>' style='cursor:hand'   readonly onclick="javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);">
    </td>
  <td class="table_header_center">Buyer</td>
  <td class="table_bg_bright"><SELECT NAME='ag_buyer'><%= buyerList %></SELECT></td>
</tr>
<tr>
  <td class="table_header_center">PO#</td>
  <td class="table_bg_bright"><input type=text name='ag_po_no' value='<%= ag_po_no %>' size='40' maxlength='200'></td>
  <td class="table_header_center">Style#</td>
  <td class="table_bg_bright"><input type=text name='ag_style_no' value='<%= ag_style_no %>' size='10' maxlength='6'></td>
  <td width="10%" class="table_header_center">Order by</td>
  <td width="18%" class="table_bg_bright"><SELECT NAME='ag_orderby'>
    <OPTION value="1" <% if(ag_orderby.equals("1")) out.print("SELECTED"); %>>PO No.</OPTION>
    <OPTION value="2" <% if(ag_orderby.equals("2")) out.print("SELECTED"); %>>Supplier</OPTION>
    <OPTION value="3" <% if(ag_orderby.equals("3")) out.print("SELECTED"); %>>Buyer</OPTION>
    <OPTION value="4" <% if(ag_orderby.equals("4")) out.print("SELECTED"); %>>Ship Date</OPTION>
    <OPTION value="5" <% if(ag_orderby.equals("5")) out.print("SELECTED"); %>>Delivery Date</OPTION>
    <OPTION value="6" <% if(ag_orderby.equals("6")) out.print("SELECTED"); %>>Delivery Date+Supplier</OPTION>
    </SELECT></td>
</tr>
</form>
</table>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>
</td></tr></table>
* Select the invoice number below to search its payment history. 
<table width="100%" border="0" cellspacing="0" cellpadding="3"><tr><td>
<TABLE border=0 width=99% CELLPADDING=0 CELLSPACING=1 class="table_bg">
<form name='form2' method='post'>
<input type='hidden' name='ag_supplier' value='<%= ag_supplier %>'>
<input type='hidden' name='ag_inv_no' value='<%= ag_inv_no %>'>
<input type='hidden' name='ag_date_type' value='<%= ag_date_type %>'>
<input type='hidden' name='ag_from_date' value='<%= ag_from_date %>'>
<input type='hidden' name='ag_to_date' value='<%= ag_to_date %>'>
<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
<input type='hidden' name='ag_style_no' value='<%= ag_style_no %>'>
<input type='hidden' name='ag_orderby' value='<%= ag_orderby %>'>
<input type='hidden' name='ag_buyer' value='<%= ag_buyer %>'>
<TR class="table_header_center">
  <TD>No</TD>
  <TD>Invoice No.</TD>
  <TD>PO No.</TD>
  <TD>SGR</TD>
  <TD>Style No.</TD>
  <TD>Season</TD>
  <TD>Buyer</TD>
  <TD>Supplier</TD>
  <TD>Unit Price</TD>
  <TD>Order Qty</TD>
  <TD>Order Price</TD>
  <TD>PO Status</TD>
  <TD>Order Date</TD>
  <TD>Date Ship</TD>
  <TD>Date Arrival</TD>
  <TD>Image</TD>
</TR>
<%= outS %>
</form>
</TABLE>
</td></tr></table>

<table width="840" border="0" cellspacing="0" cellpadding="0"><tr><td>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
<iframe width="0" height="0" name="hidenFrame"></iframe>
</BODY>
</HTML>
