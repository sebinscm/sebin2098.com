<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="dbconn.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
request.setCharacterEncoding("euc-kr"); 
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
String seq_no[] = request.getParameterValues("seq_no");

String pay_amt = request.getParameter("pay_amt");
String pay_date = request.getParameter("pay_date");
String pay_comment = request.getParameter("pay_comment");
String claim_amt = request.getParameter("claim_amt");
String claim_date = request.getParameter("claim_date");
String claim_comment = request.getParameter("claim_comment");
String close_yn = request.getParameter("close_yn");
if ( pay_amt == "" || pay_amt == null ) pay_amt ="0"; 
if ( claim_amt == "" || claim_amt == null ) claim_amt ="0"; 
 if ( !pay_date.equals("") )  pay_date = pay_date.substring(0,4)+"/"+pay_date.substring(5,7)+"/"+pay_date.substring(8,10); 
 if ( !claim_date.equals("") )  claim_date = claim_date.substring(0,4)+"/"+claim_date.substring(5,7)+"/"+claim_date.substring(8,10);
 
int iRet = 0;
int iRet2 = 0;
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
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
   matrix = new MatrixDataSet();
  dataProcess = new DataProcess();
    // update invoice info
  conn.setAutoCommit(false);
  String tmp_seq_no = "";
  if (seq_no != null) {
    for (int i = 0; i < seq_no.length; i++) {
      if (i > 0) tmp_seq_no += ",";
      tmp_seq_no += "'" + seq_no[i] + "'";
    }
  }
  int j = 0;
  int rcnt = 0;
  if (actionFlag.equals("ADD")) {
	       // check next seqno for insert record
	      sql = " select count(*) from payment_01t where invoice_no = '" + inv_no + "' "
	      	           +  " and supplier =  '" + sup_id + "' "
	                  + " and buyer = '" + buyer_id + "' ";
	      dataProcess.RetrieveData(sql, matrix, conn);  
	      rcnt =  Integer.parseInt(matrix.getRowData(0).getData(0));    
	      int next_seqno = 1;    
	      if ( rcnt > 0 ) {
			      sql = " select ifnull(max(seq_no)+1,0)  from payment_01t where invoice_no = '" + inv_no + "' "
			          +  " and supplier =  '" + sup_id + "' "
			           + " and buyer = '" + buyer_id + "' ";
		         iRet = dataProcess.RetrieveData(sql, matrix, conn);      
		        next_seqno   =  Integer.parseInt(matrix.getRowData(0).getData(0));
          } 	
    // read POs info and add POs to invoice
    sql = " insert  into payment_01t "
        + "         ( invoice_no, seq_no, supplier, buyer, pay_amt,pay_date , pay_comment, "
        + "           claim_amount , claim_date, claim_comment , close_yn, updated , updated_id ) "
        + "  values ( upper(?) , ?, ?, ?, ?, str_to_date(?, '%Y/%m/%d') ,? , "
        + "               ?, str_to_date(?, '%Y/%m/%d') , ?, ?, sysdate(), ?) " ;
    j = 0;

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(++j, inv_no);
    pstmt.setString(++j, next_seqno+"");
    pstmt.setString(++j, sup_id);
    pstmt.setString(++j, buyer_id);
    pstmt.setString(++j, pay_amt);
    pstmt.setString(++j, pay_date);
    pstmt.setString(++j, pay_comment);
    pstmt.setString(++j, claim_amt);
    pstmt.setString(++j, claim_date);
    pstmt.setString(++j, claim_comment);
    pstmt.setString(++j, close_yn);
    pstmt.setString(++j, _adminid);
    pstmt.executeUpdate();
    pstmt.close();
    
    // update invoice status(C) completed & pai date if closed the payment amount
    if ( close_yn.equals("Y") ) {
	    sql = " update  invoice_01t "
	        + " set     status = 'C' ,"
	        + "           paid_date = sysdate() " 
	        + " where  upper(invoice_no) =upper('" + inv_no + "')  ";
	    
	    pstmt = conn.prepareStatement(sql);
	    pstmt.executeUpdate();
	    pstmt.close();
	    sql = " update  purchase_order "
	        + " set     order_status = '99' "   // Payment완료
	        + " where  upper(payment_no) = upper('" + inv_no + "')  ";
	    
	    pstmt = conn.prepareStatement(sql);
	    pstmt.executeUpdate();
	    pstmt.close();
    }

  } else if (actionFlag.equals("DEL")) {

    // delete POs from invoice
    sql = " delete from payment_01t "
        + " where   invoice_no = ? "
        + " and     seq_no in (" + tmp_seq_no + ") "
        + " and     buyer = ?  " 
        + " and     supplier = ? ";

    j = 0;
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(++j, inv_no);
    pstmt.setString(++j, buyer_id);
    pstmt.setString(++j, sup_id);
    pstmt.executeUpdate();
    pstmt.close();

    // update invoice status
    sql = " update  invoice_01t "
        + " set     status = 'R', " //Invoice작성
        + "           paid_date = str_to_date('', '%Y/%m/%d') " //Invoice no clear
        + " where   invoice_no = '" + inv_no + "' "
        +  " and sup_id =  '" + sup_id + "' "
	    + " and buyer_id = '" + buyer_id + "' ";;
    
    pstmt = conn.prepareStatement(sql);
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

  System.out.println("Exception invoice_edit_save : " + e.getMessage());
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

// delete attach file
if (actionFlag.equals("D") && isSucceeded && !attach_file.equals("")) {
  try {
    File file = new File(application.getRealPath(_invoiceFileUrl) + File.separator + attach_file);
    if (file.exists()) { file.delete(); }
  } catch (Exception e) {}
}

// result message
if (isSucceeded) {
  strMsg = "The data are successfully processed.";
} else {
  strMsg = "The operation failed.\\n" + strMsg;
}

// set Next Url
nextUrl = "./payment_edit_form.jsp";
if (actionFlag.equals("ADD") && isSucceeded) {
  nextUrl = "./payment_edit_form.jsp";
}
if (actionFlag.equals("DEL") && isSucceeded) {
  nextUrl = "./payment_edit_form.jsp";
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
