<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
request.setCharacterEncoding("euc-kr"); 
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

String po_no[] = request.getParameterValues("po_no");
String local_price[] = request.getParameterValues("local_price");
String sub_paydate[] = request.getParameterValues("sub_paydate");
String sub_paydate2[] = request.getParameterValues("sub_paydate2");
String sub_paydate3[] = request.getParameterValues("sub_paydate3");
String delivery_date[] = request.getParameterValues("delivery_date");
String sub_payment[] = request.getParameterValues("sub_payment");
String sub_paid[] = request.getParameterValues("sub_paid");
String sub_paid2[] = request.getParameterValues("sub_paid2");
String sub_paid3[] = request.getParameterValues("sub_paid3");
//String sub_balance[] = request.getParameterValues("sub_balance");
String sub_charge[] = request.getParameterValues("sub_charge");
 String  sub_comment[] = request.getParameterValues("sub_comment");
 

String sql = "";
String sql2 = "";
int iRet = 0;
boolean isSucceeded = false;
String strMsg = "";
Connection conn = null;
PreparedStatement pstmt2 = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;

// set array string
String po_nos = "";
for (int i = 0; i < po_no.length; i++) {
  po_nos += (i > 0 ? "," : "") + "'" + po_no[i] + "'";
}
// query for select po list
sql = " select  order_no "
    + " from    purchase_order "
    + " where   order_no in (" + po_nos + ") ";
    
// query for update
sql2 =  " update purchase_order "
      + " set     sub_paydate = str_to_date(?, '%Y/%m/%d'), "
      + "           sub_paydate2 = str_to_date(?, '%Y/%m/%d'), "
      + "           sub_paydate3 = str_to_date(?, '%Y/%m/%d'), "
      + "           local_price = ?, "
      + "           sub_payment = ?, "    
      + "           sub_paid = ?, "
      + "           sub_paid2 = ?, "
      + "           sub_paid3 = ?, "
//    + "           sub_balance = ?, "
      + "           sub_charge = ?, "
      + "           sub_comment = ? "
      + " where   order_no = ? ";

try {

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();

  // po list
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  ArrayList poList = new ArrayList();

  for (int i = 0; i < iRet; i++) {
    poList.add(matrix.getRowData(i).getData(0));
  }

  // insert or update purchase order info
  conn.setAutoCommit(false);
  pstmt2 = conn.prepareStatement(sql2);

  for (int i = 0; i < po_no.length; i++) {
    int j = 0;     
    if (poList.contains(po_no[i])) {
      // update   
      pstmt2.setString(++j, sub_paydate[i]);
      pstmt2.setString(++j, sub_paydate2[i]);
      pstmt2.setString(++j, sub_paydate3[i]);
      pstmt2.setString(++j, local_price[i]);
      pstmt2.setString(++j, sub_payment[i]);
      pstmt2.setString(++j, sub_paid[i]);
      pstmt2.setString(++j, sub_paid2[i]);
      pstmt2.setString(++j, sub_paid3[i]);
      //pstmt2.setString(++j, sub_balance[i]);
      pstmt2.setString(++j, sub_charge[i]);
      pstmt2.setString(++j, sub_comment[i]);
      pstmt2.setString(++j, po_no[i]);
      pstmt2.executeUpdate();
    }
  }
  conn.commit();
  isSucceeded = true;

} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}
  System.out.println("Exception sub_Payment_save : " + e.getMessage());
  throw e;
} finally {  
  if (pstmt2 != null) {
    try { pstmt2.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
  }
}

// result message
if (isSucceeded) strMsg = "The data are successfully processed.";
else strMsg = "The operation failed. Check your data.";
%>
<HTML>
<head>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
</head>
<body>
<form name='form1' method='post'>
<input type='hidden' name='ag_supplier' value='<%= ag_supplier %>'>
<input type='hidden' name='ag_season' value='<%= ag_season %>'>
<input type='hidden' name='ag_date_type' value='<%= ag_date_type %>'>
<input type='hidden' name='ag_from_date' value='<%= ag_from_date %>'>
<input type='hidden' name='ag_to_date' value='<%= ag_to_date %>'>
<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
<input type='hidden' name='ag_style_no' value='<%= ag_style_no %>'>
<input type='hidden' name='ag_orderby' value='<%= ag_orderby %>'>
<input type='hidden' name='ag_buyer' value='<%= ag_buyer %>'>
</form>
<script language='javascript'>
alert("<%= strMsg %>");
form1.action = './sub_payment_list.jsp';
form1.submit();
</script>
</BODY>
</HTML>
