/*
 * JSP generated by Resin-3.1.9 (built Mon, 13 Apr 2009 11:09:12 PDT)
 */

package _jsp._admin._buyer;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import java.sql.*;
import common.*;
import common.util.*;
import dbconn.*;

public class _original_0sample_0in_0out_0save__jsp extends com.caucho.jsp.JavaPage
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

      out.write('\n');
      
String curPage = request.getParameter("curPage");
String pageSize = request.getParameter("pageSize");
String searchItemClass = request.getParameter("searchItemClass");
String searchFromDate = request.getParameter("searchFromDate");
String searchToDate = request.getParameter("searchToDate");
String searchSupplier = request.getParameter("searchSupplier");
String searchItemGroup = request.getParameter("searchItemGroup");
String searchBuyer = request.getParameter("searchBuyer");
String searchSampleNo = request.getParameter("searchSampleNo");
String searchNotReceivedOnly = request.getParameter("searchNotReceivedOnly");
if (searchNotReceivedOnly == null) searchNotReceivedOnly = "";

String actionFlag = request.getParameter("actionFlag");
String sequenceNo = request.getParameter("sequenceNo");
String item_class = request.getParameter("item_class");
String times = request.getParameter("times");
String buyer = request.getParameter("buyer");
String inputDate = request.getParameter("inputDate");
String qty = request.getParameter("qty");
String place = request.getParameter("place");
String item_group = request.getParameter("item_group");
String supplier = request.getParameter("supplier");
String sendingDate = request.getParameter("sendingDate");
String returnDate = request.getParameter("returnDate");
String remarks = request.getParameter("remarks").trim();

String sql = "";
int iCnt = 0;
boolean isSucceeded = false;
String strMsg = "";
DBConnManager dbPool = null;
dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;
Connection connScm = null;
PreparedStatement pstmt = null;

