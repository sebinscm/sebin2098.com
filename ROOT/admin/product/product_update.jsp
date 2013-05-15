<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="dbconn.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
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
String po_status[] = request.getParameterValues("ag_po_status");

//String order_date[] = request.getParameterValues("order_date");
String delivery_date[] = request.getParameterValues("delivery_date");
String arrival_date[] = request.getParameterValues("arrival_date");
String received_date[] = request.getParameterValues("received_date");
String contract_date[] = request.getParameterValues("contract_date");               
String fit_confirm_date[] =  request.getParameterValues("fit_confirm_date");          
String pp_confirm_date[] =  request.getParameterValues("pp_confirm_date");           
String pp_requested[] = request.getParameterValues("pp_requested");                        
String mat_order_date[] = request.getParameterValues("mat_order_date");                     
String mat_in_date[] =   request.getParameterValues("mat_in_date");                      
String acc_order_date[] =  request.getParameterValues("acc_order_date");                    
String acc_in_date[] = request.getParameterValues("acc_in_date");                        
String cutting[] =  request.getParameterValues("cutting");                           
String running[] = request.getParameterValues("running");                            
String top_sent[] =  request.getParameterValues("top_sent");                           
String top_confirm[] = request.getParameterValues("top_confirm");                         
String packing_date[] =  request.getParameterValues("packing_date");       
String inhouse_date[] = request.getParameterValues("inhouse_date");        
String go_date[] =  request.getParameterValues("go_date");       
String col_date[] =  request.getParameterValues("col_date");       
String col_in_date[] = request.getParameterValues("col_in_date");       
String pp_in_date[] = request.getParameterValues("pp_in_date");    



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
sql2 =  " update   purchase_order "
        + " set  "
        + "   delivery_date = str_to_date(?, '%Y/%m/%d'), " 
        + "   arrival_date = str_to_date(?, '%Y/%m/%d'), " 
        + "   received_date = str_to_date(?, '%Y/%m/%d'), " 
        + "   contract_date = str_to_date(?, '%Y/%m/%d'), "          
        + "   fit_confirm_date = str_to_date(?, '%Y/%m/%d'), "           
        + "   pp_confirm_date = str_to_date(?, '%Y/%m/%d'), "          
        + "   pp_requested = str_to_date(?, '%Y/%m/%d'), "           
        + "   mat_order_date= str_to_date(?, '%Y/%m/%d'), "            
        + "   mat_in_date = str_to_date(?, '%Y/%m/%d'), "          
        + "   acc_order_date  = str_to_date(?, '%Y/%m/%d'), "             
        + "   acc_in_date = str_to_date(?, '%Y/%m/%d'), "        
        + "   cutting = str_to_date(?, '%Y/%m/%d'), "  
        + "   running = str_to_date(?, '%Y/%m/%d'), "
        + "   top_sent = str_to_date(?, '%Y/%m/%d'), "   
        + "   top_confirm = str_to_date(?, '%Y/%m/%d'), "   
        + "   packing_date = str_to_date(?, '%Y/%m/%d'), " 
        + "   inhouse_date = str_to_date(?, '%Y/%m/%d'), " 
        + "   ex_factory_date= str_to_date(?, '%Y/%m/%d'), " 
        + "   col_order_date = str_to_date(?, '%Y/%m/%d'), " 
        + "   col_in_date = str_to_date(?, '%Y/%m/%d'), "
        + "   pp_in_date = str_to_date(?, '%Y/%m/%d'), "
        + "         order_status = ?, "
        + "         modifier = ?, "    
        + "         modified_date = sysdate() "
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
      //pstmt2.setString(++j,  order_date[i]);
      pstmt2.setString(++j,  delivery_date[i]);
      pstmt2.setString(++j,  arrival_date[i]);
      pstmt2.setString(++j,  received_date[i] );
      pstmt2.setString(++j,  contract_date[i] );         
      pstmt2.setString(++j,  fit_confirm_date[i] );          
      pstmt2.setString(++j,  pp_confirm_date[i] );         
      pstmt2.setString(++j,  pp_requested[i] );          
      pstmt2.setString(++j,  mat_order_date[i]);           
      pstmt2.setString(++j,  mat_in_date[i] );         
      pstmt2.setString(++j,  acc_order_date[i] );            
      pstmt2.setString(++j,  acc_in_date[i] );       
      pstmt2.setString(++j,  cutting[i] ); 
      pstmt2.setString(++j,  running[i] );
      pstmt2.setString(++j,  top_sent[i] );  
      pstmt2.setString(++j,  top_confirm[i] );  
      pstmt2.setString(++j,  packing_date[i] );
      pstmt2.setString(++j,  inhouse_date[i] );
      pstmt2.setString(++j,  go_date[i] ); 
      pstmt2.setString(++j,  col_date[i] );
      pstmt2.setString(++j,  col_in_date[i] );
      pstmt2.setString(++j,  pp_in_date[i] );
      pstmt2.setString(++j, po_status[i]);
      pstmt2.setString(++j, _adminid);
      pstmt2.setString(++j, po_no[i]);
      pstmt2.executeUpdate();
    }
  }
  conn.commit();
  isSucceeded = true;

} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}
  System.out.println("Exception admin_delivery_status_save : " + e.getMessage());
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
form1.action = './product_management.jsp';
form1.submit();
</script>
</BODY>
</HTML>
