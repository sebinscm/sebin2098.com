package org.apache.jsp.admin.notice;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.net.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import common.util.*;
import dbconn.*;

public final class edit_005fform_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


/*------------------------------------------------------------------------
	- °Ô½ÃÆÇ ÀÛ¼º¿¡ »ç¿ëµÇ´Â ÇÔ¼öµé

		ÄÚµå¸¦ °ø°³ÇÏ±â À§ÇÑ ¿øÄ¢¿¡ µû¶ó¼­ ÀÚ¹ÙºóÁî¸¦ »ç¿ëÇÏÁö
		¾Ê°í ´ëºÎºÐ ÄÚµå¸¦ jsp¸¦ º¼¼ö ÀÖµµ·Ï ±¸¼ºÇÏ¿´½À´Ï´Ù.

	- ÀúÀÛ±Ç

		ÀÌ °Ô½ÃÆÇ ¼Ò½º´Â ³ª¸ð ¾×Æ¼ºê½ºÄù¾î¸¦ ÀÌ¿ëÇÏ¿© °Ô½ÃÆÇÀ» ±¸¼ºÇÏ´Â ¿¹Á¦
		ÀÔ´Ï´Ù.

		ÀÌ °Ô½ÃÆÇ ¼Ò½ºÀÇ ÀúÀÛ±ÇÀº (ÁÖ)¼¼Áß³ª¸ðÀÎÅÍ·¢Æ¼ºê¿¡ ÀÖÀ¸³ª ÀÚÀ¯·Ó°Ô ¼öÁ¤,
		º¹»ç, ¹èÆ÷ÇÒ ¼ö ÀÖ½À´Ï´Ù.

		ÀÌ °Ô½ÃÆÇ ¼Ò½º ¹× ¼öÁ¤ÇÑ ¼Ò½º·Î ÀÎÇØ ¹ß»ýÇÏ´Â ¸ðµç Ã¥ÀÓ¿¡ ´ëÇØ¼­´Â ´ç»ç°¡ º¸ÁõÇÏÁö
		¾Ê½À´Ï´Ù.

		More information	: htpp://www.namo.com (US)
							: http://www.namo.co.kr (Korea)
							: http://www.namo.com/jp (Japan)
--------------------------------------------------------------------------*/
	/**
		¹®ÀÚ¿­Áß ÁöÁ¤ÇÑ ¹®ÀÚ¿­À» Ã£¾Æ¼­ »õ·Î¿î ¹®ÀÚ¿­·Î ¹Ù²Ù´Â ÇÔ¼ö
		origianl	´ë»ó ¹®ÀÚ¿­
		oldstr		Ã£À» ¹®ÀÚ¿­
		newstr		¹Ù²Ü ¹®ÀÚ¿­
		return		¹Ù²ï °á°ú
	*/
	public String replace(String original, String oldstr, String newstr)
	{
		String convert = new String();
		int pos = 0;
		int begin = 0;
		pos = original.indexOf(oldstr);

		if(pos == -1)
			return original;

		while(pos != -1)
		{
			convert = convert + original.substring(begin, pos) + newstr;
			begin = pos + oldstr.length();
			pos = original.indexOf(oldstr, begin);
		}
		convert = convert + original.substring(begin);

		return convert;
	}

	/**
		³»¿ëÁß HTML Åö¼ö±âÈ£ÀÎ ¹®ÀÚ¸¦ HTML Æ¯¼ö±âÈ£ Çü½ÄÀ¸·Î º¯È¯ÇÕ´Ï´Ù.
		htmlstr		¹Ù²Ü ´ë»óÀÎ ¹®ÀÚ¿­
		return		¹Ù²ï °á°ú
		PHPÀÇ htmlspecialchars¿Í À¯»çÇÑ °á°ú¸¦ ¹ÝÈ¯ÇÕ´Ï´Ù.
	*/
	public String convertHtmlchars(String htmlstr)
	{
		String convert = new String();
		convert = replace(htmlstr, "&", "&amp;");
		convert = replace(convert, "<", "&lt;");
		convert = replace(convert, ">", "&gt;");
		convert = replace(convert, "\"", "&quot;");
		return convert;
	}


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
    _jspx_dependants = new java.util.ArrayList(4);
    _jspx_dependants.add("/admin/login_check.jsp");
    _jspx_dependants.add("/common/board/board.util.jsp");
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
      out.write("\r\n");
      out.write("\r\n");

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

      out.write('\r');
      out.write('\n');
      out.write('\n');
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

