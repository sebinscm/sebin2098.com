/*
 * JSP generated by Resin-3.1.9 (built Mon, 13 Apr 2009 11:09:12 PDT)
 */

package _jsp._admin._buyer;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import java.sql.*;
import common.util.*;
import dbconn.*;

public class _original_0sample_0history_0print__jsp extends com.caucho.jsp.JavaPage
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
      
String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";

String curPage = request.getParameter("curPage");
String pageSize = request.getParameter("pageSize");
String searchItemBrand = request.getParameter("searchItemBrand");
String searchPlace = request.getParameter("searchPlace");
String searchPurchaser = request.getParameter("searchPurchaser");
String searchPurBrand = request.getParameter("searchPurBrand");
String searchFromDate = request.getParameter("searchFromDate");
String searchToDate = request.getParameter("searchToDate");

// paging \u00b0\u00fc\u00b7\u00c3 \u00ba\u00af\u00bc\u00f6
int iCurPage = 1;
int iPageSize = 20;
int iTotalPage = 1;
int iPageBlockSize = 10;
int iTotalCnt = 0;
int iBeginRownum = 0;
int iEndRownum = 0;
String pageList = "";
int sumQty = 0;
int sumNonQty = 0;
int sumTotalQty = 0;
double sumAmount = 0.0d;
double sumNonAmount = 0.0d;
double sumTotalAmount = 0.0d;

try {
  iCurPage = Integer.parseInt(curPage);
  iPageSize = Integer.parseInt(pageSize);
} catch (NumberFormatException ne) {}

int iRet = 0;
String outS = "";
String sql = "";
String cntSql = "";
String mainSql = "";
String conditionSql = "";

Connection connScm = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
DBConnManager dbPool = null;

// set query
cntSql = " select count(*) from VG_SAMPLE_ENTRY a ";

mainSql = " select  a.sample_no, a.item_brand, to_char(a.input_date, 'dd/mm/yyyy'), a.place, b.place place_nm, "
        + "         upper(a.purchaser), a.brand, c.code_name, nvl(a.qty, 0) qty, a.currency, nvl(a.price, 0) price, a.finance_confirm, "
        + "         nvl(a.non_qty, 0) non_qty, nvl(a.non_price, 0) non_price, d.code_name credit_card_name, "
        + "         e.code_name item_brand_nm "
        + " from    VG_SAMPLE_ENTRY a "
        + "         left outer join VG_SAMPLE_PLACE b "
        + "           on a.place = b.seq_no "
        + "         left outer join VG_COMMON_CODE c "
        + "           on a.brand = c.code "
        + "           and c.type = 'SAMPLE_BRAND' "
        + "         left outer join VG_COMMON_CODE d "
        + "           on a.credit_card_type = d.code "
        + "           and d.type = 'CARD_TYPE' "
        + "         left outer join VG_COMMON_CODE e "
        + "           on a.item_brand = e.code "
        + "           and e.type = 'USER_BRAND2' ";

conditionSql = " where   a.input_date between to_date('" + searchFromDate + "', 'dd/mm/yyyy') "
             + "         and  to_date('" + searchToDate + "', 'dd/mm/yyyy') ";

if (!searchItemBrand.equals("")) {
  conditionSql += " and    a.item_brand = " + searchItemBrand;
}

if (!searchPlace.equals("")) {
  conditionSql += " and    a.place = " + searchPlace;
}

if (!searchPurchaser.equals("")) {
  conditionSql += " and    upper(a.purchaser) = '" + searchPurchaser + "' ";
}

if (!searchPurBrand.equals("")) {
  conditionSql += " and    a.brand = " + searchPurBrand;
}

conditionSql += " order by a.input_date desc, a.sample_no desc ";

try {

  dataProcess = new dbconn.DataProcess();
  matrix = new dbconn.MatrixDataSet();
  dbPool = dbconn.DBConnManager.getInstance();
  connScm = dbPool.getConnection("intranet");

  // read total count
  dataProcess.RetrieveData(cntSql + conditionSql, matrix, connScm);

  iTotalCnt = Integer.parseInt(matrix.getRowData(0).getData(0));
  iTotalPage = (iTotalCnt - 1)/iPageSize + 1;
  
  if (iCurPage > iTotalPage) {
    iCurPage = iTotalPage;
    curPage = iCurPage + "";
  }

  iBeginRownum = (iCurPage - 1)*iPageSize + 1;
  iEndRownum = iBeginRownum + iPageSize - 1;

  // read original sample history by condition
  sql = " select  * "
      + " from    ( "
      + "           select  rownum rnum, innerview.* "
      + "           from    ( "
      +                       mainSql + conditionSql
      + "                   ) innerview "
      + "           where   rownum <= " + iEndRownum
      + "         ) "
      + " where   rnum >= " + iBeginRownum;

  //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, connScm);

} catch (Exception e) {
  System.out.println("Exception original_sample_history_print : " + e.getMessage());
  throw e;
} finally {
  if (connScm != null) {
    dbPool.freeConnection("intranet", connScm);
  }
}

