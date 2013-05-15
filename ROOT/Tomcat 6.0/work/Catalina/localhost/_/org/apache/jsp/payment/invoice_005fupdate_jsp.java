package org.apache.jsp.payment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.*;
import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;
import dbconn.*;
import common.*;
import common.util.*;

public final class invoice_005fupdate_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


//-------------------------------------------
// CopyRightLogo
//
//-------------------------------------------
String CopyRightLogo()
{
  String str;
  str = "<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center' >";
  str += "<tr><td width='100%' height='2' align='center' colspan='2'>";
  str += "<HR color='#5BA3C1' width=100% size=1></td></tr>";
  str += "<tr><td width='40%'align='right'><img src='/img/sebin_small.jpg'></td>";
  str += " <td width='60%' align='left'><FONT size=2 color=778899>";
  str += "&copy;Copyright 2011 ";
  str += "Sebin Trading Enterprise Co,. Ltd. All Rights Reserved.<BR>";
  str += "Contact to <FONT color=blue><A href='mailto:scm@sebin2098.com'>scm@sebin2098.com</A>";
  str += " for more information.</FONT>";
  str += "</td></tr></table>";

  return (String)str;
}

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(3);
    _jspx_dependants.add("/admin/login_check.jsp");
    _jspx_dependants.add("/bottom_line.jsp");
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
      com.jspsmart.upload.SmartUpload smart = null;
      synchronized (_jspx_page_context) {
        smart = (com.jspsmart.upload.SmartUpload) _jspx_page_context.getAttribute("smart", PageContext.PAGE_SCOPE);
        if (smart == null){
          smart = new com.jspsmart.upload.SmartUpload();
          _jspx_page_context.setAttribute("smart", smart, PageContext.PAGE_SCOPE);
        }
      }
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
      out.write('\n');
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

String path = application.getRealPath(_invoiceFileUrl) + java.io.File.separator;

// Initialization
smart.initialize(pageContext);
smart.upload();

//myUpload.init(config);
smart.service(request,response);

// Upload
//Enumeration e = smart.getRequest().getParameterNames();
String ag_buyer = smart.getRequest().getParameter("ag_buyer");
String ag_supplier = smart.getRequest().getParameter("ag_supplier");
String ag_po_no = request.getParameter("ag_po_no");

String filename = "";
com.jspsmart.upload.File upfile = smart.getFiles().getFile(0);

if(!upfile.isMissing()) {
   filename = upfile.getFileName();
   filename = ag_buyer + "_" + filename ;
   upfile.saveAs(path + filename);
}

if ( filename.length() > 50 ) {
   out.println( " Max invoice file Characters are 50. Try again After Confirming  number of invoice file Characters!");
   return;
}

String invoiceno = smart.getRequest().getParameter("invoice_no").trim();
String invoice_date = smart.getRequest().getParameter("invoice_date");
//String rcnt = smart.getRequest().getParameter("pcnt");
String status = "P"; // Invoice 생성
//int row = Integer.parseInt(rcnt);
String[] seq          =  smart.getRequest().getParameterValues("seq");
String[] check_pono   =  smart.getRequest().getParameterValues("check_pono");
String[] a_style_no   =  smart.getRequest().getParameterValues("a_style_no");
String[] a_qty        =  smart.getRequest().getParameterValues("a_qty");
String[] a_price      =  smart.getRequest().getParameterValues("a_price");
//String[] a_air_price  =  smart.getRequest().getParameterValues("a_air_price");
//String[] disc_price   =  smart.getRequest().getParameterValues("disc_price");

Statement stmt = null;
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
String sql  = "";
int iRet = 0;
String outS = "";

