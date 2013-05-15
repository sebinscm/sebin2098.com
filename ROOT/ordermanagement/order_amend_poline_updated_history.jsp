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
String sql2 = "";
int iRet = 0;
int iRet2 = 0;
int iRet3 = 0;
String outS = "";

// query for po list
 sql = " select  amend_date,colour,total_qty,sqty_1,sqty_2,sqty_3,sqty_4,sqty_5,sqty_6 "
      + " from    purchase_order_line_history "
      + " where order_no = '"+search_pono+"' and amend_date is not null order by updated" ; 


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
  String   po_updated = matrix.getRowData(i).getData(j++);
  String   col = matrix.getRowData(i).getData(j++);
  double	  siztotal_qty = Double.parseDouble(matrix.getRowData(i).getData(j++));
  String  qty1 = matrix.getRowData(i).getData(j++);
  String    qty2 = matrix.getRowData(i).getData(j++);
  String    qty3 = matrix.getRowData(i).getData(j++);
  String    qty4 = matrix.getRowData(i).getData(j++);
  String    qty5 = matrix.getRowData(i).getData(j++);
  String    qty6 = matrix.getRowData(i).getData(j++);    
	 
  String colour_code = "";
  if (i%2 == 0) {
    colour_code = "#FFFFF0";
  } else {
    colour_code = "#EEEEE0";
  }
 
  
  outS += "<tr align='center' bgcolor='" + colour_code + "'>"
        + " <td>" + (i+1) + "</td>"
        + " <td>" + po_updated + "</td>"
        + " <td>" + col+ "</td>"
        + " <td>" + qty1 + "</td>"
        + " <td>" + qty2 + "</td>"
        + " <td>" + qty3 + "</td>"
        + " <td>" + qty4 + "</td>"
        + " <td>" + qty5 + "</td>"                
        + " <td>" + qty6 + "</td>"        
        + " <td>" + StringUtil.formatNumber(siztotal_qty, QTY_FORMAT) + "</td>"
        + "</tr>";
}


%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<SCRIPT LANGUAGE=JavaScript>

function fnBack(frm) {
  frm.action = "order_amend_updated_history.jsp";
  frm.submit();
}


</SCRIPT>
</HEAD>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="700" border="0" cellspacing="0" cellpadding="0">
<tr><td>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/btnCategories.gif"></td>
  <td width="*" class="left_title">PO Line Amend 변경 History내역</td>
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
<form name='form2' method='post'>
<input type='hidden' name='po_no_selected' value='<%= search_pono %>'>		
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
  <TD>변경 Date</TD>
  <TD>COLOR칼라</TD>
  <TD>SIZE1</TD>
  <TD>SIZE2</TD>
  <TD>SIZE3</TD>
  <TD>SIZE4</TD>
  <TD>SIZE5</TD>
  <TD>SIZE6</TD>
  <TD>TOTAL수량</TD>
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
