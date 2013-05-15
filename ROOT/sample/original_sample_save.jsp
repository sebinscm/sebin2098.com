<%@page import="java.net.*" %>
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
String curPage = request.getParameter("curPage");
String pageSize = request.getParameter("pageSize");
String searchItemClass = request.getParameter("searchItemClass");
String searchFromDate = request.getParameter("searchFromDate");
String searchToDate = request.getParameter("searchToDate");
String searchSupplier = request.getParameter("searchSupplier");
String searchItemGroup = request.getParameter("searchItemGroup");
String searchBuyer = request.getParameter("searchBuyer");
String searchSampleNo = request.getParameter("searchSampleNo");

String actionFlag = request.getParameter("actionFlag");
String sequenceNo = request.getParameter("sequenceNo");
String sampleNo = request.getParameter("sampleNo");
String buyer = request.getParameter("buyer");
String supplier = request.getParameter("supplier");
String order_status = request.getParameter("new_order_status");
String returnDate = request.getParameter("returnDate");
String remarks = request.getParameter("remarks").trim();
String remarks2 = request.getParameter("remarks2").trim();
String buyer_name="";
String sample_person_name="";
String supplier_name="";
String status_name="";
String sample_image_url = _SCMIMGURL+"SAMPLE_IMAGE/"+sampleNo+".jpg";

if ( returnDate == null || returnDate.equals("0000/00/00") ) returnDate="";
String sql = "";
int iCnt = 0;
int iRet = 0;
boolean isSucceeded = false;
boolean isEmailSended = false;
String toEmailName = "";
String toEmailAddress = "";
String toSampleEmailName = "";
String toSampleEmailAddress = "";
ArrayList ccEmail = new ArrayList();
String strMsg = "";
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
Connection conn = null;
PreparedStatement pstmt = null;

