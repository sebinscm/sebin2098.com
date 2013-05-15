<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="dbconn.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/apess/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
request.setCharacterEncoding("euc-kr"); 
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

String ag_supplier = request.getParameter("ag_supplier");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_status = request.getParameter("ag_status");
String ag_orderby = request.getParameter("ag_orderby");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");

String pt_date = request.getParameter("pt_date");
pt_date = pt_date.substring(0,4)+"/"+pt_date.substring(5,7)+"/"+pt_date.substring(8,10); 
String po_no = request.getParameter("po_no");
String seq_no = request.getParameter("seqno");
String pt_info = request.getParameter("pt_info").trim();
String actionFlag = request.getParameter("actionFlag");
if ( seq_no == "" || seq_no == null ) seq_no =""; 
String sql = "";
int iCnt = 0;
boolean isSucceeded = false;
String strMsg = "";
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
PreparedStatement pstmt = null;


try {

  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
    matrix = new MatrixDataSet();
   dataProcess = new DataProcess();
  // insert/update/delete 처리...
  int idx = 0;
  conn.setAutoCommit(false);

  // actionFlag에 따라 처리함.
  if (actionFlag.equals("I")) {
    // seq no check
    sql = "select  ifnull(max(seq+1), 1)  from gp_input  where po_no='"+po_no+"' "
             + (!seq_no.equals("") ? " and    seq ='" + seq_no + "' " : "") ;  
     //out.println(sql);
     //if (true) return;
	 dataProcess.RetrieveData(sql, matrix, conn); 
	 String next_seq = matrix.getRowData(0).getData(0);
    // insert...
    sql = " insert into gp_input "
        + " ( "
        + "   seq, po_no, pt_date, pt_info, updated, userid "
        + " ) "
        + " values "
        + " ( "
        + "   ?, ?, str_to_date(?, '%Y/%m/%d'), ?, sysdate(), ? "
        + " ) ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(++idx, Integer.parseInt(next_seq));
    pstmt.setString(++idx, po_no);
    pstmt.setString(++idx, pt_date);
    pstmt.setString(++idx, pt_info);
    pstmt.setString(++idx, (_adminid != null ? _adminid : _adminid));

  } else if (actionFlag.equals("U")) {

    // update..
    sql = " update  gp_input"
        + " set "
        + "   pt_date = str_to_date(?, '%Y/%m/%d'), "
        + "   pt_info = ?, "
        + "   updated = sysdate() "
        + " where   po_no = ? "
        + "  and     seq  = ? ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(++idx, pt_date);
    pstmt.setString(++idx, pt_info);
    pstmt.setString(++idx, po_no);
    pstmt.setString(++idx, seq_no);

  } else if (actionFlag.equals("D")) {

    // delete..
    sql = " delete  from gp_input  "
          + " where   po_no = ? "
          + "  and     seq  = ? ";

    pstmt = conn.prepareStatement(sql);
     pstmt.setString(++idx, po_no);
    pstmt.setString(++idx, seq_no);

  } else {

    throw new UserDefinedException("The action is unknown.");

  }

  // execute ...
  iCnt = pstmt.executeUpdate();

  if (iCnt != 1) {
    throw new UserDefinedException("Check your data.");
  }

  conn.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  strMsg = ue.getMessage();
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  System.out.println("Exception /apess/inspector_save : " + e.getMessage());
  throw e;
} finally {
  if (pstmt != null) {
    try { pstmt.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
  }
}

// 결과 메시지 처리
if (isSucceeded) strMsg = "The data are successfully processed.";
else strMsg = "The operation failed.\\n" + strMsg;
%>
<html>
<head>
<title></title>
</head>
<body>
<form name="form1" method="post" action="./pt_management.jsp">
<input type='hidden' name='po_no_selected' value='<%= po_no %>'>
<input type='hidden' name='ag_orderby' value='<%= ag_orderby %>'>
<input type='hidden' name='ag_status' value='<%= ag_status %>'>
<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
<input type='hidden' name='ag_style_no' value='<%= ag_style_no %>'>
<input type='hidden' name='ag_supplier' value='<%= ag_supplier %>'>
<input type='hidden' name='ag_from_date' value='<%= ag_from_date %>'>
<input type='hidden' name='ag_to_date' value='<%= ag_to_date %>'>	

</form>
<script language="javascript">
  alert('<%= strMsg %>');
  document.form1.submit();
</script>
</body>
</html>
