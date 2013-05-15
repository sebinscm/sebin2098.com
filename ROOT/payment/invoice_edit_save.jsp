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
String ag_supplier = request.getParameter("ag_supplier");
String ag_supplier_type = request.getParameter("ag_supplier_type");
String ag_month = request.getParameter("ag_month");
String ag_year = request.getParameter("ag_year");
String ag_search_inv_no = request.getParameter("ag_search_inv_no");
String inv_no = request.getParameter("inv_no");
String sup_id = request.getParameter("sup_id");
String buyer_id = request.getParameter("buyer_id");
String chk_status = request.getParameter("chk_status");
String passwd = request.getParameter("passwd");
String actionFlag = request.getParameter("actionFlag");
String po_no[] = request.getParameterValues("po_no");
//out.println(chk_status);
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
      + "           on a.invoice_no = b.invoice_no "
      + "           and a.sup_id = b.sup_id "
      + " where   a.invoice_no = '" + inv_no + "' "
      + " and     a.sup_id = '" + sup_id + "' "
      + " and     a.buyer_id = '" + buyer_id + "' "
      + " and     b.po_no in ( "
      + "           select  order_no "
      + "           from    purchase_order "
      + "           where   order_status > '92' "
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
    throw new UserDefinedException("Invoice내에 하나 이상의 PO가 이미 Buyer에 의해 Confirm되어 삭제가 불가능합니다..\\n확인후 다시 처리 바랍니다.");
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
  if (actionFlag.equals("AP")) {
  
    // check POs whether they are already invoiced.
    sql = " select  count(*) "
        + " from    invoice_02t "
        + " where   po_no in (" + tmp_po_no + ") ";

    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);
  
    if (rs.next()) {
      iCnt = rs.getInt(1);
    }

    rs.close();
    stmt.close();
  
    if (iCnt > 0) {
      throw new UserDefinedException("추가로 선택하신 PO가 이미 Invoice에 존재 합니다.추가불가!\\n확인후 다시 처리해 주세요!");
    }
  // check next seqno for insert record
   sql = " select ifnull(max(seq)+1,0)  from invoice_02t where invoice_no = '" + inv_no + "' "
        +  " and sup_id =  '" + sup_id + "' "
        + " and buyer_id = '" + buyer_id + "' ";
   int next_seqno = 1;  
   //out.println(sql);
   //if (true) return;   
   iRet = dataProcess.RetrieveData(sql, matrix, conn);      
   if ( iRet > 0 ) {
      next_seqno   =  Integer.parseInt(matrix.getRowData(0).getData(0));
   }   

    // read POs info and add POs to invoice
    sql = " insert  into invoice_02t "
        + "         ( invoice_no, seq, po_no , style_no , qty, price , sup_id, buyer_id,updated ) "
        + " select  '"+inv_no+"', '"+next_seqno+"', a.order_no, a.style, a.total_qty, a.vendor_price, "
        + "         '"+sup_id+"',  '"+buyer_id+"' , sysdate() "
        + " from    purchase_order a "
        + " where   a.backorder_flag = 'N' "
        + "   and     a.order_no in (" + tmp_po_no + ") "
//        + " and     a.order_status between  '75' and '90' "
        + " and     a.supplier = '" + sup_id + "' "
        + " and     a.buyer = '" + buyer_id + "' ";

    j = 0;
   //out.println(sql);
   //if (true) return;
    pstmt = conn.prepareStatement(sql);
    pstmt.executeUpdate();
    pstmt.close();
    
    // update div_status
    sql = " update  purchase_order "
        + " set     order_status = '90' ," //Invoice작성
        + "           payment_no = '"+inv_no+"' " 
        + " where   order_no in (" + tmp_po_no + ") ";
    
    pstmt = conn.prepareStatement(sql);
    pstmt.executeUpdate();
    pstmt.close();

  } else if (actionFlag.equals("DP")) {           //해당 Invoice Detail에서 특정PO삭제

    // delete POs from invoice
    sql = " delete  from invoice_02t "
        + " where   invoice_no = ? "
        + " and     po_no in (" + tmp_po_no + ") "
        + " and     buyer_id = ?  " 
        + " and     sup_id = ? ";

    j = 0;
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(++j, inv_no);
    pstmt.setString(++j, buyer_id);
    pstmt.setString(++j, sup_id);
    pstmt.executeUpdate();
    pstmt.close();

    // update div_status
    sql = " update  purchase_order "
        + " set     order_status = '85', " //Invoice작성(90)전 
        + "           payment_no = '' " //Invoice no clear
        + " where   order_no in (" + tmp_po_no + ") ";
    
    pstmt = conn.prepareStatement(sql);
    pstmt.executeUpdate();
    pstmt.close();
    //out.println(sql);
    //if (true) return;

  } else if (actionFlag.equals("D")) {
  
    // check password
    if (_adminid != null) {
      if (!passwd.equals("12345")) {
        throw new UserDefinedException("선택한 Invoice삭제를 위한 비빌번호가 틀립니다. 비밀번호를 확인해 주세요!");
      }
    }

    // read attached file
    sql = " select  file_name "
        + " from    invoice_01t "
        + " where   invoice_no = '" + inv_no + "' "
        + " and     buyer_id = '" + buyer_id + "' "
        + " and     sup_id = '" + sup_id + "' ";

    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);
  
    if (rs.next()) {
      attach_file = rs.getString(1);
    }

    rs.close();

    // update div_status
    sql = " update  purchase_order "
        + " set     order_status = '85',  "  //Invoice작성(90)전 
        + "           payment_no = '' " //Invoice no clear   
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

    // delete delivery note header info  
    sql = " delete  from invoice_01t "
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

    // delete delivery note details info
    sql = " delete  from invoice_02t "
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
} else if (actionFlag.equals("SD")) { 
    
    // update PO status
    sql = " update  purchase_order "
        + " set     order_status = '92'  "  // 대금청구 -"92"
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
        +  "       set   status='S', "       // Invoice발송(S) 
        + "               gp_status ='Y' , "   // 대금청구
        +  "              gp_date = sysdate() "  //청구일자
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
  strMsg = "성공적으로 처리되었습니다.";
} else {
  strMsg = "The operation failed.\\n" + strMsg;
}

// set Next Url
nextUrl = "./invoice_edit_form.jsp";
if (actionFlag.equals("SD") && isSucceeded) {
  nextUrl = "./invoice_search.jsp";
}
if (actionFlag.equals("D") && isSucceeded) {
  nextUrl = "./invoice_search.jsp";
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
<input type='hidden' name='chk_status' value='<%= chk_status %>'>
</form>
<script language='javascript'>
alert("<%= strMsg %>");
form1.action = '<%= nextUrl %>';
form1.submit();
</script>
</BODY>
</HTML>
