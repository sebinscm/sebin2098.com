/*
 * JSP generated by Resin-3.1.9 (built Mon, 13 Apr 2009 11:09:12 PDT)
 */

package _jsp._order;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import dbconn.*;
import common.util.*;

public class _fob_0invoice_0confirm_0search__jsp extends com.caucho.jsp.JavaPage
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
    str += "Contact <FONT color=blue><A href='mailto:systemadmin@fastfuturebrands.com.au'>systemadmin@fastfuturebrands.com.au</A></FONT>";
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

// Sample Image Url
String _sampleIamgeUrl = "/image/SAMPLE_IMAGE";

// barcode file Image Url
String _barcodeFileUrl = "/image/Barcode";

// Invoice file path
String _invoiceFileUrl = "/order/inv_files";

// Apess MU rate
double _MURate = 0.25;

// Ex-Factory Price Rate
double _EXRate = 0.15;


// Ex-Factory Price Rate for Apess2
double _EXRate2 = 0.07;

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

int iRet = 0;
Connection connScm = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
DBConnManager dbPool = null;
String outS = "";
String sql = "";

// for creating invoice
String ag_brand = request.getParameter("ag_brand");
String ag_po_no = request.getParameter("ag_po_no");
String ag_orderby = request.getParameter("ag_orderby");
if (ag_brand == null) ag_brand = "1";
if (ag_po_no == null) ag_po_no = "";
if (ag_orderby == null) ag_orderby = "1";

// for adding POs
String ag_supplier = request.getParameter("ag_supplier");
String ag_month = request.getParameter("ag_month");
String ag_year = request.getParameter("ag_year");
String ag_search_inv_no = request.getParameter("ag_search_inv_no");
String inv_no = request.getParameter("inv_no");
String sup_id = request.getParameter("sup_id");
String actionFlag = request.getParameter("actionFlag");
if (ag_supplier == null) ag_supplier = "";
if (ag_month == null) ag_month = "";
if (ag_year == null) ag_year = "";
if (ag_search_inv_no == null) ag_search_inv_no = "";
if (inv_no == null) inv_no = "";
if (sup_id == null) sup_id = "";
if (actionFlag == null) actionFlag = "";

