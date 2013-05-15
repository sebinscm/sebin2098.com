<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="common.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="java.text.*" %>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@ page contentType="application/vnd.ms-excel"  %>
<%@ include file="/admin/login_check.jsp" %>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%
response.setHeader("Content-Disposition", "attachment; filename=PO_List.xls;");
response.setHeader("Content-Description", "JSP Generated Data");
request.setCharacterEncoding("euc-kr"); 
String ag_supplier = request.getParameter("ag_supplier");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_status = request.getParameter("ag_status");
String ag_orderby = request.getParameter("ag_orderby");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");
if (ag_supplier == null) ag_supplier = "";
if (ag_from_date == null || ag_to_date == null) {
  ag_from_date = ag_to_date = DateUtil.getToday("yyyy/MM/dd");
}
if (ag_status == null) ag_status = "";
if (ag_orderby == null) ag_orderby = "1";
if (ag_po_no == null) ag_po_no = "";
if (ag_style_no == null) ag_style_no = "";

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
    + "         order_date, "
    + "          buyer_name, "
    + "         supplier_name, "
    + "         case "
    + "           when order_status = '10' then 'Created' "
    + "           when order_status = '20' then 'Requested' "
    + "           when order_status = '30' then 'Confirmed' "
    + "           when order_status = '90' then 'Cancelled' "
    + "           else  order_status "
    + "         end, "
    + "         to_char(created, 'yyyy/mm/dd'),total_qty "
    + " from   purchase_order "
    + " where   backorder_flag = 'N' " ;
 

if (ag_po_no.length() > 0 || ag_style_no.length() > 0) {
  if (ag_po_no.length() > 0) {
    sql += " and    order_no like '" + ag_po_no + "%' " ;
  }

  if (ag_style_no.length() > 0) {
    sql += " and    style like '" + ag_style_no + "%' " ;
  }
} else {
  if (!ag_supplier.equals("")) {
      sql += " and    buyer = '" + ag_supplier + "' ";
    }

 sql += " and    to_char(created,'yyyymmdd') between to_char(to_date('" + ag_from_date + "', 'yyyy/mm/dd'),'yyyymmdd') and to_char(to_date('" + ag_to_date + "', 'yyyy/mm/dd'),'yyyymmdd') ";

  if (!ag_status.equals("")) {
    if (ag_status.equals("40")) {
      sql += " and    order_status between '10' and '80' ";
    } else {
      sql += " and    order_status = '" + ag_status + "' ";
    }
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

try {

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();

  // po list
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  conn.commit();

} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception in po_list_excel : " + e.getMessage());
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
   outS += "<tr align='center' >"
        + " <td>" + (i+1) + "</td>"
        + " <td>"  + po_no + "</td>"
        + " <td>" + style_no + "</td>"
        + " <td>" + season + "</td>"
         + " <td>" + total_qty + "</td>"
        + " <td>" + order_date + "</td>"
        + " <td>" + convert_to_ascii(buyer) + "</td>"
        + " <td>" + convert_to_ascii(supplier) + "</td>"
        + " <td>" + po_status + "</td>"
         + " <td>" + created_date + "</td>"
        + "</tr>";
}
%>

<%!
private String convert_to_ksc(String str) {
		String result = null;
		try {
			byte[] rawBytes = str.getBytes("8859_1");
			result = new String(rawBytes, "KSC5601");
		} catch(UnsupportedEncodingException e) {
			System.err.println(e.toString());
		}
		return result;
	}
private String convert_to_ascii(String str) {		
		String result = null;
		try {
			byte[] kscBytes = str.getBytes("KSC5601");
			result = new String(kscBytes, "8859_1");
		} catch(UnsupportedEncodingException e) {
			System.err.println(e.toString());
		}
		return result;
	}	
%>
<HTML>
<HEAD>
	<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>
</HEAD>
<body>
<table width="1500" border="1" cellspacing="0" cellpadding="0">
<TR align='center'>
  <TD>No</TD>
  <TD>PO No.</TD>
  <TD>Style No.</TD>
  <TD>Season</TD>
  <TD>Total ¼ö·®</TD>
  <TD>Order Date</TD>
  <TD>Buyer</TD>
  <TD>Supplier</TD>
  <TD>PO Status</TD>
  <TD>Created</TD>
</TR>
<%= outS %>
</TABLE>
</BODY>
</HTML>
