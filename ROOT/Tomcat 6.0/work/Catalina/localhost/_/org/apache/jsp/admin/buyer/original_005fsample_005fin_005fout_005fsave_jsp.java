package org.apache.jsp.admin.buyer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;
import common.*;
import common.util.*;
import org.apache.commons.mail.HtmlEmail;
import dbconn.*;

public final class original_005fsample_005fin_005fout_005fsave_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/admin/login_check.jsp");
    _jspx_dependants.add("/common/CommonVars.jsp");
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=euc-kr");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!--%@ page errorPage=\"/error.jsp\" %-->\n");

response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0);
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1

String _adminid = "";
String _adminname = "";
String _admintype = "";
String _admingroup = "";
String _approval = "";
String _adminclass = "";
String _adminmail = "";

try{

  _adminid = (String) session.getAttribute("adminid");

  if( _adminid == null || _adminid.length() == 0 || _adminid.equals("null") ) {
    response.sendRedirect("/admin/login_first.html");
    return;
  }

  _adminname = (String) session.getAttribute("adminname");
  _admintype = (String) session.getAttribute("admintype");
  _admingroup = (String) session.getAttribute("admingroup");
  _approval = (String) session.getAttribute("approval");
  _adminclass = (String) session.getAttribute("adminclass");
  _adminmail = (String) session.getAttribute("admin_email");
  //session.setMaxInactiveInterval(60*60);

}catch( Exception e ) {
  response.sendRedirect("/admin/login_first.html");
  return;
}

      out.write('\n');

// MY SQL DB
//String _mysqlJdbcDriver = "com.mysql.jdbc.Driver";
//String _urlLogin = "jdbc:mysql://10.2.1.247:3306";
//String _userLogin = "user";
//String _pwLogin = "password";

// MS-SQL DB
//String _mssqlJdbcDriver = "com.microsoft.jdbc.sqlserver.SQLServerDriver";
//String _urlFutura = "jdbc:microsoft:sqlserver://10.2.1.228:1433";
//String _userFutura = "user";
//String _pwFutura = "password";


// Management Notice Upload path
String _ManagementNoticeUploadUrl = "/admin/notice/upload";

// Uplod
//String _uploadPath = "../../var/tmp";
String _uploadPath = "C:/SCM_MYSQL/ROOT/var/tmp";
String _uploadPath2 = "C:/SCM_MYSQL/ROOT/var/tmp";
long _maxFileSize = 50*1024*1024;

// SCM Image Path
String _SCMIMGURL = "http://www.sebin2098.com/images/";

// style image path
String _styleImgURL = "/images";

// Fault return invoice File URL
String _faultReturnInvoiceFileURL = "/images/Return";

// Memo °ü·Ã º¯¼ö
String _memoDataUrl = "/memo/upload";


// Spec Sheet path
String _specSheetUrl = "/spec_sheet_files";

// Notice URL
// Notice
String _noticeDataUrl = "/notice_new/upload";


// Sample Image Url
String _sampleImageUrl = "/images/SAMPLE_IMAGE";

// barcode file Image Url
String _barcodeFileUrl = "/images/Barcode";

// Invoice file path
String _invoiceFileUrl = "/payment/inv_files";

// shipment file path
String _shipmentFileUrl = "/ordermanagement/shipment_upload";

// SMTP MAIL SERVER
String SMTP_SERVER = "smtp.gmail.com";
String SMTP_USER ="scm@sebin2098.com";
String SMTP_PASSWORD ="gavi1004";

// System Admin Mail Address
String _systemAdminEmail = "scm@sebin2098.com";
String _systemAdminName = "SCM Administrator";

//  MU rate
double _MURate = 0.25;

// Ex-Factory Price Rate
double _EXRate = 0.04;


// Ex-Factory Price Rate 
double _EXRate2 = 0.04;


      out.write('\n');
      out.write('\n');

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
String item_class = request.getParameter("item_class");