String brand_name = "";

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  dbPool = dbconn.DBConnManager.getInstance();
  connScm = dbPool.getConnection("intranet");

  // if this is for Adding POs then set the brand as the same value in the current invoice.
  // read brand info
  if (actionFlag.equals("AP")) {
    sql = " select  case "
        + "           when xspo_stock_group between '1000' and '2ZZZ' then '1' "
        + "           when xspo_stock_group between '3000' and '4ZZZ' then '2' "
        + "         end "
        + " from    xstpu22@pronto "
        + " where   xspo_po_order_no in ( "
        + "           select  po_no "
        + "           from    invoice_02t "
        + "           where   invoice_no = '" + inv_no + "' "
        + "           and     sup_id = '" + sup_id + "' "
        + "         ) "
        + " and     rownum = 1 ";

    //out.println(sql);
    iRet = dataProcess.RetrieveData(sql, matrix, connScm);

    if (iRet > 0) {
      ag_brand = matrix.getRowData(0).getData(0);
    }
  }

  // read data
  sql = " select  a.po_order_no, b.xspo_style, d.supplier_stkcd, d.packing_date, "
      + "         d.shipping_date, d.packing_qty "
      + " from    por5mf4@pronto a "
      + "         inner join xstpu22@pronto b "
      + "           on a.po_order_no = b.xspo_po_order_no "
      + "           and a.backorder_flag = b.backorder_flag "
      + "         inner join cre5mfi@pronto c "
      + "           on a.cre_accountcode = c.cre_accountcode "
      + "         inner join "
      + "         ( "
      + "           select  a.po_no po_no, "
      + "                   max(nvl(a.supplier_stkcd, '')) supplier_stkcd, "
      + "                   a.packing_date, a.shipping_date, "
      + "                   sum(nvl(b.ttl_qty, 0)) packing_qty "
      + "           from    packing_01t a, packing_03t b "
      + "           where   a.supplier_id = '" + scmid + "' "
      + (ag_po_no.equals("") ? "" : " and     a.po_no = '" + ag_po_no + "' ")
      + "           and     not exists ( select  /*+ PUSH_SUBQ */ 1 "
      + "                                from    invoice_02t g "
      + "                                where   g.po_no = a.po_no "
      + "                                and     g.sup_id = a.supplier_id ) "
      + "           and     a.po_no = b.po_no "
      + "           and     a.packing_date = b.packing_date "
      + "           and     a.style_no = b.style_no "
      + "           group by a.po_no, a.packing_date, a.shipping_date "
      + "         ) d "
      + "           on a.po_order_no = d.po_no "
      + " where   a.backorder_flag = ' ' "
      + " and     a.cre_accountcode = '" + scmid + "' "
      + (ag_po_no.equals("") ? "" : " and     a.po_order_no = " + ag_po_no)
      //+ " and     a.po_order_status between '40' and '42' "
      + " and     a.po_order_status between '40' and '90' "
      + " and     d.packing_date >= '20100401' "
      + " and     b.xspo_stock_group not in ('1888', '2888', '3888', '4888') "
      + " and     case "
      + "           when b.xspo_stock_group between '1000' and '2ZZZ' then '1' "
      + "           when b.xspo_stock_group between '3000' and '4ZZZ' then '2' "
      + "         end = '" + ag_brand + "' "
      + " and     c.cr_supplier_grp = 'FOB' "
      + " order by a.po_order_no ";

  //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, connScm);
  connScm.commit();

} catch (Exception e) {
  if (connScm != null) {
    try { connScm.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception invoice_confirm_search : " + e.getMessage());
  throw e;
} finally {
  if (connScm != null) {
    dataProcess = new DataProcess();
    dataProcess.ManipulateData("alter session close database link pronto", connScm);
    dbPool.freeConnection("intranet", connScm);
  }
}

for (int i = 0; i < iRet; i++) {
  int j = 0;
  String po_no = matrix.getRowData(i).getData(j++);
  String style_no = matrix.getRowData(i).getData(j++);
  String supplierStkcd = matrix.getRowData(i).getData(j++);
  String packingDate = matrix.getRowData(i).getData(j++);
  String shippingDate = matrix.getRowData(i).getData(j++);
  int packingQty = Integer.parseInt(matrix.getRowData(i).getData(j++));

  if (packingDate.length() == 8) {
    packingDate = packingDate.substring(6) + "/" + packingDate.substring(4, 6)
                  + "/" + packingDate.substring(0, 4);
  }

  if (shippingDate.length() == 8) {
    shippingDate = shippingDate.substring(0, 6) + "20" + shippingDate.substring(6);
  }

  outS += "<tr align=center bgcolor='" + (i%2 == 0 ? "#FFFFF0" : "#EEEEE0") + "'>" +
          "<td><input type='checkbox' name='po_no' value='" + po_no + "'></td>" +
          "<td>" + (i+1) + "</td>" +
          "<td>" + supplierStkcd + "</td>" +
          "<td><a href=\"javascript:fnView('" + po_no + "')\">" + po_no + "</td>" +
          "<td>" + style_no + "</td>" +
          "<td>" + packingDate + "</td>" +
          "<td>" + shippingDate + "</td>" +
          "<td align=right>" + StringUtil.formatNumber(packingQty, QTY_FORMAT) + "</td>" +
          "</tr>" ;
}

      out.write(_jsp_string2, 0, _jsp_string2.length);
      
if (actionFlag.equals("AP")) {

      out.write(_jsp_string3, 0, _jsp_string3.length);
      
} else {

      out.write(_jsp_string4, 0, _jsp_string4.length);
      
}

      out.write(_jsp_string5, 0, _jsp_string5.length);
      out.print(( ag_supplier ));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print(( ag_month ));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print(( ag_year ));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print(( ag_search_inv_no ));
      out.write(_jsp_string9, 0, _jsp_string9.length);
      out.print(( inv_no ));
      out.write(_jsp_string10, 0, _jsp_string10.length);
      out.print(( sup_id ));
      out.write(_jsp_string11, 0, _jsp_string11.length);
      out.print(( actionFlag ));
      out.write(_jsp_string12, 0, _jsp_string12.length);
      out.print(( actionFlag.equals("AP") ? "disabled" : "" ));
      out.write(_jsp_string13, 0, _jsp_string13.length);
       if(ag_brand.equals("1"))  out.print("SELECTED");  
      out.write(_jsp_string14, 0, _jsp_string14.length);
       if(ag_brand.equals("2")) out.print("SELECTED");  
      out.write(_jsp_string15, 0, _jsp_string15.length);
      out.print(( ag_po_no ));
      out.write(_jsp_string16, 0, _jsp_string16.length);
       if(ag_orderby.equals("1")) out.print("SELECTED");  
      out.write(_jsp_string17, 0, _jsp_string17.length);
      out.print(( outS ));
      out.write(_jsp_string18, 0, _jsp_string18.length);
      
out.println(CopyRightLogo());

      out.write(_jsp_string19, 0, _jsp_string19.length);
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
    depend = new com.caucho.vfs.Depend(appDir.lookup("order/fob_invoice_confirm_search.jsp"), -703563384842293025L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("login_check.jsp"), -1755892913547665674L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("bottom_line.jsp"), 8977276902620635191L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("common/CommonVars.jsp"), 7218390274410365734L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
  }

  private final static char []_jsp_string17;
  private final static char []_jsp_string13;
  private final static char []_jsp_string9;
  private final static char []_jsp_string12;
  private final static char []_jsp_string7;
  private final static char []_jsp_string2;
  private final static char []_jsp_string16;
  private final static char []_jsp_string4;
  private final static char []_jsp_string15;
  private final static char []_jsp_string1;
  private final static char []_jsp_string5;
  private final static char []_jsp_string10;
  private final static char []_jsp_string19;
  private final static char []_jsp_string11;
  private final static char []_jsp_string8;
  private final static char []_jsp_string14;
  private final static char []_jsp_string6;
  private final static char []_jsp_string3;
  private final static char []_jsp_string0;
  private final static char []_jsp_string18;
  static {
    _jsp_string17 = "> PO No.</OPTION>\n    </SELECT></TD>\n  <td width='13%' class='table_bg_bright_center'><INPUT TYPE=BUTTON VALUE=\"Search\" ONCLICK=submit(this.form)></TD>\n</TR>\n</TABLE>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tr>\n  <td width=\"100%\" height=\"15\"></td>\n</tr>\n</table>\n\n<TABLE width=640 border=0 CELLPADDING=0 CELLSPACING=1 align=center class=\"table_bg\">\n<TR class='table_header_center'>\n  <TD><input type='checkbox' name='tmpCheck' onclick='fnSelect(this.form);'></TD>\n  <TD>No</TD>\n  <TD>Ref#</TD>\n  <TD>PO No.</TD>\n  <TD>Style No.</TD>\n  <TD>Packing Date</TD>\n  <TD>Shipping Date</TD>\n  <TD>Packing Qty</TD>\n</TR>\n".toCharArray();
    _jsp_string13 = ">\n    <OPTION value=\"1\" ".toCharArray();
    _jsp_string9 = "'>\n<input type='hidden' name='inv_no' value='".toCharArray();
    _jsp_string12 = "'>\n<input type='hidden' name='po_no_selected'>\n<TR>\n  <TD><font color=blue size=2 >*** You can find the available PO list for issuing invoice after receiving your product at our Distribution centre. </font></TD>\n</TR>\n<TR>\n  <td><font color=blue size=2 >\n    *** Contact to our Finance Department (02 9475 9100 or accounts@fastfuturebrands.com.au) for more information about invoice.\n    </font></td>\n</TR>\n<!--TR>\n  <td><font color=red size=2 >\n    *** The date in invoice should not be earlier than receiving date, otherwise FFB will regard your invoice date as of invoice uploading date to SCM.\n    </font></td>\n</TR-->\n</TABLE>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tr>\n  <td width=\"100%\" height=\"15\"></td>\n</tr>\n</table>\n<TABLE WIDTH=640 border=\"0\" cellspacing=\"1\" cellpadding=\"0\" align=\"center\" class=\"table_bg\">\n<TR>\n  <TD width='12%' class='table_header_center'>Brand</TD>\n  <TD width='17%' class='table_bg_bright'>\n    <SELECT NAME=ag_brand ".toCharArray();
    _jsp_string7 = "'>\n<input type='hidden' name='ag_year' value='".toCharArray();
    _jsp_string2 = "\n<HTML>\n<HEAD>\n<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n<SCRIPT LANGUAGE=JavaScript>\nfunction Confirm(form)\n{\n  var isChecked = false;\n\n  if (form.po_no) {\n    if (form.po_no.length) {\n      for (var i = 0; i < form.po_no.length; i++) {\n        if (form.po_no[i].checked) {\n          isChecked = true;\n          break;\n        }\n      }\n    } else {\n      if (form.po_no.checked) isChecked = true;\n    }\n  }\n\n  if (!isChecked) {\n    alert('Select POs you want to add to invoice.');\n    return;\n  }\n\n  if (confirm('Do you want to add the selected POs to invoice?')) {\n".toCharArray();
    _jsp_string16 = "'></TD>\n  <TD width='12%' class='table_header_center'>Order by </TD>\n  <TD width='17%' class='table_bg_bright'>\n    <SELECT NAME=ag_orderby >\n    <OPTION value=\"1\"  ".toCharArray();
    _jsp_string4 = "\n    form.action = \"./fob_invoice.jsp\";\n    form.submit();\n".toCharArray();
    _jsp_string15 = "> TEMT </OPTION>\n    </SELECT></TD>\n  <TD width='12%' class='table_header_center'>PO#</TD>\n  <TD width='17%' class='table_bg_bright'><input type=text name=ag_po_no value='".toCharArray();
    _jsp_string1 = "\n\n\n".toCharArray();
    _jsp_string5 = "\n  }\n}\n\nfunction submit()\n{\n  frmMain.submit();\n}\n\nfunction fnView(po_no_selected) {\n  frmMain.po_no_selected.value = po_no_selected;\n  frmMain.action = \"invoice_detail.jsp\";\n  frmMain.submit();\n}\n\nfunction fnSelect(frm) {\n  if (frm.po_no) {\n    if (frm.po_no.length) {\n      for (var i = 0; i < frm.po_no.length; i++) {\n        frm.po_no[i].checked = frm.tmpCheck.checked;\n      }\n    } else {\n      frm.po_no.checked = frm.tmpCheck.checked;\n    }\n  }\n}\n</SCRIPT>\n</HEAD>\n<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\n<table width=\"840\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tr><td>\n\n<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n<tr>\n  <td width=\"100%\" height=\"15\" colspan=\"2\"></td>\n</tr>\n<tr>\n  <td width=\"3%\"><img src=\"/img/title_icon.gif\"></td>\n  <td width=\"*\" class=\"left_title\">Available invoice issue list</td>\n</tr>\n<tr>\n  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n</tr>\n<tr>\n  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n</tr>\n</table>\n\n<TABLE WIDTH=90% border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n<FORM NAME=frmMain ACTION=\"fob_invoice_confirm_search.jsp\" METHOD='POST'>\n<input type='hidden' name='ag_supplier' value='".toCharArray();
    _jsp_string10 = "'>\n<input type='hidden' name='sup_id' value='".toCharArray();
    _jsp_string19 = "\n</td></tr></table>\n</BODY>\n</HTML>\n".toCharArray();
    _jsp_string11 = "'>\n<input type='hidden' name='actionFlag' value='".toCharArray();
    _jsp_string8 = "'>\n<input type='hidden' name='ag_search_inv_no' value='".toCharArray();
    _jsp_string14 = "> Valleygirl </OPTION>\n    <OPTION value=\"2\" ".toCharArray();
    _jsp_string6 = "'>\n<input type='hidden' name='ag_month' value='".toCharArray();
    _jsp_string3 = "\n    form.target = opener.name;\n    form.action = './fob_invoice_edit_save.jsp';\n    form.submit();\n    top.close();\n".toCharArray();
    _jsp_string0 = "\n\n\n\n\n\n".toCharArray();
    _jsp_string18 = "\n</TABLE>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align='center'>\n<tr>\n  <td width=\"100%\" height=\"15\"></td>\n</tr>\n<tr>\n  <td width=\"100%\" align='center'><INPUT TYPE=BUTTON VALUE=\"Add to invoice\" ONCLICK=\"Confirm(this.form)\"></td>\n</tr>\n</FORM>\n</table>\n".toCharArray();
  }
}