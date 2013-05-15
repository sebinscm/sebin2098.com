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

public class _admin_0faulty_0return_0search__jsp extends com.caucho.jsp.JavaPage
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



  public String getSupplierNameOptions(String selectedItem, boolean includeAll, String valueStr) {
    String retStr = "";
    int iRet = 0;
    String sql = "";
    DBConnManager dbPool = null;
    Connection conn = null;
    MatrixDataSet matrix = null;
    DataProcess dataProcess = null;

    try {
      sql = " select id, name from login_01t order by name ";

      dbPool = DBConnManager.getInstance();
      conn = dbPool.getConnection("intranet");
      matrix = new MatrixDataSet();
      dataProcess = new DataProcess();

      iRet = dataProcess.RetrieveData(sql, matrix, conn);

      if (includeAll) retStr += "<option value=''>All</option>";

      for (int i = 0; i < iRet; i++) {
        String id = matrix.getRowData(i).getData(0);
        String name = matrix.getRowData(i).getData(1);
        String value = "";

        if (valueStr.equals("id")) value = id;
        else if (valueStr.equals("name")) value = name;

        retStr += "<option value='" + value + "'"
                + (selectedItem.equals(value) ? " selected" : "")
                + ">" + id + "-" + name + "</option>";
      }
    } catch (Exception e) {
      retStr = "";
    } finally {
      if (conn != null) dbPool.freeConnection("intranet", conn);
    }

    return retStr;
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

      out.write(_jsp_string1, 0, _jsp_string1.length);
      
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";

String outS = "";
int iRet = 0;
dbconn.DBConnManager dbPool = null;
dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;
Connection connPronto = null;
String sql = "";

String ag_supplier = request.getParameter("ag_supplier");
String ag_month = request.getParameter("ag_month");
String ag_year = request.getParameter("ag_year");
if (ag_supplier == null) ag_supplier = "";
if (ag_month == null || ag_year == null) {
  ag_month = DateUtil.getToday("MM");
  ag_year = DateUtil.getToday("yyyy");
}

// create month and year optiones
String optionMonths = "";
String optionYears = "";
int iag_month = Integer.parseInt(ag_month);
int thisYear = Integer.parseInt(DateUtil.getToday("yyyy"));

for (int i = 1; i <= 12; i++) {
  optionMonths += "<option value='" + (i < 10 ? "0" + i : "" + i) + "'"
               + (i == iag_month ? " selected" : "") + ">"
               + (i < 10 ? "0" + i : "" + i) + "</option>";
}

for (int i = thisYear - 4; i <= thisYear; i++) {
  optionYears += "<option value='" + i + "' " + (ag_year.equals(i + "") ? "selected" : "") +">" + i + "</option>";
}

// set query
sql = " select  to_char(a.po_invoice_date, 'dd/mm/yyyy'), "
    + "         a.invoice_details, "
    + "         a.po_order_no, "
    + "         a.backorder_flag, "
    + "         b.cr_shortname, "
    + "         a.header_tax_rate, "
    + "         decode(a.po_currency_code, ' ', 'AUD', a.po_currency_code), "
    + "         -c.po_received_qty, "
    + "         -a.po_tax_amount, "
    //+ "         -a.invoice_amount "
    + "         -a.po_order_total "
    + " from    por5mf4 a "
    + "         left outer join cre5mfi b "
    + "           on a.cre_accountcode = b.cre_accountcode "
    + "         inner join "
    + "         ( "
    + "           select  po_order_no, "
    + "                   backorder_flag, "
    + "                   sum(po_received_qty) po_received_qty "
    + "           from    por5lnp "
    + "           where   po_received_qty < 0 "
    + "           group by po_order_no, backorder_flag "
    + "         ) c "
    + "           on a.po_order_no = c.po_order_no "
    + "           and a.backorder_flag = c.backorder_flag "
    + " where   a.po_order_status = '90' "
    + " and     a.po_order_type = 'R' "
    + " and     a.po_invoice_date >= to_date('" + ag_year + ag_month + "01', 'yyyymmdd') "
    + " and     a.po_invoice_date < add_months(to_date('" + ag_year + ag_month + "01', 'yyyymmdd'), 1) ";

if (!ag_supplier.equals("")) {
  sql += " and     a.cre_accountcode = '" + ag_supplier + "' ";
}

sql += " order by a.po_invoice_date, a.po_order_no ";
//out.println(sql);


try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  dbPool = DBConnManager.getInstance();
  connPronto = dbPool.getConnection("pronto");

  iRet = dataProcess.RetrieveData(sql, matrix, connPronto);

} catch (Exception e) {
  System.out.println("Exception in invoice_fault_return_search : " + e.getMessage());
  throw e;
} finally {
  if (connPronto != null) {
    dbPool.freeConnection("pronto", connPronto);
  }
}


