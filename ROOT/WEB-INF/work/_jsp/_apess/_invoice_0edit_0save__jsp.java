/*
 * JSP generated by Resin-3.1.9 (built Mon, 13 Apr 2009 11:09:12 PDT)
 */

package _jsp._apess;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import java.sql.*;
import common.*;
import dbconn.*;

public class _invoice_0edit_0save__jsp extends com.caucho.jsp.JavaPage
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
//String scmsubids = "";
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
  //scmsubids = (String) session.getAttribute("scmsubids");

} catch( Exception e ) {
  response.sendRedirect("/apess/login_first.html");
  return;
}

      out.write('\n');
      
// Intranet DB
String _mysqlJdbcDriver = "com.mysql.jdbc.Driver";
String _urlLogin = "jdbc:mysql://10.2.1.247:3306/intranet";
String _userLogin = "intranet";
String _pwLogin = "tetris82";

// Futura DB
String _mssqlJdbcDriver = "com.microsoft.jdbc.sqlserver.SQLServerDriver";
String _urlFutura = "jdbc:microsoft:sqlserver://10.2.1.228:1433";
String _userFutura = "intranet";
String _pwFutura = "tetris";

// Uplod
String _uploadPath = "/var/tmp";
long _maxFileSize = 10*1024*1024;

// style image path
String _styleImgURL = "/image";

// Fault return invoice File URL
String _faultReturnInvoiceFileURL = "/image/Return";

// Memo \u00b0\u00fc\u00b7\u00c3 \u00ba\u00af\u00bc\u00f6
String _memoDataUrl = "/memo/upload";

// APESS SCM ID
String _apessID = "60171";

// Spec Sheet path
String _specSheetUrl = "/image/SPEC_SHEET";

// Spec Sheet upload path
String _specSheetUploadUrl = "/scan_spec_sheet";

// Sample Image Url
String _sampleIamgeUrl = "/image/SAMPLE_IMAGE";

// barcode file Image Url
String _barcodeFileUrl = "/image/Barcode";

// Invoice file path
String _invoiceFileUrl = "/order/inv_files";

// shipment file path
String _shipmentFileUrl = "/order/shipment_upload";

// Apess MU rate
double _MURate = 0.25;

// Ex-Factory Price Rate
double _EXRate = 0.04;


// Ex-Factory Price Rate for Apess2
double _EXRate2 = 0.04;

// Pronto DATA_AREA
//String _dataArea = "fft";
String _dataArea = "ffl";

// Pronto PIE Info
//String _pieIP = "10.2.1.226";
String _pieIP = "newffbpro.fastfuturebrands.com.au";
int _piePort = 7000;
//String _pieDataset = "apitest";
String _pieDataset = "apilive";

      out.write(_jsp_string1, 0, _jsp_string1.length);
      
String M = request.getParameter("M");
String ag_month = request.getParameter("ag_month");
String ag_year = request.getParameter("ag_year");
String ag_invoice_no = request.getParameter("ag_invoice_no");
String actionFlag = request.getParameter("actionFlag");
String invoice_no = request.getParameter("invoice_no");
String supplier_id = request.getParameter("supplier_id");
String ship_via_02 = request.getParameter("ship_via_02");
String ship_date = request.getParameter("ship_date");
String chk_po_no[] = request.getParameterValues("chk_po_no");
String style_no[] = request.getParameterValues("style_no");
String po_no[] = request.getParameterValues("po_no");
String description[] = request.getParameterValues("description");
String content[] = request.getParameterValues("content");
String category[] = request.getParameterValues("category");
String qty[] = request.getParameterValues("qty");
String box_qty[] = request.getParameterValues("box_qty");
String unit_price[] = request.getParameterValues("unit_price");
String add_cost[] = request.getParameterValues("add_cost");
String disc_price[] = request.getParameterValues("disc_price");
String remarks[] = request.getParameterValues("remarks");
String brand[] = request.getParameterValues("brand");
String remarks2[] = request.getParameterValues("remarks2");

if (M == null) M = "";
if (ag_month == null) ag_month = "";
if (ag_year == null) ag_year = "";
if (ag_invoice_no == null) ag_invoice_no = "";

String sql = "";
boolean isSucceeded = false;
String strMsg = "";
Connection conn = null;
ResultSet rs = null;
Statement stmt = null;
PreparedStatement pstmt = null;
PreparedStatement pstmt2 = null;
DBConnManager dbPool = null;
int iCnt = 0;
String nextUrl = "";