// print out history list
for (int i = 0; i < iRet; i++) {
  int j = 0;
  j++;                  // Skip reading rnum
  String sampleNo       = matrix.getRowData(i).getData(j++);
  String brand          = matrix.getRowData(i).getData(j++);
  String inputDate      = matrix.getRowData(i).getData(j++);
  String place          = matrix.getRowData(i).getData(j++);
  String placeNm        = matrix.getRowData(i).getData(j++);
  String purchaser      = matrix.getRowData(i).getData(j++);
  String purBrand       = matrix.getRowData(i).getData(j++);
  String purBrandNm     = matrix.getRowData(i).getData(j++);
  int qty               = Integer.parseInt(matrix.getRowData(i).getData(j++));
  String currency       = matrix.getRowData(i).getData(j++);
  double price          = Double.parseDouble(matrix.getRowData(i).getData(j++));
  String financeConfirm = matrix.getRowData(i).getData(j++);
  int non_qty           = Integer.parseInt(matrix.getRowData(i).getData(j++));
  double non_price      = Double.parseDouble(matrix.getRowData(i).getData(j++));
  String creditCardTypeNm = matrix.getRowData(i).getData(j++);
  String brandNm = matrix.getRowData(i).getData(j++);

  int total_qty = qty + non_qty;
  double total_price = price + non_price;

  sumQty += qty;
  sumNonQty += non_qty;
  sumTotalQty += total_qty;
  sumAmount += price;
  sumNonAmount += non_price;
  sumTotalAmount += total_price;

  outS += "<tr align='center'>"
        + " <td>" + sampleNo + "</td>"
        + " <td>" + brandNm + "</td>"
        + " <td>" + inputDate + "</td>"
        + " <td>" + placeNm + "</td>"
        + " <td align='left'>" + purchaser + "</td>"
        + " <td align='left'>" + purBrandNm + "&nbsp;</td>"
        + " <td align='right'>" + StringUtil.formatNumber(qty, QTY_FORMAT) + "</td>"
        + " <td align='right'>" + StringUtil.formatNumber(non_qty, QTY_FORMAT) + "</td>"
        + " <td align='right'>" + StringUtil.formatNumber(total_qty, QTY_FORMAT) + "</td>"
        + " <td>" + currency + "</td>"
        + " <td align='right'>" + StringUtil.formatNumber(price, MONEY_FORMAT) + "</td>"
        + " <td align='right'>" + StringUtil.formatNumber(non_price, MONEY_FORMAT) + "</td>"
        + " <td align='right'>" + StringUtil.formatNumber(total_price, MONEY_FORMAT) + "</td>"
        + " <td>" + financeConfirm + "</td>"
        + " <td nowrap>" + creditCardTypeNm + "&nbsp;</td>"
        + "</tr>";
}

