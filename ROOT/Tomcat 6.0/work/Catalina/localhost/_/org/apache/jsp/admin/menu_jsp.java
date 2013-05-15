package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import dbconn.*;
import javax.naming.*;
import javax.sql.*;

public final class menu_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/admin/login_check.jsp");
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

      out.write("\n");
      out.write(" \n");
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

      out.write(' ');
      out.write('\n');
      out.write('\n');

String menus = "";

int iRet = 0;
Connection conn = null;
dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;
String sql = "";

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
  // Read Menu List
  sql = " SELECT  M.PARENT_NO, M.MENUNAME, M.MENUURL, IFNULL(MC.CHILD_CNT, 0) "
      + " FROM    ( "
      + "           SELECT SEQNO, PARENT_NO, MENUNAME, MENUURL, SORT_NO "
      + "           FROM   MENU_T "
      + "           WHERE  MENU_TYPE = '" + _admintype + "' "
      + "           AND    USER_GROUP = '" + _admingroup + "' "
      + "           ORDER BY SORT_NO "
      + "         ) M LEFT OUTER JOIN "
      + "         ( "
      + "           SELECT M1.SEQNO, COUNT(M2.SEQNO) CHILD_CNT "
      + "           FROM   MENU_T M1  LEFT OUTER JOIN MENU_T M2 ON ( M1.SEQNO = M2.PARENT_NO AND M1.PARENT_NO = 1)  "
      + "           WHERE  M1.MENU_TYPE = '" + _admintype + "' "
      + "           AND    M1.USER_GROUP = '" + _admingroup + "' "
      + "           GROUP BY M1.SEQNO "
      + "         ) MC ON (  M.SEQNO = MC.SEQNO) "
      + " ORDER BY M.SORT_NO ";
 // out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  for (int i = 0; i < iRet; i++) {
    int j = 0;

    String parentNo   = matrix.getRowData(i).getData(j++);
    String menuName   = matrix.getRowData(i).getData(j++);
    String menuUrl    = matrix.getRowData(i).getData(j++);
    int childCnt      = Integer.parseInt(matrix.getRowData(i).getData(j++));

    if (parentNo.equals("1")) {

      // Parent Menu��寃쎌�
      if (childCnt > 0) {
        menus += "aux1 = insFolder(rootTree, genFolder(\"" + menuName + "\", \"" + menuUrl + "\"));\n";
      } else {
        menus += "insItem(rootTree, genItemIcon(\"write.gif\", \"" + menuName + "\", \"" + menuUrl + "\"));\n";
      }

    } else {
       
      // Child Menu      
      menus += "insItem(aux1, genItemIcon(\"write.gif\", \"" + menuName + "\", \"" + menuUrl + "\"));\n";

    }

  }
  /////////////////////////////////////////////////////////////////////////

} catch (Exception e) {
  System.out.println("Exception menu : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}}

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title></title>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\t\n");
      out.write("<style type=\"text/css\">\n");
      out.write("a:link {text-decoration: none ; color: #020468;}\n");
      out.write("a:visited {text-decoration: none ; color: #666666;}\n");
      out.write("a:active {text-decoration: underline ; color: #0770FF;}\n");
      out.write("a:hover {text-decoration: underline ; color: #0770FF;}\n");
      out.write("</style>\n");
      out.write("<script language=javascript src=\"/common/js/admin_tree_win.js\"></script>\n");
      out.write("<script language=\"javascript\">\n");
      out.write("function LoadLeave()\n");
      out.write("{\n");
      out.write("    clearTimeout(Time_ID);\n");
      out.write("    location.href = \"./menu.jsp\";\n");
      out.write("}\n");
      out.write("function delay()\n");
      out.write("{\n");
      out.write("    Time_ID = setTimeout(\"LoadLeave()\",( 10 * 60 * 1000 ));\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("<body leftmargin=\"2\" topmargin=\"10\" marginwidth=\"0\" marginheight=\"0\"  onload=\"delay()\">\n");
      out.write("<!--body leftmargin=\"2\" topmargin=\"10\" marginwidth=\"0\" marginheight=\"0\" background=\"/img/bgimage2.gif\" onload=\"delay()\"-->\n");
      out.write("<script language=javascript>\n");
      out.write("rootTree = genFolderRoot(\"<img src='/img/tree_base.gif' border='0'> <b>HOME</b>\", ");
      out.print( _admingroup.equals("Z") ? "'/order/admin_po_status.jsp'" : "'/admin/notice/list.jsp'" );
      out.write(')');
      out.write(';');
      out.write('\n');
      out.print( menus );
      out.write("\n");
      out.write("initializeDocument(rootTree);\n");
      out.write("</script>\n");
      out.write("<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td align=\"center\" height=\"10\"></td>\n");
      out.write("</tr>\n");
      out.write("\n");
      out.write("<tr>\n");
      out.write("  <td align=\"center\"><a href=\"http://www.sebin2098.com/admin\" target=\"_blank\"><img src=\"/img/sebin_mid.jpg\"></a></td>\n");
      out.write("  </tr>\n");
      out.write("<!--tr>\n");
      out.write("   <td align=\"center\"><a href=\"http://get.adobe.com/reader/\" target=\"_blank\"><img src=\"/img/adobe_reader.png\"></a></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td align=\"center\" class=\"font_small\"><font color=\"#0770FF\" siz=2>Get Adobe Reader</font></td>\n");
      out.write("\n");
      out.write("</tr-->\n");
      out.write("\n");
      out.write("</table>\n");
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
