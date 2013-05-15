package org.apache.jsp.admin.buyer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class style_005fimage_005fupload_005fform_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/admin/login_check.jsp");
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"/error.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\n');

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
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title></title>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script language=javascript src=\"/common/js/util.js\"></script>\n");
      out.write("<script language=\"javascript\">\n");
      out.write("function fnUpload(frm) {\n");
      out.write("  var isEntered = false;\n");
      out.write("  \n");
      out.write("  for (var i = 1; i <= 10; i++) {\n");
      out.write("    if (jf_ChkValue(frm['file'+i].value)) {\n");
      out.write("      isEntered = true;\n");
      out.write("      break;\n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (!isEntered) {\n");
      out.write("    alert(\"Input image file name.\\nThe extension of the file name must be 'jpg'.\");\n");
      out.write("    frm.file1.focus();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  // check extension of file names\n");
      out.write("  for (var i = 1; i <= 10; i++) {\n");
      out.write("    if (jf_ChkValue(frm['file'+i].value)) {\n");
      out.write("      var ext = frm['file'+i].value.substr(frm['file'+i].value.lastIndexOf(\".\")+1);\n");
      out.write("\n");
      out.write("      if (ext != \"jpg\" && ext != \"JPG\") {\n");
      out.write("        alert(\"The extension of the file name must be 'jpg' or 'JPG'.\");\n");
      out.write("        frm['file'+i].select();\n");
      out.write("        return;\n");
      out.write("      }\n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (confirm('Do you want to upload these files?')) {\n");
      out.write("    frm.action = './style_image_upload_save.jsp';\n");
      out.write("    frm.submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>\n");
      out.write("<table width='840' border='0' cellspacing='0' cellpadding='0'><tr><td>\n");
      out.write("\n");
      out.write("<table width='99%' border='0' cellspacing='0' cellpadding='0' align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td height='15' colspan='2'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width='3%'><img src='/img/image_upload.jpg'></td>\n");
      out.write("  <td width='*' class='left_title'>Sample Image Upload</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width='100%' height='2' colspan='2'><hr width='100%'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td height='10' colspan='2'></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("** You can upload max 10 images at once. Image file name must be 'Sample#.jpg' format.\n");
      out.write("<table width='80%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\n");
      out.write("<form name='form1' method='post' enctype='multipart/form-data'>\n");

for (int i = 1; i <= 10; i++) {

      out.write("\n");
      out.write("<tr>\n");
      out.write("  <td width='20%' class='table_header_center'>File");
      out.print( i );
      out.write("</td>\n");
      out.write("  <td width='80%' class='table_bg_bright'><input type='file' name='file");
      out.print( i );
      out.write("' size='70'></td>\n");
      out.write("</tr>\n");

}

      out.write("\n");
      out.write("</table>\n");
      out.write("<table width='80%' border='0' cellspacing='0' cellpadding='0' align='center'>\n");
      out.write("<tr>\n");
      out.write("  <td height='15'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td align='center'>\n");
      out.write("    <input type='reset' value='Reset'>\n");
      out.write("    <input type='button' value='Upload' onclick='fnUpload(this.form);'>\n");
      out.write("  </td>\n");
      out.write("</tr>\n");
      out.write("</form>\n");
      out.write("</table>\n");

out.println(CopyRightLogo());

      out.write("\n");
      out.write("</tr></td></table>\n");
      out.write("</body>\n");
      out.write("</html>");
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
