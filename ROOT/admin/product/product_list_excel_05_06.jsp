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
response.setHeader("Content-Disposition", "attachment; filename=Product_Status.xls;");
response.setHeader("Content-Description", "JSP Generated Data");

String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";
String imgUrl = "<font color=red>Image<br>Not Ready</font>";
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
  ag_from_date = DateUtil.getRelativeDateString(new java.util.Date(), 0, 0, -6, "yyyy/MM/dd");
  ag_to_date = DateUtil.getToday("yyyy/MM/dd");
}
if (ag_po_no == null) ag_po_no = "";
if (ag_style_no == null) ag_style_no = "";
if (ag_orderby == null) ag_orderby = "6";
if (ag_buyer == null) ag_buyer = "";

Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
String sql = "";
int iRet = 0;
String outS = "";

// query for po list
sql = " select  order_no, "
    + "             style, "
    + "             season, "
    + "          buyer_name, "
    + "         supplier_name, "
    + "         order_status, "
    + "         date_format(created, '%Y/%m/%d'),total_qty, "
    + "         date_format(order_date,'%Y/%m/%d'), "
    + "         date_format(delivery_date,'%Y/%m/%d'), "
    + "         date_format(arrival_date,'%Y/%m/%d'), "
    + "         date_format(received_date,'%Y/%m/%d'), "
    + "            date_format(CONTRACT_DATE,'%Y/%m/%d'), "  
		+ "		  date_format(FIT_CONFIRM_DATE,'%Y/%m/%d'), " 
		+ "		  date_format(PP_CONFIRM_DATE,'%Y/%m/%d'), " 
		+ "		  date_format(PP_REQUESTED,'%Y/%m/%d'), "     
		+ "		  date_format(MAT_ORDER_DATE,'%Y/%m/%d'), "  
		+ "		  date_format(MAT_IN_DATE,'%Y/%m/%d'), "     
		+ "		  date_format(ACC_ORDER_DATE,'%Y/%m/%d'), "   
		+ "		  date_format(ACC_IN_DATE,'%Y/%m/%d'), "     
		+ "		  date_format(CUTTING,'%Y/%m/%d'), "         
		+ "		  date_format(RUNNING,'%Y/%m/%d'), "          
		+ "		  date_format(TOP_SENT,'%Y/%m/%d'), "         
		+ "		  date_format(TOP_CONFIRM,'%Y/%m/%d'), "       
		+ "	     date_format(PACKING_DATE,'%Y/%m/%d'), " 
	    + "	     date_format(INHOUSE_DATE,'%Y/%m/%d'), " 
	    + "	     date_format(ex_factory_date,'%Y/%m/%d'), " 
	    + "	     date_format(col_order_date,'%Y/%m/%d'), " 
	    + "	     date_format(col_in_date,'%Y/%m/%d'), " 
	    + "	     date_format(pp_in_date,'%Y/%m/%d'), " 
	    + "        subsupplier_name "
    + " from   purchase_order "
    + " where   backorder_flag = 'N' " ;

