package org.apache.jsp.notice_005fnew;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import common.util.*;
import dbconn.*;

public final class buyer_005fview_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_dependants.add("/login_check.jsp");
    _jspx_dependants.add("/common/CommonVars.jsp");
    _jspx_dependants.add("/bottom_line.jsp");
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

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

      out.write('\r');
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


      out.write('\r');
      out.write('\n');
      out.write('\n');
      out.write("\r\n");
      out.write("\r\n");

//response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
//response.setHeader("Pragma","no-cache"); //HTTP 1.0
//response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

String curPage = request.getParameter("curPage");
String pageSize = request.getParameter("pageSize");
String noticeType = request.getParameter("noticeType");
String searchCategory = request.getParameter("searchCategory");
String searchKeyword = request.getParameter("searchKeyword");
String seqno = request.getParameter("seqno");

if (curPage == null) curPage = "1";
if (pageSize == null) pageSize = "20";
if (noticeType == null) noticeType = "1";
if (searchCategory == null) searchCategory = "Title";
if (searchKeyword == null) searchKeyword = "";
int iRet = 0;
Connection conn = null;
PreparedStatement pstmt = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
String sql = "";

// Weekly Report 
String inputDate = "";
String userId = "";
String userName = "";
String title = "";
String content = "";
int readCnt = 0;
String attachFiles = "";

try {

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();
  conn.setAutoCommit(false);

  // update read count
  sql = " update  notice_01t "
      + " set     read_cnt = read_cnt + 1 "
      + " where   seqno = ? ";
  pstmt = conn.prepareStatement(sql);
  pstmt.setLong(1, Long.parseLong(seqno));
  pstmt.executeUpdate();
  conn.commit();

  // Report
  sql = " select  date_format(input_date, '%d/%m/%Y'), user_id, "
      + "         user_name, read_cnt, title, content "
      + " from    notice_01t "
      + " where   seqno = " + seqno
      + " and     type = " + noticeType;

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  if (iRet > 0) {
    int j = 0;
    inputDate   = matrix.getRowData(0).getData(j++);
    userId      = matrix.getRowData(0).getData(j++);
    userName    = matrix.getRowData(0).getData(j++);
    readCnt     = Integer.parseInt(matrix.getRowData(0).getData(j++));
    title       = matrix.getRowData(0).getData(j++);
    content     = matrix.getRowData(0).getData(j++);
  }

  // 
  sql = " select  attach_file,  attach_real_file "
      + " from    notice_02t "
      + " where   notice_seqno = " + seqno
      + " order by seqno desc ";

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}
  System.out.println("Exception view : " + e.getMessage());
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

