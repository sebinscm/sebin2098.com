<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="common.util.*" %>
<%@page import="org.apache.commons.mail.HtmlEmail" %>
<%@page import="dbconn.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String DATE_FORMAT = "yyyy/MM/dd";
String ag_supplier = request.getParameter("ag_supplier");
String ag_season = request.getParameter("ag_season");
String ag_date_type = request.getParameter("ag_date_type");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");
String ag_orderby = request.getParameter("ag_orderby");
String ag_buyer = request.getParameter("ag_buyer");

String po_no = request.getParameter("po_no");
String po_status = request.getParameter("po_status_list");
//out.println(po_status);
//if (true) return;
String init_delivery_date = request.getParameter("init_delivery_date");
String old_po_status ="";
String buyer="";
String supplier="";
String buyer_name="";
String supplier_name="";
String status_name="";
String sql = "";
String sql2 = "";
String sql3 = "";
String sql4 = "";
int iRet = 0;
boolean isChanged = false;
boolean isSucceeded = false;
boolean isEmailSended = false;
String toEmailName = "";
String toEmailAddress = "";
ArrayList ccEmail = new ArrayList();
String strMsg = "";
Connection conn = null;
PreparedStatement pstmt2 = null;
PreparedStatement pstmt3 = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;


// check old value for po status
sql = " select  order_status,buyer,supplier "
    + " from    purchase_order "
    + " where   order_no = '" + po_no +"' ";

// query for update
sql2 =  " update   purchase_order "
      + " set     initial_del_date =  str_to_date(?, '%Y/%m/%d'), "
      + "         order_status = ?, "
      + "         modifier = ?, "    
      + "         modified_date = sysdate() "
       + " where   order_no = ? ";

 // insert data purchase order history
sql3 = " insert  into purchase_order_history"
	      + " ( "
	      + "   ORDER_NO , BACKORDER_FLAG ,  INITIAL_DEL_DATE, "
	      + "   ORDER_STATUS, UPDATED,USER_NAME ";
	  
sql3 += " ) "
	       + " values "
	       + " ( "
	       + "   ?,'N',str_to_date(?, '%Y/%m/%d'), "
	       + "   ?,now(),? ) " ;
 // ORDER STATUS
 sql4 = " select code_name  from vg_common_code " +
                   " where type='ORDER_STATUS' and use_yn='Y'  and code = '"+po_status+"' ";
