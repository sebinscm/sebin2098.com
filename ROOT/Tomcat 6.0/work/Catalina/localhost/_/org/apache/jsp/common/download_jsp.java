package org.apache.jsp.common;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import common.*;

public final class download_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

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
      out.write("<!--%@ include file=\"/login_check.jsp\" %-->\n");

//response.resetBuffer();
//response.reset();
request.setCharacterEncoding("euc-kr"); 
response.resetBuffer();
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
String attachPath = request.getParameter("attachPath");
String attachFile = request.getParameter("attachFile");
String attachRealFile = request.getParameter("attachRealFile");

try {

  String savePath = application.getRealPath(attachPath) + File.separator;
  File file = new File(savePath + attachRealFile);

  if (!file.exists()) {
    throw new UserDefinedException("File does not exist.");
  }

  // file read ..
  //response.setContentType("application/octet-stream");
  //response.setHeader("Content-Length", "" + file.length());
  //response.setHeader("Content-Disposition", "attachment; filename=" + attachFile + ";");
  // file read ..
  response.reset();
  response.setContentType("application/octet-stream");
  //response.setContentType("application/pdf");
  response.setHeader("Content-Length", "" + file.length());
  response.setHeader("Content-Disposition", "attachment; filename=" + attachFile + ";");
  //response.setHeader("Content-Disposition", "inline; filename=" + attachFile + ";");

  byte[] buf = new byte[8192];

  int cnt = 0;

  BufferedInputStream inStream = new BufferedInputStream(new FileInputStream(file));
  BufferedOutputStream outStream = new BufferedOutputStream(response.getOutputStream());

  try {
    while ((cnt = inStream.read(buf)) != -1) {
        outStream.write(buf, 0, cnt);
    }

    outStream.flush();
  } catch (Exception e) {
    throw e;
  } finally {
    if (outStream != null) outStream.close();
    if (inStream != null) inStream.close();
  }

} catch (Exception e) {
  out.println("<html><script language='javascript'>alert('" + e.getMessage() + "');</script></html>");
}

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
