/*
 * JSP generated by Resin-3.1.9 (built Mon, 13 Apr 2009 11:09:12 PDT)
 */

package _jsp._order;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import java.text.*;
import common.util.*;
import dbconn.*;

public class _invoice_0fault_0return_0search_0old__jsp extends com.caucho.jsp.JavaPage
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
    str += "Contact <FONT color=blue><A href='mailto:scm@fastfuturebrands.com.au'>scm@fastfuturebrands.com.au</A></FONT>";
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

String scmid = "";
String scmnm = "";
String usertype = "";
String usergroup = "";
String scmsubids = "";
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

  scmsubids = (String) session.getAttribute("scmsubids");
  //session.setMaxInactiveInterval(60*60);

}catch( Exception e ) {
  response.sendRedirect("/login_first.html");
  return;
}

      out.write(_jsp_string1, 0, _jsp_string1.length);
      
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

// Apess MU rate
double _MURate = 0.25;

// Ex-Factory Price Rate
double _EXRate = 0.05;


// Ex-Factory Price Rate for Apess2
double _EXRate2 = 0.05;

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
      
String outS = "";
int iRet = 0;
dbconn.DBConnManager dbPoll = null;
dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;
Connection connFutura = null;
String sql = "";

String searchMonth = request.getParameter("searchMonth");
String searchYear = request.getParameter("searchYear");
if (searchMonth == null || searchYear == null) {
  searchMonth = DateUtil.getToday("MM");
  searchYear = DateUtil.getToday("yyyy");
}

// create month and year optiones
String optionMonths = "";
String optionYears = "";
int iSearchMonth = Integer.parseInt(searchMonth);
int thisYear = Integer.parseInt(DateUtil.getToday("yyyy"));

for (int i = 1; i <= 12; i++) {
  optionMonths += "<option value='" + (i < 10 ? "0" + i : "" + i) + "'"
               + (i == iSearchMonth ? " selected" : "") + ">"
               + (i < 10 ? "0" + i : "" + i) + "</option>";
}

for (int i = thisYear - 4; i <= thisYear; i++) {
  optionYears += "<option value='" + i + "' " + (searchYear.equals(i + "") ? "selected" : "") +">" + i + "</option>";
}

