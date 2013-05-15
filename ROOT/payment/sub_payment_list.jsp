<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<%@page import="common.*" %>
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
String QTY_FORMAT = "#####0";
String MONEY_FORMAT = "#####0.00";

String ag_supplier = request.getParameter("ag_supplier");
String ag_season = request.getParameter("ag_season");
String ag_date_type = request.getParameter("ag_date_type");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");
String ag_orderby = request.getParameter("ag_orderby");
String ag_buyer = request.getParameter("ag_buyer");
//out.println(ag_from_date);
if (ag_supplier == null) ag_supplier = "";
if (ag_season == null) ag_season = "";
if (ag_date_type == null) ag_date_type = "CD";

if (ag_from_date == null && ag_to_date == null) {
   ag_from_date = DateUtil.getRelativeDateString(new java.util.Date(), 0, 0, -30, "yyyy/MM/dd");
   ag_to_date = DateUtil.getToday("yyyy/MM/dd");
}
//out.println(ag_from_date);
if (ag_po_no == null) ag_po_no = "";
if (ag_style_no == null) ag_style_no = "";
if (ag_orderby == null) ag_orderby = "6";
if (ag_buyer == null) ag_buyer = "";

Connection conn = null;

MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
MatrixDataSet matrix3 = null;
MatrixDataSet matrix4 = null;
MatrixDataSet matrix5 = null;
DataProcess dataProcess = null;
String sql = "";
String sql2 = "";
String sql3 = "";
String sql4 = "";
String sql5 = "";
int iRet = 0;
int iRet2 = 0;
int iRet3 = 0;
int iRet4 = 0;
int iRet5 = 0;
String outS = "";
String statusList="";

// query for po list
sql = " select  a.order_no, "
    + "             a.style, "
    + "             a.season, "
    + "          a.order_date, "
    + "          a.buyer_name, "
    + "         a.supplier_name, "
    + "         b.code_name, "
    + "         date_format(a.order_date, '%Y/%m/%d'),ifnull(a.total_qty,0), "
    + "         date_format(a.delivery_date,'%Y/%m/%d'),a.sgr,ifnull(a.local_price,0),"
    + "         ifnull(a.sub_payment,0), ifnull(a.sub_paid,0), "
    + "         ifnull(a.sub_charge,0), a.sub_comment,  "
    + "         date_format(a.sub_paydate,'%Y/%m/%d'), "
    + "         ifnull(d.subqty,'0'), (ifnull(d.subqty,0) * ifnull(a.local_price,0)), "
    + "         date_format(a.sub_paydate2,'%Y/%m/%d'),ifnull(a.sub_paid2,0), "
    + "         date_format(a.sub_paydate3,'%Y/%m/%d'),ifnull(a.sub_paid3,0), "
    + "         ifnull(a.sub_payment,0) - (  ifnull(a.sub_paid,0) +  ifnull(a.sub_paid2,0) +  ifnull(a.sub_paid3,0) + ifnull(a.sub_charge,0) ) "
    + " from   purchase_order a LEFT OUTER JOIN vg_common_code b ON ( a.order_status = b.code and b.type='ORDER_STATUS' and b.use_yn='Y') "
    + "                                     LEFT OUTER JOIN ( select sum(c.total_qty) subqty ,c.order_no  from subpurchase_order_line c group by order_no ) d on ( a.order_no = d.order_no ) "
    + " where   a.backorder_flag = 'N' " ;

if (ag_po_no.length() > 0 || ag_style_no.length() > 0) {
  if (ag_po_no.length() > 0) {
    String sql_po_no = "'" + ag_po_no.replaceAll(",", "','") + "'";
    sql += " and    upper(a.order_no)  in upper(" + sql_po_no + ") " ;
  }

  if (ag_style_no.length() > 0) {
    sql += " and    upper(a.style) like upper('" + ag_style_no + "%' )" ;
  }
  
} else {
  if (!ag_supplier.equals("")) {
    sql += " and    a.supplier = '" + ag_supplier + "' ";
  }

  if (!ag_season.equals("")) {
    sql += " and    upper(a.season) = upper('" + ag_season + "') ";
  }

  if (!ag_buyer.equals("")) {
    sql += " and    a.buyer = '" + ag_buyer + "' ";
  }
  
  String tmpDate = "";
  if (ag_date_type.equals("DD")) {
    tmpDate = "a.delivery_date";
  } else if (ag_date_type.equals("AD")) {
    tmpDate = "a.arrival_date";
  } else if (ag_date_type.equals("CD")) {
    tmpDate = "a.created";
  } else if (ag_date_type.equals("OD")) {
    tmpDate = "a.order_date";
  }

  sql += " and " + tmpDate + " between   str_to_date('" + ag_from_date + "', '%Y/%m/%d') "
       + " and  str_to_date('" + ag_to_date + "', '%Y/%m/%d') ";
}

