/*
 * JSP generated by Resin-3.1.9 (built Mon, 13 Apr 2009 11:09:12 PDT)
 */

package _jsp;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;

public class _error__jsp extends com.caucho.jsp.JavaPage
{
  private static final java.util.HashMap<String,java.lang.reflect.Method> _jsp_functionMap = new java.util.HashMap<String,java.lang.reflect.Method>();
  private boolean _caucho_isDead;
  
  public void
  _jspService(javax.servlet.http.HttpServletRequest request,
              javax.servlet.http.HttpServletResponse response)
    throws java.io.IOException, javax.servlet.ServletException
  {
    javax.servlet.http.HttpSession session = request.getSession(true);
    com.caucho.server.webapp.WebApp _jsp_application = _caucho_getApplication();
    javax.servlet.ServletContext application = _jsp_application;
    com.caucho.jsp.PageContextImpl pageContext = _jsp_application.getJspApplicationContext().allocatePageContext(this, _jsp_application, request, response, null, session, 8192, true, false);
    javax.servlet.jsp.PageContext _jsp_parentContext = pageContext;
    javax.servlet.jsp.JspWriter out = pageContext.getOut();
    final javax.el.ELContext _jsp_env = pageContext.getELContext();
    javax.servlet.ServletConfig config = getServletConfig();
    javax.servlet.Servlet page = this;
    response.setContentType("text/html; charset=MS949");
    request.setCharacterEncoding("MS949");
    com.caucho.jstl.el.FormatDateTag _jsp_FormatDateTag_0 = null;
    com.caucho.jsp.IteratorLoopSupportTag _jsp_loop_0 = null;
    com.caucho.jsp.IteratorLoopSupportTag _jsp_loop_1 = null;
    try {
      out.write(_jsp_string0, 0, _jsp_string0.length);
      out.print(( java.net.InetAddress.getLocalHost().getHostName() ));
      out.write(_jsp_string1, 0, _jsp_string1.length);
      out.print(( java.net.InetAddress.getLocalHost().getHostAddress() ));
      out.write(_jsp_string2, 0, _jsp_string2.length);
      java.util.Date now;
      now = (java.util.Date) pageContext.getAttribute("now");
      if (now == null) {
        now = new java.util.Date();
        pageContext.setAttribute("now", now);
      }
      out.write(_jsp_string3, 0, _jsp_string3.length);
      if (_jsp_FormatDateTag_0 == null) {
        _jsp_FormatDateTag_0 = new com.caucho.jstl.el.FormatDateTag();
        _jsp_FormatDateTag_0.setPageContext(pageContext);
        _jsp_FormatDateTag_0.setParent((javax.servlet.jsp.tagext.Tag) null);
        _jsp_FormatDateTag_0.setPattern(_caucho_expr_0);
      }

      _jsp_FormatDateTag_0.setValue(_caucho_expr_1);
      _jsp_FormatDateTag_0.doEndTag();
      out.write(_jsp_string4, 0, _jsp_string4.length);
      if (_caucho_expr_2.evalBoolean(_jsp_env)) {
        out.write(_jsp_string5, 0, _jsp_string5.length);
        _caucho_expr_3.print(out, _jsp_env, true);
        out.write(_jsp_string6, 0, _jsp_string6.length);
      }
      out.write(_jsp_string7, 0, _jsp_string7.length);
      if (_caucho_expr_4.evalBoolean(_jsp_env)) {
        out.write(_jsp_string8, 0, _jsp_string8.length);
        _caucho_expr_5.print(out, _jsp_env, true);
        out.write(_jsp_string9, 0, _jsp_string9.length);
      }
      else {
        out.write(_jsp_string8, 0, _jsp_string8.length);
        _caucho_expr_6.print(out, _jsp_env, true);
        out.write(_jsp_string9, 0, _jsp_string9.length);
      }
      out.write(_jsp_string10, 0, _jsp_string10.length);
      _caucho_expr_7.print(out, _jsp_env, true);
      out.write(_jsp_string11, 0, _jsp_string11.length);
      _caucho_expr_8.print(out, _jsp_env, true);
      out.write(_jsp_string12, 0, _jsp_string12.length);
      if (_caucho_expr_9.evalBoolean(_jsp_env)) {
        out.write(_jsp_string13, 0, _jsp_string13.length);
        pageContext.defaultSetOrRemove("ex", _caucho_expr_10.evalObject(_jsp_env));
        out.write(_jsp_string13, 0, _jsp_string13.length);
        java.lang.Throwable ex;
        ex = (java.lang.Throwable) pageContext.getAttribute("ex");
        if (ex == null) {
          ex = new java.lang.Throwable();
          pageContext.setAttribute("ex", ex);
        }
        out.write(_jsp_string14, 0, _jsp_string14.length);
         ex.printStackTrace(new java.io.PrintWriter(out)); 
        out.write(_jsp_string15, 0, _jsp_string15.length);
      }
      out.write(_jsp_string16, 0, _jsp_string16.length);
      _caucho_expr_11.print(out, _jsp_env, true);
      if (_caucho_expr_12.evalBoolean(_jsp_env)) {
        out.write('?');
        _caucho_expr_13.print(out, _jsp_env, true);
      }
      out.write(_jsp_string17, 0, _jsp_string17.length);
      if (_caucho_expr_14.evalBoolean(_jsp_env)) {
        out.write(_jsp_string18, 0, _jsp_string18.length);
      }
      else if (_caucho_expr_15.evalBoolean(_jsp_env)) {
        out.write(_jsp_string19, 0, _jsp_string19.length);
        _caucho_expr_16.print(out, _jsp_env, true);
        out.write(_jsp_string20, 0, _jsp_string20.length);
        if (_caucho_expr_17.evalBoolean(_jsp_env)) {
          out.write(_jsp_string21, 0, _jsp_string21.length);
        }
        else if (_caucho_expr_18.evalBoolean(_jsp_env)) {
          out.write(_jsp_string22, 0, _jsp_string22.length);
        }
        else {
          out.write(_jsp_string23, 0, _jsp_string23.length);
        }
        out.write(_jsp_string24, 0, _jsp_string24.length);
      }
      else {
        out.write(_jsp_string25, 0, _jsp_string25.length);
      }
      out.write(_jsp_string26, 0, _jsp_string26.length);
      if (_jsp_loop_0 == null)
        _jsp_loop_0 = new com.caucho.jsp.IteratorLoopSupportTag();
      java.lang.Object _jsp_items_6 = _caucho_expr_19.evalObject(_jsp_env);
      java.util.Iterator _jsp_iter_6 = com.caucho.jstl.rt.CoreForEachTag.getIterator(_jsp_items_6);
      _jsp_loop_0.init(0, Integer.MAX_VALUE, 1);
      Object _jsp_oldVar_6 = pageContext.getAttribute("pn");
      while (_jsp_iter_6.hasNext()) {
        Object _jsp_i_6 = _jsp_iter_6.next();
        pageContext.setAttribute("pn", _jsp_i_6);
        _jsp_loop_0.setCurrent(_jsp_i_6, _jsp_iter_6.hasNext());
        out.write(_jsp_string24, 0, _jsp_string24.length);
        if (_jsp_loop_1 == null)
          _jsp_loop_1 = new com.caucho.jsp.IteratorLoopSupportTag();
        java.lang.Object _jsp_items_7 = _caucho_expr_20.evalObject(_jsp_env);
        java.util.Iterator _jsp_iter_7 = com.caucho.jstl.rt.CoreForEachTag.getIterator(_jsp_items_7);
        _jsp_loop_1.init(0, Integer.MAX_VALUE, 1);
        Object _jsp_oldVar_7 = pageContext.getAttribute("pv");
        while (_jsp_iter_7.hasNext()) {
          Object _jsp_i_7 = _jsp_iter_7.next();
          pageContext.setAttribute("pv", _jsp_i_7);
          _jsp_loop_1.setCurrent(_jsp_i_7, _jsp_iter_7.hasNext());
          out.write(_jsp_string27, 0, _jsp_string27.length);
          _caucho_expr_21.print(out, _jsp_env, true);
          out.write(_jsp_string28, 0, _jsp_string28.length);
        }
        pageContext.pageSetOrRemove("pv", _jsp_oldVar_7);
        out.write(_jsp_string29, 0, _jsp_string29.length);
      }
      pageContext.pageSetOrRemove("pn", _jsp_oldVar_6);
      out.write(_jsp_string30, 0, _jsp_string30.length);
      if (_jsp_loop_0 == null)
        _jsp_loop_0 = new com.caucho.jsp.IteratorLoopSupportTag();
      java.lang.Object _jsp_items_8 = _caucho_expr_22.evalObject(_jsp_env);
      java.util.Iterator _jsp_iter_8 = com.caucho.jstl.rt.CoreForEachTag.getIterator(_jsp_items_8);
      _jsp_loop_0.init(0, Integer.MAX_VALUE, 1);
      Object _jsp_oldVar_8 = pageContext.getAttribute("hn");
      while (_jsp_iter_8.hasNext()) {
        Object _jsp_i_8 = _jsp_iter_8.next();
        pageContext.setAttribute("hn", _jsp_i_8);
        _jsp_loop_0.setCurrent(_jsp_i_8, _jsp_iter_8.hasNext());
        out.write(_jsp_string31, 0, _jsp_string31.length);
        _caucho_expr_23.print(out, _jsp_env, true);
        out.write(_jsp_string32, 0, _jsp_string32.length);
      }
      pageContext.pageSetOrRemove("hn", _jsp_oldVar_8);
      out.write(_jsp_string33, 0, _jsp_string33.length);
      if (_jsp_loop_0 == null)
        _jsp_loop_0 = new com.caucho.jsp.IteratorLoopSupportTag();
      java.lang.Object _jsp_items_9 = _caucho_expr_24.evalObject(_jsp_env);
      java.util.Iterator _jsp_iter_9 = com.caucho.jstl.rt.CoreForEachTag.getIterator(_jsp_items_9);
      _jsp_loop_0.init(0, Integer.MAX_VALUE, 1);
      Object _jsp_oldVar_9 = pageContext.getAttribute("cook");
      while (_jsp_iter_9.hasNext()) {
        Object _jsp_i_9 = _jsp_iter_9.next();
        pageContext.setAttribute("cook", _jsp_i_9);
        _jsp_loop_0.setCurrent(_jsp_i_9, _jsp_iter_9.hasNext());
        out.write(_jsp_string31, 0, _jsp_string31.length);
        _caucho_expr_25.print(out, _jsp_env, true);
        out.write(_jsp_string32, 0, _jsp_string32.length);
      }
      pageContext.pageSetOrRemove("cook", _jsp_oldVar_9);
      out.write(_jsp_string34, 0, _jsp_string34.length);
    } catch (java.lang.Throwable _jsp_e) {
      pageContext.handlePageException(_jsp_e);
    } finally {
      if (_jsp_FormatDateTag_0 != null)
        _jsp_FormatDateTag_0.release();
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
    manager.addTaglibFunctions(_jsp_functionMap, "c", "http://java.sun.com/jstl/core");
    manager.addTaglibFunctions(_jsp_functionMap, "fmt", "http://java.sun.com/jstl/fmt");
    manager.addTaglibFunctions(_jsp_functionMap, "sql", "http://java.sun.com/jstl/sql");
    manager.addTaglibFunctions(_jsp_functionMap, "x", "http://java.sun.com/jstl/xml");
    com.caucho.jsp.PageContextImpl pageContext = new com.caucho.jsp.PageContextImpl(webApp, this);
    _caucho_expr_0 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "yyyy/MM/dd a hh:mm:ss");
    _caucho_expr_1 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${now}");
    _caucho_expr_2 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${not empty requestScope['javax.servlet.error.status_code']}");
    _caucho_expr_3 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${requestScope['javax.servlet.error.status_code']}");
    _caucho_expr_4 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${not empty requestScope['javax.servlet.error.request_uri']}");
    _caucho_expr_5 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${requestScope['javax.servlet.error.request_uri']}");
    _caucho_expr_6 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${pageContext.request.requestURI}");
    _caucho_expr_7 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${requestScope['javax.servlet.error.exception_type']}");
    _caucho_expr_8 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${requestScope['javax.servlet.error.message']}");
    _caucho_expr_9 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${not empty requestScope['javax.servlet.error.exception']}");
    _caucho_expr_10 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${requestScope['javax.servlet.error.exception']}");
    _caucho_expr_11 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${pageContext.request.method} ${pageContext.request.requestURL}");
    _caucho_expr_12 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${not empty pageContext.request.queryString}");
    _caucho_expr_13 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${pageContext.request.queryString}");
    _caucho_expr_14 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${empty pageContext.request.requestedSessionId}");
    _caucho_expr_15 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${pageContext.request.requestedSessionIdValid}");
    _caucho_expr_16 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${pageContext.request.requestedSessionId}");
    _caucho_expr_17 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${pageContext.request.requestedSessionIdFromCookie}");
    _caucho_expr_18 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${pageContext.request.requestedSessionIdFromURL}");
    _caucho_expr_19 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${pageContext.request.parameterNames}");
    _caucho_expr_20 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${paramValues[pn]}");
    _caucho_expr_21 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${pn} = ${pv}");
    _caucho_expr_22 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${pageContext.request.headerNames}");
    _caucho_expr_23 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${hn} = ${header[hn]}");
    _caucho_expr_24 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${pageContext.request.cookies}");
    _caucho_expr_25 = com.caucho.jsp.JspUtil.createExpr(pageContext.getELContext(), "${cook.name} = ${cook.value}");
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
    depend = new com.caucho.vfs.Depend(appDir.lookup("error.jsp"), 5994387391858192267L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("request_data.jspf"), -6147950721020318944L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(mergePath.lookup("jar:file:/usr/local/resin-3.1.9/lib/resin.jar!/com/caucho/jstl/fmt-el.tld"), -449626256852172091L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, new com.caucho.make.ClassDependency(com.caucho.jstl.el.FormatDateTag.class, 5899277161707882428L));
  }

  static {
    try {
    } catch (Exception e) {
      e.printStackTrace();
      throw new RuntimeException(e);
    }
  }
  private static com.caucho.el.Expr _caucho_expr_0;
  private static com.caucho.el.Expr _caucho_expr_1;
  private static com.caucho.el.Expr _caucho_expr_2;
  private static com.caucho.el.Expr _caucho_expr_3;
  private static com.caucho.el.Expr _caucho_expr_4;
  private static com.caucho.el.Expr _caucho_expr_5;
  private static com.caucho.el.Expr _caucho_expr_6;
  private static com.caucho.el.Expr _caucho_expr_7;
  private static com.caucho.el.Expr _caucho_expr_8;
  private static com.caucho.el.Expr _caucho_expr_9;
  private static com.caucho.el.Expr _caucho_expr_10;
  private static com.caucho.el.Expr _caucho_expr_11;
  private static com.caucho.el.Expr _caucho_expr_12;
  private static com.caucho.el.Expr _caucho_expr_13;
  private static com.caucho.el.Expr _caucho_expr_14;
  private static com.caucho.el.Expr _caucho_expr_15;
  private static com.caucho.el.Expr _caucho_expr_16;
  private static com.caucho.el.Expr _caucho_expr_17;
  private static com.caucho.el.Expr _caucho_expr_18;
  private static com.caucho.el.Expr _caucho_expr_19;
  private static com.caucho.el.Expr _caucho_expr_20;
  private static com.caucho.el.Expr _caucho_expr_21;
  private static com.caucho.el.Expr _caucho_expr_22;
  private static com.caucho.el.Expr _caucho_expr_23;
  private static com.caucho.el.Expr _caucho_expr_24;
  private static com.caucho.el.Expr _caucho_expr_25;

  private final static char []_jsp_string9;
  private final static char []_jsp_string29;
  private final static char []_jsp_string14;
  private final static char []_jsp_string27;
  private final static char []_jsp_string7;
  private final static char []_jsp_string26;
  private final static char []_jsp_string2;
  private final static char []_jsp_string22;
  private final static char []_jsp_string20;
  private final static char []_jsp_string34;
  private final static char []_jsp_string6;
  private final static char []_jsp_string21;
  private final static char []_jsp_string13;
  private final static char []_jsp_string5;
  private final static char []_jsp_string24;
  private final static char []_jsp_string16;
  private final static char []_jsp_string23;
  private final static char []_jsp_string33;
  private final static char []_jsp_string3;
  private final static char []_jsp_string1;
  private final static char []_jsp_string8;
  private final static char []_jsp_string32;
  private final static char []_jsp_string15;
  private final static char []_jsp_string31;
  private final static char []_jsp_string0;
  private final static char []_jsp_string28;
  private final static char []_jsp_string12;
  private final static char []_jsp_string30;
  private final static char []_jsp_string18;
  private final static char []_jsp_string4;
  private final static char []_jsp_string19;
  private final static char []_jsp_string17;
  private final static char []_jsp_string10;
  private final static char []_jsp_string25;
  private final static char []_jsp_string11;
  static {
    _jsp_string9 = "\n        ".toCharArray();
    _jsp_string29 = "\r\n  ".toCharArray();
    _jsp_string14 = "\n    <table width=100% border=1 cellpadding=6 cellspacing=0>\n      <tr align=\"center\" bgcolor=\"lightgrey\"><td> Error stack tracking information\n      </td></tr>\n      <tr align=\"left\"><td>\n      <pre>".toCharArray();
    _jsp_string27 = "\r\n      &nbsp;&nbsp;&nbsp;&nbsp;".toCharArray();
    _jsp_string7 = "\n      Access Path :\n      ".toCharArray();
    _jsp_string26 = "\r\n  </td></tr>\r\n  </table>\r\n<p>\r\n  <table width=100% border=1 cellpadding=6 cellspacing=0>\r\n  <tr align=\"center\" bgcolor=\"lightgrey\"><td>Request Parameter</td></tr>\r\n  <tr align=\"left\"><td>\r\n  <b>Parameters</b>:<br>\r\n  ".toCharArray();
    _jsp_string2 = ")&nbsp;&nbsp;\n".toCharArray();
    _jsp_string22 = "URL)".toCharArray();
    _jsp_string20 = " (Location:\r\n      ".toCharArray();
    _jsp_string34 = "\r\n  </td></tr>\r\n  </table>\r\n\n\n</td></tr>\n</table>\n<table>\n    <tr align=\"center\" bgcolor=\"#FFCC66\"><td bgcolor=\"#000080\"> <font color=\"#E1E1E1\"><span style=\"background-color: #000080\"> Please contact us for the SCM Support.\n        </span>.</font></td></tr>\n    <tr><td> Head Office: 02-8548-6200 </td></tr>\n</table>\n</body>\n</html>\n".toCharArray();
    _jsp_string6 = "&nbsp;&nbsp;&nbsp;&nbsp;\n      ".toCharArray();
    _jsp_string21 = "Session & Cookie)".toCharArray();
    _jsp_string13 = "\n    ".toCharArray();
    _jsp_string5 = "\n      Status Code : ".toCharArray();
    _jsp_string24 = "\r\n    ".toCharArray();
    _jsp_string16 = "\n\n  <table width=100% border=1 cellpadding=6 cellspacing=0>\r\n  <tr align=\"center\" bgcolor=\"lightgrey\"><td>Request Information</td></tr>\r\n  <tr align=\"left\"><td>\r\n  <b>Request</b>:<br>\r\n  ".toCharArray();
    _jsp_string23 = "Unknown)".toCharArray();
    _jsp_string33 = "\r\n  </td></tr>\r\n  </table>\r\n<p>\r\n  <table width=100% border=1 cellpadding=6 cellspacing=0>\r\n  <tr align=\"center\" bgcolor=\"lightgrey\"><td>Session Information</td></tr>\r\n  <tr align=\"left\"><td>\r\n  <b>Cookies</b>:<br>\r\n  ".toCharArray();
    _jsp_string3 = "\nCurrent ttime : ".toCharArray();
    _jsp_string1 = "\n(".toCharArray();
    _jsp_string8 = "\n          ".toCharArray();
    _jsp_string32 = "<br>\r\n  ".toCharArray();
    _jsp_string15 = "</pre>\n      </td></tr>\n    </table>\n    <p>\n  ".toCharArray();
    _jsp_string31 = "\r\n    &nbsp;&nbsp;&nbsp;&nbsp;".toCharArray();
    _jsp_string0 = "\n\n\n\n\n\n\n<HTML>\n<META content=\"text/html; charset=UTF-8\" http-equiv=Content-Type>\n<link rel=\"stylesheet\" type = \"text/css\" href=\"style.css\">\n<HEAD>\n<SCRIPT language=JavaScript>\n<!--\nfunction submitForm(sub) {\n  document.forms[sub].submit();\n}\n\nfunction proceedSubmission() {\n  return confirm(\"Press submit button then your message send to administrator.\");\n}\n// -->\n</SCRIPT>\n\n</HEAD>\n\n<body leftmargin=15 topmargin=10>\n<FORM id=firstForm onsubmit=\"return proceedSubmission()\" action=mailto:systemadmin@ffb.net.au method=post encType=text/plain>\n<tr><td><font color=red>  The page cannot be displayed with an error as below System Error Message;</font> <td> </tr>\n<tr><td><font color=red>  Please try again but if you still have a problem, please save as a file and send us an e-mail with attached the file(\"file_name.html or file_name.htm\").</font> <td></tr>\n<A onclick=\"submitForm('firstForm')\" href=\"thanks.htm\"> click here to send an e-mail</A>\n</FORM>\n\n<table width=\"700\" cellpadding=\"7\" cellspacing=\"0\"\n       border=\"1\" bordercolordark=\"WHITE\" bordercolorlight=\"BLACK\">\n<tr align=\"center\"><td>\nHost : ".toCharArray();
    _jsp_string28 = "<br>\r\n    ".toCharArray();
    _jsp_string12 = "</td>\n    </tr>\n  </table>\n  <p>\n\n  ".toCharArray();
    _jsp_string30 = "\r\n  </td></tr>\r\n  </table>\r\n<p>\r\n  <table width=100% border=1 cellpadding=6 cellspacing=0>\r\n  <tr align=\"center\" bgcolor=\"lightgrey\"><td>Requesst Header</td></tr>\r\n  <tr align=\"left\"><td>\r\n  <b>Headers</b>:<br>\r\n  ".toCharArray();
    _jsp_string18 = "None.".toCharArray();
    _jsp_string4 = "\n</td></tr>\n\n<tr><td>\n\n  <table width=100% border=1 cellpadding=6 cellspacing=0>\n    <tr align=\"center\" bgcolor=\"#FFCC66\"><td> <b> System Error Message</b></td></tr>\n    <tr align=\"center\">\n      <td>\n      ".toCharArray();
    _jsp_string19 = "\r\n      ".toCharArray();
    _jsp_string17 = "\r\n  <p><b>Session ID</b>:<br>\r\n  ".toCharArray();
    _jsp_string10 = "\n      </td>\n    </tr>\n    <tr align=\"center\">\n      <td><b>\n      Exception type : ".toCharArray();
    _jsp_string25 = "Session id not available & expired ".toCharArray();
    _jsp_string11 = "<br>\n      </b></td>\n    </tr>\n    <tr align=\"center\">\n      <td>".toCharArray();
  }
}