// print out
for (int i = 0; i < iRet; i++) {
  int j = 0;

  String invoice_date = matrix.getRowData(i).getData(j++);
  String credit_note_no = matrix.getRowData(i).getData(j++);
  String po_no = matrix.getRowData(i).getData(j++);
  String backorder_flag = matrix.getRowData(i).getData(j++);
  String supplier_name = matrix.getRowData(i).getData(j++);
  double tax_rate = Double.parseDouble(matrix.getRowData(i).getData(j++));
  String currency = matrix.getRowData(i).getData(j++);
  int po_received_qty = Integer.parseInt(matrix.getRowData(i).getData(j++));
  double tax_amount = Double.parseDouble(matrix.getRowData(i).getData(j++));
  double invoice_amount = Double.parseDouble(matrix.getRowData(i).getData(j++));

  String bgColor = "#fffff0";
  if (i%2 > 0) bgColor = "#eeeee0";

  outS += "<tr align='center' class='table_list' style='background-color:" + bgColor + ";'>"
        + "  <td>" + invoice_date + "</td>"
        + "  <td>" + credit_note_no + "</td>"
        + "  <td><a href=\"javascript:fnView('" + po_no + "', '" + backorder_flag + "');\">" + po_no + backorder_flag + "</a></td>"
        + "  <td align='left'>" + supplier_name + "</td>"
        + "  <td align='right'>" + StringUtil.formatNumber(tax_rate, MONEY_FORMAT) + "</td>"
        + "  <td>" + currency + "</td>"
        + "  <td align='right'>" + StringUtil.formatNumber(po_received_qty, QTY_FORMAT) + "</td>"
        + "  <td align='right'>" + StringUtil.formatNumber(tax_amount, MONEY_FORMAT) + "</td>"
        + "  <td align='right'>" + StringUtil.formatNumber(invoice_amount, MONEY_FORMAT) + "</td>"
        + "  <td align='right'>" + StringUtil.formatNumber(tax_amount + invoice_amount, MONEY_FORMAT) + "</td>"
        + "</tr>";
  
}

      out.write(_jsp_string2, 0, _jsp_string2.length);
      out.print(( getSupplierNameOptions(ag_supplier, true, "id") ));
      out.write(_jsp_string3, 0, _jsp_string3.length);
      out.print(( optionMonths ));
      out.write(_jsp_string4, 0, _jsp_string4.length);
      out.print(( optionYears ));
      out.write(_jsp_string5, 0, _jsp_string5.length);
      out.print(( outS ));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print(( ag_supplier ));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print(( ag_month ));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print(( ag_year ));
      out.write(_jsp_string9, 0, _jsp_string9.length);
      out.print(( CopyRightLogo() ));
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
    depend = new com.caucho.vfs.Depend(appDir.lookup("order/admin_faulty_return_search.jsp"), -5767377143396117911L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("admin/login_check.jsp"), 6768457171426488389L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("bottom_line.jsp"), 5941552803368297242L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("common/getSupplierNameOptions.jsp"), -5604839093945239777L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
  }

  private final static char []_jsp_string9;
  private final static char []_jsp_string8;
  private final static char []_jsp_string3;
  private final static char []_jsp_string0;
  private final static char []_jsp_string5;
  private final static char []_jsp_string1;
  private final static char []_jsp_string2;
  private final static char []_jsp_string7;
  private final static char []_jsp_string10;
  private final static char []_jsp_string4;
  private final static char []_jsp_string6;
  static {
    _jsp_string9 = "'>\n<input type='hidden' name='po_no_selected'>\n<input type='hidden' name='backorder_flag_selected'>\n</form>\n</table>\n\n".toCharArray();
    _jsp_string8 = "'>\n<input type='hidden' name='ag_year' value='".toCharArray();
    _jsp_string3 = "</select></td>\n  <td width='15%' class='table_header_center'>Date</td>\n  <td width='15%' class='table_bg_bright_center'>\n    <select name='ag_month'>".toCharArray();
    _jsp_string0 = "\n\n\n\n\n\n\n".toCharArray();
    _jsp_string5 = "</select></td>\n  <td width='15%' class='table_bg_bright_center'><input type='button' value='Search' onclick='fnSearch(this.form);'></td>\n</tr>\n</table>\n<table border='0' cellspacing='0' cellspadding='0'>\n<tr>\n  <td height='15'></td>\n</tr>\n</table>\n\n<table width='99%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\n<tr class='table_header_center'>\n  <td>Invoice Date</td>\n  <td>Credit Note No</td>\n  <td>PO No</td>\n  <td>Supplier Name</td>\n  <td>GST %</td>\n  <td>Currency</td>\n  <td>Total Qty</td>\n  <td>GST</td>\n  <td>Net Amount</td>\n  <td>Total Amount</td>\n</tr>\n".toCharArray();
    _jsp_string1 = "\n\n\n\n".toCharArray();
    _jsp_string2 = "\n<html>\n<head>\n<link href='/common/css/style.css' rel='stylesheet' type='text/css'>\n<script language='javascript'>\nfunction fnSearch(frm) {\n  frm.action = './admin_faulty_return_search.jsp';\n  frm.submit();\n}\n\nfunction fnView(po_no_selected, backorder_flag_selected) {\n  document.form2.po_no_selected.value = po_no_selected;\n  document.form2.backorder_flag_selected.value = backorder_flag_selected;\n  document.form2.action = \"./return_invoice_detail.jsp\";\n  document.form2.submit();\n}\n</script>\n</head>\n<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>\n<table width='840' border='0' cellspacing='0' cellpadding='0'>\n<tr><td>\n\n<table width='99%' border='0' cellspacing='0' cellpadding='0' align='center'>\n<tr>\n  <td height='15' colspan='2'></td>\n</tr>\n<tr>\n  <td width='3%'><img src='/img/title_icon.gif'></td>\n  <td width='*'class='left_title'>Faulty Return Invoice</td>\n</tr>\n<tr>\n  <td width='100%' height='2' colspan='2'><hr width='100%'></td>\n</tr>\n<tr>\n  <td height='15' colspan='2'></td>\n</tr>\n</table>\n\n<table width='99%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\n<form name='form1' method='post'>\n<tr>\n  <td width='15%' class='table_header_center'>Supplier</td>\n  <td width='*' colspan='3' class='table_bg_bright'><select name='ag_supplier'>".toCharArray();
    _jsp_string7 = "'>\n<input type='hidden' name='ag_month' value='".toCharArray();
    _jsp_string10 = "\n\n</td></tr></table>\n<iframe name='hiddenFrm' src='' width='0' height='0' frameborder='0'></iframe>\n</body>\n</html>\n".toCharArray();
    _jsp_string4 = "</select>\n    <select name='ag_year'>".toCharArray();
    _jsp_string6 = "\n</form>\n<form name='form2' method='post'>\n<input type='hidden' name='ag_supplier' value='".toCharArray();
  }
}