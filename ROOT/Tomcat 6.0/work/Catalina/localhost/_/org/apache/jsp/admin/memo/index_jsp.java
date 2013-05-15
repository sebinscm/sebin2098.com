package org.apache.jsp.admin.memo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.*;
import java.sql.*;
import dbconn.*;
import javax.naming.*;
import javax.sql.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      			"../../error.jsp", true, 8192, true);
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

String next_page="index.jsp?";
String prev_page="";
String start_seqno= request.getParameter("seqno");
String ag_title = request.getParameter("title");

if ( start_seqno != null && start_seqno.length() > 0 ) {
     prev_page = "<A href=\"JavaScript:Back()\">Prev</A>";
}
else {
     start_seqno = "99999";
}
if ( ag_title == null ) {
     ag_title = "";
}

dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;
Connection conn = null;
String sql  = "";

String outS =  "";
String curno =  "";
int iRet = 0;
int page_size = 20;

sql = "  SELECT  seqno, adminname, date_format(idate,'%Y/%m/%d') , title  " +
      "  FROM    t_memo_01t " +
      "  WHERE   seqno < " + start_seqno +
      "  AND     dflag = '0' " +
      "  And     (title like '%" + ag_title + "%' OR contents like '%" + ag_title + "%') " +
      "  ORDER BY seqno desc  " +
      "   limit  " + page_size ;
//out.println(sql);

try {
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  String seqno = "";
  String adminname = "";
  String idate = "";
  String title = "";

  int count = 0 ;

  for (count = 0 ; count < iRet; count++) {
    seqno = matrix.getRowData(count).getData(0);
    adminname = matrix.getRowData(count).getData(1);
    idate = matrix.getRowData(count).getData(2);
    title = matrix.getRowData(count).getData(3);

    outS += "<tr class='table_list'>"
          + "  <td align=center>" + seqno + "</td>"
          + "  <td align=center>" + idate + "</td>"
          + "  <td><font color=blue>&nbsp;<a href='view_memo.jsp?seqno=" + seqno + "'>" + title + "</a></font></td>"
          + "</tr>\n";
  }

  if ( count < page_size )
    next_page = "";
  else
    next_page = "<A HREF=\"" + next_page + "seqno=" + seqno + "\">Next</A>";

} catch (Exception e) {
  System.out.println("Exception /admin/memo/index : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}
}

      out.write("\n");
      out.write("<HTML>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<SCRIPT LANGUAGE=\"JavaScript\">\n");
      out.write("function NewMemo()\n");
      out.write("{\n");
      out.write("  window.location.replace(\"memo_form.jsp\");\n");
      out.write("}\n");
      out.write("\n");
      out.write("function Back()\n");
      out.write("{\n");
      out.write("  history.back();\n");
      out.write("}\n");
      out.write("</SCRIPT>\n");
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
      out.write("  <td width=\"*\" class=\"left_title\">Buyer Notice Board</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\"  >\n");
      out.write("<FORM ACTION=\"index.jsp\" METHOD=POST>\n");
      out.write("<tr>\n");
      out.write("\t");

  	   if ( _adminclass.equals("1")) {
     
      out.write("\n");
      out.write("   <td width=\"50%\" ><INPUT TYPE=BUTTON VALUE=\"New\" ONCLICK=\"JavaScript:NewMemo()\"  class=\"button_default\" ></td>\n");
      out.write("        ");

      } 
     
      out.write("\n");
      out.write("  <td width=\"50%\" align=right ><input type=text name=title>\n");
      out.write("    <INPUT TYPE=BUTTON VALUE=\"Search\" ONCLICK=submit() class=\"button_default\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<TABLE border=0 width=99% CELLPADDING=0 CELLSPACING=1 align=center class=\"table_bg\">\n");
      out.write("<TR class=\"table_header_center\">\n");
      out.write("<TD WIDTH=10%>Seqno</TD>\n");
      out.write("<TD WIDTH=10%>Date</TD>\n");
      out.write("<TD WIDTH=*>Title</TD>\n");
      out.write("</TR>\n");
      out.print( outS );
      out.write("\n");
      out.write("<TR>\n");
      out.write("<TD colspan=3 align=right class='table_bg_bright' ><font size=2>");
      out.print(prev_page);
      out.write("&nbsp;");
      out.print(next_page);
      out.write("</font></TD>\n");
      out.write("</TR>\n");
      out.write("</TABLE>\n");
      out.write("<BR>\n");

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
