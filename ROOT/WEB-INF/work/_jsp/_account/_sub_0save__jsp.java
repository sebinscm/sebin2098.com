/*
 * JSP generated by Resin-3.1.9 (built Mon, 13 Apr 2009 11:09:12 PDT)
 */

package _jsp._account;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import java.sql.*;
import common.*;
import dbconn.*;

public class _sub_0save__jsp extends com.caucho.jsp.JavaPage
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

      out.write('\n');
      
String actionFlag = request.getParameter("actionFlag");
String searchId = request.getParameter("searchId");
String id = request.getParameter("id");
String subid = request.getParameter("subid");
String oldId = request.getParameter("oldId");
String oldSubid = request.getParameter("oldSubid");

String sql = "";
int iRet = 0;
int iCnt = 0;
boolean isSucceeded = false;
String strMsg = "";
DBConnManager dbPool = null;
Connection conn = null;
PreparedStatement pstmt = null;
dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;

try {

  dbPool = DBConnManager.getInstance();
  conn = dbPool.getConnection("intranet");

  // check duplication
  if ((actionFlag.equals("I") || actionFlag.equals("U"))
      && (!id.equals(oldId) || !subid.equals(oldSubid))) {
    sql = " select  count(*) "
        + " from    login_02t "
        + " where   id = '" + id + "' "
        + " and     subid = '" + subid + "' ";

    matrix = new dbconn.MatrixDataSet();
    dataProcess = new dbconn.DataProcess();
    iRet = dataProcess.RetrieveData(sql, matrix, conn);
    
    if (iRet > 0) {
      iCnt = Integer.parseInt(matrix.getRowData(0).getData(0));

      if (iCnt > 0) {
        throw new UserDefinedException("Duplication error. Check your data.");
      }
    }
  }
  
  // insert/update/delete \u00c3\u00b3\u00b8\u00ae...
  int idx = 1;
  iCnt = 0;
  conn.setAutoCommit(false);

  // actionFlag\u00bf\u00a1 \u00b5\u00fb\u00b6\u00f3 \u00c3\u00b3\u00b8\u00ae\u00c7\u00d4.
  if (actionFlag.equals("I")) {
    /*
    //request from Joy 07102009
    // check sub-supplier whether it is apess or not
    sql = " select  name "
        + " from    login_01t "
        + " where   id = '" + subid + "' ";

    matrix = new dbconn.MatrixDataSet();
    dataProcess = new dbconn.DataProcess();
    iRet = dataProcess.RetrieveData(sql, matrix, conn);

    if (iRet > 0) {
      String subSupplier = matrix.getRowData(0).getData(0);

      if (!subSupplier.startsWith("APESS")) {
        throw new UserDefinedException("Apess Suppliers are only accepted. Check your data.");
      }
    } else {
      throw new UserDefinedException("Sub-supplier can not be found. Check your data.");
    }
    */

    // insert...
    sql = " insert into login_02t "
        + " ( "
        + "   id, subid, modifyid, modify_date "
        + " ) "
        + " values "
        + " ( "
        + "   ?, ?, ?, sysdate "
        + " ) ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, id);
    pstmt.setString(idx++, subid);
    pstmt.setString(idx++, _adminid);

  } else if (actionFlag.equals("U")) {

    // update..
    sql = " update  login_02t "
        + " set "
        + "   id = ?, "
        + "   subid = ?, "
        + "   modifyid = ?, "
        + "   modify_date = sysdate "
        + " where   id = ? "
        + " and     subid = ? ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, id);
    pstmt.setString(idx++, subid);
    pstmt.setString(idx++, _adminid);
    pstmt.setString(idx++, oldId);
    pstmt.setString(idx++, oldSubid);

  } else if (actionFlag.equals("D")) {

    // delete..
    sql = " delete  login_02t "
        + " where   id = ? "
        + " and     subid = ? ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(idx++, id);
    pstmt.setString(idx++, subid);

  } else {

    throw new UserDefinedException("The action is unknown.");

  }

  // execute ...
  iCnt = pstmt.executeUpdate();

  if (iCnt != 1) {
    throw new UserDefinedException("Check your data.");
  }

  conn.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  strMsg = ue.getMessage();
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  System.out.println("Exception /account/sub_save : " + e.getMessage());
  throw e;
} finally {
  if (pstmt != null) {
    try { pstmt.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    dbPool.freeConnection("intranet", conn);
  }
}

// \u00b0\u00e1\u00b0\u00fa \u00b8\u00de\u00bd\u00c3\u00c1\u00f6 \u00c3\u00b3\u00b8\u00ae
if (isSucceeded) strMsg = "The data are successfully processed.";
else strMsg = "The operation failed.\\n" + strMsg;

      out.write(_jsp_string1, 0, _jsp_string1.length);
      out.print(( searchId ));
      out.write(_jsp_string2, 0, _jsp_string2.length);
      out.print(( strMsg ));
      out.write(_jsp_string3, 0, _jsp_string3.length);
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
    depend = new com.caucho.vfs.Depend(appDir.lookup("account/sub_save.jsp"), -8946947066387841935L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("apess/login_check.jsp"), 8233910267322158578L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
  }

  private final static char []_jsp_string0;
  private final static char []_jsp_string2;
  private final static char []_jsp_string1;
  private final static char []_jsp_string3;
  static {
    _jsp_string0 = "\n\n\n\n".toCharArray();
    _jsp_string2 = "'>\n</form>\n<script language=\"javascript\">\n  alert('".toCharArray();
    _jsp_string1 = "\n<html>\n<head>\n<title></title>\n</head>\n<body>\n<form name=\"form1\" method=\"post\" action=\"./sub_list.jsp\">\n<input type='hidden' name='searchId' value='".toCharArray();
    _jsp_string3 = "');\n  document.form1.submit();\n</script>\n</body>\n</html>\n".toCharArray();
  }
}
