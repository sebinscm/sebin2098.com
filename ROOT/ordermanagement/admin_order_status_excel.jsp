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
response.setHeader("Content-Disposition", "attachment; filename=Order_Status.xls;");
response.setHeader("Content-Description", "JSP Generated Data");

String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";

String ag_supplier = request.getParameter("ag_supplier");
//String ag_brand = request.getParameter("ag_brand");
String ag_date_type = request.getParameter("ag_date_type");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");
String ag_orderby = request.getParameter("ag_orderby");
String ag_buyer = request.getParameter("ag_buyer");

Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
String sql = "";
int iRet = 0;
String outS = "";

// query for po list
// query for po list
sql = " select  order_no, "
    + "             style, "
    + "             season, "
    + "          order_date, "
    + "          buyer_name, "
    + "         supplier_name, "
    + "         order_status, "
    + "         date_format(created, '%Y/%m/%d'),total_qty, "
    + "         date_format(initial_del_date, '%Y/%m/%d'),date_format(delivery_date, '%Y/%m/%d'), "
    + "         date_format(arrival_date, '%Y/%m/%d'), date_format(received_date, '%Y/%m/%d') " 
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
  String order_date = matrix.getRowData(i).getData(j++);
  String buyer = matrix.getRowData(i).getData(j++);
  String supplier = matrix.getRowData(i).getData(j++);
  String po_status = matrix.getRowData(i).getData(j++);
  String created_date = matrix.getRowData(i).getData(j++); 
  String total_qty = matrix.getRowData(i).getData(j++); 
  String init_delivery_date = matrix.getRowData(i).getData(j++);
  String delivery_date = matrix.getRowData(i).getData(j++);
  String arrival_date = matrix.getRowData(i).getData(j++);
  String received_date = matrix.getRowData(i).getData(j++);

 outS += "<tr align='center' >"
        + " <td>" + (i+1) + "</td>"
        + " <td>" + po_no + "</td>"
        + " <td>" + style_no + "</td>"
        + " <td>" + season + "</td>"
        + " <td>" + buyer + "</td>"
        + " <td>" + supplier + "</td>"        
        + " <td>" + total_qty + "</td>"
        + " <td>" + po_status + "</td>" 
        + " <td>" + init_delivery_date + "</td>"
        + " <td>" + delivery_date + "</td>"
        + " <td>" + arrival_date + "</td>"
        + " <td>" + received_date+ "</td>"
        + "</tr>";
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
  <TD>Buyer</TD>
  <TD>Supplier</TD>
  <TD>Total QTY</TD>
  <TD>PO Status</TD>
  <TD>Initial Delivery</TD>
  <TD>Delivery date</TD>
  <TD>Arrival Date</TD>
  <TD>Received Date</TD>
</TR>
<%= outS %>
</table>
</body>
</html>