if (ag_po_no.length() > 0 || ag_style_no.length() > 0) {
  if (ag_po_no.length() > 0) {
    String sql_po_no = "'" + ag_po_no.replaceAll(",", "','") + "'";
    sql += " and    order_no in (" + sql_po_no + ") " ;
  }

  if (ag_style_no.length() > 0) {
    sql += " and    style like '" + ag_style_no + "%' " ;
  }
  
} else {
  if (!ag_supplier.equals("")) {
    sql += " and    supplier = '" + ag_supplier + "' ";
  }

  if (!ag_season.equals("")) {
    sql += " and    season = '" + ag_season + "' ";
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

  System.out.println("Exception in admin_delivery_status_excel : " + e.getMessage());
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
  String buyer = matrix.getRowData(i).getData(j++);
  String supplier = matrix.getRowData(i).getData(j++);
  String po_status = matrix.getRowData(i).getData(j++);
  String created_date = matrix.getRowData(i).getData(j++); 
  String total_qty = matrix.getRowData(i).getData(j++); 
  String order_date = matrix.getRowData(i).getData(j++);
  String delivery_date = matrix.getRowData(i).getData(j++);
  String arrival_date = matrix.getRowData(i).getData(j++);
  String received_date = matrix.getRowData(i).getData(j++);
  String contract_date = matrix.getRowData(i).getData(j++);               
  String fit_confirm_date  = matrix.getRowData(i).getData(j++);           
  String pp_confirm_date  = matrix.getRowData(i).getData(j++);            
  String pp_requested = matrix.getRowData(i).getData(j++);                 
  String mat_order_date = matrix.getRowData(i).getData(j++);              
  String mat_in_date = matrix.getRowData(i).getData(j++);                 
  String acc_order_date = matrix.getRowData(i).getData(j++);              
  String acc_in_date = matrix.getRowData(i).getData(j++);                 
  String cutting = matrix.getRowData(i).getData(j++);                     
  String running = matrix.getRowData(i).getData(j++);                     
  String top_sent = matrix.getRowData(i).getData(j++);                     
  String top_confirm = matrix.getRowData(i).getData(j++);                  
  String packing_date = matrix.getRowData(i).getData(j++); 
  String inhouse_date = matrix.getRowData(i).getData(j++); 
  String go_date = matrix.getRowData(i).getData(j++); 
  String col_date = matrix.getRowData(i).getData(j++); 
  String col_in_date = matrix.getRowData(i).getData(j++);
  String pp_in_date = matrix.getRowData(i).getData(j++);  
  String subsupplier_name = matrix.getRowData(i).getData(j++);
  
  if ( order_date.equals("0000/00/00") )  order_date ="";
   if (delivery_date.equals("0000/00/00") ) delivery_date ="";
   if ( arrival_date.equals("0000/00/00") )  arrival_date ="";
   if (received_date.equals("0000/00/00") ) received_date ="";
   
    if ( contract_date.equals("0000/00/00") )  contract_date ="";
   if (fit_confirm_date.equals("0000/00/00") ) fit_confirm_date ="";
   if ( pp_confirm_date.equals("0000/00/00") ) pp_confirm_date ="";
   if (pp_requested.equals("0000/00/00") ) pp_requested ="";
   
   if (  mat_order_date.equals("0000/00/00") )  mat_order_date ="";
   if (mat_in_date.equals("0000/00/00") ) mat_in_date ="";
   if (  acc_order_date.equals("0000/00/00") )   acc_order_date ="";
   if (acc_in_date.equals("0000/00/00") ) acc_in_date ="";
   
   if ( cutting.equals("0000/00/00") )  cutting ="";
   if ( running.equals("0000/00/00") )  running ="";
   if ( top_sent.equals("0000/00/00") )  top_sent ="";
   if ( top_confirm.equals("0000/00/00") )  top_confirm ="";
   
   if ( packing_date.equals("0000/00/00") )  packing_date ="";
   if (inhouse_date.equals("0000/00/00") ) inhouse_date ="";
   if ( go_date.equals("0000/00/00") )  go_date ="";
   if (col_date.equals("0000/00/00") ) col_date ="";
   
   if (col_in_date.equals("0000/00/00") )  col_in_date ="";
   if ( pp_in_date.equals("0000/00/00") )  pp_in_date ="";
   
   String colour_code = "#FFFFF0";
  // set item imagae
    File imgFile = new File(application.getRealPath(_styleImgURL) + File.separator + style_no + ".jpg");
	if (imgFile.exists()) {
	  imgUrl = "<img src='" + _styleImgURL + "/" + style_no + ".jpg' width='50' height='70'>";
	} else {
		  imgUrl = "<img src='" + _styleImgURL + "/noimage.jpg' width='50' height='70'>";
	}	

 outS += "<tr align='center' bgcolor='" + colour_code + "'>"
        + " <td>" + (i+1) + "</td>"
        + " <td>" + po_no + "</td>" 
        + " <td>" + style_no + "</td>"
        + " <td>" + season + "</td>"
        + "  <td>" + order_date + "</td>"
        + " <td>" + buyer + "</td>"
        + " <td>" + total_qty + "</td>"
        + " <td>" + imgUrl + "</td>"
        + " <td>" + po_status  + "</td>"
        + " <td nowrap>" + inhouse_date     + "</td>"
         + " <td nowrap>" + delivery_date    + "</td>"
          + " <td nowrap>" + contract_date     + "</td>"
          + " <td nowrap>" + go_date    + "</td>"
          + " <td nowrap>" + subsupplier_name     + "</td>"
          + " <td nowrap>" + fit_confirm_date     + "</td>"
          + " <td nowrap>" + pp_in_date    + "</td>" 
          + " <td nowrap>" + pp_confirm_date     + "</td>"
          + " <td nowrap>" + pp_requested + "</td>"
          + " <td nowrap>" + mat_order_date   + "</td>"
          + " <td nowrap>" + mat_in_date   + "</td>"           
          + " <td nowrap>" + col_date    + "</td>" 
          + " <td nowrap>" + col_in_date   + "</td>" 
          + " <td nowrap>" + acc_order_date    + "</td>" 
          + " <td nowrap>" + acc_in_date    + "</td>" 
          + " <td nowrap>" + cutting    + "</td>" 
          + " <td nowrap>" + running    + "</td>" 
          + " <td nowrap>" + top_sent   + "</td>" 
          + " <td nowrap>" + top_confirm  + "</td>" 
          + " <td nowrap>" + packing_date   + "</td>" 
          + " <td nowrap>" + arrival_date   + "</td>"
          + " <td nowrap>" + received_date    + "</td>"
          +  "</tr>";
}
%>
<html>
<head>
</head>
<body>
<table width="1700" border="1" cellspacing="0" cellpadding="0">
<tr class='table_header_center'>
  <td colspan='7'>PO Details</td>
  <td colspan='5'>Order Status</td>
</tr>
<TR class="table_header_center">
  <TD>No</TD>
  <TD>PO No.</TD>
  <TD>Style No.</TD>
  <TD>Season</TD>
  <TD>오더일자</TD>
  <TD>Buyer</TD>
  <TD>Total QTY</TD>
  <TD>Image</TD>
  <TD>PO Status</TD>
  <td>Inhouse </td>
  <td>Delivery</td>
  <td>계약일 </td>
  <td>출고일 </td>
  <td>하청업체 </td>
  <td>FIT 컨펌</td>
  <td>PP입고 </td>
  <td>PP 컨펌</td>
  <td>PP작업지시 </td>
  <td>원단발주 </td>
  <td>원단입고 </td>          
  <td>배색발주 </td>
  <td>배색입고 </td>
  <td>장식발주 </td>
  <td>장식입고 </td>
  <td>재단  </td>
  <td>투입 </td>
  <td>TOP발송 </td>
  <td>TOP 컨펌  </td>
  <td>패킹 </td>
  <td>배뜬는날자 </td>
  <td>미국입고 </td>
</TR>
<%= outS %>
</table>
</body>
</html>