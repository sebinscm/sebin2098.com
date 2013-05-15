package org.apache.jsp.ordermanagement;

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

public final class buyer_005forder_005fstatus_005fsave_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/login_check.jsp");
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

String scmid = "";
String scmnm = "";
String usertype = "";
String usergroup = "";
String scmsupid = "";
String _buyer_email ="";
String _supplier_email="";

try{
  scmid = (String) session.getAttribute("scmid");


  if (scmid == null || scmid.length() == 0 || scmid.equals("null") ) {     
    response.sendRedirect("/login_first.html");
    return;
  }
  

  scmnm = (String) session.getAttribute("scmnm");
  scmsupid = (String) session.getAttribute("scmsupid");
  usertype = (String) session.getAttribute("usertype");
  if (usertype == null) usertype = "";

  usergroup = (String) session.getAttribute("usergroup");
  if (usergroup == null) usergroup = "";
  _buyer_email = (String) session.getAttribute("buyer_email");
  _supplier_email = (String) session.getAttribute("supplier_email");
  
  //session.setMaxInactiveInterval(60*60);

}catch( Exception e ) {
  response.sendRedirect("/login_first.html");
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

String DATE_FORMAT = "yyyy/MM/dd";
String ag_supplier = request.getParameter("ag_supplier");
String ag_season = request.getParameter("ag_season");
String ag_date_type = request.getParameter("ag_date_type");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");
String ag_orderby = request.getParameter("ag_orderby");
//String ag_buyer = request.getParameter("ag_buyer");

String po_no = request.getParameter("po_no");
String po_status = request.getParameter("po_status_list");
//out.println(po_status);
//if (true) return;
String init_delivery_date = request.getParameter("init_delivery_date");
String old_po_status ="";
String buyer="";
String supplier="";
String buyer_name="";
String buyer_email="";
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
      + " where  id = '" + supplier + "' ";
   iRet = dataProcess.RetrieveData(sql, matrix, conn);
   if (iRet > 0) {
	    toEmailName = matrix.getRowData(0).getData(0);
	    toEmailAddress = matrix.getRowData(0).getData(1);
   }
  	//buyer_name = toEmailName;
    // read sender buyer name 
   sql = " select  name, email "
      + " from    login_01t "
      + " where  id = '" + buyer + "' ";
     iRet = dataProcess.RetrieveData(sql, matrix, conn);     
     if (iRet > 0) {
	    buyer_name = matrix.getRowData(0).getData(0);	    
	    buyer_email = matrix.getRowData(0).getData(1);	  
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
	      pstmt2.setString(++j, scmid);
	      pstmt2.setString(++j, po_no);
	      pstmt2.executeUpdate();
	      // PO History insert
	       int k = 0;  
	      pstmt3.setString(++k, po_no);
	      pstmt3.setString(++k, init_delivery_date);
	      pstmt3.setString(++k, po_status);
	      pstmt3.setString(++k, scmid);
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
// 주) Status를  오더컴요청(40),오더취소(999)으로 변경시 해당 Supplier에게 e-mail이 자동으로 발송이 됩니다. 
if (po_status.equals("45") || po_status.equals("55")  || po_status.equals("85") || po_status.equals("999")) {

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
	               + "  <td bgcolor='#F4F5F0'>" + buyer_name + "&nbsp;</td>"
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
	    
	    String tmpName = "SCM Admin";
	    String tmpEmail = "scm@sebin2098.com";
	    String[] tmpCc = {tmpName, tmpEmail};
	    ccEmail.add(tmpCc);
	    for (int i = 0; i < ccEmail.size(); i++) {
	        tmpCc = (String[]) ccEmail.get(i);
	      //String[] tmpCc = (String[]) ccEmail.get(i);
	      htmlEmail.addCc(tmpCc[1], tmpCc[0]);
	    }
	
	    //if (_adminmail.length() > 0) {
	      htmlEmail.setFrom(buyer_email, buyer_name);
	    //} else {
	     // htmlEmail.setFrom(_systemAdminEmail, _systemAdminName);
	    //}
	
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
	

      out.write("\n");
      out.write("<HTML>\n");
      out.write("<head>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<form name='form1' method='post'>\n");
      out.write("<input type='hidden' name='ag_supplier' value='");
      out.print( ag_supplier );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_season' value='");
      out.print( ag_season );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_date_type' value='");
      out.print( ag_date_type );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_from_date' value='");
      out.print( ag_from_date );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_to_date' value='");
      out.print( ag_to_date );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_po_no' value='");
      out.print( ag_po_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_style_no' value='");
      out.print( ag_style_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_orderby' value='");
      out.print( ag_orderby );
      out.write("'>\n");
      out.write("</form>\n");
      out.write("<script language='javascript'>\n");
      out.write("alert(\"");
      out.print( strMsg );
      out.write("\");\n");
      out.write("form1.action = './buyer_order_status_list.jsp';\n");
      out.write("form1.submit();\n");
      out.write("</script>\n");
      out.write("</BODY>\n");
      out.write("</HTML>\n");
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
