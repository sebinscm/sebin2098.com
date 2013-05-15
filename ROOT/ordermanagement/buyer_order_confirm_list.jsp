<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@ include file="/login_check.jsp" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/common/calendar/calendar.htm" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String imgUrl = "<font color=red>Image<br>Not Ready</font>";
String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";
String fromUrl="./buyer_order_confirm_list.jsp";

String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");
String ag_orderby = request.getParameter("ag_orderby");

if (ag_po_no == null) ag_po_no = "";
if (ag_style_no == null) ag_style_no = "";
if (ag_orderby == null) ag_orderby = "6";


Connection conn = null;

MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
MatrixDataSet matrix3 = null;
MatrixDataSet matrix4 = null;
MatrixDataSet matrix5 = null;
DataProcess dataProcess = null;
String sql = "";

int iRet = 0;
int iRet2 = 0;
int iRet3 = 0;
int iRet4 = 0;
int iRet5 = 0;
String outS = "";
String statusList="";

// query for po list
sql = " select  order_no, "
    + "             style, "
    + "             season, "
    + "          order_date, "
    + "          buyer_name, "
    + "         supplier_name, "
    + "         order_status, "
    + "         date_format(created, '%Y/%m/%d'),total_qty, "
    + "         date_format(initial_del_date,'%Y/%m/%d'),sgr,ifnull(buyer_comments,' ') "
    + " from   purchase_order "
    + " where   backorder_flag = 'N' and order_status='40' " ;    // PO-Confirm¿äÃ»

if (ag_po_no.length() > 0 || ag_style_no.length() > 0) {
  if (ag_po_no.length() > 0) {
    String sql_po_no = "'" + ag_po_no.replaceAll(",", "','") + "'";
    sql += " and    upper(order_no)  in upper(" + sql_po_no + ") " ;
  }

  if (ag_style_no.length() > 0) {
    sql += " and    upper(style) like upper('" + ag_style_no + "%' )" ;
  }
  
} else {
   sql += " and    buyer = '" + scmid + "' ";
  
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
  String total_qty = matrix.getRowData(i).getData(j++); 
  String init_delivery_date = matrix.getRowData(i).getData(j++);
  String  sgr = matrix.getRowData(i).getData(j++);
  String  buyer_comments = matrix.getRowData(i).getData(j++);
  String colour_code = "#FFFFF0";
  // set item imagae
    File imgFile = new File(application.getRealPath(_styleImgURL) + File.separator + style_no.toLowerCase() + ".jpg");
	if (imgFile.exists()) {
	  imgUrl = "<img src='" + _styleImgURL + "/" + style_no.toLowerCase() + ".jpg' width='50' height='70'>";
	} else {
		  imgUrl = "<img src='" + _styleImgURL + "/noimage.jpg' width='50' height='70'>";
	}	  

  outS += "<tr align='center' bgcolor='" + colour_code + "'>"
         + " <td><input type='checkbox' name='po_no' value='" + po_no + "'></td>"
        + " <td>" + (i+1) + "</td>"
        + " <td><a href=\"javascript:fnView('" + po_no + "')\">" + po_no + "</td>" 
        + " <td>" + sgr + "</td>"
        + " <td>" + style_no + "</td>"
        + " <td>" + season + "</td>"
        + " <td>" + imgUrl + "</td>"
        + " <td>" + buyer + "</td>"
        + " <td>" + supplier + "</td><input type='hidden' name='buyer' value='"+ supplier +"' >"        
        + " <td>" + total_qty + "</td>"
        + " <td>" +init_delivery_date+ "</td>"
//        + " <td><select name=ag_po_status>" + statusList + "</select></td>"
        + " <td><textarea  name='remarks' cols='50' rows='5' style='width:100%;' >"+buyer_comments+"</textarea></td>" ;
      editableCnt++;


  outS += "</tr>";
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
  //frm.target = hidenFrame.name;
  frm.submit();
}

function fnExcel(frm) {
  if (confirm("Do you want to download these data as an excel file?"))
  {
    frm.action="./buyer_order_status_excel.jsp";
    frm.target = hidenFrame.name;
    frm.submit();
  }
}

function fnView(po_no_selected) {
  frmMain.po_no_selected.value = po_no_selected;
  frmMain.action = "./buyer_po_details.jsp";
  frmMain.submit();
}

function fnViewPop_up(po_no_selected) {
	var win = window.open('', "winPrint", "toolbar=no, menubar=no, resizable=no, scrollbars=yes, width=1000, height=900");
    frmMain.po_no_selected.value = po_no_selected;
    if (win) {
	    frmMain.action = "./buyer_po_detail_popup.jsp";
	    frmMain.target = win.name;
	    frmMain.submit();
   }
}

function fnSave(frm) {
    // check date 
     if (!jf_ChkRadioOrCheckBox(frm.po_no)) {
         alert('Select PO to be Confirmed!');
        return;
     }
      if (confirm("Do you confirm the PO?")) {
        frm.action = './buyer_order_confirm_save.jsp';
        frm.target = this.name;
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
  <td width="3%"><img src="/img/icon_tasks.jpg"></td>
  <td width="*" class="left_title">PO Confirmation </td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>
1) Search Query
<table width="99%" border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<FORM name='frmMain' ACTION="buyer_order_confirm_list.jsp" METHOD=POST>
	<input type='hidden' name='po_no_selected'>
	<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
    <input type='hidden' name='ag_style_no' value='<%= ag_style_no %>'>
    <input type='hidden' name='ag_orderby' value='<%= ag_orderby %>'>
    <input type='hidden' name='fromUrl' value='<%= fromUrl %>'>
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
    <td width="28%" class="table_bg_bright_center" colspan='6'><INPUT TYPE='BUTTON' VALUE="Search" ONCLICK='fnSubmit(this.form)'>
    	<!--input type='button' value='Save as Excel' onclick='fnExcel(document.form2);'></td-->
</tr>
</form>
</table>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>
</td></tr></table>
2) Search Result:<br>
1. Select PO to be confirmed.<br>
2. Click 'Confirm' Button. After PO is confirmed, the PO will be taken away from the search result list.<br>
3. The confirmed PO can be found by PO status on PO History menu.<br>
<table width="100%" border="0" cellspacing="0" cellpadding="3"><tr><td>
<TABLE border=0 width=99% CELLPADDING=0 CELLSPACING=1 class="table_bg">
<form name='form2' method='post'>
<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
<input type='hidden' name='ag_style_no' value='<%= ag_style_no %>'>
<input type='hidden' name='ag_orderby' value='<%= ag_orderby %>'>
<input type='hidden' name='fromUrl' value='<%= fromUrl %>'>
<tr class='table_header_center'>
  <td colspan='10'>PO Details</td>
  <td colspan='2'>Order Confirm</td>
</tr>
<TR class="table_header_center">
<TD>Select</TD>
  <TD>No</TD>
  <TD>PO No.</TD>
  <TD>SGR</TD>
  <TD>Style No.</TD>
  <TD>Season</TD>
  <TD>Image</TD>
  <TD>Buyer</TD>
  <TD>Supplier</TD>
  <TD>Total QTY</TD>
  <TD>Delivery Schedule</TD>
  <TD width='30%'>Comments</TD>
</TR>
<%= outS %>
<tr>
  <td align='center' class='table_bg_bright' colspan='21'><input type='button' value='Confirm' onclick='fnSave(this.form);'>
    <input type='reset' value='Reset'></td>
</tr>
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
