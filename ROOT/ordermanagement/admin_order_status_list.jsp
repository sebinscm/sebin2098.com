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
String imgUrl = "<font color=red>Image<br>Not Ready</font>";
String strSep = "|!^";
String fromUrl = "admin_order_status_list.jsp";
String ag_supplier = request.getParameter("ag_supplier");
String ag_season = request.getParameter("ag_season");
String ag_date_type = request.getParameter("ag_date_type");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");
String ag_orderby = request.getParameter("ag_orderby");
String ag_buyer = request.getParameter("ag_buyer");

if (ag_supplier == null) ag_supplier = "";
if (ag_season == null) ag_season = "";
if (ag_date_type == null) ag_date_type = "CD";
if (ag_from_date == null || ag_to_date == null) {
  ag_from_date = DateUtil.getRelativeDateString(new java.util.Date(), 0, 0, -60, "yyyy/MM/dd");
  ag_to_date = DateUtil.getToday("yyyy/MM/dd");
}
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
    + "         a.order_status, "
    + "         date_format(a.created, '%Y/%m/%d'),total_qty, "
    + "         date_format(a.initial_del_date, '%Y/%m/%d'),a.sgr,a.buyer,b.code_name "
    + " from   purchase_order a LEFT OUTER JOIN vg_common_code b ON (  a.order_status = b.code and type='ORDER_STATUS' and b.use_yn='Y'  )  " 
    + " where   backorder_flag = 'N' " ;

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

  sql += " and " + tmpDate + "  BETWEEN  str_to_date('" + ag_from_date + "', '%Y/%m/%d') "
       + " and  str_to_date('" + ag_to_date + "',  '%Y/%m/%d') ";
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

// read user brand code info
//sql5 =  " select code,code_name from vg_common_code " +
//          " where type = 'BRAND' " +
//          " and     use_yn = 'Y' " +
//          "  order by code ";
          
sql4 = " select code,code_name  from vg_common_code " +
          " where type='ORDER_STATUS' and use_yn='Y' and code >'30' order by sort_order ";          

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

  // brand list
 // iRet5 = dataProcess.RetrieveData(sql5, matrix5, conn);

  iRet4 = dataProcess.RetrieveData(sql4, matrix4, conn); 
  
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
  String  buyer_code = matrix.getRowData(i).getData(j++);
  String  status_name = matrix.getRowData(i).getData(j++);
  String colour_code = "#FFFFF0";
   // PO Status list
  // set item imagae
    File imgFile = new File(application.getRealPath(_styleImgURL) + File.separator + style_no.toLowerCase() + ".jpg");
	if (imgFile.exists()) {
	  imgUrl = "<img src='" + _styleImgURL + "/" + style_no.toLowerCase() + ".jpg' width='50' height='70'>";
	} else {
		  imgUrl = "<img src='" + _styleImgURL + "/noimage.jpg' width='50' height='70'>";
	}	
	
  String strLink = "<a href=\"javascript:fnSetData('"
                  + po_no + strSep
                  + po_status 
                  + "')\">" + po_no + "</a>";

  outS += "<tr align='center' bgcolor='" + colour_code + "'>"
        + " <td>" + (i+1) + "</td>"
        + " <td>" + strLink + "</td>"
        + " <td>" + sgr + "</td>"
        + " <td>" + style_no + "</td>"
        + " <td>" + season + "</td>"
        + " <td>" + buyer + "</td>"
        + " <td>" + buyer_code + "</td>" 
        + " <td>" + supplier + "</td>"        
        + " <td>" + total_qty + "</td>"
        + " <td>" + status_name + "</td>" 
        + "  <td><a href=\"javascript:fnViewHistory('" + po_no + "')\">  View Change history </a></td>"  ;
       

    //String cus_init_date_input = "";

    //cus_init_date_input = "<input type='text' name='init_delivery_date' size='10' value='" + init_delivery_date + "' style='cursor:hand' readonly "
    //                              + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\">";    
     
   // outS += " <td nowrap><input type='hidden' name='po_no' value='" + po_no + "'>" + cus_init_date_input + "</td>";
   // outS += " <td nowrap>" + cus_init_date_input + "</td>";
     

    editableCnt++;

  statusList = "";
  outS += "<td>" + imgUrl + "</td></tr>";
}

// print po_status list
//statusList  = "<option value=''>All</option>";
for (int i = 0; i < iRet4; i++) {
  String code = matrix4.getRowData(i).getData(0);
  String code_name = matrix4.getRowData(i).getData(1);
   statusList  += "<option value=\"" + code + "\"";    
   statusList  += ">" + code_name + "</option>";
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
<SCRIPT LANGUAGE=JavaScript>
function fnSetData(strParams) {
  var params = strParams.split('<%= strSep %>');
  var j = 0;

  with (document.form2) {
    po_no.value = params[j++];
    jf_fnSetSelectOption(po_status_list, params[j++]);
  }
}	
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
    frm.action="./admin_order_status_excel.jsp";
    frm.target = hidenFrame.name;
    frm.submit();
  }
}
function fnViewHistory(po_no_selected) {
  frmMain.po_no_selected.value = po_no_selected;
  frmMain.action  = "./admin_po_status_updated_history.jsp";
  frmMain.submit();
}