sql += " order by ";

if ( ag_orderby.equals("1"))  {
  sql += " a.order_no ";
}
else if ( ag_orderby.equals("2"))  {
  sql += " a.supplier, a.order_no ";
}
else if ( ag_orderby.equals("3"))  {
  sql += " a.buyer, a.order_no ";
}
else if ( ag_orderby.equals("4"))  {
  sql += " a.arrival_date, a.order_no " ;
}
else if ( ag_orderby.equals("5"))  {
  sql += " a.delivery_date, a.order_no " ;
}
else if ( ag_orderby.equals("6"))  {
  sql += " a.delivery_date,a.supplier, a.order_no " ;
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
  matrix4 = new MatrixDataSet();
  //matrix5 = new MatrixDataSet();
  dataProcess = new DataProcess();

  // po list
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  //conn.commit();

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
  String po_no = matrix.getRowData(i).getData(j++);
  String style_no  = matrix.getRowData(i).getData(j++);
  String season   = matrix.getRowData(i).getData(j++);
  String order_date = matrix.getRowData(i).getData(j++);
  String buyer = matrix.getRowData(i).getData(j++);
  String supplier = matrix.getRowData(i).getData(j++);
  String po_status = matrix.getRowData(i).getData(j++);
  String created_date = matrix.getRowData(i).getData(j++); 
   int     total_qty = Integer.parseInt(matrix.getRowData(i).getData(j++));
  String delivery_date = matrix.getRowData(i).getData(j++);
  String  sgr = matrix.getRowData(i).getData(j++);
  double local_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  double sub_payment = Double.parseDouble(matrix.getRowData(i).getData(j++));
  double sub_paid = Double.parseDouble(matrix.getRowData(i).getData(j++));
  double sub_charge = Double.parseDouble(matrix.getRowData(i).getData(j++));
  String  sub_comment = matrix.getRowData(i).getData(j++);  
  String  sub_paydate = matrix.getRowData(i).getData(j++); 
  int     subtotal_qty = Integer.parseInt(matrix.getRowData(i).getData(j++));
  double sub_totalamount = Double.parseDouble(matrix.getRowData(i).getData(j++));
  String  sub_paydate2 = matrix.getRowData(i).getData(j++);
  double sub_paid2 = Double.parseDouble(matrix.getRowData(i).getData(j++)); 
  String  sub_paydate3 = matrix.getRowData(i).getData(j++);
  double sub_paid3 = Double.parseDouble(matrix.getRowData(i).getData(j++)); 
  double sub_balance = Double.parseDouble(matrix.getRowData(i).getData(j++));

  String  pay_date_input  = "<input type='text' name='sub_paydate' size='10' value='" + sub_paydate + "' style='cursor:hand' readonly"
                                    + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'PAID');\">X</a>";
  String  pay_date_input2  = "<input type='text' name='sub_paydate2' size='10' value='" + sub_paydate2 + "' style='cursor:hand' readonly"
                                    + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'PAID2');\">X</a>";
   String  pay_date_input3  = "<input type='text' name='sub_paydate3' size='10' value='" + sub_paydate3 + "' style='cursor:hand' readonly"
                                    + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'PAID3');\">X</a>";                                    
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
        + " <td><a href=\"javascript:fnView('" + po_no + "')\">" + po_no + "</td>" 
        + " <td>" + imgUrl + "</td>"
        + " <td>" + sgr + "</td>"
        + " <td>" + style_no + "</td>"
        + " <td>" + season + "</td>"
        + " <td><input type='hidden' name='po_no' value='" + po_no + "'>" + buyer + "</td>"
//     + " <td>" + supplier + "</td>"        
        + " <td>" + StringUtil.formatNumber(total_qty, QTY_FORMAT) + "</td>"
        + " <td>" + po_status + "</td>"
