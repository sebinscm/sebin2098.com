package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import javax.naming.*;
import javax.sql.*;
import dbconn.*;
import java.util.ArrayList;

public final class menu_005fbot_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/login_check.jsp");
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
      			"error.jsp", true, 8192, true);
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

String main_window = "memo/";
String menuhtml = "menu.jsp";


Connection conn = null;
dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;
int iRet = 0;

try {

  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();

  String sql = " select seqno from s_memo_03t " +
               "  where comid = '" + scmid + "' " +
               "    and dflag = '0' " +
               "    and decode(sign(IDATE + 100 - sysdate),-1,0,1) = 1 " +
               "  minus " +
               " select seqno from s_memo_02t " +
               "  where staffid = '" + scmid + "' " +
               "    and decode(sign(RDATE + 100 - sysdate),-1,0,1) = 1 " ;

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

/*
  if( iRet <  1 ) {
    if (scmid.equals("3")) {
       main_window = "memo/";
    } else {
       main_window = "memo/";
    }
  } else {
    if (scmid.equals("3")) {
      main_window = "memo/";
      menuhtml = "menu.jsp";
    } else {
      main_window = "memo/";
      menuhtml = "menu_error.jsp";
    }
  }


  if (iRet > 0) {
    if (!usertype.equals("A")) {
      menuhtml = "menu_error.jsp";
    }
  }
 */
} catch (Exception e) {
  System.out.println("Exception menu_bot : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close(); }
}

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title></title>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<frameset cols=\"190,*\" frameborder=\"0\" border=\"0\" framespacing=\"0\">\n");
      out.write("  <frame src=\"");
      out.print( menuhtml );
      out.write("\" name=\"menu\" scrolling=\"auto\" noresize>\n");
      out.write("  <frame src=\"");
      out.print( main_window );
      out.write("\" name=\"main\">\n");
      out.write("</frameset>\n");
      out.write("<noframes>\n");
      out.write("<body></body>\n");
      out.write("</noframes>\n");
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