String buyer = request.getParameter("buyer");
String inputDate = request.getParameter("inputDate");
String qty = request.getParameter("qty");
String season = request.getParameter("season");
String item_group = request.getParameter("item_group");
String sampleNo = request.getParameter("sampleNo");
String style_no = request.getParameter("styleNo");
String supplier = request.getParameter("supplier");
String sendingDate = request.getParameter("sendingDate");
String returnDate = request.getParameter("returnDate");
String remarks = request.getParameter("remarks").trim();
String remarks2 = request.getParameter("remarks2").trim();
String order_status = request.getParameter("order_status");
String buyer_name="";
String supplier_name="";
String status_name="";
String sample_image_url = _SCMIMGURL+"SAMPLE_IMAGE/"+sampleNo+".jpg";
//out.println(sample_image_url);
//if (true) return;
String sql = "";
int iCnt = 0;
int iRet = 0;
boolean isSucceeded = false;
boolean isEmailSended = false;
String toEmailName = "";
String toEmailAddress = "";
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
  if (actionFlag.equals("I")) {

    // read next sample no
    //sql = " select  '" + item_class + "'||to_char(sysdate, 'yymm'), "
    //    + "         nvl(max(to_number(substr(sample_no, 6, 3)))+1, 1) "
    //    + " from    vg_sample_in_out "
    //    + " where   substr(sample_no, 1, 5) = '" + item_class + "'||to_char(sysdate, 'yymm') ";

    //dataProcess = new DataProcess();
    //matrix = new MatrixDataSet();
    //dataProcess.RetrieveData(sql, matrix, conn);
    //int j = 0;
    //String sampleNo = matrix.getRowData(0).getData(j++);
    //int nextNo = Integer.parseInt(matrix.getRowData(0).getData(j++));

    //int iTimes = Integer.parseInt(times);
    //String item_brand = String.valueOf((Integer.parseInt(item_class)+1)/2);

    // insert...master
    sql = " insert into VG_SAMPLE_IN_OUT "
        + " ( "
        + "   sample_no, item_class, input_date, item_group, qty, buyer, supplier, "
        + "   sending_date, return_date, remarks, modifier, modified_date, season,style_no,status "
        + " ) "
        + " values "
        + " ( "
        + "    ?, ?, str_to_date(?, '%Y/%m/%d'), ?, ?, ?, ?, "
        + "   str_to_date(?, '%Y/%m/%d'), str_to_date(?, '%Y/%m/%d'), ?, ?, sysdate(), ?, ?, ? "
        + " ) ";
      order_status ="00";
      pstmt = conn.prepareStatement(sql);
   
      pstmt.setString(idx++, sampleNo.toUpperCase());
      pstmt.setString(idx++, item_class);
      pstmt.setString(idx++, inputDate);
      pstmt.setString(idx++, item_group);
      pstmt.setString(idx++, qty);
      pstmt.setString(idx++, buyer);
      pstmt.setString(idx++, supplier);
      pstmt.setString(idx++, sendingDate);
      pstmt.setString(idx++, returnDate);
      pstmt.setString(idx++, remarks);
      pstmt.setString(idx++, _adminid);
      pstmt.setString(idx++, season.toUpperCase());
      pstmt.setString(idx++, style_no.toUpperCase()); 
      pstmt.setString(idx++, order_status);
      pstmt.executeUpdate();

  } else if (actionFlag.equals("U")) {
  	 // read receiver buyer name and email
    sql = " select  name, email "
      + " from    login_01t "
      + " where  id = '" + buyer + "' ";
     dataProcess = new DataProcess();
     matrix = new MatrixDataSet();
     iRet = dataProcess.RetrieveData(sql, matrix, conn);
     int j=0;
     if (iRet > 0) {
	    j = 0;
	    toEmailName = matrix.getRowData(0).getData(j++);
	    toEmailAddress = matrix.getRowData(0).getData(j++);
     }
  	 buyer_name = toEmailName;
      // read sender supplier name 
    sql = " select  name "
      + " from    login_01t "
      + " where  id = '" + supplier + "' ";
     dataProcess = new DataProcess();
     matrix = new MatrixDataSet();
     iRet = dataProcess.RetrieveData(sql, matrix, conn);     
     if (iRet > 0) {
	    j = 0;
	    supplier_name = matrix.getRowData(0).getData(j++);	    
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
        + "   input_date = str_to_date(?, '%Y/%m/%d'), "
        + "   item_group = ?, "
        + "   item_class = ?, " 
        + "   qty = ?, "
        + "   buyer = ?, "
        + "   supplier = ?, "
        + "   season = ?, "
        + "   sending_date = str_to_date(?, '%Y/%m/%d'), "
        + "   return_date = str_to_date(?, '%Y/%m/%d'), "
        + "   remarks = ?, "
        + "   modifier = ?, "
        + "   modified_date = sysdate(), "
        + "   style_no = ? , "
        + "   status = ? "
        + " where   sequence_no = ? ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, inputDate);
    pstmt.setString(idx++, item_group);
    pstmt.setString(idx++, item_class); 
    pstmt.setString(idx++, qty);
    pstmt.setString(idx++, buyer);
    pstmt.setString(idx++, supplier);
    pstmt.setString(idx++, season.toUpperCase());
    pstmt.setString(idx++, sendingDate);
    pstmt.setString(idx++, returnDate);
    pstmt.setString(idx++, remarks);
    pstmt.setString(idx++, _adminid);
    pstmt.setString(idx++, style_no.toUpperCase());
    pstmt.setString(idx++, order_status);
    pstmt.setString(idx++, sequenceNo);
    iCnt = pstmt.executeUpdate();

    if (iCnt != 1) {
      throw new UserDefinedException("Check SAMPLE MASTER data.");
    }
    // insert...history
    sql = " insert into SAMPLE_HISTORY "
        + " ( "
        + "   sample_no, item_class, input_date, item_group, qty, buyer, supplier, "
        + "   sending_date, return_date, remarks, modifier, modified_date, season,style_no,status "
        + " ) "
        + " values "
        + " ( "
        + "    ?, ?, str_to_date(?, '%Y/%m/%d'), ?, ?, ?, ?, "
        + "   str_to_date(?, '%Y/%m/%d'), str_to_date(?, '%Y/%m/%d'), ?, ?, sysdate(), ?, ?, ? "
        + " ) ";
      idx = 1;    
      pstmt = conn.prepareStatement(sql);   
      pstmt.setString(idx++, sampleNo.toUpperCase());
      pstmt.setString(idx++, item_class);
      pstmt.setString(idx++, inputDate);
      pstmt.setString(idx++, item_group);
      pstmt.setString(idx++, qty);
      pstmt.setString(idx++, buyer);
      pstmt.setString(idx++, supplier);
      pstmt.setString(idx++, sendingDate);
      pstmt.setString(idx++, returnDate);
      pstmt.setString(idx++, remarks);
      pstmt.setString(idx++, _adminid);
      pstmt.setString(idx++, season.toUpperCase());
      pstmt.setString(idx++, style_no.toUpperCase()); 
      pstmt.setString(idx++, order_status);
      iCnt = pstmt.executeUpdate();
       if (iCnt != 1) {
        throw new UserDefinedException("Check SAMPLE_HISTORY data.");
      }
    // insert..comment hist
    sql = " insert into SAMPLE_COMMENTS "
        + " ( "
        + "   SEQUENCE_NO, SAMPLE_NO, SUPPLIER_REMARKS,BUYER_REMARKS, SUPPLIER_ID, SUPPLIER_UPDATED "
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
      pstmt.setString(idx++, _adminid);
      iCnt = pstmt.executeUpdate();
      if (iCnt != 1) {
        throw new UserDefinedException("Check SAMPLE_COMMENTS data.");
      }


  } else if (actionFlag.equals("D")) {

    // delete..
    sql = " delete  from VG_SAMPLE_IN_OUT "
        + " where   sequence_no = ? ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, sequenceNo);
    iCnt = pstmt.executeUpdate();

    if (iCnt != 1) {
      throw new UserDefinedException("Check your data.");
    }

  } else {

    throw new UserDefinedException("The action is unknown.");

  }

  conn.commit();
  isSucceeded = true;

  // save SGR, inputDate, PGR in session
  // to avoid repeated input
  if (actionFlag.equals("I")) {
    //session.setAttribute("_InOutSgr", item_class);
    session.setAttribute("_InOutInputDate", inputDate);
    session.setAttribute("_InOutItemGroup", item_group);
  }

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
if (isSucceeded) strMsg = "The data are successfully processed ";
else strMsg = "The operation failed.\\n" + strMsg;
	
// sending email
String mailSubject = "";
String mailContents = "";
// 주) Status를  Sample발송(20), Sample수정(26),디자인 확정(30),오더취소(999)으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다. 
if (order_status.equals("20") || order_status.equals("26") || order_status.equals("30") || order_status.equals("999")) {
	if (isSucceeded && !toEmailAddress.equals("")) {
	   
	 mailSubject = "[SCM] Original sample #" + sampleNo + " 에 대한 발송 e-mail 입니다.";  
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
	//               + (order_status.equals("90") ? "<br>And related Purchase Orders have been automatically created." : "")
	               + "<br>"
	               + "상세한 내역의 확인은 SCM Site를 접속하여 확인을 할 수 있습니다.[<a href='http://www.sebin2098.com/'>SCM</a>] web site."
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
	               + "  <td bgcolor='#E8E8E8' align='center'>(수신)Buyer</td>"
	               + "  <td bgcolor='#F4F5F0'>" + buyer_name + " ( "+buyer+ " ) &nbsp;</td>"
	               + "</tr>"
	               + "<tr>"
	               + "  <td bgcolor='#E8E8E8' align='center'>(발송)Supplier</td>"
	               + "  <td bgcolor='#F4F5F0'>" + supplier_name + " ( "+supplier+ " ) &nbsp;</td>"
	               + "</tr>"
	               + "<tr>"
	               + "  <td bgcolor='#E8E8E8' align='center'>Season</td>"
	               + "  <td bgcolor='#F4F5F0'>" + season + "&nbsp;</td>"
	               + "</tr>"
	               + "<tr>"
	               + "  <td bgcolor='#E8E8E8' align='center'>Created </td>"
	               + "  <td bgcolor='#F4F5F0'>" + inputDate + "&nbsp;</td>"
	               + "</tr>"              
	               + "<tr>"
	               + "  <td bgcolor='#E8E8E8' align='center'> 요청자 </td>"
	               + "  <td bgcolor='#F4F5F0'>" + _adminname + "&nbsp;</td>"
	               + "</tr>"
	               + "<tr>"
	               + "  <td bgcolor='#E8E8E8' align='center'>메일 발송일</td>"
	               + "  <td bgcolor='#F4F5F0'>" + DateUtil.getToday(DATE_FORMAT) + "&nbsp;</td>"
	               + "</tr>"               
	               + "<tr height='60'>"
	               + "  <td bgcolor='#E8E8E8' align='center'>Supplier's<br>Comments</td>"
	               + "  <td bgcolor='#F4F5F0' valign='top'>" + StringUtil.convertTextToHtml(remarks) + "&nbsp;</td>"
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
	  else strMsg += "The email sending is failed.\\n" + strMsg;	
	}

}


      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title></title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<form name=\"form1\" method=\"post\" action=\"./original_sample_in_out_list.jsp\">\n");
      out.write("<input type=\"hidden\" name=\"curPage\" value=\"");
      out.print( curPage );
      out.write("\">\n");
      out.write("<input type=\"hidden\" name=\"pageSize\" value=\"");
      out.print( pageSize );
      out.write("\">\n");
      out.write("<input type='hidden' name='searchFromDate' value='");
      out.print( searchFromDate );
      out.write("'>\n");
      out.write("<input type='hidden' name='searchToDate' value='");
      out.print( searchToDate );
      out.write("'>\n");
      out.write("<input type='hidden' name='searchBuyer' value='");
      out.print( searchBuyer );
      out.write("'>\n");
      out.write("<input type='hidden' name='searchItemClass' value='");
      out.print( searchItemClass );
      out.write("'>\n");
      out.write("<input type='hidden' name='searchSupplier' value='");
      out.print( searchSupplier );
      out.write("'>\n");
      out.write("<input type='hidden' name='searchItemGroup' value='");
      out.print( searchItemGroup );
      out.write("'>\n");
      out.write("<input type='hidden' name='searchSampleNo' value='");
      out.print( searchSampleNo );
      out.write("'>\n");
      out.write("</form>\n");
      out.write("<script language=\"javascript\">\n");
      out.write("  alert('");
      out.print( strMsg );
      out.write("');\n");
      out.write("  document.form1.submit();\n");
      out.write("</script>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
