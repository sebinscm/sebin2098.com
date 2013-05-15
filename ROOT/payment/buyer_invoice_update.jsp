<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="dbconn.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String ag_supplier = request.getParameter("ag_supplier");
String ag_supplier_type = request.getParameter("ag_supplier_type");
String ag_month = request.getParameter("ag_month");
String ag_year = request.getParameter("ag_year");
String ag_search_inv_no = request.getParameter("ag_search_inv_no");
String inv_no = request.getParameter("inv_no");
String sup_id = request.getParameter("sup_id");
String buyer_id = request.getParameter("buyer_id");
String passwd = request.getParameter("passwd");
String actionFlag = request.getParameter("actionFlag");
String po_no[] = request.getParameterValues("po_no");
int iRet = 0;
String sql = "";
String sql2 = "";
boolean isSucceeded = false;
String strMsg = "";
Connection conn = null;
ResultSet rs = null;
Statement stmt = null;
PreparedStatement pstmt = null;
DataProcess dataProcess = null;
MatrixDataSet matrix = null;
int iCnt = 0;
String nextUrl = "";
String attach_file = "";

try {

  // check whether this invoice can be editable
 
  sql = " select  count(b.po_no) "
      + " from    invoice_01t a "
      + "         inner join invoice_02t b "
      + "           on ( a.invoice_no = b.invoice_no "
      + "           and a.sup_id = b.sup_id ) "
      + " where   a.invoice_no = '" + inv_no + "' "
      + " and     a.sup_id = '" + sup_id + "' "
      + " and     a.buyer_id = '" + buyer_id + "' "
      + " and     b.po_no in ( "
      + "           select  order_no "
      + "           from    purchase_order "
      + "           where   order_status > '94' " //대상자료 수신처리 확인
      + "         ) ";

  //out.println(sql); 
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  stmt = conn.createStatement();
  rs = stmt.executeQuery(sql);

  if (rs.next()) {
    iCnt = rs.getInt(1);
  }

  rs.close();
  stmt.close();

  if (iCnt > 0) {
    throw new UserDefinedException("Invoice내에 하나 이상의 PO가 이미 Buyer에 의해 이미 수신처리가 되었습니다.\\n확인후 다시 처리 바랍니다.");
  }

  // update invoice info
  conn.setAutoCommit(false);

  String tmp_po_no = "";
  if (po_no != null) {
    for (int i = 0; i < po_no.length; i++) {
      if (i > 0) tmp_po_no += ",";
      tmp_po_no += "'" + po_no[i] + "'";
    }
  }

  int j = 0;

if (actionFlag.equals("RCV")) { 
    
    // update PO status
    sql = " update  purchase_order "
        + " set     order_status = '94'  "  // Invoice수신 -"94"
        + " where   order_no in ( "
        + "           select  po_no "
        + "           from    invoice_02t "
        + "           where   invoice_no = ? "
        + "           and     buyer_id = ? "
        + "           and     sup_id = ? "
        + "         ) ";
    
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(++j, inv_no);
    pstmt.setString(++j, buyer_id);
    pstmt.setString(++j, sup_id);
    pstmt.executeUpdate();
    pstmt.close();

    // Update invoice header status  
    sql = " update  invoice_01t "
        +  "       set   status='R', "       // Invoice수신(S->R) 
        +  "              rcv_date = sysdate() "  //수신일자
        + " where   invoice_no = ? "
        + "  and     buyer_id = ? "
        + " and     sup_id = ? ";

    j = 0;
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(++j, inv_no);
    pstmt.setString(++j, buyer_id);
    pstmt.setString(++j, sup_id);
    pstmt.executeUpdate();
    pstmt.close();
    

  } else {
  
    throw new UserDefinedException("The action is unknown.");

  }

  conn.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  strMsg = ue.getMessage();
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  System.out.println("Exception buyer invoice_update : " + e.getMessage());
  throw e;
} finally {
  if (rs != null) {
    try { rs.close(); } catch (Exception e) {}
  }

  if (stmt != null) {
    try { stmt.close(); } catch (Exception e) {}
  }

  if (pstmt != null) {
    try { pstmt.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
  }
}

// result message
if (isSucceeded) {
  strMsg = "The data are successfully processed.";
} else {
  strMsg = "The operation failed.\\n" + strMsg;
}

// set Next Url
nextUrl = "./buyer_invoice_search.jsp";
if ( isSucceeded) {
  nextUrl = "./buyer_invoice_search.jsp";
} else {
  nextUrl = "./buyer_invoice_details.jsp";
}
%>
<HTML>
<head>
</head>
<body>
<form name='form1' method='post'>
<input type='hidden' name='ag_supplier' value='<%= ag_supplier %>'>
<input type='hidden' name='ag_supplier_type' value='<%= ag_supplier_type %>'>
<input type='hidden' name='ag_month' value='<%= ag_month %>'>
<input type='hidden' name='ag_year' value='<%= ag_year %>'>
<input type='hidden' name='ag_search_inv_no' value='<%= ag_search_inv_no %>'>
<input type='hidden' name='inv_no' value='<%= inv_no %>'>
<input type='hidden' name='buyer_id' value='<%= buyer_id %>'>
<input type='hidden' name='sup_id' value='<%= sup_id %>'>
</form>
<script language='javascript'>
alert("<%= strMsg %>");
form1.action = '<%= nextUrl %>';
form1.submit();
</script>
</BODY>
</HTML>
