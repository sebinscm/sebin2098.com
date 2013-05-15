/*
 * JSP generated by Resin-3.1.9 (built Mon, 13 Apr 2009 11:09:12 PDT)
 */

package _jsp._order;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import java.sql.*;
import common.*;
import common.util.*;
import dbconn.*;

public class _packing_0update__jsp extends com.caucho.jsp.JavaPage
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

String scmid = "";
String scmnm = "";
String usertype = "";
String usergroup = "";
//String scmsubids = "";
String _adminid = "";
String _adminname = "";
String _admingroup = "";
String _apessid = "";
String _apessname = "";

try{
  scmid = (String) session.getAttribute("scmid");
  _adminid = (String) session.getAttribute("adminid");

  if( (scmid == null || scmid.length() == 0 || scmid.equals("null"))
      && (_adminid == null || _adminid.length() == 0 || _adminid.equals("null")) ) {
    response.sendRedirect("/login_first.html");
    return;
  }

  _adminname = (String) session.getAttribute("adminname");

  _apessid = (String) session.getAttribute("apessid");
  _apessname = (String) session.getAttribute("apessname");

  scmnm = (String) session.getAttribute("scmnm");

  usertype = (String) session.getAttribute("usertype");
  if (usertype == null) usertype = "";

  usergroup = (String) session.getAttribute("usergroup");
  if (usergroup == null) usergroup = "";

  //scmsubids = (String) session.getAttribute("scmsubids");
  //session.setMaxInactiveInterval(60*60);

}catch( Exception e ) {
  response.sendRedirect("/login_first.html");
  return;
}

      out.write('\n');
      
String DATE_FORMAT = "yyyyMMdd";
int RATIO_SIZE = 6;

String packing_date = DateUtil.getFmtDateString(new java.util.Date(), DATE_FORMAT);
String old_packing_date = request.getParameter("old_packing_date");
String po_no_selected = request.getParameter("po_no_selected");
String supplier_id = request.getParameter("supplier_id");
String style_no = request.getParameter("style_no");
String brand = request.getParameter("brand");
String buyer = request.getParameter("buyer");
String ship_type = request.getParameter("ship_type");
String delivery_date = request.getParameter("delivery_date");
String season_cd = request.getParameter("season_cd");
String shipping_date = request.getParameter("shipping_date");
String ttl_ctns = request.getParameter("ttl_ctns");
String packs_carton = request.getParameter("packs_carton");
String colour[] = request.getParameterValues("colour");
String ratio_desc[] = request.getParameterValues("ratio_desc");
String pcs_pack[] = request.getParameterValues("pcs_pack");
String size1_qty[] = request.getParameterValues("size1_qty");
String size2_qty[] = request.getParameterValues("size2_qty");
String size3_qty[] = request.getParameterValues("size3_qty");
String size4_qty[] = request.getParameterValues("size4_qty");
String size5_qty[] = request.getParameterValues("size5_qty");
String size6_qty[] = request.getParameterValues("size6_qty");
String ttl_pqty[] = request.getParameterValues("ttl_pqty");
String ttl_qty[] = request.getParameterValues("ttl_qty");
String ttl_ctn[] = request.getParameterValues("ttl_ctn");
String supplier_stkcd = request.getParameter("supplier_stkcd");
String ctn_no[] = request.getParameterValues("ctn_no");
String c_colour[] = request.getParameterValues("c_colour");
String c_size1_qty[] = request.getParameterValues("c_size1_qty");
String c_size2_qty[] = request.getParameterValues("c_size2_qty");
String c_size3_qty[] = request.getParameterValues("c_size3_qty");
String c_size4_qty[] = request.getParameterValues("c_size4_qty");
String c_size5_qty[] = request.getParameterValues("c_size5_qty");
String c_size6_qty[] = request.getParameterValues("c_size6_qty");
String c_ttl_pqty[] = request.getParameterValues("c_ttl_pqty");
String c_ttl_qty[] = request.getParameterValues("c_ttl_qty");
String c_ttl_ctn[] = request.getParameterValues("c_ttl_ctn");
String others = request.getParameter("others");

// check duplicated carton number
for (int i = 0; i < ctn_no.length; i++) {
  for (int j = i+1; j < ctn_no.length; j++) {
    if (ctn_no[i].equals(ctn_no[j]) && c_colour[i].equals(c_colour[j])) {
      System.out.println("packing_update.jsp Carton NO Collusion " + ctn_no[i]);
      response.sendRedirect("./packing_error.jsp");
      return;
    }
  }
}

// change date format
if (delivery_date.length() == 10) {
  // change format from dd/mm/yyyy to dd-mm-yy.
  delivery_date = delivery_date.substring(0, 2) + "-" + delivery_date.substring(3, 5) + "-" + delivery_date.substring(8);
}

if (shipping_date.length() == 10) {
  // change format from dd/mm/yyyy to dd/mm/yy.
  shipping_date = shipping_date.substring(0, 6) + shipping_date.substring(8);
}


