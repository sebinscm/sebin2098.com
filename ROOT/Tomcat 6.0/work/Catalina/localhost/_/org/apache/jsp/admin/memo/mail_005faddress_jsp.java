package org.apache.jsp.admin.memo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import dbconn.*;

public final class mail_005faddress_jsp extends org.apache.jasper.runtime.HttpJspBase
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

int iRet = 0;
int iCnt = 0;
String outS = "";
String sql = "";
Connection conn = null;
dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  // Read supplier list
  sql = " select  upper(name), id,supplier_class "
      + " from    login_01t "
      + " where   IFNULL(delete_yn, 'N') = 'N' "
      + " order by upper(name) ";

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

} catch (Exception e) {
  System.out.println("Exception /admin/memo/mail_address : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}	
}

if (iRet > 0) {
  for (int i = 0; i < iRet; i++) {
    int j = 0;
    String name       = matrix.getRowData(i).getData(j++);
    String id         = matrix.getRowData(i).getData(j++);
    String userGroup  = matrix.getRowData(i).getData(j++);
  
    if (iCnt++ == 0) {
      outS += "<tr class='table_list'>";
    }
    
    outS += "<td><input type='checkbox' name='" + userGroup + "' value=\"" + id + "^" + name + "\"></td>"
          + "<td>" + name + "</td>";
  
    if (iCnt == 2) {
      outS += "</tr>\n";
      iCnt = 0;
    }
  }

  for (int i = iCnt; i < 2; i++) {
    outS += "<td></td><td></td>";
  }

  outS += "</tr>";
}

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title></title>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script language=\"javascript\">\n");
      out.write("function fnSet(obj) {\n");
      out.write("  var objCollection;\n");
      out.write("  \n");
      out.write("  if (obj.value == '') {\n");
      out.write("    objCollection = obj.form.elements;\n");
      out.write("  } else {\n");
      out.write("    objCollection = obj.form[obj.value];\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (objCollection) {\n");
      out.write("    if (objCollection.length) {\n");
      out.write("      for (var i = 0; i < objCollection.length; i++) {\n");
      out.write("        if (objCollection[i].type == 'checkbox' && objCollection[i].name != '_check') {\n");
      out.write("          objCollection[i].checked = obj.checked;\n");
      out.write("        }\n");
      out.write("      }\n");
      out.write("    } else {\n");
      out.write("      if (objCollection.type == 'checkbox') {\n");
      out.write("        objCollection.checked = obj.checked;\n");
      out.write("      }\n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnSend(frm) {\n");
      out.write("  var ids = \"\";\n");
      out.write("  var obj = frm.elements;\n");
      out.write("\n");
      out.write("  for (var i = 0; i < obj.length; i++) {\n");
      out.write("    if (obj[i].type == 'checkbox' && obj[i].checked && obj[i].name != '_check') {\n");
      out.write("      ids += obj[i].value + \";\";\n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (ids == \"\") {\n");
      out.write("    alert(\"At least a receiver required.\");\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  opener.document.frmMain.receiver.value = ids;\n");
      out.write("  top.close();\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>\n");
      out.write("<table width='99%' border='0' cellspacing='0' cellpadding='0' align='center'>\n");
      out.write("<tr>\n");
      out.write("  <td height='5'></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<table width='99%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\n");
      out.write("<form name='form1' method='post'>\n");
      out.write("<tr>\n");
      out.write("  <td class='table_header_center'></td>\n");
      out.write("  <td class='table_header_center'>Buyer</td>\n");
      out.write("  <td class='table_header_center'></td>\n");
      out.write("  <td class='table_header_center'>Buyer</td>\n");
      out.write("  <td class='table_header_center'></td>\n");
      out.write("</tr>\n");
      out.print( outS );
      out.write("\n");
      out.write("</table>\n");
      out.write("<table width='99%' border='0' cellspacing='0' cellpadding='0' align='center'>\n");
      out.write("<tr>\n");
      out.write("  <td height='15'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td align='center'>    \n");
      out.write("    <input type='checkbox' name='_check' value='' onclick='fnSet(this);'>Select All\n");
      out.write("    <br>\n");
      out.write("    <input type='button' value='OK' onclick='fnSend(this.form);'>\n");
      out.write("    <input type='reset' value='Reset'>\n");
      out.write("    <input type='button' value='Cancel' onclick='top.close();'>\n");
      out.write("  </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td height='5'></td>\n");
      out.write("</tr>\n");
      out.write("</form>\n");
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
