<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="common.util.*" %>
<%@page import="org.apache.commons.mail.HtmlEmail" %>
<%@page import="dbconn.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%

request.setCharacterEncoding("euc-kr"); 
String DATE_FORMAT = "yyyy/MM/dd";

String ag_style_no = request.getParameter("ag_style_no");
String ag_orderby = request.getParameter("ag_orderby");
String ag_po_no = request.getParameter("ag_po_no");

String po_no[] = request.getParameterValues("po_no");

String po_status = "45"; // PO확정 및 생산
String status_name="PO확정 및 생산";
String buyer_comments[] = request.getParameterValues("remarks");

String toEmailName = "";
String toEmailAddress = "";
String supplier_name="";
ArrayList ccEmail = new ArrayList();
String sql = "";
String sql2 = "";
String sql3 = "";
int iRet = 0;
String confirmed_po_list="";
boolean isSucceeded = false;
boolean isEmailSended = false;
String strMsg = "";
Connection conn = null;
PreparedStatement pstmt2 = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
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
      + " set    confirm_date = sysdate() , "
      + "         order_status = ? ,"
      + "         buyer_comments = ? "   
       + " where   order_no = ? ";
       
sql3 = " select  name, email "
      + " from    login_01t "
      + " where  id = '" + scmsupid + "' ";

try {

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();
  // email  info setup
  matrix2 = new MatrixDataSet();
  
  iRet = dataProcess.RetrieveData(sql3, matrix2, conn);
  if (iRet > 0) {
	    toEmailName = matrix2.getRowData(0).getData(0);
	    toEmailAddress = matrix2.getRowData(0).getData(1).trim();
  }
  supplier_name = toEmailName;
  

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
      confirmed_po_list += po_no[i]+" , ";
      pstmt2.setString(++j, po_status);
      pstmt2.setString(++j, buyer_comments[i]);
      pstmt2.setString(++j, po_no[i]);      
      pstmt2.executeUpdate();
    }
  }
  conn.commit();
  isSucceeded = true;

} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}
  System.out.println("Exception PO Confirmed by buyer : " + e.getMessage());
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
if (isSucceeded) strMsg = "선택된 PO가 Confirm처리가 되었습니다.";
else strMsg = "[System Error] The operation failed. Check your data!!!";

// sending email
String mailSubject = "";
String mailContents = "";

if (isSucceeded && !toEmailAddress.equals("") ) {
	   
	 mailSubject = "[SCM] Buyer로부터 Purchase Order Confirmation에 대한 #" + confirmed_po_list + " 에 대한 발송 e-mail 입니다.";  
	 mailContents = "<html>"
	               + "<head>"
	               + "<style>"
	               + "  body, td, br, p {font-family: Verdana;font-size:12px;}"
	               + "</style>"
	               + "</head>"
	               + "<body>"
	               + "본 메일은 SCM시스템에서 자동으로 생성이 되어 발송이 됩니다."
	               + "<br><br>"
	               + mailSubject
	               + "<br>"
	               + "상세한 내역의 확인은 SCM Site를 접속하여 확인을 할 수 있습니다.[<a href='http://www.sebin2098.com/'>SCM</a>] web site."
	               + "<br><br>"
	               + "<table width='99%' border='1' cellspacing='0' cellpadding='2'>"
	               + "<tr>"
	               + "  <td width='30%' bgcolor='#E8E8E8' align='center'>Confirm된 PO번호#</td>"
	               + "  <td width='70%' bgcolor='#F4F5F0'>" + confirmed_po_list + "&nbsp;</td>"
	               + "</tr>"
	               + "<tr>"
	               + "  <td bgcolor='#E8E8E8' align='center'>Status</td>"
	               + "  <td bgcolor='#F4F5F0'>" + status_name+" ( "+po_status + " ) &nbsp;</td>"
	               + "</tr>"
	               + "<tr>"
	               + "  <td bgcolor='#E8E8E8' align='center'>(발신자)Buyer</td>"
	               + "  <td bgcolor='#F4F5F0'>" + scmnm + " ( "+scmid+ " ) &nbsp;</td>"
	               + "</tr>"
	               + "  <td bgcolor='#E8E8E8' align='center'>Supplier</td>"
	               + "  <td bgcolor='#F4F5F0'>" + toEmailName + " ( "+scmsupid+ " ) &nbsp;</td>"
	               + "</tr>"
	               + "<tr>"
	               + "  <td bgcolor='#E8E8E8' align='center'>Confirm 일자</td>"
	               + "  <td bgcolor='#F4F5F0'>" +  DateUtil.getToday(DATE_FORMAT)  + "&nbsp;</td>"
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
	   
	    //htmlEmail.setAuthentication(SMTP_USER, SMTP_PASSWORD); 
	    //htmlEmail.setHostName(SMTP_SERVER);
	    //toEmailAddress = "jeffrey.song@ffb.net.au";
	    //htmlEmail.addTo(toEmailAddress, toEmailName);
	    
	    String tmpName = scmnm;
	    String tmpEmail = _buyer_email;
	    String[] tmpCc = {tmpName, tmpEmail};
	    ccEmail.add(tmpCc);
	    for (int i = 0; i < ccEmail.size(); i++) {
	        tmpCc = (String[]) ccEmail.get(i);
	      //String[] tmpCc = (String[]) ccEmail.get(i);
	      htmlEmail.addCc(tmpCc[1], tmpCc[0]);
	    }
	
	    if (toEmailAddress.length() > 0) {
	      htmlEmail.setFrom(toEmailAddress, toEmailName);
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
	  if (isEmailSended) strMsg += " , 자동으로 e-mail이 "+toEmailAddress+" 로 발송이 되었습니다.!";
	  else strMsg += "e-mail발송이 실패되었습니다.\\n" + strMsg;	
}


	
%>
<HTML>
<head>
</head>
<body>
<form name='form1' method='post'>
<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
<input type='hidden' name='ag_style_no' value='<%= ag_style_no %>'>
<input type='hidden' name='ag_orderby' value='<%= ag_orderby %>'>
</form>
<script language='javascript'>
alert("<%= strMsg %>");
form1.action = './buyer_order_confirm_list.jsp';
form1.submit();
</script>
</BODY>
</HTML>