//SimpleDateFormat dd = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");   //import java.text.*
String update = DateUtil.getToday("yyyy.MM.dd HH:mm:ss");

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
   Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  sql = " select count(*) from invoice_01t " +
        " where invoice_no =  '" + invoiceno + "'  " +
        "  and  sup_id     =  '" + ag_supplier + "' " +        
        "  and  buyer_id     =  '" + ag_buyer + "' " ;

  //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  int check_cnt= 0;

  if ( iRet > 0 ) {
    check_cnt   =  Integer.parseInt(matrix.getRowData(0).getData(0));
  }

  if (check_cnt > 0) {
    outS += "<tr><td><font color= red >Invoice생성이 실패 되었습니다! 이미 등록된 Invoice번호가 존재합니다. Invoice번호를 체크하시고 다시 생성해 주세요!</font><td><tr>"
              +  "<tr><td align=center><A HREF='./invoice_confirm_search.jsp'><b> 돌아가기 </b> </A></td><tr> "  ;
    throw new UserDefinedException("Invoice number duplication");
  }

  sql = "INSERT INTO invoice_01t( invoice_date, invoice_no, buyer_id,sup_id , file_name, status, updated ) " +
        " VALUES( " +
        " str_to_date( '"+invoice_date+"' , '%Y/%m/%d') ,"  +
        "upper('" + invoiceno   + "'),"  +
        "'" + ag_buyer        + "',"  +
        "'" + ag_supplier     + "',"  + 
        "upper('" + filename + "'), "  +
        "'" +  status   + "',"  + 
        "  sysdate() ) ";
  conn.setAutoCommit(false);
  stmt = conn.createStatement();
  iRet = stmt.executeUpdate(sql);
  stmt.close();
  
  if (iRet > 0) {
    System.out.println("Invoice_01t insert Sucess : Qeyry = " + update + " ==> " +sql ) ;
  } else {
    throw new UserDefinedException("Invoice_01t insert ERROR : Qeyry = " + update + " ==> " +sql ) ;
  }
  for (int i = 0; i < check_pono.length; i++) {
    sql =  " INSERT INTO invoice_02t ( invoice_no, seq, po_no , style_no , qty, price , sup_id, buyer_id, updated ) " +
           " VALUES( " +
           "upper('" + invoiceno + "') ,"  +
           "'"+ (i+1) + "',"  +
           "'" + check_pono[i]   + "',"  +
           "'" + a_style_no[i]   + "',"  +
           "'" + a_qty[i]   + "',"  +
           "'" + a_price[i]   + "',"  +
           "'" + ag_supplier        + "',"  +
           "'" + ag_buyer        + "',"  +  
           " sysdate() ) ";

    stmt = conn.createStatement();
    iRet = stmt.executeUpdate(sql);
    if (iRet > 0 ) {
      System.out.println("Invoice_02t insert Sucess : Qeyry = " + update + " ==> " +sql ) ;
    } else {
      throw new UserDefinedException("Invoice_02t insert ERROR : Qeyry = " + update + " ==> " +sql) ;
    }
    
    // update div_status
    sql = " update  purchase_order "
        + " set     order_status = '90' , "  // Invoice작성완료
        + "           payment_no = upper('" + invoiceno + "') ,"
        + "           updated = sysdate() " 
        + " where   order_no = '" + check_pono[i] + "' ";

    iRet = stmt.executeUpdate(sql);
    stmt.close();

    if (iRet != 1) {
      outS = "<td><font color= red >Sending invoice failed. Couldn't update the PO status.</font><td>";
      throw new UserDefinedException("po update ERROR : Qeyry = " + update + " ==> " +sql) ;
    }
  }

  outS += "<tr><td><font color=blue> Invoice번호 : " + invoiceno + " 으로 정상적으로 생성이 되었습니다. '완료' 버튼을 틀릭하세요! </font></td></tr> " +
               "<tr><td align=center ><A HREF='./invoice_search.jsp'><b> 완료 </b> </A></td></tr> " + 
              "<tr><td> <font color=red> Buyer에게 대금청구를 하려면 반드시 생성된 Invoice를 조회후 대금청구 처리를 해야 합니다.</font></td></tr>"  ;

   conn.commit();

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  System.out.println("Exception invoice_update : " + ue.getMessage());
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  System.out.println("Exception invoice_update, Date : " + update + ", Query ==> " + sql);
  throw e;
} finally {
  if (stmt != null) {
    try { stmt.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
  }
}

      out.write("\n");
      out.write("<HTML>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script language=JavaScript>\n");
      out.write("function Back()\n");
      out.write("{\n");
      out.write("  history.back();\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\n");
      out.write("<table width=\"840\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr><td>\n");
      out.write("\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"3%\"><img src=\"/img/title_icon.gif\"></td>\n");
      out.write("  <td width=\"*\" class=\"left_title\">Invoices생성 처리결과 메세지</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<TABLE WIDTH=640 BORDER=0 CELLSPACING=0 CELLPADDING=0 align='center'>\n");
      out.write("\t<FORM NAME=frmMain METHOD=POST enctype=\"multipart/form-data\">\n");
      out.write("<input type='hidden' name='ag_buyer' value='");
      out.print( ag_buyer );
      out.write("'>\t\n");
      out.write("<input type='hidden' name='ag_supplier' value='");
      out.print( ag_supplier );
      out.write("'>\t\n");
      out.write("<FORM>\n");
      out.write("<TR>\n");
      out.print(outS);
      out.write("\n");
      out.write("</TR>\n");
      out.write("</TABLE>\n");

out.println(CopyRightLogo());

      out.write("\n");
      out.write("</td></tr></table>\n");
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