//        + " <td><input type='hidden' name='po_no' value='" + po_no + "'>" + delivery_date + "</td>"
        +  "<td><input type='text' onblur='extractNumber(this,2,false);' onkeyup='extractNumber(this,2,false);' onkeypress='return blockNonNumbers(this, event, true, false);'  value='"+ StringUtil.formatNumber(local_price, MONEY_FORMAT) +"' name='local_price' size='10' maxlength='10' class='input_text_right'></td>"      
        + " <td>" + StringUtil.formatNumber(subtotal_qty, QTY_FORMAT) + "</td>" 
        + " <td>" + StringUtil.formatNumber(sub_totalamount, MONEY_FORMAT) + "</td>"          
        +  "<td><font color=blue><input type='text' onblur='extractNumber(this,2,false);' onkeyup='extractNumber(this,2,false);' onkeypress='return blockNonNumbers(this, event, true, false);'  value='"+ StringUtil.formatNumber(sub_payment, MONEY_FORMAT)+"' name='sub_payment' size='10' maxlength='10' class='input_text_right'></font></td>"   
        +  "<td><font color=blue><input type='text' onblur='extractNumber(this,2,false);' onkeyup='extractNumber(this,2,false);' onkeypress='return blockNonNumbers(this, event, true, false);'  value='"+ StringUtil.formatNumber(sub_paid, MONEY_FORMAT) +"' name='sub_paid' size='10' maxlength='10' class='input_text_right'></font></td>"    
        + " <td>"+ pay_date_input +" </td>"
        +  "<td><font color=blue><input type='text' onblur='extractNumber(this,2,false);' onkeyup='extractNumber(this,2,false);' onkeypress='return blockNonNumbers(this, event, true, false);'  value='"+ StringUtil.formatNumber(sub_paid2, MONEY_FORMAT) +"' name='sub_paid2' size='10' maxlength='10' class='input_text_right'></font></td>"    
        + " <td>"+ pay_date_input2 +" </td>"
        +  "<td><font color=blue><input type='text' onblur='extractNumber(this,2,false);' onkeyup='extractNumber(this,2,false);' onkeypress='return blockNonNumbers(this, event, true, false);'  value='"+ StringUtil.formatNumber(sub_paid3, MONEY_FORMAT) +"' name='sub_paid3' size='10' maxlength='10' class='input_text_right'></font></td>"    
        + " <td>"+ pay_date_input3 +" </td>"
        + " <td align=right ><font color=red>" + StringUtil.formatNumber(sub_balance, MONEY_FORMAT) + "</font></td>" 
        +  "<td><input type='text' onblur='extractNumber(this,2,false);' onkeyup='extractNumber(this,2,false);' onkeypress='return blockNonNumbers(this, event, true, false);'  value='"+ StringUtil.formatNumber(sub_charge, MONEY_FORMAT) +"' name='sub_charge' size='10' maxlength='10' class='input_text_right'></td>"   
        + " <td><TEXTAREA name=sub_comment cols='50' rows='2'  >" +sub_comment+ " </TEXTAREA></td>";

    editableCnt++;


  outS += "</tr>";
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
             + buyer_name +"-"+buyer_id+ "</option>";
}



%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<script language="javaScript" src="/common/js/validate2.js"></script>
<SCRIPT LANGUAGE=JavaScript>
function fnClearDate(obj)
{
  obj.value = '';
}

function fnClearDate(idx, dateType) {
  with (document.form2) {
    if (po_no.length) {
	      if (dateType == 'PAID') {
	        sub_paydate[idx].value = ''; 
	      }
	      if (dateType == 'PAID2') {
	        sub_paydate2[idx].value = ''; 
	      }
	      if (dateType == 'PAID3') {
	        sub_paydate3[idx].value = ''; 
	      }
    } else {
	      if (dateType == 'PAID') {
	        sub_paydate.value = '';  
         }
         if (dateType == 'PAID2') {
	        sub_paydate2.value = '';  
         }
         if (dateType == 'PAID3') {
	        sub_paydate3.value = '';  
         }
   }
   }
}


function fnSubmit(frm)
{
  frm.ag_po_no.value = jf_AllTrim(frm.ag_po_no.value);
  frm.ag_style_no.value = jf_AllTrim(frm.ag_style_no.value);
  frm.submit();
}

