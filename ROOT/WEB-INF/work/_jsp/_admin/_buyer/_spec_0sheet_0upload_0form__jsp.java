/*
 * JSP generated by Resin-3.1.9 (built Mon, 13 Apr 2009 11:09:12 PDT)
 */

package _jsp._admin._buyer;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;

public class _spec_0sheet_0upload_0form__jsp extends com.caucho.jsp.JavaPage
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
    str += "<FONT size=2 >&copy;Copyright 2010 </font>";
    str += "<FONT size=2 color=green>Fast Future Brands Pty Ltd. All Rights Reserved.</FONT><BR>";
    str += "<FONT size=2> For more information,please contact</font> <FONT size=2 color=blue><A href='mailto:scm@ffb.net.au'>scm@ffb.net.au</A></FONT>";
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
      out.write('\n');
      
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0);
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1

String _adminid = "";
String _adminname = "";
String _admintype = "";
String _admingroup = "";
String _brand = "";
String _adminclass = "";

try{

  _adminid = (String) session.getAttribute("adminid");

  if( _adminid == null || _adminid.length() == 0 || _adminid.equals("null") ) {
    response.sendRedirect("/admin/login_first.html");
    return;
  }

  _adminname = (String) session.getAttribute("adminname");
  _admintype = (String) session.getAttribute("admintype");
  _admingroup = (String) session.getAttribute("admingroup");
  _brand = (String) session.getAttribute("brand");
  _adminclass = (String) session.getAttribute("adminclass");
  //session.setMaxInactiveInterval(60*60);

}catch( Exception e ) {
  response.sendRedirect("/admin/login_first.html");
  return;
}

      out.write(_jsp_string0, 0, _jsp_string0.length);
      
if (_admingroup.equals("B")) {

      out.write(_jsp_string1, 0, _jsp_string1.length);
      out.print(( _brand.equals("1") ? "VG" : (_brand.equals("2") ? "TEMT" : _brand) ));
      out.write(_jsp_string2, 0, _jsp_string2.length);
      out.print(( _brand.equals("1") ? "VG" : (_brand.equals("2") ? "TEMT" : _brand) ));
      out.write(_jsp_string3, 0, _jsp_string3.length);
      
} else {

      out.write(_jsp_string4, 0, _jsp_string4.length);
      
}

      out.write(_jsp_string5, 0, _jsp_string5.length);
      
for (int i = 1; i <= 10; i++) {

      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print(( i ));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print(( i ));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      
}

      out.write(_jsp_string9, 0, _jsp_string9.length);
      
out.println(CopyRightLogo());

      out.write(_jsp_string10, 0, _jsp_string10.length);
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
    depend = new com.caucho.vfs.Depend(appDir.lookup("admin/buyer/spec_sheet_upload_form.jsp"), 2411100796067979529L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("admin/login_check.jsp"), 6768457171426488389L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("bottom_line.jsp"), 5941552803368297242L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
  }

  private final static char []_jsp_string8;
  private final static char []_jsp_string4;
  private final static char []_jsp_string0;
  private final static char []_jsp_string9;
  private final static char []_jsp_string7;
  private final static char []_jsp_string2;
  private final static char []_jsp_string1;
  private final static char []_jsp_string3;
  private final static char []_jsp_string5;
  private final static char []_jsp_string6;
  private final static char []_jsp_string10;
  static {
    _jsp_string8 = "' size='70'></td>\n</tr>\n".toCharArray();
    _jsp_string4 = "\n    <option value='' ></option>\n    <option value='VG'>VG</option>\n    <option value='TEMT'>TEMT</option>\n".toCharArray();
    _jsp_string0 = "\n\n\n<html>\n<head>\n<title></title>\n<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n<script language=javascript src=\"/common/js/util.js\"></script>\n<script language=\"javascript\">\nfunction fnUpload(frm) {\n  var isEntered = false;\n\n  if (!jf_ChkValue(frm.brand.value)) {\n    alert(\"Input Brand.\");\n    frm.brand.focus();\n    return;\n  }\n\n  for (var i = 1; i <= 10; i++) {\n    if (jf_ChkValue(frm['file'+i].value)) {\n      isEntered = true;\n      break;\n    }\n  }\n\n  if (!isEntered) {\n    alert(\"Input spec sheet file name.\");\n    frm.file1.focus();\n    return;\n  }\n\n/*\n  // check extension of file names\n  for (var i = 1; i <= 10; i++) {\n    if (jf_ChkValue(frm['file'+i].value)) {\n      var ext = frm['file'+i].value.substr(frm['file'+i].value.lastIndexOf(\".\")+1);\n\n      if (ext != \"jpg\") {\n        alert(\"The extension of the file name must be 'jpg'.\");\n        frm['file'+i].select();\n        return;\n      }\n    }\n  }\n*/\n\n  if (confirm('Do you want to upload these files?')) {\n    frm.action = './spec_sheet_upload_save.jsp';\n    frm.submit();\n  }\n}\n</script>\n</head>\n<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>\n<table width='840' border='0' cellspacing='0' cellpadding='0'><tr><td>\n\n<table width='99%' border='0' cellspacing='0' cellpadding='0' align=\"center\">\n<tr>\n  <td height='15' colspan='2'></td>\n</tr>\n<tr>\n  <td width='3%'><img src='/img/title_icon.gif'></td>\n  <td width='*' class='left_title'>Spec Sheet Upload</td>\n</tr>\n<tr>\n  <td width='100%' height='2' colspan='2'><hr width='100%'></td>\n</tr>\n<tr>\n  <td height='10' colspan='2'></td>\n</tr>\n</table>\n\n<table width='80%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\n<form name='form1' method='post' enctype='multipart/form-data'>\n<tr>\n  <td width='20%' class='table_header_center'>Brand</td>\n  <td width='80%' class='table_bg_bright'><select name='brand'>\n".toCharArray();
    _jsp_string9 = "\n</table>\n<table width='80%' border='0' cellspacing='0' cellpadding='0' align='center'>\n<tr>\n  <td height='15'></td>\n</tr>\n<tr>\n  <td align='center'>\n    <input type='reset' value='Reset'>\n    <input type='button' value='Upload' onclick='fnUpload(this.form);'>\n  </td>\n</tr>\n</form>\n</table>\n".toCharArray();
    _jsp_string7 = "</td>\n  <td class='table_bg_bright'><input type='file' name='file".toCharArray();
    _jsp_string2 = "'>".toCharArray();
    _jsp_string1 = "\n    <option value='".toCharArray();
    _jsp_string3 = "</option>\n".toCharArray();
    _jsp_string5 = "\n  </select></td>\n</tr>\n".toCharArray();
    _jsp_string6 = "\n<tr>\n  <td class='table_header_center'>File".toCharArray();
    _jsp_string10 = "\n</tr></td></table>\n</body>\n</html>".toCharArray();
  }
}
