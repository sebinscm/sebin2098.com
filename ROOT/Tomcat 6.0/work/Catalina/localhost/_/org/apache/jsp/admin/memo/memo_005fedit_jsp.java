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

public final class memo_005fedit_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_dependants = new java.util.ArrayList(3);
    _jspx_dependants.add("/admin/login_check.jsp");
    _jspx_dependants.add("/common/board/board.util.jsp");
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
      out.write('\n');
      out.write('\n');
      out.write('\n');
      out.write('\n');
      out.write('\n');

String seqno = request.getParameter("seqno");
String adminid ="";
String adminname ="";
String idate ="";
String title ="";
String contents ="";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql  = "";
String outS = "";

sql = "SELECT adminid, adminname, str_to_date(date_format(idate,'%Y/%m/%d'),'%Y/%m/%d'), title, contents " +
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

} catch (Exception e) {
  System.out.println("Exception /admin/memo/memo_edit : " + e.getMessage());
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
      out.write("<script language=\"vbscript\" src=\"/common/board/board.vb\"></script>\n");
      out.write("<SCRIPT LANGUAGE=\"JavaScript\">\n");
      out.write("function List(form)\n");
      out.write("{\n");
      out.write("\tlocation.href = 'index.jsp';\n");
      out.write("}\n");
      out.write("\n");
      out.write("function Delete( form )\n");
      out.write("{\n");
      out.write("    result = confirm(\"Are you sure?\");\n");
      out.write("    if( result == true )\n");
      out.write("\t{\n");
      out.write("            form.action = \"memo_delete.jsp\";\n");
      out.write("            form.submit();\n");
      out.write("    }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function Update(form)\n");
      out.write("{\n");
      out.write("  if(form.siba != null) {\n");
      out.write("    form.contents.value = form.siba.MIMEValue;\n");
      out.write("  }\n");
      out.write("  \n");
      out.write("\tform.action = \"memo_update.jsp\";\n");
      out.write("\tform.submit();\n");
      out.write("}\n");
      out.write("</SCRIPT>\n");
      out.write("</HEAD>\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\n");
      out.write("<table width=\"840\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr><td>\n");
      out.write("\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"3%\"><img src=\"/img/icon_ann.jpg\"></td>\n");
      out.write("  <td width=\"*\" class=\"left_title\"> Edit Buyer Notice</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\">No. : <B>");
      out.print(seqno);
      out.write("</B></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<TABLE WIDTH=700 border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" class=\"table_bg\">\n");
      out.write("<FORM NAME=frmMain METHOD=POST action = \"memo_update.jsp\">\n");
      out.write("<INPUT type =\"HIDDEN\" NAME=seqno   VALUE=\"");
      out.print(seqno);
      out.write("\">\n");
      out.write("<INPUT type =\"HIDDEN\" NAME=contents   VALUE=\"");
      out.print( convertHtmlchars(contents) );
      out.write("\">\n");
      out.write("<TR>\n");
      out.write("  <TD width='100' class=\"table_header_center\"><FONT SIZE=2>Sender</TD>\n");
      out.write("  <TD width='250' class=\"table_bg_bright\"><FONT SIZE=2>");
      out.print(adminname);
      out.write("</TD>\n");
      out.write("  <TD width='100' class=\"table_header_center\"><FONT SIZE=2>Date</TD>\n");
      out.write("  <TD width='250' class=\"table_bg_bright\"><FONT SIZE=2>");
      out.print(idate);
      out.write("</TD>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("  <TD ALIGN=CENTER class=\"table_header_center\"><FONT SIZE=2>Title</TD>\n");
      out.write("  <TD COLSPAN=3  class=\"table_bg_bright\"><font size=2><input type=\"text\" name=\"title\" value=\"");
      out.print(title);
      out.write("\" size=\"90\" maxlength=100></font></TD>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("    <td colspan=4 class=\"table_bg_bright\">\n");
      out.write("      <object width=0 height=0 classid=\"clsid:5220cb21-c88d-11cf-b347-00aa00a28331\">\n");
      out.write("      <param name=\"LPKPath\" value=\"/common/board/NamoWe_valleygirl.lpk\">\n");
      out.write("      </object>\n");
      out.write("      <object id=\"siba\" width=700 height=500 classid=\"CLSID:898FD2A4-B75E-11d4-BFF3-0050FC1AFCDD\" codebase=\"/common/board/NamoWe.cab#version=2,1,0,3\">\n");
      out.write("      </object>\n");
      out.write("    </td>\n");
      out.write("</TR>\n");
      out.write("</TABLE>\n");
      out.write("\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" align='center'>\n");
      out.write("    <INPUT TYPE=BUTTON VALUE=\" LIST \" ONCLICK=\"List(document.frmMain)\">\n");
      out.write("    <INPUT TYPE=BUTTON VALUE=\"DELETE\" ONCLICK=\"Delete(document.frmMain)\">\n");
      out.write("    <INPUT TYPE=\"BUTTON\" VALUE=\"UPDATE\" ONCLICK=\"Update(document.frmMain)\">\n");
      out.write("  </td>\n");
      out.write("</tr>\n");
      out.write("</FORM>\n");
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