// Data query ..
try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Class.forName(_mssqlJdbcDriver);
  connFutura = DriverManager.getConnection(_urlFutura, _userFutura, _pwFutura);

  sql = " SELECT LFS_DATOK, "                       // DN OK Date
      + "        LFS_LFS del_note_no, "             // Del Note No
      + "        LFS_KNR supplier_no, "             // Supplier No
      + "        ADD_INDEX, "                       // Supplier Name
      + "        LFS_RNR "                          // Inv No
      + "   FROM LIEFHEAD WITH (NOLOCK), "
      + "        ADR_DATA WITH (NOLOCK) "
      + "  WHERE LFS_ORIGNR=1 "
      + "    AND LFS_ANG_ANR=0 "
      + "    AND LFS_KTYP = 4 "
      + "    AND ADD_TYP =4 "
      + "    AND ADD_NUMMER = LFS_KNR "
      + "    AND LFS_KNR = " + scmid
      + "    AND LFS_DATOK/100 = " + searchYear + searchMonth
      + "  ORDER BY LFS_LFS DESC ";

  iRet = dataProcess.RetrieveData(sql, matrix, connFutura);

  int k = 0;

  for (int i = 0; i < iRet; i++) {
    int j = 0;

    String dnOkDate = matrix.getRowData(i).getData(j++);
    String delNoteNo = matrix.getRowData(i).getData(j++);
    String supplierNo = matrix.getRowData(i).getData(j++);
    String supplierName = matrix.getRowData(i).getData(j++);
    String invNo = matrix.getRowData(i).getData(j++);

    dnOkDate = dnOkDate.substring(6) + "/" + dnOkDate.substring(4, 6) + "/" + dnOkDate.substring(0, 4);

    String fileUrl = "";
    File invoiceFile = new File(application.getRealPath(_faultReturnInvoiceFileURL)
                            + File.separator + supplierNo + "_" + invNo + ".pdf");

    if (invoiceFile.exists()) {
      fileUrl = "<a href=\"javascript:fnDownload('" + invoiceFile.getName() + "');\">" + invoiceFile.getName() + "</a>";

      String bgColor = "#fffff0";
      if (k++%2 > 0) bgColor = "#eeeee0";

      outS += "<tr align='center' class='table_list' style='background-color:" + bgColor + ";'>"
            + "  <td>" + dnOkDate + "</td>"
            + "  <td>" + delNoteNo + "</td>"
            + "  <td align='right'>" + invNo + "</td>"
            + "  <td>" + supplierNo + "</td>"
            + "  <td>" + supplierName + "</td>"
            + "  <td>" + fileUrl + "</td>"
            + "</tr>";
    }
  }

} catch (Exception e) {
  System.out.println("Exception in invoice_fault_return_search_old : " + e.getMessage());
  throw e;
} finally {
  if (connFutura != null) {
    try { connFutura.close(); } catch (Exception e) {}
  }
}

      out.write(_jsp_string2, 0, _jsp_string2.length);
      out.print(( optionMonths ));
      out.write(_jsp_string3, 0, _jsp_string3.length);
      out.print(( optionYears ));
      out.write(_jsp_string4, 0, _jsp_string4.length);
      out.print(( outS ));
      out.write(_jsp_string5, 0, _jsp_string5.length);
      out.print(( _faultReturnInvoiceFileURL ));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print(( CopyRightLogo() ));
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
    depend = new com.caucho.vfs.Depend(appDir.lookup("order/invoice_fault_return_search_old.jsp"), 68872312608808992L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("login_check.jsp"), -1755892913547665674L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("bottom_line.jsp"), 2208872747581278893L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("common/CommonVars.jsp"), -5170805388265383793L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
  }

  private final static char []_jsp_string0;
  private final static char []_jsp_string4;
  private final static char []_jsp_string2;
  private final static char []_jsp_string1;
  private final static char []_jsp_string6;
  private final static char []_jsp_string3;
  private final static char []_jsp_string5;
  private final static char []_jsp_string7;
  static {
    _jsp_string0 = "\n\n\n\n\n\n\n".toCharArray();
    _jsp_string4 = "</select>\n    &nbsp;&nbsp;<input type='button' value='Search' onclick='fnSearch(this.form);'></td>\n</tr>\n</table>\n<table border='0' cellspacing='0' cellspadding='0'>\n<tr>\n  <td height='15'></td>\n</tr>\n</table>\n\n<table width='90%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\n<tr class='table_header_center'>\n  <td width='18%'>DN Confirmed Date</td>\n  <td width='13%'>DN Number</td>\n  <td width='12%'>Inv No</td>\n  <td width='12%'>Supplier</td>\n  <td width='25%'>Supplier Name</td>\n  <td width='20%'>Return Invoice File</td>\n</tr>\n".toCharArray();
    _jsp_string2 = "\n<html>\n<head>\n<link href='/common/css/style.css' rel='stylesheet' type='text/css'>\n<script language='javascript'>\nfunction fnSearch(frm) {\n  frm.action = './invoice_fault_return_search_old.jsp';\n  frm.submit();\n}\n\nfunction fnDownload(file) {\n  with (document.form2) {\n    attachFile.value = file;\n    attachRealFile.value = file;\n    action = '/common/download.jsp';\n    target = 'hiddenFrm';\n    submit();\n  }\n}\n</script>\n</head>\n<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>\n<table width='840' border='0' cellspacing='0' cellpadding='0'>\n<tr><td>\n\n<table width='99%' border='0' cellspacing='0' cellpadding='0' align='center'>\n<tr>\n  <td height='15' colspan='2'></td>\n</tr>\n<tr>\n  <td width='3%'><img src='/img/title_icon.gif'></td>\n  <td width='*'class='left_title'>Faulty Return Invoice</td>\n</tr>\n<tr>\n  <td width='100%' height='2' colspan='2'><hr width='100%'></td>\n</tr>\n<tr>\n  <td height='15' colspan='2'></td>\n</tr>\n</table>\n\n<table width='90%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\n<form name='form1' method='post'>\n<tr>\n  <td width='100%' class='table_bg_bright_center'>Date :\n    <select name='searchMonth'>".toCharArray();
    _jsp_string1 = "\n\n\n".toCharArray();
    _jsp_string6 = "'>\n<input type='hidden' name='attachFile'>\n<input type='hidden' name='attachRealFile'>\n</form>\n</table>\n\n".toCharArray();
    _jsp_string3 = "</select>\n    <select name='searchYear'>".toCharArray();
    _jsp_string5 = "\n</form>\n<form name='form2' method='post'>\n<input type='hidden' name='attachPath' value='".toCharArray();
    _jsp_string7 = "\n\n</td></tr></table>\n<iframe name='hiddenFrm' src='' width='0' height='0' frameborder='0'></iframe>\n</body>\n</html>\n".toCharArray();
  }
}