function fnView(po_no_selected) {
  frmMain.po_no_selected.value = po_no_selected;
  frmMain.action = "./admin_po_details_screen.jsp";
  frmMain.submit();
}

<%
if (_admingroup.equals("A")) {
%>
function fnSave(frm) {
  if (!frm.po_no.value) {
    alert('Select PO number to update the status!');
    return;
  }	
  if (confirm('Do you want to update selected PO( '+frm.po_no.value+' ) Status?')) {      	
        frm.action = './admin_order_status_save.jsp';
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
<table width="840" border="0" cellspacing="0" cellpadding="0">
<tr><td>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/icon_tasks.jpg"> </td>
  <td width="*" class="left_title">Order Status Management </td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<table width="99%" border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<FORM name='frmMain' ACTION="admin_order_status_list.jsp" METHOD=POST>
	<input type='hidden' name='po_no_selected'>
   <input type='hidden' name='po_status_selected'>
	<input type='hidden' name='fromUrl' value='<%= fromUrl %>'>	
<tr>
  <td width="10%" class="table_header_center">Supplier</td>
  <td width="32%" class="table_bg_bright"><SELECT NAME='ag_supplier'><%= supplierList %></SELECT></td>
  <td width="10%" class="table_header_center">SEASON</td>
  <td width="20%" class="table_bg_bright"><input type='text' name='ag_season' size='20' maxlength='20' class='input_text'></td>
  <td width="28%" class="table_bg_bright_center" colspan='2' rowspan='2'><INPUT TYPE='BUTTON' VALUE="Search" ONCLICK='fnSubmit(this.form)'>
    <input type='button' value='Save as Excel' onclick='fnExcel(document.form2);'></td>
</tr>
<tr>
  <td class="table_header_center">Date</td>
  <td class="table_bg_bright"><select name='ag_date_type'>
  	 <option value='CD' <%= ag_date_type.equals("CD") ? "selected" : "" %>>Created Date</option>
    <option value='OD' <%= ag_date_type.equals("OD") ? "selected" : "" %>>Order Date</option>
    <option value='DD' <%= ag_date_type.equals("DD") ? "selected" : "" %>>Delivery Date</option>
    <option value='AD' <%= ag_date_type.equals("AD") ? "selected" : "" %>>Arrival Date</option>    
    </select><br>From
    <input type='text' name='ag_from_date' size='10' value='<%= ag_from_date %>' style='cursor:hand' readonly  onclick="javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);">
     To
    <input type='text' name='ag_to_date' size='10' value='<%= ag_to_date %>' style='cursor:hand' readonly    onclick="javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);">
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
</td>
</tr>
</table>
* Select PO number below to edit PO Status. 
<table width="840" border="0" cellspacing="0" cellpadding="0" class="table_bg">
<form name='form2' method='post' >
<input type='hidden' name='ag_supplier' value='<%= ag_supplier %>' >
<input type='hidden' name='ag_season' value='<%= ag_season %>' >
<input type='hidden' name='ag_date_type' value='<%= ag_date_type %>' >
<input type='hidden' name='ag_from_date' value='<%= ag_from_date %>' >
<input type='hidden' name='ag_to_date' value='<%= ag_to_date %>' >
<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>' >
<input type='hidden' name='ag_style_no' value='<%= ag_style_no %>' >
<input type='hidden' name='ag_orderby' value='<%= ag_orderby %>' >
<input type='hidden' name='ag_buyer' value='<%= ag_buyer %>' >
<tr >
  <td width='50' bgcolor=yellow align=center>PO#</td>
  <td width='100' class='table_bg_bright'><input type='text' name='po_no' size='30' maxlength='10' readonly ></td>
  <td width='150' bgcolor=yellow align=center >PO Status(*)</td>
  <td width='150' class='table_bg_bright'><select name="po_status_list"><%= statusList %></select></td>
  <%
if (_admingroup.equals("A")) {
%>
  <td align='center' class='table_bg_bright'> <input type='button' value='Update' onclick='fnSave(this.form);'> </td>
<%
}
%>
</tr>
<tr >
  <td colspan=5 class='table_bg_bright'>** If you change the PO Status to "PO-confirm", the confirmation email will be sent to the Supplier. System may be slow down while it is processed.</td>
</tr>
</table>
<TABLE border=0 width=100% border='0' cellspacing='1' cellpadding='1' align='left' class='table_bg'>
<!--tr class='table_header_center'>
  <td colspan='8'>PO Details</td>
  <td colspan='6'>Order Status</td>
</tr-->
<TR class="table_header_center">
  <TD>No</TD>
  <TD>PO No.</TD>
  <TD>SGR</TD>
  <TD>Style No.</TD>
  <TD>Season</TD>
  <TD>Buyer</TD>
  <TD>Buyer ID</TD>
  <TD>Supplier</TD>
  <TD>Total QTY</TD>
  <TD>PO Status</TD>
  <TD></TD>
  <TD>Image</TD>
</TR>
<%= outS %>
</table>

<iframe width="0" height="0" name="hidenFrame"></iframe>
</form></BODY>
</HTML>