function fnExcel(frm) {
  if (confirm("Do you want to download these data as an excel file?"))
  {
    frm.action="./admin_order_status_excel.jsp";
    frm.target = hidenFrame.name;
    frm.submit();
  }
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

<%
if (_admingroup.equals("A")) {
%>
function fnSave(frm) {
    // check date 
      if (confirm("Are you sure to save these data?")) {
        frm.action = './sub_payment_update.jsp';
        frm.target = this.name;
        frm.submit();
      }


}

<%
}
%>
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
  <td width="3%"><img src="/img/btnWindow.gif"></td>
  <td width="*" class="left_title">Manufacturer Payment Management</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<table width="100%" border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<FORM name='frmMain' ACTION="sub_payment_list.jsp" METHOD=POST>
	<input type='hidden' name='po_no_selected'>
<tr>
  <td width="10%" class="table_header_center">Supplier</td>
  <td width="32%" class="table_bg_bright"><SELECT NAME='ag_supplier'><%= supplierList %></SELECT></td>
  <td width="10%" class="table_header_center">SEASON</td>
  <td width="20%" class="table_bg_bright"><input type='text' name='ag_season' size='20' maxlength='20' class='input_text'></td>
  <td width="28%" class="table_bg_bright_center" colspan='2' rowspan='2'><INPUT TYPE='BUTTON' VALUE="Search" ONCLICK='fnSubmit(this.form)'>
   </tr>
<tr>
  <td class="table_header_center">Date</td>
  <td class="table_bg_bright"><select name='ag_date_type'>
  	 <option value='CD' <%= ag_date_type.equals("CD") ? "selected" : "" %>>Created Date</option>
    <option value='OD' <%= ag_date_type.equals("OD") ? "selected" : "" %>>Order Date</option>
    <option value='DD' <%= ag_date_type.equals("DD") ? "selected" : "" %>>Delivery Date</option>
    <option value='AD' <%= ag_date_type.equals("AD") ? "selected" : "" %>>Arrival Date</option>    
    </select><br>From
    <input type="text" name="ag_from_date" size="10" value="<%= ag_from_date %>" >
    <img src="/img/calendar.gif" style="cursor:hand" align="absmiddle" onclick="javascript:popFrame.fPopCalendar(this, document.frmMain.ag_from_date, document.all['popCal'], 'RIGHT', event);">
    ~
    <input type="text" name="ag_to_date" size="10" value="<%= ag_to_date %>" >
    <img src="/img/calendar.gif" style="cursor:hand" align="absmiddle" onclick="javascript:popFrame.fPopCalendar(this, document.frmMain.ag_to_date, document.all['popCal'], 'RIGHT', event);">
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
* Production Cost and Actual payment could be different.<br>
Actual Cost = Pre-payment + Rest of payment.<br>
Please double check the Actual Payment!<br>
<table width="1800" border="0" cellspacing="0" cellpadding="3"><tr><td>
<TABLE border=0 width=100% CELLPADDING=0 CELLSPACING=1 class="table_bg">
<form name='form2' method='post'>
<input type='hidden' name='ag_supplier' value='<%= ag_supplier %>'>
<input type='hidden' name='ag_season' value='<%= ag_season %>'>
<input type='hidden' name='ag_date_type' value='<%= ag_date_type %>'>
<input type='hidden' name='ag_from_date' value='<%= ag_from_date %>'>
<input type='hidden' name='ag_to_date' value='<%= ag_to_date %>'>
<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
<input type='hidden' name='ag_style_no' value='<%= ag_style_no %>'>
<input type='hidden' name='ag_orderby' value='<%= ag_orderby %>'>
<input type='hidden' name='ag_buyer' value='<%= ag_buyer %>'
<tr class="table_header_center">
  <td colspan='8' align=center  class='table_bg_bright'>PO Basic Info</td>
  <td colspan='13' align=center class='table_bg_bright' >Manufacturer Payment</td>
</tr>
<TR class="table_header_center">
  <TD>No</TD>
  <TD>PO No.</TD>
   <TD>Image</TD>
  <TD>SGR</TD>
  <TD>Style No.</TD>
  <TD>Season</TD>
  <TD>Buyer</TD>
  <TD>PO Qty</TD>
  <TD>PO Status</TD>
  <TD>Unit Price</TD>
  <TD>Produce Qty</TD>
  <TD>Production Price</TD>
  <TD>Actual Payable - Total Price</TD>
  <TD>1st-Payable Price</TD>
  <TD>1st-Pay Date</TD>
  <TD>2nd-Pay Amount</TD>
  <TD>2nd-Pay Date</TD>
  <TD>3nd-Pay Amount</TD>
  <TD>3nd-Pay Date</TD>
  <TD >Balance</TD>
  <TD>Back Charge</TD>
  <TD>Note</TD>  
</TR>
<%= outS %>
<%
if (_admingroup.equals("A")) {
%>
<tr>
  <td align='center' class='table_bg_bright' colspan='21'><input type='button' value='Save' onclick='fnSave(this.form);'>
    <input type='reset' value='Reset'></td>
</tr>
<%
}
%>
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
