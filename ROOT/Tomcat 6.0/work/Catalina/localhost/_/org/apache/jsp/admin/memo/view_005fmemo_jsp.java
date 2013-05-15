package org.apache.jsp.admin.memo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.net.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import dbconn.*;

public final class view_005fmemo_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_dependants.add("/common/CommonVars.jsp");
    _jspx_dependants.add("/admin/memo/../../bottom_line.jsp");
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


      out.write("\n");
      out.write("<!--%@ page errorPage=\"../../error.jsp\" %-->\n");
      out.write('\n');
      out.write('\n');
      out.write('\n');

String seqno = request.getParameter("seqno");
String adminid ="";
String adminname ="";
String idate ="";
String title ="";
String contents ="";
String recv_list ="";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql  = "";
String outS = "";
String file_name = "";
String file_name2 = "";
String file_nm ="";
String path = application.getRealPath(_memoDataUrl) + File.separator;   // file path

sql = "SELECT adminid, adminname, str_to_date(date_format(idate,'%Y/%m/%d'),'%Y/%m/%d'), title, contents, AFNAME " +
      " FROM  t_memo_01t " +
      " WHERE seqno = " + seqno;

try {

  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  stmt = conn.createStatement();
  rs = stmt.executeQuery(sql);

  if (rs.next()) {
    adminid = rs.getString(1);
    adminname = rs.getString(2);
    idate = rs.getString(3);
    title = rs.getString(4);
    // CLOB Test
    StringBuffer output = new StringBuffer();
    Reader input = rs.getCharacterStream(5);
    char[] buffer = new char[1024];
    int byteRead;
    while( (byteRead=input.read(buffer,0,1024))!= -1 )       
    output.append(buffer,0,byteRead);    
    input.close();
    contents = output.toString();
     
    //
    


    //Clob clob   = rs.getClob(5);
    //Reader clobStream = clob.getCharacterStream();
    //StringBuffer buf = new StringBuffer();
    //int    nchars = 0; // Number of characters read
    //char[] buffer = new char[10];  //  Buffer holding characters being transferred
    //while( (nchars = clobStream.read(buffer)) != -1 ) // Read from Clob
    //  buf.append(buffer, 0, nchars);        // Write to StringBuffer
    //clobStream.close();  // Close the Clob input stream
    //contents = buf.toString();

    if ( rs.getString(6) != null ) {
      file_nm   = rs.getString(6);
      file_name = path + file_nm;
      file_name2  =  "<td align=left colspan=5 class='table_list' ><B><a href='download.jsp?filename=" + file_name + "'><font color=#0000FF >" + file_nm + " </font></B> </td>";
    } else {
      file_name2 = "<td colspan=5 align=left class='table_list'> No attached files </TD>";
    }
  }

 // sql = " select COMNAME, IFNULL(read_date,'not read') " +
 //       " from ( " +
 sql =   "        SELECT COMNAME, str_to_date(date_format(rdate,'%Y/%m/%d'),'%Y/%m/%d') AS read_date " +
        "        FROM   s_memo_02t WHERE seqno = " + seqno  +
        "        union " +
        "        Select comname, str_to_date(date_format('','%Y/%m/%d'),'%Y/%m/%d') AS read_date from s_memo_03t " +
        "        where  seqno = " + seqno +
        "        and    comid not in (select staffid from  s_memo_02t where seqno= " + seqno + ")" ;
  //      "      ) " +
  //      " order by substr(read_date,7,10) asc " ;
  //out.println(sql);
  //if (true) return;
  rs = stmt.executeQuery(sql);

  int linefeed = 0;
  String bgcolor = "#FFFFF0";
  
  while (rs.next()) {
    String shopname = rs.getString(1);
    String rdate = rs.getString(2);

    if( linefeed == 0 ) {
      bgcolor = "#FFFFF0";
      linefeed = 1;
    } else {
      bgcolor = "#EEEEE0";
      linefeed = 0;
    }
    
    recv_list += "<TR><TD class='table_list'> " + shopname +
      "</TD><TD align=center class='table_list'>" + rdate +
      "</font></TD></TR>\n";
  }

} catch (Exception e) {
  System.out.println("Exception /admin/memo/view_memo : " + e.getMessage());
  throw e;
} finally {
  if (rs != null) {
    try { rs.close(); } catch (Exception e) {}
  }

  if (stmt != null) {
    try { stmt.close(); } catch (Exception e) {}
  }

  if (conn != null) {conn.close(); }
}

      out.write("\n");
      out.write("<HTML>\n");
      out.write("<HEAD>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<SCRIPT LANGUAGE=\"JavaScript\">\n");
      out.write("function List(form)\n");
      out.write("{\n");
      out.write("  form.seqno.value = \"\";\n");
      out.write("  form.action = \"index.jsp\";\n");
      out.write("  form.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function Delete( form )\n");
      out.write("{\n");
      out.write("    result = confirm(\"Are you sure?\");\n");
      out.write("    if( result == true )\n");
      out.write("  {\n");
      out.write("            form.action = \"memo_delete.jsp\";\n");
      out.write("            form.submit();\n");
      out.write("    }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function Update(form)\n");
      out.write("{\n");
      out.write("  form.action = \"memo_edit.jsp\";\n");
      out.write("  form.submit();\n");
      out.write("}\n");
      out.write("</SCRIPT>\n");
      out.write("</HEAD>\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\n");
      out.write("<table width=\"840\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr><td>\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"3%\"><img src=\"/img/icon_ann.jpg\"></td>\n");
      out.write("  <td width=\"*\" class=\"left_title\"> Manage Buyer Notice</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<table width=\"100%\" border=\"0\" cellspacing='1' cellpadding='2' align=\"center\" class=\"table_bg\">\n");
      out.write("<FORM NAME=\"frmMain\" METHOD=POST>\n");
      out.write("<INPUT type =\"HIDDEN\" NAME=seqno VALUE=\"");
      out.print(seqno);
      out.write("\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" colspan=2 align='center' class=\"table_bg_bright_center\">\n");
      out.write("    <INPUT TYPE=BUTTON VALUE=\" List \" ONCLICK=\"List(document.frmMain)\" class=\"button_default\">\n");
      out.write("     ");

  	   if ( _adminclass.equals("1")) {
     
      out.write("\n");
      out.write("    <INPUT TYPE=BUTTON VALUE=\"Delete\" ONCLICK=\"Delete(document.frmMain)\" class=\"button_default\">\n");
      out.write("    <INPUT TYPE=BUTTON VALUE=\"Edit\" ONCLICK=\"Update(document.frmMain)\" class=\"button_default\">\n");
      out.write("        ");

      } 
     
      out.write("\n");
      out.write("  </td>\n");
      out.write("</tr>\n");
      out.write("</FORM>\n");
      out.write("</table>\n");
      out.write("<TABLE border=0 cellspacing='1' cellpadding='2' WIDTH=100% align='center' class=\"table_bg\">\n");
      out.write("<TR>\n");
      out.write("<TD WIDTH=\"10%\" ALIGN=CENTER class=\"table_header_center\">Notice No.</TD>\n");
      out.write("<TD WIDTH=\"10%\" ALIGN=CENTER class='table_bg_bright'><B>");
      out.print(seqno);
      out.write("</B></TD>\t\n");
      out.write("<TD WIDTH=\"10%\" ALIGN=CENTER class=\"table_header_center\">Sender</TD>\n");
      out.write("<TD WIDTH=\"30%\" ALIGN=CENTER class='table_bg_bright'>");
      out.print(adminname);
      out.write("</TD>\n");
      out.write("<TD WIDTH=\"10%\" ALIGN=CENTER class=\"table_header_center\">Date</TD>\n");
      out.write("<TD WIDTH=\"30%\" ALIGN=CENTER class='table_bg_bright'>");
      out.print(idate);
      out.write("</TD>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("<TD WIDTH=\"20%\" ALIGN=CENTER class=\"table_header_center\">Title</TD>\n");
      out.write("<TD WIDTH=\"80%\" COLSPAN=5 class='table_bg_bright'>");
      out.print(title);
      out.write("</TD>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("<TD WIDTH=\"100%\" COLSPAN=6 HEIGHT=250 VALIGN=TOP bgcolor=\"white\" >");
      out.print(contents);
      out.write("</font></TD>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("<TD WIDTH=\"20%\" ALIGN=CENTER class=\"table_header_center\">Attached File</TD>\n");
      out.print(file_name2);
      out.write("\n");
      out.write("</TR>\n");
      out.write("</TABLE>\n");
      out.write("<br>\n");
      out.write("<table width=\"50%\" border=\"0\" cellspacing='1' cellpadding='2' align=\"center\" class=\"table_bg\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" colspan=2 align='center' class=\"table_bg_bright_center\">\n");
      out.write("    Confirmed Notice \n");
      out.write("  </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <TD WIDTH=50% ALIGN=CENTER class=\"table_header_center\">Receiver</TD>\n");
      out.write("  <TD WIDTH=50% ALIGN=CENTER class=\"table_header_center\">Read time</TD>\n");
      out.write("   ");
      out.print(recv_list);
      out.write("\n");
      out.write("</tr>\n");
      out.write("</table>\n");

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