String sql = "";
int iRet = 0;
int iCnt = 0;
boolean isSucceeded = false;
String strMsg = "";
Connection connScm = null;
PreparedStatement pstmt = null;
dbconn.DBConnManager dbPool = null;
dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;


try {

  dbPool = DBConnManager.getInstance();
  connScm = dbPool.getConnection("intranet");
  connScm.setAutoCommit(false);

  // delete packing_01t
  sql = " delete  packing_01t "
      + " where   po_no = ? ";

  int j = 0;
  pstmt = connScm.prepareStatement(sql);
  pstmt.setString(++j, po_no_selected);
  pstmt.executeUpdate();
  pstmt.close();

  // delete packing_02t
  sql = " delete  packing_02t "
      + " where   po_no = ? ";

  j = 0;
  pstmt = connScm.prepareStatement(sql);
  pstmt.setString(++j, po_no_selected);
  pstmt.executeUpdate();
  pstmt.close();

  // delete packing_03t
  sql = " delete  packing_03t "
      + " where   po_no = ? ";

  j = 0;
  pstmt = connScm.prepareStatement(sql);
  pstmt.setString(++j, po_no_selected);
  pstmt.executeUpdate();
  pstmt.close();

  // delete packing_04t
  sql = " delete  packing_04t "
      + " where   po_no = ? ";

  j = 0;
  pstmt = connScm.prepareStatement(sql);
  pstmt.setString(++j, po_no_selected);
  pstmt.executeUpdate();
  pstmt.close();

  // update packing_t
  sql = " update  packing_t "
      + " set     packing_date = ? "
      + " where   po_no = ? ";

  j = 0;
  pstmt = connScm.prepareStatement(sql);
  pstmt.setString(++j, packing_date);
  pstmt.setString(++j, po_no_selected);
  pstmt.executeUpdate();
  pstmt.close();

  // insert packing_01t
  sql = " insert  into packing_01t "
      + " ( "
      + "   packing_date, po_no, style_no, brand, buyer, "
      + "   supplier_id, ship_type, shipping_date, arrival_date, delivery_date, "
      + "   season_cd, ttl_cttn_qty, ratio_1, ratio_2, ratio_3, "
      + "   ratio_4, ratio_5, ratio_6, ratio_7, ratio_8, "
      + "   unit_price, supplier_stkcd, pcs_pack, packs_carton, ttl_pks, "
      + "   ttl_ctns, others, print_yn "
      + " ) "
      + " values "
      + " ( "
      + "   ?, ?, ?, ?, ?, "
      + "   ?, ?, ?, null, ?, "
      + "   ?, null, 0, 0, 0, "
      + "   0, 0, 0, 0, 0, "
      + "   0, ?, 0, ?, null, "
      + "   ?, ?, 'N' "
      + " ) ";

  j = 0;
  pstmt = connScm.prepareStatement(sql);
  pstmt.setString(++j, packing_date);
  pstmt.setString(++j, po_no_selected);
  pstmt.setString(++j, style_no);
  pstmt.setString(++j, brand);
  pstmt.setString(++j, buyer);
  pstmt.setString(++j, supplier_id);
  pstmt.setString(++j, ship_type);
  pstmt.setString(++j, shipping_date);
  pstmt.setString(++j, delivery_date);
  pstmt.setString(++j, season_cd);
  pstmt.setString(++j, supplier_stkcd);
  pstmt.setString(++j, packs_carton);
  pstmt.setString(++j, ttl_ctns);
  pstmt.setString(++j, others);
  iCnt = pstmt.executeUpdate();
  pstmt.close();

  if (iCnt != 1) {
    throw new UserDefinedException("Insert error - packing_01t. Check your data.");
  }

  // insert packing_02t
  sql = " insert  into packing_02t "
      + " ( "
      + "   packing_date, po_no, style_no, colour, size1_qty, "
      + "   size2_qty, size3_qty, size4_qty, size5_qty, size6_qty, "
      + "   size7_qty, size8_qty, ttl_qty, pack_qty, ctn_qty, "
      + "   ratio_1, ratio_2, ratio_3, ratio_4, ratio_5, "
      + "   ratio_6, ratio_7, ratio_8, pcs_pack "
      + " ) "
      + " values "
      + " ( "
      + "   ?, ?, ?, ?, ?, "
      + "   ?, ?, ?, ?, ?, "
      + "   0, 0, ?, ?, ?, "
      + "   ?, ?, ?, ?, ?, "
      + "   ?, 0, 0, ? "
      + " ) ";

  pstmt = connScm.prepareStatement(sql);

  for (int i = 0; i < colour.length; i++) {
    j = 0;
    pstmt.setString(++j, packing_date);
    pstmt.setString(++j, po_no_selected);
    pstmt.setString(++j, style_no);
    pstmt.setString(++j, colour[i]);
    pstmt.setString(++j, size1_qty[i]);
    pstmt.setString(++j, size2_qty[i]);
    pstmt.setString(++j, size3_qty[i]);
    pstmt.setString(++j, size4_qty[i]);
    pstmt.setString(++j, size5_qty[i]);
    pstmt.setString(++j, size6_qty[i]);
    pstmt.setString(++j, ttl_qty[i]);
    pstmt.setString(++j, ttl_pqty[i]);
    pstmt.setString(++j, ttl_ctn[i]);

    // set ratio
    String[] ratio_label = ratio_desc[i].split(":");

    for (int k = 0; k < ratio_label.length; k++) {
      pstmt.setString(++j, ratio_label[k]);
    }

    for (int k = 0; k < RATIO_SIZE - ratio_label.length; k++) {
      pstmt.setInt(++j, 0);
    }

    pstmt.setString(++j, pcs_pack[i]);

    iCnt = pstmt.executeUpdate();

    if (iCnt != 1) {
      throw new UserDefinedException("Insert error - packing_02t. Check your data.");
    }
  }

  pstmt.close();

  // insert packing_03t
  sql = " insert  into packing_03t "
      + " ( "
      + "   packing_date, po_no, style_no, ctn_no, colour, "
      + "   size1_qty, size2_qty, size3_qty, size4_qty, size5_qty, "
      + "   size6_qty, size7_qty, size8_qty, ttl_qty, pack_qty, "
      + "   ctn_qty "
      + " ) "
      + " values "
      + " ( "
      + "   ?, ?, ?, ?, ?, "
      + "   ?, ?, ?, ?, ?, "
      + "   ?, 0, 0, ?, ?, "
      + "   ? "
      + " ) ";

  pstmt = connScm.prepareStatement(sql);

  for (int i = 0; i < ctn_no.length; i++) {
    j = 0;
    pstmt.setString(++j, packing_date);
    pstmt.setString(++j, po_no_selected);
    pstmt.setString(++j, style_no);
    pstmt.setString(++j, ctn_no[i]);
    pstmt.setString(++j, c_colour[i]);
    pstmt.setString(++j, c_size1_qty[i]);
    pstmt.setString(++j, c_size2_qty[i]);
    pstmt.setString(++j, c_size3_qty[i]);
    pstmt.setString(++j, c_size4_qty[i]);
    pstmt.setString(++j, c_size5_qty[i]);
    pstmt.setString(++j, c_size6_qty[i]);
    pstmt.setString(++j, c_ttl_qty[i]);
    pstmt.setString(++j, c_ttl_pqty[i]);
    pstmt.setString(++j, c_ttl_ctn[i]);
    iCnt = pstmt.executeUpdate();

    if (iCnt != 1) {
      throw new UserDefinedException("Insert error - packing_03t. Check your data.");
    }
  }

  pstmt.close();

  connScm.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { connScm.rollback(); } catch (Exception ex) {}
  strMsg = ue.getMessage();
} catch (Exception e) {
  try { connScm.rollback(); } catch (Exception ex) {}
  System.out.println("Exception packing_update : " + e.getMessage());
  throw e;
} finally {
  if (pstmt != null) {
    try { pstmt.close(); } catch (Exception e) {}
  }

  if (connScm != null) {
    try { connScm.setAutoCommit(true); } catch (Exception e) {}
    dbPool.freeConnection("intranet", connScm);
  }
}

