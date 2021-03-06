/*
 * JSP generated by Resin-3.1.9 (built Mon, 13 Apr 2009 11:09:12 PDT)
 */

package _jsp._account;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import java.sql.*;
import common.util.*;
import dbconn.*;

public class _sub_0list__jsp extends com.caucho.jsp.JavaPage
{
  private static final java.util.HashMap<String,java.lang.reflect.Method> _jsp_functionMap = new java.util.HashMap<String,java.lang.reflect.Method>();
  private boolean _caucho_isDead;


  //-------------------------------------------
  // CopyRightLogo
  //
  //-------------------------------------------
  String CopyRightLogo()
  {
    String str;
    str = "<table width='99%' border='0' cellspacing='0' cellpadding='0' align='center'>";
    str += "<tr><td width='100%' height='2' align='center'>";
    str += "<HR width=100% size=2></td></tr>";
    str += "<tr><td width='100%' align='center'>";
    str += "&copy;Copyright 2007 ";
    str += "<FONT color=green>Fast Future Brands Pty Ltd.</FONT> All Rights Reserved.<BR>";
    str += "Contact <FONT color=blue><A href='mailto:scm@ffb.net.au'>scm@ffb.net.au</A></FONT>";
    str += " for more information.";
    str += "</td></tr></table>";

    return (String)str;
  }

  
  public void
  _jspService(javax.servlet.http.HttpServletRequest request,
              javax.servlet.http.HttpServletResponse response)
    throws java.io.IOException, javax.servlet.ServletException
  {
    javax.servlet.http.HttpSession session = request.getSession(true);
    com.caucho.server.webapp.WebApp _jsp_application = _caucho_getApplication();
    javax.servlet.ServletContext application = _jsp_application;
    com.caucho.jsp.PageContextImpl pageContext = _jsp_application.getJspApplicationContext().allocatePageContext(this, _jsp_application, request, response, "/error.jsp", session, 8192, true, false);
    javax.servlet.jsp.PageContext _jsp_parentContext = pageContext;
    javax.servlet.jsp.JspWriter out = pageContext.getOut();
    final javax.el.ELContext _jsp_env = pageContext.getELContext();
    javax.servlet.ServletConfig config = getServletConfig();
    javax.servlet.Servlet page = this;
    response.setContentType("text/html");
    try {
      out.write(_jsp_string0, 0, _jsp_string0.length);
      
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0);
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1

String _apessid = "";
String _apessname = "";
String usertype = "";
String usergroup = "";
String scmid = "";
String scmnm = "";
String scmsubids = "";
String _adminid = "";
String _adminname = "";

try {
  _apessid = (String) session.getAttribute("apessid");
  _adminid = (String) session.getAttribute("adminid");

  if( (_apessid == null || _apessid.length() == 0 || _apessid.equals("null"))
      && (_adminid == null || _adminid.length() == 0 || _adminid.equals("null")) ) {
    response.sendRedirect("/apess/login_first.html");
    return;
  }

  _apessname = (String) session.getAttribute("apessname");
  _adminname = (String) session.getAttribute("adminname");

  usertype = (String) session.getAttribute("usertype");
  if (usertype == null) usertype = "";

  usergroup = (String) session.getAttribute("usergroup");
  if (usergroup == null) usergroup = "";

  scmid = (String) session.getAttribute("scmid");
  scmnm = (String) session.getAttribute("scmnm");
  scmsubids = (String) session.getAttribute("scmsubids");

} catch( Exception e ) {
  response.sendRedirect("/apess/login_first.html");
  return;
}

      out.write(_jsp_string1, 0, _jsp_string1.length);
      
int iRet = 0;
String strSep = "|!^";
String outS = "";
String sql = "";
dbconn.DBConnManager dbPool = null;
Connection conn = null;
dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;

String searchId = request.getParameter("searchId");
if (searchId == null) searchId = "";

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  dbPool = dbconn.DBConnManager.getInstance();
  conn = dbPool.getConnection("intranet");

  // Sub Supplier List
  sql = " select  a.id, nvl(b.name, a.id), a.subid, nvl(c.name, a.subid) "
      + " from    login_02t a, login_01t b, login_01t c "
      + " where   (a.id = nvl('" + searchId + "', a.id) or a.subid = nvl('" + searchId + "', a.subid)) "
      + " and     a.id = b.id(+) "
      + " and     a.subid = c.id(+) "
      + " order by a.id, a.subid ";

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

} catch (Exception e) {
  System.out.println("Exception /account/sub_list : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) { dbPool.freeConnection("intranet", conn); }
}

for (int i = 0; i < iRet; i++) {
  int j = 0;

  String id         = matrix.getRowData(i).getData(j++);
  String idName     = matrix.getRowData(i).getData(j++);
  String subid      = matrix.getRowData(i).getData(j++);
  String subidName  = matrix.getRowData(i).getData(j++);

  String bgColor = "#fffff0";
  if (i%2 > 0) bgColor = "#eeeee0";

  String strLink = "<a href=\"javascript:fnSetData('" + id + strSep + subid + "')\">" + subid + "</a>";

  outS += "<tr align='center' style='background-color:" + bgColor + ";'>"
        + " <td>" + id + "</td>"
        + " <td align='left'>" + idName + "</td>"
        + " <td>" + strLink + "</td>"
        + " <td align='left'>" + subidName + "</td>"
        + "</tr>";
}

      out.write(_jsp_string2, 0, _jsp_string2.length);
      out.print(( strSep ));
      out.write(_jsp_string3, 0, _jsp_string3.length);
      out.print(( searchId ));
      out.write(_jsp_string4, 0, _jsp_string4.length);
      out.print(( searchId ));
      out.write(_jsp_string5, 0, _jsp_string5.length);
      out.print(( outS ));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      
out.println(CopyRightLogo());

      out.write(_jsp_string7, 0, _jsp_string7.length);
    } catch (java.lang.Throwable _jsp_e) {
      pageContext.handlePageException(_jsp_e);
    } finally {
      _jsp_application.getJspApplicationContext().freePageContext(pageContext);
    }
  }

  private java.util.ArrayList _caucho_depends = new java.util.ArrayList();

  public java.util.ArrayList _caucho_getDependList()
  {
    return _caucho_depends;
  }

  public void _caucho_addDepend(com.caucho.vfs.PersistentDependency depend)
  {
    super._caucho_addDepend(depend);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
  }

  public boolean _caucho_isModified()
  {
    if (_caucho_isDead)
      return true;
    if (com.caucho.server.util.CauchoSystem.getVersionId() != 5783496155892875126L)
      return true;
    for (int i = _caucho_depends.size() - 1; i >= 0; i--) {
      com.caucho.vfs.Dependency depend;
      depend = (com.caucho.vfs.Dependency) _caucho_depends.get(i);
      if (depend.isModified())
        return true;
    }
    return false;
  }

  public long _caucho_lastModified()
  {
    return 0;
  }

  public java.util.HashMap<String,java.lang.reflect.Method> _caucho_getFunctionMap()
  {
    return _jsp_functionMap;
  }

  public void init(ServletConfig config)
    throws ServletException
  {
    com.caucho.server.webapp.WebApp webApp
      = (com.caucho.server.webapp.WebApp) config.getServletContext();
    super.init(config);
    com.caucho.jsp.TaglibManager manager = webApp.getJspApplicationContext().getTaglibManager();
    com.caucho.jsp.PageContextImpl pageContext = new com.caucho.jsp.PageContextImpl(webApp, this);
  }

  public void destroy()
  {
      _caucho_isDead = true;
      super.destroy();
  }

  public void init(com.caucho.vfs.Path appDir)
    throws javax.servlet.ServletException
  {
    com.caucho.vfs.Path resinHome = com.caucho.server.util.CauchoSystem.getResinHome();
    com.caucho.vfs.MergePath mergePath = new com.caucho.vfs.MergePath();
    mergePath.addMergePath(appDir);
    mergePath.addMergePath(resinHome);
    com.caucho.loader.DynamicClassLoader loader;
    loader = (com.caucho.loader.DynamicClassLoader) getClass().getClassLoader();
    String resourcePath = loader.getResourcePathSpecificFirst();
    mergePath.addClassPath(resourcePath);
    com.caucho.vfs.Depend depend;
    depend = new com.caucho.vfs.Depend(appDir.lookup("account/sub_list.jsp"), -8807609479420932477L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("apess/login_check.jsp"), 8233910267322158578L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("bottom_line.jsp"), -738727881222331677L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
  }

  private final static char []_jsp_string2;
  private final static char []_jsp_string0;
  private final static char []_jsp_string3;
  private final static char []_jsp_string1;
  private final static char []_jsp_string7;
  private final static char []_jsp_string6;
  private final static char []_jsp_string4;
  private final static char []_jsp_string5;
  static {
    _jsp_string2 = "\n<html>\n<head>\n<title></title>\n<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n<script language=javascript src=\"/common/js/util.js\"></script>\n<script language=\"javascript\">\nfunction fnSearch(frm) {\n  frm.action = './sub_list.jsp';\n  frm.submit();\n}\n\nfunction fnNew(frm) {\n  frm.reset();\n  frm.id.focus();\n}\n\nfunction fnSave(frm) {\n  if (!jf_IsNumeric(frm.id.value)) {\n    alert('Input Supplier ID. Numbers are only accepted.');\n    frm.id.select();\n    return;\n  }\n\n  if (!jf_IsNumeric(frm.subid.value)) {\n    alert('Input Sub-Supplier ID. Numbers are only accepted.');\n    frm.subid.select();\n    return;\n  }\n\n  if (confirm('Do you really want to save these data?')) {\n    frm.action = './sub_save.jsp';\n    frm.submit();\n  }\n}\n\nfunction fnDelete(frm) {\n  if (!frm.id.value || !frm.subid.value) {\n    alert('Select an item you want to delete.');\n    return;\n  }\n\n  if (confirm('Do you really want to delete the selected item?')) {\n    frm.actionFlag.value = 'D';\n    frm.action = './sub_save.jsp';\n    frm.submit();\n  }\n}\n\nfunction fnSetData(strParams) {\n  var params = strParams.split('".toCharArray();
    _jsp_string0 = "\n\n\n\n".toCharArray();
    _jsp_string3 = "');\n  var j = 0;\n\n  with (document.form2) {\n    id.value = params[j++];\n    oldId.value = id.value;\n    subid.value = params[j++];\n    oldSubid.value = subid.value;\n    actionFlag.value = 'U';\n  }\n}\n</script>\n</head>\n<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>\n<table width='840' border='0' cellspacing='0' cellpadding='0'><tr><td>\n\n<table width='99%' border='0' cellspacing='0' cellpadding='0'>\n<tr>\n  <td height='15' colspan='2'></td>\n</tr>\n<tr>\n  <td width='3%'><img src='/img/title_icon.gif'></td>\n  <td width='*' class='left_title'>Sub-Supplier List</td>\n</tr>\n<tr>\n  <td width='100%' height='2' colspan='2'><hr width='100%'></td>\n</tr>\n<tr>\n  <td height='10' colspan='2'></td>\n</tr>\n</table>\n\n<table width='90%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\n<form name='form1' method='post'>\n<tr>\n  <td align='center' class='table_bg_bright'>Search Supplier ID\n    <input type='text' name='searchId' value='".toCharArray();
    _jsp_string1 = "\n\n\n".toCharArray();
    _jsp_string7 = "\n</tr></td></table>\n</body>\n</html>".toCharArray();
    _jsp_string6 = "\n</table>\n<table width='90%' border='0' cellspacing='0' cellpadding='0' align='center'>\n<tr>\n  <td height='15'></td>\n</tr>\n<tr>\n  <td align='center'>\n    <input type='button' value='New' onclick='fnNew(this.form);'>\n    <input type='button' value='Save' onclick='fnSave(this.form);'>\n    <input type='button' value='Delete' onclick='fnDelete(this.form);'>\n  </td>\n</tr>\n</table>\n</form>\n".toCharArray();
    _jsp_string4 = "' size='10' maxlength='5'>\n    <input type='button' value='Search' onClick='fnSearch(this.form);'></td>\n</tr>\n</form>\n</table>\n<table width='90%' border='0' cellspacing='0' cellpadding='0' align='center'>\n<tr>\n  <td height='15'></td>\n</tr>\n</table>\n<table width='90%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\n<form name='form2' method='post'>\n<input type='hidden' name='actionFlag' value='I'>\n<input type='hidden' name='searchId' value='".toCharArray();
    _jsp_string5 = "'>\n<input type='hidden' name='oldId'>\n<input type='hidden' name='oldSubid'>\n<tr>\n  <td width='25%' class='table_header_center'>Supplier ID(*)</td>\n  <td width='25%' class='table_bg_bright'><input type='text' name='id' size='10' maxlength='5'></td>\n  <td width='25%' class='table_header_center'>Sub-Supplier ID(*)</td>\n  <td width='25%' class='table_bg_bright'><input type='text' name='subid' size='10' maxlength='5'></td>\n</tr>\n</table>\n<table width='90%' border='0' cellspacing='0' cellpadding='0' align='center'>\n<tr>\n  <td height='15'></td>\n</tr>\n<tr>\n  <td align='center'>\n    <input type='button' value='New' onclick='fnNew(this.form);'>\n    <input type='button' value='Save' onclick='fnSave(this.form);'>\n    <input type='button' value='Delete' onclick='fnDelete(this.form);'>\n  </td>\n</tr>\n<tr>\n  <td height='15'></td>\n</tr>\n</table>\n<table width='90%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\n<tr class='table_header_center'>\n  <td width='15%'>Supplier ID</td>\n  <td width='25%'>Supplier Name</td>\n  <td width='15%'>Sub-Supplier ID</td>\n  <td width='45%'>Sub-Supplier Name</td>\n</tr>\n".toCharArray();
  }
}