try {

  dbPool = dbconn.DBConnManager.getInstance();
  conn = dbPool.getConnection("intranet");
  conn.setAutoCommit(false);
  int j = 0;

  if (actionFlag.equals("U")) {

    // update invoice info
    // invoice header
    sql = " update  invoice_apess_01t "
        + " set     ship_via_02 = ?, "
        //+ "         ship_date = to_date(?, 'dd/mm/yyyy'), "
        + "         update_date = sysdate, "
        + "         update_id = ? "
        + " where   invoice_no = ? "
        + " and     supplier_id = ? ";
  
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(++j, ship_via_02);
    //pstmt.setString(++j, ship_date);
    pstmt.setString(++j, _apessid);
    pstmt.setString(++j, invoice_no);
    pstmt.setString(++j, supplier_id);
    pstmt.executeUpdate();
    pstmt.close();

    // invoice_detail
    // for insert
    sql = " update  invoice_apess_02t "
        + " set     description = ?, "
        + "         content = ?, "
        + "         category = ?, "
        + "         qty = ?, "
        + "         box_qty = ?, "
        + "         update_date = sysdate, "
        + "         update_id = ?, "
        + "         remarks2 = ? "
        + " where   po_no = ? ";
  
    pstmt = conn.prepareStatement(sql);

    // for insert if there is no row affected
    sql = " insert into invoice_apess_02t "
        + " ( "
        + "   po_no, style_no, invoice_no, description, content, category, qty, box_qty, unit_price, "
        + "   add_cost, remarks, brand, input_date, input_id, update_date, update_id, remarks2, disc_price "
        + " ) "
        + " values "
        + " ( "
        + "   ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, null, null, ?, ? "
        + " ) ";
  
    pstmt2 = conn.prepareStatement(sql);

    for (int i = 0; i < po_no.length; i++) {
      j = 0;
      pstmt.setString(++j, description[i]);
      pstmt.setString(++j, content[i]);
      pstmt.setString(++j, category[i]);
      pstmt.setString(++j, qty[i]);
      pstmt.setString(++j, box_qty[i]);
      pstmt.setString(++j, _apessid);
      pstmt.setString(++j, remarks2[i]);
      pstmt.setString(++j, po_no[i]);
      int iRet = pstmt.executeUpdate();

      if (iRet == 0) {
        j = 0;
        pstmt2.setString(++j, po_no[i]);
        pstmt2.setString(++j, style_no[i]);
        pstmt2.setString(++j, invoice_no);
        pstmt2.setString(++j, description[i]);
        pstmt2.setString(++j, content[i]);
        pstmt2.setString(++j, category[i]);
        pstmt2.setString(++j, qty[i]);
        pstmt2.setString(++j, box_qty[i]);
        pstmt2.setString(++j, unit_price[i]);
        pstmt2.setString(++j, add_cost[i]);
        pstmt2.setString(++j, remarks[i]);
        pstmt2.setString(++j, brand[i]);
        pstmt2.setString(++j, _apessid);
        pstmt2.setString(++j, remarks2[i]);
        pstmt2.setString(++j, disc_price[i]);
        pstmt2.executeUpdate();
      }
    }

  } else if (actionFlag.equals("DP")) {

    // delete POs
    String tmp_po_no = "";

    for (int i = 0; i < chk_po_no.length; i++) {
      if (i > 0) {
        tmp_po_no += ",";
      }
  
      tmp_po_no += "'" + chk_po_no[i] + "'";
    }

    sql = " delete  invoice_apess_02t "
        + " where   po_no in (" + tmp_po_no + ") ";

    pstmt = conn.prepareStatement(sql);
    pstmt.executeUpdate();

  } else {

    throw new UserDefinedException("The action is unknown.");

  }

  conn.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  strMsg = ue.getMessage();
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  System.out.println("Exception invoice_edit_save : " + e.getMessage());
  throw e;
} finally {
  if (rs != null) {
    try { rs.close(); } catch (Exception e) {}
  }

  if (stmt != null) {
    try { stmt.close(); } catch (Exception e) {}
  }

  if (pstmt != null) {
    try { pstmt.close(); } catch (Exception e) {}
  }

  if (pstmt2 != null) {
    try { pstmt2.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    dbPool.freeConnection("intranet", conn);
  }
}

// result message
if (isSucceeded) {
  strMsg = "The data are successfully processed.";
  nextUrl = "./invoice_view.jsp";
} else {
  strMsg = "The operation failed.\\n" + strMsg;
  nextUrl = "./invoice_edit_form.jsp";
}

      out.write(_jsp_string2, 0, _jsp_string2.length);
      out.print(( M ));
      out.write(_jsp_string3, 0, _jsp_string3.length);
      out.print(( ag_month ));
      out.write(_jsp_string4, 0, _jsp_string4.length);
      out.print(( ag_year ));
      out.write(_jsp_string5, 0, _jsp_string5.length);
      out.print(( ag_invoice_no ));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print(( invoice_no ));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print(( strMsg ));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print(( nextUrl ));
      out.write(_jsp_string9, 0, _jsp_string9.length);
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
    depend = new com.caucho.vfs.Depend(appDir.lookup("apess/invoice_edit_save.jsp"), 986847695648627354L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("apess/login_check.jsp"), 3743346625025852725L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("common/CommonVars.jsp"), 5055347195946766837L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("bottom_line.jsp"), 5941552803368297242L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
  }

  private final static char []_jsp_string2;
  private final static char []_jsp_string9;
  private final static char []_jsp_string4;
  private final static char []_jsp_string8;
  private final static char []_jsp_string0;
  private final static char []_jsp_string1;
  private final static char []_jsp_string6;
  private final static char []_jsp_string7;
  private final static char []_jsp_string3;
  private final static char []_jsp_string5;
  static {
    _jsp_string2 = "\n<HTML>\n<head>\n</head>\n<body>\n<form name='form1' method='post'>\n<input type='hidden' name='M' value='".toCharArray();
    _jsp_string9 = "';\nform1.submit();\n</script>\n</BODY>\n</HTML>\n".toCharArray();
    _jsp_string4 = "'>\n<input type='hidden' name='ag_year' value='".toCharArray();
    _jsp_string8 = "\");\nform1.action = '".toCharArray();
    _jsp_string0 = "\n\n\n\n".toCharArray();
    _jsp_string1 = "\n\n\n".toCharArray();
    _jsp_string6 = "'>\n<input type='hidden' name='invoice_no' value='".toCharArray();
    _jsp_string7 = "'>\n</form>\n<script language='javascript'>\nalert(\"".toCharArray();
    _jsp_string3 = "'>\n<input type='hidden' name='ag_month' value='".toCharArray();
    _jsp_string5 = "'>\n<input type='hidden' name='ag_invoice_no' value='".toCharArray();
  }
}