try {

  // insert/update/delete 처리...
  int idx = 1;
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  conn.setAutoCommit(false);

  // actionFlag에 따라 처리함.
 if (actionFlag.equals("U")) {
  	 // read receiver buyer and sample 관리자 name and email
    sql = " select  name, email "
      + " from    login_01t "
      + " where  id = '" + supplier + "' ";
     dataProcess = new DataProcess();
     matrix = new MatrixDataSet();
     iRet = dataProcess.RetrieveData(sql, matrix, conn);
     int j=0;
     if (iRet > 0) {
	    j = 0;
	    toEmailName = matrix.getRowData(0).getData(j++);
	    toEmailAddress = matrix.getRowData(0).getData(j++).trim();
     }
  	 supplier_name = toEmailName;
  	 
  	 sql = " select  code_name, description "
      + " from    vg_common_code "
      + " where  type = 'SAMPLE' and use_yn='Y' " ;
     dataProcess = new DataProcess();
     matrix = new MatrixDataSet();
     iRet = dataProcess.RetrieveData(sql, matrix, conn);
     int y=0;
     if (iRet > 0) {
	    y = 0;
	    toSampleEmailName = matrix.getRowData(0).getData(y++);
	    toSampleEmailAddress = matrix.getRowData(0).getData(y++).trim();;
     }
  	 sample_person_name = toSampleEmailName;
  	 
      // read sender buyer name 
    sql = " select  name "
      + " from    login_01t "
      + " where  id = '" + scmid + "' ";
     dataProcess = new DataProcess();
     matrix = new MatrixDataSet();
     iRet = dataProcess.RetrieveData(sql, matrix, conn);     
     if (iRet > 0) {
	    j = 0;
	    buyer_name = matrix.getRowData(0).getData(j++);	    
     }  	
     
     // ORDER STATUS
     sql = " select code_name  from vg_common_code " +
                   " where type='ORDER_STATUS' and use_yn='Y'  and code = '"+order_status+"' ";
     dataProcess = new DataProcess();
     matrix = new MatrixDataSet();
     iRet = dataProcess.RetrieveData(sql, matrix, conn);     
     if (iRet > 0) {
	    j = 0;
	    status_name = matrix.getRowData(0).getData(j++);	    
     }  	               
    // update..
    sql = " update  VG_SAMPLE_IN_OUT "
        + " set "
        + "   return_date = str_to_date(?, '%Y/%m/%d'), "
        + "   comments = ?, "
        + "   status = ?, "
        + "   supplieremail = ?, "
        + "   ccemail = ?  "
        + " where   sequence_no = ? ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, returnDate);
    pstmt.setString(idx++, remarks2);
    pstmt.setString(idx++, order_status);
    pstmt.setString(idx++, toEmailAddress);
    pstmt.setString(idx++, toSampleEmailAddress);
    pstmt.setString(idx++, sequenceNo);
    iCnt = pstmt.executeUpdate();

    if (iCnt != 1) {
      throw new UserDefinedException("Check your data.");
    }
    // insert..comment hist
    sql = " insert into SAMPLE_COMMENTS "
        + " ( "
        + "   SEQUENCE_NO, SAMPLE_NO, SUPPLIER_REMARKS,BUYER_REMARKS, BUYER_ID, BUYER_UPDATED "
        + " ) "
        + " values "
        + " ( "
        + "    ?, ?, ?, ?, ?, sysdate()  "
        + " ) ";
      idx = 1;  
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(idx++, sequenceNo);
      pstmt.setString(idx++, sampleNo.toUpperCase());
      pstmt.setString(idx++, remarks);
      pstmt.setString(idx++, remarks2);
      pstmt.setString(idx++, scmid);
      iCnt = pstmt.executeUpdate();
      if (iCnt != 1) {
        throw new UserDefinedException("Check SAMPLE_COMMENTS data.");
      }
   
   
   
  
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

  System.out.println("Exception /admin/buyer/original_sample_in_out_save : " + e.getMessage());
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
if (isSucceeded) strMsg = "정상적으로 처리 되었습니다. ";
else strMsg = "[System Error] The operation failed. Check your data!!" + strMsg;
	
// sending email
String mailSubject = "";
String mailContents = "";
// 주) Status를  Sample수신(22),디자인수정요청(24),오더요청(35)으로 변경시 해당 Supplier및 Sample관리자에게 e-mail이 자동으로 발송이 됩니다.
if (order_status.equals("22") || order_status.equals("24") || order_status.equals("35")) {
	if (isSucceeded && !toEmailAddress.equals("") && !toSampleEmailAddress.equals("")) {
	   
	 mailSubject = "[SCM] Buyer로부터 Original sample #" + sampleNo + " 에 대한 발송 e-mail 입니다.";  
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
	               + "상세한 내역의 확인은 SCM Site를 접속하여 확인을 할 수 있습니다.[<a href='http://www.sebin2098.com'>SCM</a>] web site."
	               + "<br><br>"
	               + "<table width='99%' border='1' cellspacing='0' cellpadding='2'>"
	               + "<tr>"
	               + "  <td width='30%' bgcolor='#E8E8E8' align='center'>Original Sample#</td>"
	               + "  <td width='70%' bgcolor='#F4F5F0'>" + sampleNo + "&nbsp;</td>"
	               + "</tr>"
	               + "<tr>"
	               + "  <td bgcolor='#E8E8E8' align='center'>Status</td>"
	               + "  <td bgcolor='#F4F5F0'>" + status_name+" ( "+order_status + " ) &nbsp;</td>"
	               + "</tr>"
	               + "<tr>"
	               + "  <td bgcolor='#E8E8E8' align='center'>(발신자)Buyer</td>"
	               + "  <td bgcolor='#F4F5F0'>" + buyer_name + " ( "+buyer+ " ) &nbsp;</td>"
	               + "</tr>"
	               + "<tr>"
	               + "  <td bgcolor='#E8E8E8' align='center'>(수신자)Sample관리자</td>"
	               + "  <td bgcolor='#F4F5F0'>" + toSampleEmailName +  " &nbsp;</td>"
	               + "</tr>"
	               + "<tr>"	               
	               + "  <td bgcolor='#E8E8E8' align='center'>Supplier</td>"
	               + "  <td bgcolor='#F4F5F0'>" + supplier_name + " ( "+supplier+ " ) &nbsp;</td>"
	               + "</tr>"
	               + "<tr>"
	               + "  <td bgcolor='#E8E8E8' align='center'>요청(변경)일자</td>"
	               + "  <td bgcolor='#F4F5F0'>" + returnDate + "&nbsp;</td>"
	               + "</tr>"              
	               + "<tr>"
	               + "  <td bgcolor='#E8E8E8' align='center'>메일 발송일</td>"
	               + "  <td bgcolor='#F4F5F0'>" + DateUtil.getToday(DATE_FORMAT) + "&nbsp;</td>"
	               + "</tr>"               
	               + "<tr height='60'>"
	               + "  <td bgcolor='#E8E8E8' align='center'>Supplier's<br>Comments</td>"
	               + "  <td bgcolor='#F4F5F0' valign='top'>" + StringUtil.convertTextToHtml(remarks2) + "&nbsp;</td>"
	               + "</tr>"             
	               + "<tr height='60'>"
	               + "  <td bgcolor='#E8E8E8' align='center'>Sample Image</td>"
	               + "  <td bgcolor='#F4F5F0' valign='top'><img src='"+sample_image_url+"' width='110' height='169'></td>"
	               + "</tr>"             
	               + "</table>"
	               + "</body>"
	               + "</html>";
	
	  try {
	    HtmlEmail htmlEmail = new HtmlEmail();
	    htmlEmail.setCharset("euc-kr");
	    // 인증 필요시
	    //htmlEmail.setAuthentication(SMTP_USER, SMTP_PASSWORD); 
	    //htmlEmail.setHostName(SMTP_SERVER);
	    //toEmailAddress = "jeffrey.song@ffb.net.au";
	    htmlEmail.setHostName(SMTP_SERVER);
			htmlEmail.setSmtpPort(587);
			htmlEmail.setAuthentication(SMTP_USER, SMTP_PASSWORD); 
			htmlEmail.setTLS(true);
			
	    htmlEmail.addTo(toSampleEmailAddress, toSampleEmailName);
	    
	    String tmpName = toEmailName;
	    String tmpEmail = toEmailAddress;
	    String[] tmpCc = {tmpName, tmpEmail};
	    ccEmail.add(tmpCc);
	    for (int i = 0; i < ccEmail.size(); i++) {
	        tmpCc = (String[]) ccEmail.get(i);
	      //String[] tmpCc = (String[]) ccEmail.get(i);
	      htmlEmail.addCc(tmpCc[1], tmpCc[0]);
	    }
	
	    if (toEmailAddress.length() > 0) {
	      htmlEmail.setFrom(toSampleEmailAddress, toSampleEmailName);
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
	  if (isEmailSended) strMsg += " , 자동으로 e-mail이 "+toSampleEmailAddress+" 로 발송이 되었습니다.!";
	  else strMsg += "e-mail발송이 실패되었습니다.\\n" + strMsg;	
	}

}

%>
<html>
<head>
<title></title>
</head>
<body>
<form name="form1" method="post" action="./original_sample_list.jsp">
<input type="hidden" name="curPage" value="<%= curPage %>">
<input type="hidden" name="pageSize" value="<%= pageSize %>">
<input type='hidden' name='searchFromDate' value='<%= searchFromDate %>'>
<input type='hidden' name='searchToDate' value='<%= searchToDate %>'>
<input type='hidden' name='searchBuyer' value='<%= searchBuyer %>'>
<input type='hidden' name='searchItemClass' value='<%= searchItemClass %>'>
<input type='hidden' name='searchSupplier' value='<%= searchSupplier %>'>
<input type='hidden' name='searchItemGroup' value='<%= searchItemGroup %>'>
<input type='hidden' name='searchSampleNo' value='<%= searchSampleNo %>'>
</form>
<script language="javascript">
  alert('<%= strMsg %>');
  document.form1.submit();
</script>
</body>
</html>
