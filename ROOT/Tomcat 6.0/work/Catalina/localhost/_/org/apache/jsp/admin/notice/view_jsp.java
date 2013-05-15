package org.apache.jsp.admin.notice;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import common.util.*;
import dbconn.*;

public final class view_jsp extends org.apache.jasper.runtime.HttpJspBase
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

response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

String curPage = request.getParameter("curPage");
String pageSize = request.getParameter("pageSize");
String seqNo = request.getParameter("seqNo");
String searchKeyword = request.getParameter("searchKeyword");

Connection conn = null;
DataProcess dataProcess = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = "";

// Weekly Report 관련 변수
String inputDate = "";
String adminId = "";
String adminName = "";
String title = "";
String content = "";
int readCnt = 0;
String attachedFiles = "";

try {

      dataProcess = new dbconn.DataProcess();
     Context ic = new InitialContext(); 
	 DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	 conn = ds.getConnection();
	 	
  conn.setAutoCommit(false);

  // update read count
  sql = " update  scm_notice_01t "
      + " set     read_cnt = ifnull(read_cnt, 0) + 1 "
      + " where   seqno = ? ";
  pstmt = conn.prepareStatement(sql);
  pstmt.setLong(1, Long.parseLong(seqNo));
  pstmt.executeUpdate();
  conn.commit();

  // read the notice
  sql = " select  str_to_date(date_format(input_date, '%Y/%m/%d'),'%Y/%m/%d'), admin_id, "
      + "         admin_name, ifnull(read_cnt, 0), title, content "
      + " from    scm_notice_01t "
      + " where   seqno = " + seqNo;

  stmt = conn.createStatement();
  rs = stmt.executeQuery(sql);

  if (rs.next()) {
    int j = 0;
    inputDate     = rs.getString(++j);
    adminId       = rs.getString(++j);
    adminName     = rs.getString(++j);
    readCnt       = rs.getInt(++j);
    title         = rs.getString(++j);

    // read content
   StringBuffer output = new StringBuffer();
    Reader input = rs.getCharacterStream(6);
    char[] buffer = new char[1024];
    int byteRead;
    while( (byteRead=input.read(buffer,0,1024))!= -1 )       
    output.append(buffer,0,byteRead);    
    input.close();
    content = output.toString();
     
   // Clob clob     = rs.getClob(++j);

    //Reader clobStream = clob.getCharacterStream();
    //StringBuffer buf = new StringBuffer();
    //int    nchars = 0;              // Number of characters read
    //char[] buffer = new char[10];   //  Buffer holding characters being transferred

    //while( (nchars = clobStream.read(buffer)) != -1 ) {   // Read from Clob
    //  buf.append(buffer, 0, nchars);                      // Write to StringBuffer
    //}

    //clobStream.close();             // Close the Clob input stream

    //content = buf.toString();
    ////////////////////////////
  }

  rs.close();

  // read attached files
  sql = " select  seqno,  attach_file,  attach_real_file "
      + " from    scm_notice_02t "
      + " where   notice_seqno = " + seqNo
      + " order by seqno desc ";

  rs = stmt.executeQuery(sql);

  int i = 0;
  while (rs.next()) {
    int j = 0;
    long fileSeqNo        = rs.getLong(++j);
    String attachFile     = rs.getString(++j);
    String attachRealFile = rs.getString(++j);

    if (i++ > 0) attachedFiles += "<br>";

    attachedFiles += "<a href=\"javascript:fnDownload('" + attachFile + "', '" + attachRealFile + "');\">"
                + attachFile + "</a>";
  }

} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}
  System.out.println("Exception view : " + e.getMessage());
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

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title></title>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script language=\"javascript\">\n");
      out.write("function fnList(frm) {\n");
      out.write("  frm.action = \"./list.jsp\";\n");
      out.write("  frm.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnEdit(frm) {\n");
      out.write("  frm.action = \"./edit_form.jsp\";\n");
      out.write("  frm.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnDelete(frm) {\n");
      out.write("  if (confirm(\"Do you really want to delete these data?\")) {\n");
      out.write("    frm.action = \"./delete.jsp\";\n");
      out.write("    frm.submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnDownload(file1, file2) {\n");
      out.write("  with (document.form2) {\n");
      out.write("    attachFile.value = file1;\n");
      out.write("    attachRealFile.value = file2;\n");
      out.write("    action = \"/common/download.jsp\";\n");
      out.write("    target = \"hiddenFrm\";\n");
      out.write("    submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\n");
      out.write("<table width=\"840\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr><td>&nbsp;</td></tr>\n");
      out.write("<tr><td>\n");
      out.write("\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"3%\"><img src=\"/img/btnFolder.gif\"></td>\n");
      out.write("  <td width=\"*\" class=\"left_title\">&nbsp;&nbsp;&nbsp;Notice for Sebin User</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width=\"800\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" class=\"table_bg\">\n");
      out.write("<form name=\"form1\" method=\"post\">\n");
      out.write("<input type=\"hidden\" name=\"curPage\" value=\"");
      out.print( curPage );
      out.write("\">\n");
      out.write("<input type=\"hidden\" name=\"pageSize\" value=\"");
      out.print( pageSize );
      out.write("\">\n");
      out.write("<input type=\"hidden\" name=\"searchKeyword\" value=\"");
      out.print( searchKeyword );
      out.write("\">\n");
      out.write("<input type=\"hidden\" name=\"seqNo\" value=\"");
      out.print( seqNo );
      out.write("\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"15%\" class=\"table_header_center\">Date</td>\n");
      out.write("  <td width=\"20%\" class=\"table_bg_bright_center\">");
      out.print( inputDate );
      out.write("</td>\n");
      out.write("  <td width=\"15%\" class=\"table_header_center\">Admin Name</td>\n");
      out.write("  <td width=\"20%\" class=\"table_bg_bright_center\">");
      out.print( adminName );
      out.write("</td>\n");
      out.write("  <td width=\"15%\" class=\"table_header_center\">Read Count</td>\n");
      out.write("  <td width=\"15%\" class=\"table_bg_bright_center\">");
      out.print( readCnt );
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td class=\"table_header_center\">Title</td>\n");
      out.write("  <td colspan=\"5\" class=\"table_bg_bright\">");
      out.print( title );
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td class=\"table_header_center\">Attached Files</td>\n");
      out.write("  <td colspan=\"5\" class=\"table_bg_bright\">");
      out.print( attachedFiles );
      out.write("&nbsp;</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td colspan=\"6\" height=\"300\" valign=\"top\" class=\"table_bg_white\">");
      out.print( content );
      out.write("&nbsp;</td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width=\"800\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<table width=\"800\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" align=\"center\">\n");
      out.write("    <input type=\"button\" value=\" List \" onclick=\"fnList(this.form);\" class=\"button_default\">\n");

if (adminId.equals(_adminid)) {

      out.write("\n");
      out.write("    <input type=\"button\" value=\" Edit \" onclick=\"fnEdit(this.form);\" class=\"button_default\">\n");
      out.write("    <input type=\"button\" value=\" Delete\" onclick=\"fnDelete(this.form);\" class=\"button_default\">\n");

}

      out.write("\n");
      out.write("  </td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("</form>\n");

out.println(CopyRightLogo());

      out.write("\n");
      out.write("<form name=\"form2\" method=\"post\">\n");
      out.write("<input type=\"hidden\" name=\"attachPath\" value=\"");
      out.print( _ManagementNoticeUploadUrl );
      out.write("\">\n");
      out.write("<input type=\"hidden\" name=\"attachFile\">\n");
      out.write("<input type=\"hidden\" name=\"attachRealFile\">\n");
      out.write("</form>\n");
      out.write("</td></tr></table>\n");
      out.write("<iframe name=\"hiddenFrm\" src=\"\" width=\"0\" height=\"0\" frameborder=\"0\"></iframe>\n");
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