// calculate height

      out.write(_jsp_string1, 0, _jsp_string1.length);
      out.print(( outS ));
      out.write(_jsp_string2, 0, _jsp_string2.length);
      out.print(( StringUtil.formatNumber(sumQty, QTY_FORMAT) ));
      out.write(_jsp_string3, 0, _jsp_string3.length);
      out.print(( StringUtil.formatNumber(sumNonQty, QTY_FORMAT) ));
      out.write(_jsp_string3, 0, _jsp_string3.length);
      out.print(( StringUtil.formatNumber(sumTotalQty, QTY_FORMAT) ));
      out.write(_jsp_string4, 0, _jsp_string4.length);
      out.print(( StringUtil.formatNumber(sumAmount, MONEY_FORMAT) ));
      out.write(_jsp_string3, 0, _jsp_string3.length);
      out.print(( StringUtil.formatNumber(sumNonAmount, MONEY_FORMAT) ));
      out.write(_jsp_string3, 0, _jsp_string3.length);
      out.print(( StringUtil.formatNumber(sumTotalAmount, MONEY_FORMAT) ));
      out.write(_jsp_string5, 0, _jsp_string5.length);
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
    depend = new com.caucho.vfs.Depend(appDir.lookup("admin/buyer/original_sample_history_print.jsp"), -9117907654998727604L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("admin/login_check.jsp"), 6768457171426488389L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("common/CommonVars.jsp"), 5055347195946766837L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
  }

  private final static char []_jsp_string2;
  private final static char []_jsp_string0;
  private final static char []_jsp_string3;
  private final static char []_jsp_string5;
  private final static char []_jsp_string1;
  private final static char []_jsp_string4;
  static {
    _jsp_string2 = "\n<tr class='table_header'>\n  <td colspan='6'>Total</td>\n  <td align='right'>".toCharArray();
    _jsp_string0 = "\n\n\n\n".toCharArray();
    _jsp_string3 = "</td>\n  <td align='right'>".toCharArray();
    _jsp_string5 = "</td>\n  <td>&nbsp;</td>\n  <td>&nbsp;</td>\n</tr>\n</table>\n\n</td></tr>\n<tr><td height='90' valign='top'>\n\n<table width='100%' border='0' cellspacing='0' cellpadding='2'>\n<tr>\n  <td width=\"100%\" height=\"30\"></td>\n</tr>\n</table>\n<table width='100%' border='0' cellspacing='0' cellpadding='2'>\n<tr>\n  <td width=\"100%\" align='right'><table width='400' border='1' bordercolor='black' cellspacing='0' cellpadding='2'>\n    <tr class='table_header'>\n      <td width='100'>Applicant</td>\n      <td width='100'>Leader</td>\n      <td width='100'>Manager</td>\n      <td width='100'>Director</td>\n    </tr>\n    <tr height='40'>\n      <td>&nbsp;</td>\n      <td>&nbsp;</td>\n      <td>&nbsp;</td>\n      <td>&nbsp;</td>\n    </tr>\n  </table></td>\n</tr>\n</table>\n</td></tr></table>\n</body>\n</html>\n".toCharArray();
    _jsp_string1 = "\n<html>\n<head>\n<title>Original Sample Application Form</title>\n<link href='/order/style_print.css' rel='stylesheet' type='text/css'>\n</head>\n<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0' onload='window.print();'>\n<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align='center'>\n<tr><td height='950' valign='top'>\n\n<table width='100%' border='0' cellspacing='0' cellpadding='2'>\n<tr>\n  <td width=\"100%\" height=\"30\"></td>\n</tr>\n</table>\n<table width='100%' border='0' cellspacing='0' cellpadding='2'>\n<tr>\n  <td width='100%' align='center'><span class='font_title1'>Original Sample Application Form</span></td>\n</tr>\n</table>\n<table width='100%' border='0' cellspacing='0' cellpadding='2'>\n<tr>\n  <td width=\"100%\" height=\"30\"></td>\n</tr>\n</table>\n<table width='100%' border='0' cellspacing='0' cellpadding='2'>\n<tr>\n  <td width=\"40%\"><img src='/img/FFB_top_logo.gif' border='0'></td>\n  <td width=\"60%\" align='right'><table width='400' border='1' bordercolor='black' cellspacing='0' cellpadding='2'>\n    <tr class='table_header'>\n      <td width='100'>Applicant</td>\n      <td width='100'>Leader</td>\n      <td width='100'>Manager</td>\n      <td width='100'>Director</td>\n    </tr>\n    <tr height='40'>\n      <td>&nbsp;</td>\n      <td>&nbsp;</td>\n      <td>&nbsp;</td>\n      <td>&nbsp;</td>\n    </tr>\n  </table></td>\n</tr>\n</table>\n<table width='100%' border='0' cellspacing='0' cellpadding='2'>\n<tr>\n  <td width=\"100%\" height=\"30\"></td>\n</tr>\n</table>\n<table width='100%' border='1' bordercolor='black' cellspacing='0' cellpadding='2'>\n<tr class='table_header'>\n  <td rowspan='2'>Sequence No</td>\n  <td rowspan='2'>Brand</td>\n  <td rowspan='2'>Date</td>\n  <td rowspan='2'>Place</td>\n  <td rowspan='2'>Purchaser</td>\n  <td rowspan='2'>Pur. Brand</td>\n  <td colspan='3'>Qty</td>\n  <td colspan='4'>Amount</td>\n  <td rowspan='2'>CFM</td>\n  <td rowspan='2'>Credit Card</td>\n</tr>\n<tr class='table_header'>\n  <td>Apr.</td>\n  <td>Non.</td>\n  <td>Tot.</td>\n  <td>Cur.</td>\n  <td>Apr.</td>\n  <td>Non.</td>\n  <td>Tot.</td>\n</tr>\n".toCharArray();
    _jsp_string4 = "</td>\n  <td>&nbsp;</td>\n  <td align='right'>".toCharArray();
  }
}