try {

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();
 
  // po list
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  for (int i = 0; i < iRet; i++) {
    old_po_status = matrix.getRowData(i).getData(0);
    buyer = matrix.getRowData(i).getData(1);
    supplier = matrix.getRowData(i).getData(2);
  }
  
  sql = " select  name, email "
      + " from    login_01t "
      + " where  id = '" + buyer + "' ";
   iRet = dataProcess.RetrieveData(sql, matrix, conn);
   if (iRet > 0) {
	    toEmailName = matrix.getRowData(0).getData(0);
	    toEmailAddress = matrix.getRowData(0).getData(1);
   }
  	buyer_name = toEmailName;
    // read sender supplier name 
   sql = " select  name "
      + " from    login_01t "
      + " where  id = '" + supplier + "' ";
     iRet = dataProcess.RetrieveData(sql, matrix, conn);     
     if (iRet > 0) {
	    supplier_name = matrix.getRowData(0).getData(0);	    
     }  	
  
  iRet = dataProcess.RetrieveData(sql4, matrix, conn);

  for (int i = 0; i < iRet; i++) {
    status_name = matrix.getRowData(i).getData(0);
  }


  // insert or update purchase order info
  conn.setAutoCommit(false);
  pstmt2 = conn.prepareStatement(sql2);
  pstmt3 = conn.prepareStatement(sql3);
  
  if (old_po_status.equals(po_status) ) {
      strMsg = "  but new PO status( "+po_status+" )  is not changed  because the old status( "+old_po_status+" )  value is not different from new changed value as you requested.";      
      isChanged = false;
      isSucceeded = true;
   } else {
   	
	   	if ( Integer.parseInt(po_status) > Integer.parseInt(old_po_status) ) {
	       // update    
	      int j = 0;   
	      pstmt2.setString(++j, init_delivery_date);
	      pstmt2.setString(++j, po_status);
	      pstmt2.setString(++j, _adminid);
	      pstmt2.setString(++j, po_no);
	      pstmt2.executeUpdate();
	      // PO History insert
	       int k = 0;  
	      pstmt3.setString(++k, po_no);
	      pstmt3.setString(++k, init_delivery_date);
	      pstmt3.setString(++k, po_status);
	      pstmt3.setString(++k, _adminid);
	      pstmt3.executeUpdate();
	    
	      conn.commit();
	      isChanged = true;
	      isSucceeded = true;
	     } else {
	    	 strMsg = " [Warning] You cannot change the status because the new status("+po_status+") must bigger than previous status("+old_po_status+")! ";
	    	  isSucceeded = false;
	    }    	  

     }
   
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}
  System.out.println("Exception admin_PO_status_save : " + e.getMessage());
  throw e;
} finally {  
  if (pstmt2 != null) {
    try { pstmt2.close(); } catch (Exception e) {}
  }
  if (pstmt3 != null) {
    try { pstmt3.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
  }
}

// result message
if (isSucceeded) strMsg = "The data are successfully processed"+strMsg;
else strMsg += "The operation failed. Check your data.";

// sending email
String mailSubject = "";
String mailContents = "";
// 주) Status를  오더컴요청(40),오더취소(999)으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다. 
if (po_status.equals("40") || po_status.equals("999")) {

	if (isChanged && isSucceeded && !toEmailAddress.equals("")) {
	   
	 mailSubject = "[SCM] Please check your purchase order #" + po_no + ". ";  
	 mailContents = "<html>"
	               + "<head>"
	               + "<style>"
	               + "  body, td, br, p {font-family: Verdana;font-size:12px;}"
	               + "</style>"
	               + "</head>"
	               + "<body>"
	               + "This e-mail was automatically generated by SCM.."
	               + "<br><br>"
	               + mailSubject
	//               + (order_status.equals("90") ? "<br>And related Purchase Orders have been automatically created." : "")
	               + "<br>"
	               + " You can also access to [<a href='http://www.sebin2098.com/'>SCM</a>] web site."
	               + "<br><br>"
	               + "<table width='99%' border='1' cellspacing='0' cellpadding='2'>"
	               + "<tr>"
	               + "  <td width='30%' bgcolor='#E8E8E8' align='center'>Purchase Order#</td>"
	               + "  <td width='70%' bgcolor='#F4F5F0'>" + po_no + "&nbsp;</td>"
	               + "</tr>"
	               + "<tr>"
	               + "  <td bgcolor='#E8E8E8' align='center'>Current PO status</td>"
	               + "  <td bgcolor='#F4F5F0'>" + status_name+" ( "+po_status + " ) &nbsp;</td>"
	               + "</tr>"
	               + "<tr>"
	               + "  <td bgcolor='#E8E8E8' align='center'>Buyer</td>"
	               + "  <td bgcolor='#F4F5F0'>" + buyer_name + " ( "+buyer+ " ) &nbsp;</td>"
	               + "</tr>"
	               + "<tr>"
	               + "  <td bgcolor='#E8E8E8' align='center'>Supplier</td>"
	               + "  <td bgcolor='#F4F5F0'>" + supplier_name + " ( "+supplier+ " ) &nbsp;</td>"
	               + "</tr>"            
	               + "<tr>"
	               + "  <td bgcolor='#E8E8E8' align='center'> Requester </td>"
	               + "  <td bgcolor='#F4F5F0'>" + _adminname + "&nbsp;</td>"
	               + "</tr>"
	               + "<tr>"
	               + "  <td bgcolor='#E8E8E8' align='center'>Sent Date</td>"
	               + "  <td bgcolor='#F4F5F0'>" + DateUtil.getToday(DATE_FORMAT) + "&nbsp;</td>"
	               + "</tr>"           
	               + "</table>"
	               + "</body>"
	               + "</html>";
	
	  try {
	    HtmlEmail htmlEmail = new HtmlEmail();
	    htmlEmail.setCharset("euc-kr");
	    // 인증 필요시

	    htmlEmail.setHostName(SMTP_SERVER);
			htmlEmail.setSmtpPort(587);
			htmlEmail.setAuthentication(SMTP_USER, SMTP_PASSWORD); 
			htmlEmail.setTLS(true);

	    
	    htmlEmail.addTo(toEmailAddress, toEmailName);
	    
	    String tmpName = _adminname;
	    String tmpEmail = _adminmail;
	    String[] tmpCc = {tmpName, tmpEmail};
	    ccEmail.add(tmpCc);
	    for (int i = 0; i < ccEmail.size(); i++) {
	        tmpCc = (String[]) ccEmail.get(i);
	      //String[] tmpCc = (String[]) ccEmail.get(i);
	      htmlEmail.addCc(tmpCc[1], tmpCc[0]);
	    }
	
	    if (_adminmail.length() > 0) {
	      htmlEmail.setFrom(_adminmail, _adminname);
	    } else {
	      htmlEmail.setFrom(_systemAdminEmail, _systemAdminName);
	    }
	
	    htmlEmail.setSubject(mailSubject);
	    htmlEmail.setHtmlMsg(mailContents);
	    htmlEmail.send();
	
	    isEmailSended = true;
	  } catch (Exception e) {
	    System.out.println("Exception confirm : sending mail - " + e.getMessage());
	    //throw e;
	  }
	  // 결과 메시지 처리
	  if (isEmailSended) strMsg += " and also the email is successfully processed to "+toEmailAddress;
	  else strMsg = "The email sending to "+toEmailAddress+" is failed.\\n" + strMsg;	
	}

}	
	
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
form1.action = './admin_order_status_list.jsp';
form1.submit();
</script>
</BODY>
</HTML>
