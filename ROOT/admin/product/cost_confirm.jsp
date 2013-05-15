<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
request.setCharacterEncoding("euc-kr");
String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "#####0.00";

String fromUrl = request.getParameter("fromUrl");
String po_no = request.getParameter("po_no_selected");
String style_no = request.getParameter("style_selected");
String buyer_id = request.getParameter("buyer_selected");

String buyer_code = request.getParameter("buyer_code");
String supplier_code = request.getParameter("supplier_code");
String subsupplier_code = request.getParameter("subsupplier_code");
String sgr_code = request.getParameter("sgr_code");
String pgr_code = request.getParameter("pgr_code");
String season_code = request.getParameter("season_code");
String input_flag = request.getParameter("update_flag");

String ag_supplier = request.getParameter("ag_supplier");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_orderby = request.getParameter("ag_orderby");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");


String sql = "";
int iCnt = 0;
int iRet = 0;
boolean isSucceeded = false;
String strMsg = "";
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
Connection conn = null;
PreparedStatement pstmt = null;
try {
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();
    // query for update
  sql = " update  cost_01t  set "	
			+ "  STATUS   = 'Y' , "	   
			+ "  CONFIRMED_user          = ?, "     
			+ "  CONFIRMED      = sysdate()  "
	       + " where order_no = '"+po_no+"' " 
	       + "       and style = '" + style_no +"' "
	       	+ "       and buyer = '" + buyer_id +"' ";
	  int idx = 0;
	  conn.setAutoCommit(false);
	  pstmt = conn.prepareStatement(sql);  
	  pstmt.setString(++idx, _adminid);	 	  
	  iCnt = pstmt.executeUpdate();  

	if (iCnt != 1) {
	    throw new UserDefinedException("Check your data.(Cost_01t master");
   }
  // commit;
  conn.commit();

  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  strMsg = ue.getMessage();
  System.out.println("Exception Cost_confirm: " + ue.getMessage());
} catch (SQLException se) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  strMsg = "Check your data. " + se.getMessage();
  System.out.println("Exception cost_confirm : " + se.getMessage());
  throw se;
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  strMsg = "Error occurred. " + e.getMessage();
  System.out.println("Exception Cost_Confirm : " + e.getMessage());
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

// final messages..
if (isSucceeded) {
          strMsg = "Style#번호 ( "+sgr_code+style_no+")의 원가가 확정이 되었습니다! 원가확정 이후에는 수정이 불가능합니다.. ";
   
} else {
         strMsg = "The operation failed.\\n" + StringUtil.replace(StringUtil.replace(strMsg, "\"", "\\\""), "\n", "\\n");  
}
%>
<HTML>
<head>
</head>
<body>
<form name='form1' method='post'>
	<input type='hidden' name='ag_orderby' value='<%= ag_orderby %>'>
	<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
	<input type='hidden' name='ag_style_no' value='<%= ag_style_no %>'>
	<input type='hidden' name='ag_supplier' value='<%= ag_supplier %>'>
	<input type='hidden' name='ag_from_date' value='<%= ag_from_date %>'>
	<input type='hidden' name='ag_to_date' value='<%= ag_to_date %>'>
	<input type='hidden' name='fromUrl' value='<%= fromUrl %>'>
	<input type='hidden' name='po_no_selected' value='<%= po_no %>' >
    <input type='hidden' name='style_selected' value='<%= style_no %>' >
    <input type='hidden' name='buyer_selected' value='<%= buyer_id %>' >
</form>
<script language='javascript'>
alert("<%= strMsg %>");
form1.action = './cost_details_screen.jsp';
form1.submit();
</script>
</BODY>
</HTML>