// result message
if (isSucceeded) strMsg = "The data are successfully processed.";
else strMsg = "The operation failed.\\n" + strMsg;

      out.write(_jsp_string1, 0, _jsp_string1.length);
      out.print(( po_no_selected ));
      out.write(_jsp_string2, 0, _jsp_string2.length);
      out.print(( supplier_id ));
      out.write(_jsp_string3, 0, _jsp_string3.length);
      out.print(( old_packing_date ));
      out.write(_jsp_string4, 0, _jsp_string4.length);
      out.print(( strMsg ));
      out.write(_jsp_string5, 0, _jsp_string5.length);
      out.print(( isSucceeded ? "packing_view" : "packing_made" ));
      out.write(_jsp_string6, 0, _jsp_string6.length);
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
    depend = new com.caucho.vfs.Depend(appDir.lookup("order/packing_update.jsp"), 785248880612771530L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("login_check.jsp"), 5313538553479869376L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
  }

  private final static char []_jsp_string1;
  private final static char []_jsp_string4;
  private final static char []_jsp_string6;
  private final static char []_jsp_string0;
  private final static char []_jsp_string3;
  private final static char []_jsp_string2;
  private final static char []_jsp_string5;
  static {
    _jsp_string1 = "\n<HTML>\n<head>\n</head>\n<body>\n<form name='form1' method='post'>\n<input type='hidden' name='po_no_selected' value='".toCharArray();
    _jsp_string4 = "'>\n</form>\n<script language='javascript'>\nalert(\"".toCharArray();
    _jsp_string6 = ".jsp';\nform1.submit();\n</script>\n</BODY>\n</HTML>\n".toCharArray();
    _jsp_string0 = "\n\n\n\n\n".toCharArray();
    _jsp_string3 = "'>\n<input type='hidden' name='packing_date' value='".toCharArray();
    _jsp_string2 = "'>\n<input type='hidden' name='supplier_id' value='".toCharArray();
    _jsp_string5 = "\");\nform1.action = './".toCharArray();
  }
}