try {

  // insert/update/delete \u00c3\u00b3\u00b8\u00ae...
  int idx = 1;
  dbPool = dbconn.DBConnManager.getInstance();
  connScm = dbPool.getConnection("intranet");
  connScm.setAutoCommit(false);

  // actionFlag\u00bf\u00a1 \u00b5\u00fb\u00b6\u00f3 \u00c3\u00b3\u00b8\u00ae\u00c7\u00d4.
  if (actionFlag.equals("I")) {

    // read next sample no
    sql = " select  '" + item_class + "'||to_char(sysdate, 'yymm'), "
        + "         nvl(max(to_number(substr(sample_no, 6, 3)))+1, 1) "
        + " from    vg_sample_in_out "
        + " where   substr(sample_no, 1, 5) = '" + item_class + "'||to_char(sysdate, 'yymm') ";

    dataProcess = new dbconn.DataProcess();
    matrix = new dbconn.MatrixDataSet();
    dataProcess.RetrieveData(sql, matrix, connScm);
    int j = 0;
    String sampleNo = matrix.getRowData(0).getData(j++);
    int nextNo = Integer.parseInt(matrix.getRowData(0).getData(j++));

    int iTimes = Integer.parseInt(times);
    String item_brand = String.valueOf((Integer.parseInt(item_class)+1)/2);

    // insert...
    sql = " insert into VG_SAMPLE_IN_OUT "
        + " ( "
        + "   sequence_no, sample_no, item_brand, item_class, input_date, item_group, qty, buyer, supplier, "
        + "   sending_date, return_date, remarks, modifier, modified_date, place "
        + " ) "
        + " values "
        + " ( "
        + "   sample_seq.nextval, ?, ?, ?, to_date(?, 'dd/mm/yyyy'), ?, ?, ?, ?, "
        + "   to_date(?, 'dd/mm/yyyy'), to_date(?, 'dd/mm/yyyy'), ?, ?, sysdate, ? "
        + " ) ";

    pstmt = connScm.prepareStatement(sql);

    for (int i = 0; i < iTimes; i++) {
      idx = 1;
      pstmt.setString(idx++, sampleNo+StringUtil.formatNumber(nextNo++, "000"));
      pstmt.setString(idx++, item_brand);
      pstmt.setString(idx++, item_class);
      pstmt.setString(idx++, inputDate);
      pstmt.setString(idx++, item_group);
      pstmt.setString(idx++, qty);
      pstmt.setString(idx++, buyer);
      pstmt.setString(idx++, supplier);
      pstmt.setString(idx++, sendingDate);
      pstmt.setString(idx++, returnDate);
      pstmt.setString(idx++, remarks);
      pstmt.setString(idx++, _adminid);
      pstmt.setString(idx++, place);
      pstmt.executeUpdate();
    }

  } else if (actionFlag.equals("U")) {

    // update..
    sql = " update  VG_SAMPLE_IN_OUT "
        + " set "
        + "   input_date = to_date(?, 'dd/mm/yyyy'), "
        + "   item_group = ?, "
        + "   qty = ?, "
        + "   buyer = ?, "
        + "   supplier = ?, "
        + "   sending_date = to_date(?, 'dd/mm/yyyy'), "
        + "   return_date = to_date(?, 'dd/mm/yyyy'), "
        + "   remarks = ?, "
        + "   modifier = ?, "
        + "   modified_date = sysdate "
        + " where   sequence_no = ? ";

    pstmt = connScm.prepareStatement(sql);
    pstmt.setString(idx++, inputDate);
    pstmt.setString(idx++, item_group);
    pstmt.setString(idx++, qty);
    pstmt.setString(idx++, buyer);
    pstmt.setString(idx++, supplier);
    pstmt.setString(idx++, sendingDate);
    pstmt.setString(idx++, returnDate);
    pstmt.setString(idx++, remarks);
    pstmt.setString(idx++, _adminid);
    pstmt.setString(idx++, sequenceNo);
    iCnt = pstmt.executeUpdate();

    if (iCnt != 1) {
      throw new UserDefinedException("Check your data.");
    }

  } else if (actionFlag.equals("D")) {

    // delete..
    sql = " delete  VG_SAMPLE_IN_OUT "
        + " where   sequence_no = ? ";

    pstmt = connScm.prepareStatement(sql);
    pstmt.setString(idx++, sequenceNo);
    iCnt = pstmt.executeUpdate();

    if (iCnt != 1) {
      throw new UserDefinedException("Check your data.");
    }

  } else {

    throw new UserDefinedException("The action is unknown.");

  }

  connScm.commit();
  isSucceeded = true;

  // save SGR, inputDate, PGR in session
  // to avoid repeated input
  if (actionFlag.equals("I")) {
    //session.setAttribute("_InOutSgr", item_class);
    session.setAttribute("_InOutInputDate", inputDate);
    session.setAttribute("_InOutItemGroup", item_group);
  }

} catch (UserDefinedException ue) {
  try { connScm.rollback(); } catch (Exception ex) {}

  strMsg = ue.getMessage();
} catch (Exception e) {
  try { connScm.rollback(); } catch (Exception ex) {}

  System.out.println("Exception /admin/buyer/original_sample_in_out_save : " + e.getMessage());
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

// \u00b0\u00e1\u00b0\u00fa \u00b8\u00de\u00bd\u00c3\u00c1\u00f6 \u00c3\u00b3\u00b8\u00ae
if (isSucceeded) strMsg = "The data are successfully processed.";
else strMsg = "The operation failed.\\n" + strMsg;

      out.write(_jsp_string1, 0, _jsp_string1.length);
      out.print(( curPage ));
      out.write(_jsp_string2, 0, _jsp_string2.length);
      out.print(( pageSize ));
      out.write(_jsp_string3, 0, _jsp_string3.length);
      out.print(( searchFromDate ));
      out.write(_jsp_string4, 0, _jsp_string4.length);
      out.print(( searchToDate ));
      out.write(_jsp_string5, 0, _jsp_string5.length);
      out.print(( searchBuyer ));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print(( searchItemClass ));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print(( searchSupplier ));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print(( searchItemGroup ));
      out.write(_jsp_string9, 0, _jsp_string9.length);
      out.print(( searchSampleNo ));
      out.write(_jsp_string10, 0, _jsp_string10.length);
      out.print(( searchNotReceivedOnly ));
      out.write(_jsp_string11, 0, _jsp_string11.length);
      out.print(( strMsg ));
      out.write(_jsp_string12, 0, _jsp_string12.length);
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
    depend = new com.caucho.vfs.Depend(appDir.lookup("admin/buyer/original_sample_in_out_save.jsp"), -4180306208058410263L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("admin/login_check.jsp"), 6768457171426488389L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("common/CommonVars.jsp"), 5055347195946766837L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
  }

  private final static char []_jsp_string5;
  private final static char []_jsp_string2;
  private final static char []_jsp_string6;
  private final static char []_jsp_string4;
  private final static char []_jsp_string10;
  private final static char []_jsp_string8;
  private final static char []_jsp_string1;
  private final static char []_jsp_string3;
  private final static char []_jsp_string11;
  private final static char []_jsp_string0;
  private final static char []_jsp_string9;
  private final static char []_jsp_string12;
  private final static char []_jsp_string7;
  static {
    _jsp_string5 = "'>\n<input type='hidden' name='searchBuyer' value='".toCharArray();
    _jsp_string2 = "\">\n<input type=\"hidden\" name=\"pageSize\" value=\"".toCharArray();
    _jsp_string6 = "'>\n<input type='hidden' name='searchItemClass' value='".toCharArray();
    _jsp_string4 = "'>\n<input type='hidden' name='searchToDate' value='".toCharArray();
    _jsp_string10 = "'>\n<input type='hidden' name='searchNotReceivedOnly' value='".toCharArray();
    _jsp_string8 = "'>\n<input type='hidden' name='searchItemGroup' value='".toCharArray();
    _jsp_string1 = "\n<html>\n<head>\n<title></title>\n</head>\n<body>\n<form name=\"form1\" method=\"post\" action=\"./original_sample_in_out_list.jsp\">\n<input type=\"hidden\" name=\"curPage\" value=\"".toCharArray();
    _jsp_string3 = "\">\n<input type='hidden' name='searchFromDate' value='".toCharArray();
    _jsp_string11 = "'>\n</form>\n<script language=\"javascript\">\n  alert('".toCharArray();
    _jsp_string0 = "\n\n\n\n\n".toCharArray();
    _jsp_string9 = "'>\n<input type='hidden' name='searchSampleNo' value='".toCharArray();
    _jsp_string12 = "');\n  document.form1.submit();\n</script>\n</body>\n</html>\n".toCharArray();
    _jsp_string7 = "'>\n<input type='hidden' name='searchSupplier' value='".toCharArray();
  }
}