String seqNo = request.getParameter("seqNo");
String adminid ="";
String adminname ="";
String idate ="";
String title ="";
String contents ="";
String attachedFiles = "";
int readCnt = 0;

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql  = "";
String outS = "";

 // read the notice
    sql = " select  str_to_date(date_format(input_date, '%Y/%m/%d'),'%Y/%m/%d'), admin_name, "
        + "         ifnull(read_cnt, 0), title, content "
        + " from    scm_notice_01t "
        + " where   seqno = " + seqNo
        + " and     admin_id = '" + _adminid + "' ";

try {

    Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  stmt = conn.createStatement();
  rs = stmt.executeQuery(sql);
  
   if (rs.next()) {    
    adminname = rs.getString(2);
    idate = rs.getString(1);
    title = rs.getString(4);

    Clob clob   = rs.getClob(5);
    Reader clobStream = clob.getCharacterStream();
    StringBuffer buf = new StringBuffer();
    int    nchars = 0; // Number of characters read
    char[] buffer = new char[10];  //  Buffer holding characters being transferred

    while( (nchars = clobStream.read(buffer)) != -1 ) // Read from Clob
      buf.append(buffer, 0, nchars);        // Write to StringBuffer

    clobStream.close();  // Close the Clob input stream

    contents = buf.toString();
  } 
  
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

      attachedFiles += "<input type='checkbox' name='oldAttachedFile' value='" + fileSeqNo + "/" + attachRealFile + "'>"
                    + "<a href=\"javascript:fnDownload('" + attachFile + "', '" + attachRealFile + "');\">"
                    + attachFile + "</a>";
    }

} catch (Exception e) {
  System.out.println("Exception /admin/notice/edit_form : " + e.getMessage());
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

      out.write("\r\n");
      out.write("<HTML>\r\n");
      out.write("<HEAD>\r\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\r\n");
      out.write("<script language=\"vbscript\" src=\"/common/board/board.vb\"></script>\r\n");
      out.write("<SCRIPT LANGUAGE=\"JavaScript\">\r\n");
      out.write("function List(form)\r\n");
      out.write("{\r\n");
      out.write("\tlocation.href = \"./list.jsp\";\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function fnSave(frm) {\r\n");
      out.write("  frm.title.value = frm.title.value.replace(/\"/g, \"'\");\r\n");
      out.write("\r\n");
      out.write("  if (!jf_ChkValue(frm.title.value)) {\r\n");
      out.write("    alert(\"Enter title.\");\r\n");
      out.write("    frm.title.select();\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("  if(frm.siba != null) {\r\n");
      out.write("    frm.contents.value = frm.siba.MIMEValue;\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("  if (confirm(\"Do you really want to save these data?\")) {\r\n");
      out.write("    frm.action = \"./save.jsp\";\r\n");
      out.write("    frm.submit();\r\n");
      out.write("  }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
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
      out.write("</SCRIPT>\r\n");
      out.write("</HEAD>\r\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\r\n");
      out.write("<table width=\"840\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n");
      out.write("<tr><td>\r\n");
      out.write("\r\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"15\" colspan=\"2\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"3%\"><img src=\"/img/btnFolder.gif\"></td>\r\n");
      out.write("  <td width=\"*\" class=\"left_title\">&nbsp;&nbsp;&nbsp;Edit Notice for Sebin User</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\">No. : <B>");
      out.print(seqNo);
      out.write("</B></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<TABLE WIDTH=700 border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" class=\"table_bg\">\r\n");
      out.write("<FORM NAME=frmMain METHOD=POST enctype=\"multipart/form-data\" >\r\n");
      out.write("<INPUT type =\"HIDDEN\" NAME=seqNo   VALUE=\"");
      out.print(seqNo);
      out.write("\">\r\n");
      out.write("<INPUT type =\"HIDDEN\" NAME=contents   VALUE=\"");
      out.print( convertHtmlchars(contents) );
      out.write("\">\r\n");
      out.write("<TR>\r\n");
      out.write("  <TD width='100' class=\"table_header_center\"><FONT SIZE=2>Sender</TD>\r\n");
      out.write("  <TD width='250' class=\"table_bg_bright\"><FONT SIZE=2>");
      out.print(adminname);
      out.write("</TD>\r\n");
      out.write("  <TD width='100' class=\"table_header_center\"><FONT SIZE=2>Date</TD>\r\n");
      out.write("  <TD width='250' class=\"table_bg_bright\"><FONT SIZE=2>");
      out.print(idate);
      out.write("</TD>\r\n");
      out.write("</TR>\r\n");
      out.write("<TR>\r\n");
      out.write("  <TD ALIGN=CENTER class=\"table_header_center\"><FONT SIZE=2>Title</TD>\r\n");
      out.write("  <TD COLSPAN=3  class=\"table_bg_bright\"><font size=2><input type=\"text\" name=\"title\" value=\"");
      out.print(title);
      out.write("\" size=\"90\" maxlength=100></font></TD>\r\n");
      out.write("</TR>\r\n");

if (seqNo.length() > 0) {

      out.write("\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td class=\"table_header_center\">Attached Files</td>\r\n");
      out.write("    <td colspan=\"5\" class=\"table_bg_bright\">* Tick files you want to delete<br>");
      out.print( attachedFiles );
      out.write("&nbsp;</td>\r\n");
      out.write("  </tr> \r\n");

}

      out.write("\r\n");
      out.write("<TR>\r\n");
      out.write("    <td colspan=4 class=\"table_bg_bright\">\r\n");
      out.write("      <object width=0 height=0 classid=\"clsid:5220cb21-c88d-11cf-b347-00aa00a28331\">\r\n");
      out.write("      <param name=\"LPKPath\" value=\"/common/board/NamoWe_valleygirl.lpk\">\r\n");
      out.write("      </object>\r\n");
      out.write("      <object id=\"siba\" width=700 height=500 classid=\"CLSID:898FD2A4-B75E-11d4-BFF3-0050FC1AFCDD\" codebase=\"/common/board/NamoWe.cab#version=2,1,0,3\">\r\n");
      out.write("      </object>\r\n");
      out.write("    </td>\r\n");
      out.write("</TR>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td class=\"table_header_center\">File Attachment</td>\r\n");
      out.write("  <td colspan=\"5\" class=\"table_bg_bright\"><input type='file' name='attachedFile' size='98' maxlength='300' class='input_text'><br>\r\n");
      out.write("    <input type='file' name='attachedFile' size='98' maxlength='300' class='input_text'><br>\r\n");
      out.write("    <input type='file' name='attachedFile' size='98' maxlength='300' class='input_text'><br>\r\n");
      out.write("    <input type='file' name='attachedFile' size='98' maxlength='300' class='input_text'><br>\r\n");
      out.write("    <input type='file' name='attachedFile' size='98' maxlength='300' class='input_text'></td>\r\n");
      out.write("</tr>\r\n");
      out.write("</TABLE>\r\n");
      out.write("\r\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" align='center'>\r\n");
      out.write("    <INPUT TYPE=BUTTON VALUE=\" Cancel \" ONCLICK=\"List(document.frmMain)\">\r\n");
      out.write("    <INPUT TYPE=\"BUTTON\" VALUE=\" Save \" ONCLICK=\"fnSave(document.frmMain)\">\r\n");
      out.write("  </td>\r\n");
      out.write("</tr>\r\n");
      out.write("</FORM>\r\n");
      out.write("</table>\r\n");
      out.write("<form name=\"form2\" method=\"post\">\r\n");
      out.write("<input type=\"hidden\" name=\"attachPath\" value=\"");
      out.print( _ManagementNoticeUploadUrl );
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"attachFile\">\r\n");
      out.write("<input type=\"hidden\" name=\"attachRealFile\">\r\n");
      out.write("</form>\r\n");
      out.write("</td></tr></table>\r\n");
      out.write("<iframe name=\"hiddenFrm\" src=\"\" width=\"0\" height=\"0\" frameborder=\"0\"></iframe>\r\n");

out.println(CopyRightLogo());

      out.write("\r\n");
      out.write("</td></tr></table>\r\n");
      out.write("</BODY>\r\n");
      out.write("</HTML>\r\n");
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
