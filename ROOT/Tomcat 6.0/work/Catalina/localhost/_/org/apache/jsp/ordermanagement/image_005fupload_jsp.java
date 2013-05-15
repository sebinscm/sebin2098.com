package org.apache.jsp.ordermanagement;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import dbconn.*;

public final class image_005fupload_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=euc-kr");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"/error.jsp", true, 8192, true);
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("<HTML>\r\n");
      out.write("<HEAD>\r\n");
      out.write("<title>Sample Image Registration</title>\r\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<SCRIPT LANGUAGE=JavaScript>\t\r\n");
      out.write("function formCheck() {\r\n");
      out.write("\r\n");
      out.write("        \r\n");
      out.write("  fnImg_Check(filename); //첨부 파일 크기, 확장자 확인.....\r\n");
      out.write(" }\r\n");
      out.write(" \r\n");
      out.write("   \r\n");
      out.write(" function getFileExtension(filePath){  // 파일의 확장자를 가져옮\r\n");
      out.write("     var lastIndex = -1;\r\n");
      out.write("     lastIndex  = filePath.lastIndexOf('.');\r\n");
      out.write("     var extension = \"\";\r\n");
      out.write("\r\n");
      out.write("   if(lastIndex != -1)\r\n");
      out.write("   {\r\n");
      out.write("     extension = filePath.substring( lastIndex+1, filePath.len );\r\n");
      out.write("   }\r\n");
      out.write("   else\r\n");
      out.write("   {\r\n");
      out.write("     extension = \"\";\r\n");
      out.write("   }\r\n");
      out.write("     return extension;\r\n");
      out.write(" }\r\n");
      out.write("\r\n");
      out.write(" function fnImg_Check(value){   // 파일 확장자 체크하기.\r\n");
      out.write("     var src = getFileExtension(value);\r\n");
      out.write("\r\n");
      out.write("   if(!((src.toLowerCase() == \"jpg\")))\r\n");
      out.write("   {\r\n");
      out.write("         alert('Please attach JPG image only.');\r\n");
      out.write("         return;\r\n");
      out.write("     }     \r\n");
      out.write("     LoadImg(value);\r\n");
      out.write("     img_Load();\r\n");
      out.write(" }\r\n");
      out.write("\r\n");
      out.write(" function LoadImg(value){\r\n");
      out.write("     var imgInfo = new Image();\r\n");
      out.write("     imgInfo.onload = img_Load;\r\n");
      out.write("     imgInfo.src = value;\r\n");
      out.write(" }\r\n");
      out.write("\r\n");
      out.write(" function img_Load(){\r\n");
      out.write("  var frm = document.frm;\r\n");
      out.write("     var imgWidth, imgHeight, imgFileSize;\r\n");
      out.write("     var maxFileSize = 50000;  // 이미지사이즈 제한(500kb)\r\n");
      out.write("\r\n");
      out.write("     imgWidth  = this.width;\r\n");
      out.write("     imgHeight  = this.height;\r\n");
      out.write("     imgFileSize  = Math.round(this.fileSize/1024);\r\n");
      out.write("\r\n");
      out.write("  if(imgFileSize > maxFileSize)\r\n");
      out.write("  {\r\n");
      out.write("        alert('Please select the image less than 500KB.');\r\n");
      out.write("        return;\r\n");
      out.write("    } \r\n");
      out.write("   if (confirm('Do you want to upload this image?')) {\r\n");
      out.write("   \t   frm.action = 'send_photo.jsp';\r\n");
      out.write("      frm.submit();\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write(" }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("function fnSubmit()\r\n");
      out.write("{\r\n");
      out.write("\tif (!document.frm.file_name1.value ) {\r\n");
      out.write("\t  alert('Enter image file name!');\r\n");
      out.write("\t  document.frm.file_name1.focus();\r\n");
      out.write("\t  return;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tif (confirm('Do you want to upload this image?')) {\r\n");
      out.write("\t  document.frm.submit();\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("</SCRIPT>\r\n");
      out.write("</HEAD>\r\n");
      out.write("<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>\t\r\n");
      out.write("<table width='99%' border='0' cellspacing='0' cellpadding='0' align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td height='15' colspan='2'></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width='3%'><img src='/img/image_upload.jpg'></td>\r\n");
      out.write("  <td width='*' class='left_title'>Buyer Sample Image Registration</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width='100%' height='2' colspan='2'><hr width='100%'></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td height='10' colspan='2'></td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<font color=red> * Sample image file name must be match with Style number on PO.<br>\r\n");
      out.write("* File format must be \"style number.jpg\"<br>\r\n");
      out.write("* Do not put space within image file name.</font> <p>\r\n");
      out.write("*\tRecommended image size shall be 208(width)x 320(height). It may display incorrectly or currupted if the image size is too large. \r\n");
      out.write("   \r\n");
      out.write("<FORM NAME=\"frm\" ACTION=\"send_photo.jsp\" METHOD=POST enctype=\"multipart/form-data\">\r\n");
      out.write("<table width=\"600\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" class=\"table_bg\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td class=\"table_header_center\">Image File</td>\r\n");
      out.write("  <td class=\"table_header\"><input type=\"file\" name= \"file_name1\"  size=\"60\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td class=\"table_header_center\">Sample Image<br><img src=\"/images/image_sample.jpg\" border=\"0\"></td>\r\n");
      out.write("  <td class=\"table_header_center\"><INPUT TYPE=BUTTON VALUE=Submit onClick=\"fnImg_Check(frm.file_name1.value);\">&nbsp;&nbsp;&nbsp;<INPUT TYPE=reset VALUE=Cancel></td>\r\n");
      out.write("</tr>    \r\n");
      out.write("</FORM>\r\n");
      out.write("</table>\r\n");

out.println(CopyRightLogo());

      out.write("\r\n");
      out.write("</BODY>\r\n");
      out.write("</HTML>");
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