// 
for (int i = 0; i < iRet; i++) {
  int j = 0;
  String attachFile      = matrix.getRowData(i).getData(j++);
  String attachRealFile  = matrix.getRowData(i).getData(j++);

  attachFiles += "<a href=\"javascript:fnDownload('" + attachFile + "', '" + attachRealFile + "');\">"
              + attachFile + "</a>";
  if (i < (iRet - 1)) attachFiles += "<br>";
}

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title></title>\r\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("function fnNotice(type) {\r\n");
      out.write("  with (document.form0) {\r\n");
      out.write("    noticeType.value = type;\r\n");
      out.write("    action = \"./buyer_list.jsp\";\r\n");
      out.write("    submit();\r\n");
      out.write("  }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function fnList(frm) {\r\n");
      out.write("  frm.action = \"./buyer_list.jsp\";\r\n");
      out.write("  frm.submit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function fnEdit(frm) {\r\n");
      out.write("  frm.action = \"./buyer_form.jsp\";\r\n");
      out.write("  frm.submit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function fnDelete(frm) {\r\n");
      out.write("  if (confirm(\"Do you really want to delete these data?\")) {\r\n");
      out.write("    frm.action = \"./buyer_delete.jsp\";\r\n");
      out.write("    frm.submit();\r\n");
      out.write("  }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function fnDownload(file1, file2) {\r\n");
      out.write("  with (document.form2) {\r\n");
      out.write("    attachFile.value = file1;\r\n");
      out.write("    attachRealFile.value = file2;\r\n");
      out.write("    action = \"/common/download.jsp\";\r\n");
      out.write("    target = \"hiddenFrm\";\r\n");
      out.write("    submit();\r\n");
      out.write("  }\r\n");
      out.write("}\r\n");
      out.write("function fnBack(frm) {\r\n");
      out.write("  frm.action = \"./buyer_list.jsp\";\r\n");
      out.write("  frm.submit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\r\n");
      out.write("<table width=\"840\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n");
      out.write("<tr><td>&nbsp;</td></tr>\r\n");
      out.write("<tr><td>\r\n");
      out.write("\r\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"15\" colspan=\"2\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"3%\"><img src=\"/img/title_icon.gif\"></td>\r\n");
      out.write("  <td width=\"*\" class=\"left_title\">");
      out.print( noticeType.equals("1") ? "Bulletin Board" : "PDS"  );
      out.write("</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<form name=\"form1\" method=\"post\">\r\n");
      out.write("<table width=\"800\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" class=\"table_bg\">\r\n");
      out.write("<input type=\"hidden\" name=\"curPage\" value=\"");
      out.print( curPage );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"pageSize\" value=\"");
      out.print( pageSize );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"noticeType\" value=\"");
      out.print( noticeType );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"searchCategory\" value=\"");
      out.print( searchCategory );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"searchKeyword\" value=\"");
      out.print( searchKeyword );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"seqno\" value=\"");
      out.print( seqno );
      out.write("\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"15%\" class=\"table_header_center\">Date</td>\r\n");
      out.write("  <td width=\"20%\" class=\"table_bg_bright_center\">");
      out.print( inputDate );
      out.write("</td>\r\n");
      out.write("  <td width=\"15%\" class=\"table_header_center\">ID</td>\r\n");
      out.write("  <td width=\"20%\" class=\"table_bg_bright_center\">");
      out.print( userName );
      out.write("</td>\r\n");
      out.write("  <td width=\"15%\" class=\"table_header_center\">View</td>\r\n");
      out.write("  <td width=\"15%\" class=\"table_bg_bright_center\">");
      out.print( readCnt );
      out.write("</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td class=\"table_header_center\">Subject</td>\r\n");
      out.write("  <td colspan=\"5\" class=\"table_bg_bright\">");
      out.print( StringUtil.convertTextToHtml(title) );
      out.write("</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td class=\"table_header_center\">Attachment</td>\r\n");
      out.write("  <td colspan=\"5\" class=\"table_bg_bright\">");
      out.print( attachFiles );
      out.write("&nbsp;</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td colspan=\"6\" height=\"300\" valign=\"top\" class=\"table_bg_bright\">");
      out.print( content );
      out.write("&nbsp;</td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<table width=\"800\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<table width=\"800\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" align=\"center\">\r\n");
      out.write("    <input type=\"button\" value=\"List\" onclick=\"fnList(this.form);\" class=\"button_default\">\r\n");
      out.write("    <input type=\"button\" value=\"Back\" onclick=\"fnBack(this.form);\" class=\"button_default\">    \r\n");

if (userId.equals(scmid)) {

      out.write("\r\n");
      out.write("    <input type=\"button\" value=\"Edit\" onclick=\"fnEdit(this.form);\" class=\"button_default\">\r\n");
      out.write("    <input type=\"button\" value=\"Delete\" onclick=\"fnDelete(this.form);\" class=\"button_default\">\r\n");

}

      out.write("\r\n");
      out.write("  </td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</form> \r\n");
      out.write("<form name=\"form0\" method=\"post\">\r\n");
      out.write("<input type=\"hidden\" name=\"noticeType\" value=\"");
      out.print( noticeType );
      out.write("\">\r\n");
      out.write("</form>\r\n");
      out.write("<form name=\"form2\" method=\"post\">\r\n");
      out.write("<input type=\"hidden\" name=\"attachPath\" value=\"");
      out.print( _noticeDataUrl );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"attachFile\">\r\n");
      out.write("<input type=\"hidden\" name=\"attachRealFile\">\r\n");
      out.write("</form>\r\n");
      out.write("</td></tr></table>\r\n");
      out.write("<iframe name=\"hiddenFrm\" src=\"\" width=\"0\" height=\"0\" frameborder=\"0\"></iframe>\r\n");

	out.println(CopyRightLogo());
	
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
