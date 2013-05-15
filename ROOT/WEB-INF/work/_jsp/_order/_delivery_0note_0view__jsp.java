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

public class _delivery_0note_0view__jsp extends com.caucho.jsp.JavaPage
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

      out.write(_jsp_string1, 0, _jsp_string1.length);
      
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

String QTY_FORMAT = "###,##0";

int iRet = 0;
Connection connScm = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
DBConnManager dbPool = null;
String outS = "";
String sql = "";

String ag_supplier = request.getParameter("ag_supplier");
String ag_month = request.getParameter("ag_month");
String ag_year = request.getParameter("ag_year");
String del_note_date = request.getParameter("del_note_date");
String supplier_id = request.getParameter("supplier_id");
String ref_no = request.getParameter("ref_no");

if (ag_supplier == null) ag_supplier = "";
if (ag_month == null) ag_month = "";
if (ag_year == null) ag_year = "";
if (del_note_date == null) del_note_date = "";
if (supplier_id == null) supplier_id = "";
if (ref_no == null) ref_no = "";

String supplier_name = "";
String updated_date = "";
String pic = "";
int total_pl_qty = 0;
int total_dn_qty = 0;
int total_ctn_qty = 0;
boolean isEditable = false;

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  dbPool = dbconn.DBConnManager.getInstance();
  connScm = dbPool.getConnection("intranet");

  // check whether this invoice is editable or not
  // if the print status of one of the POs in the delivery note
  // is 'H' or 'Y' then this note is not editable
  int iCnt = 0;
  sql = " select  count(*) "
      + " from    del_note_det "
      + " where   del_note_date = '" + del_note_date.replaceAll("/", "") + "' "
      + " and     supplier_id = '" + supplier_id + "' "
      + " and     ref_no = '" + ref_no + "' "
      + " and     print_yn in ('H', 'Y') ";

  iRet = dataProcess.RetrieveData(sql, matrix, connScm);

  if (iRet > 0) {
    iCnt = Integer.parseInt(matrix.getRowData(0).getData(0));
    if (iCnt == 0) isEditable = true;
  }

  // read delivery note header
  sql = " select  b.name, a.updated_date, a.pic "
      + " from    del_note_hd a, login_01t b "
      + " where   a.del_note_date = '" + del_note_date.replaceAll("/", "") + "' "
      + " and     a.supplier_id = '" + supplier_id + "' "
      + " and     a.ref_no = '" + ref_no + "' "
      + " and     a.supplier_id = b.id(+) ";

  iRet = dataProcess.RetrieveData(sql, matrix, connScm);

  if (iRet > 0) {
    int j = 0;
    supplier_name = matrix.getRowData(0).getData(j++);
    updated_date = matrix.getRowData(0).getData(j++);
    pic = matrix.getRowData(0).getData(j++);
  }

  // read delivery note details
  sql = " select  po_no, style_no, brand, pl_qty, pl_del_date, dn_qty, ctn_no "
      + " from    del_note_det "
      + " where   del_note_date = '" + del_note_date.replaceAll("/", "") + "' "
      + " and     supplier_id = '" + supplier_id + "' "
      + " and     ref_no = '" + ref_no + "' "
      + " order by to_number(po_no) ";

  //out.println(sql); if (true) return;
  iRet = dataProcess.RetrieveData(sql, matrix, connScm);

} catch (Exception e) {
  System.out.println("Exception delivery_note_view : " + e.getMessage());
  throw e;
} finally {
  if (connScm != null) {
    dbPool.freeConnection("intranet", connScm);
  }
}

for (int i = 0; i < iRet; i++) {
  int j = 0;
  String po_no = matrix.getRowData(i).getData(j++);
  String style_no = matrix.getRowData(i).getData(j++);
  String brand = matrix.getRowData(i).getData(j++);
  int pl_qty = Integer.parseInt(matrix.getRowData(i).getData(j++));
  String pl_del_date = matrix.getRowData(i).getData(j++);
  int dn_qty = Integer.parseInt(matrix.getRowData(i).getData(j++));
  int ctn_qty = Integer.parseInt(matrix.getRowData(i).getData(j++));

  total_pl_qty += pl_qty;
  total_dn_qty += dn_qty;
  total_ctn_qty += ctn_qty;

  outS += "<tr align='center' bgcolor='" + (i%2 == 0 ? "#FFFFF0" : "#EEEEE0") + "'>" +
          "<td>" + (isEditable && scmid != null ? "<input type='checkbox' name='po_no' value='" + po_no + "'>" : "") + "</td>" +
          "<td>" + (i+1) + "</td>" +
          "<td>" + po_no + "</td>" +
          "<td>" + style_no + "</td>" +
          "<td>" + brand + "</td>" +
          "<td align='right'>" + StringUtil.formatNumber(pl_qty, QTY_FORMAT) + "</td>" +
          "<td>" + pl_del_date.substring(0, 2) + "/" + pl_del_date.substring(3, 5) + "/20" + pl_del_date.substring(6) + "</td>" +
          "<td align='right'>" + StringUtil.formatNumber(dn_qty, QTY_FORMAT) + "</td>" +
          "<td align='right'>" + StringUtil.formatNumber(ctn_qty, QTY_FORMAT) + "</td>" +
          "</tr>" ;
}

      out.write(_jsp_string2, 0, _jsp_string2.length);
      
if (isEditable && scmid != null) {

      out.write(_jsp_string3, 0, _jsp_string3.length);
      
}

      out.write(_jsp_string4, 0, _jsp_string4.length);
      out.print(( (_adminid != null ? "admin_" : "") ));
      out.write(_jsp_string5, 0, _jsp_string5.length);
      out.print(( ag_supplier ));
      out.write(_jsp_string6, 0, _jsp_string6.length);
      out.print(( ag_month ));
      out.write(_jsp_string7, 0, _jsp_string7.length);
      out.print(( ag_year ));
      out.write(_jsp_string8, 0, _jsp_string8.length);
      out.print(( del_note_date ));
      out.write(_jsp_string9, 0, _jsp_string9.length);
      out.print(( supplier_id ));
      out.write(_jsp_string10, 0, _jsp_string10.length);
      out.print(( ref_no ));
      out.write(_jsp_string11, 0, _jsp_string11.length);
      out.print(( supplier_name ));
      out.write(_jsp_string12, 0, _jsp_string12.length);
      out.print(( supplier_id ));
      out.write(_jsp_string13, 0, _jsp_string13.length);
      out.print(( del_note_date ));
      out.write(_jsp_string14, 0, _jsp_string14.length);
      out.print(( ref_no ));
      out.write(_jsp_string15, 0, _jsp_string15.length);
      out.print(( updated_date.length() > 0 ? updated_date.substring(0, 2)+"/"+updated_date.substring(2, 4)+"/"+updated_date.substring(4) : "" ));
      out.write(_jsp_string16, 0, _jsp_string16.length);
      out.print(( (isEditable && scmid != null ? "<input type='text' name='pic' value='" + pic + "' size='16' maxlength='20'>" : pic) ));
      out.write(_jsp_string17, 0, _jsp_string17.length);
      out.print(( outS ));
      out.write(_jsp_string18, 0, _jsp_string18.length);
      out.print(( StringUtil.formatNumber(total_pl_qty, QTY_FORMAT) ));
      out.write(_jsp_string19, 0, _jsp_string19.length);
      out.print(( StringUtil.formatNumber(total_dn_qty, QTY_FORMAT) ));
      out.write(_jsp_string20, 0, _jsp_string20.length);
      out.print(( StringUtil.formatNumber(total_ctn_qty, QTY_FORMAT) ));
      out.write(_jsp_string21, 0, _jsp_string21.length);
      
if (isEditable && scmid != null) {

      out.write(_jsp_string22, 0, _jsp_string22.length);
      
}

      out.write(_jsp_string23, 0, _jsp_string23.length);
      
out.println(CopyRightLogo());

      out.write(_jsp_string24, 0, _jsp_string24.length);
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
    depend = new com.caucho.vfs.Depend(appDir.lookup("order/delivery_note_view.jsp"), -5890091849737523512L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("login_check.jsp"), 5313538553479869376L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
    depend = new com.caucho.vfs.Depend(appDir.lookup("bottom_line.jsp"), 5941552803368297242L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
  }

  private final static char []_jsp_string21;
  private final static char []_jsp_string7;
  private final static char []_jsp_string2;
  private final static char []_jsp_string15;
  private final static char []_jsp_string4;
  private final static char []_jsp_string5;
  private final static char []_jsp_string13;
  private final static char []_jsp_string12;
  private final static char []_jsp_string19;
  private final static char []_jsp_string1;
  private final static char []_jsp_string23;
  private final static char []_jsp_string18;
  private final static char []_jsp_string24;
  private final static char []_jsp_string8;
  private final static char []_jsp_string3;
  private final static char []_jsp_string20;
  private final static char []_jsp_string16;
  private final static char []_jsp_string22;
  private final static char []_jsp_string11;
  private final static char []_jsp_string6;
  private final static char []_jsp_string17;
  private final static char []_jsp_string10;
  private final static char []_jsp_string0;
  private final static char []_jsp_string14;
  private final static char []_jsp_string9;
  static {
    _jsp_string21 = "</td>\n</tr>\n</TABLE>\n\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align='center'>\n<tr>\n  <td width=\"100%\" height=\"10\"></td>\n</tr>\n<tr>\n  <td width=\"100%\">\n".toCharArray();
    _jsp_string7 = "'>\n<input type='hidden' name='ag_year' value='".toCharArray();
    _jsp_string2 = "\n<HTML>\n<HEAD>\n<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n<SCRIPT LANGUAGE=JavaScript>\n".toCharArray();
    _jsp_string15 = "</TD>\n  <TD class='table_header_center'>Updated Date</TD>\n  <TD class='table_bg_bright'>".toCharArray();
    _jsp_string4 = "\n\nfunction fnSelect(frm) {\n  if (frm.po_no) {\n    if (frm.po_no.length) {\n      for (var i = 0; i < frm.po_no.length; i++) {\n        frm.po_no[i].checked = frm.tmpCheck.checked;\n      }\n    } else {\n      frm.po_no.checked = frm.tmpCheck.checked;\n    }\n  }\n}\n\nfunction fnPrint(frm)\n{\n  var win_print = window.open(\"\",\"win_print\", \"toolbar=no, menubar=no, resizable=no, scrollbars=yes, width=800, height=700\");\n\n  if (win_print) {\n    frm.target = win_print.name;\n    frm.action = './del_print.jsp';\n    frm.submit();\n    win_print.focus();\n  }\n}\n\nfunction fnList(frm) {\n  frm.target = self.name;\n  frm.action = './".toCharArray();
    _jsp_string5 = "delivery_note_list.jsp';\n  frm.submit();\n}\n</SCRIPT>\n</HEAD>\n<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\n<table width=\"840\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tr><td>\n\n<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n<tr>\n  <td width=\"100%\" height=\"15\" colspan=\"2\"></td>\n</tr>\n<tr>\n  <td width=\"3%\"><img src=\"/img/title_icon.gif\"></td>\n  <td width=\"*\" class=\"left_title\">Delivery Note</td>\n</tr>\n<tr>\n  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n</tr>\n<tr>\n  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n</tr>\n</table>\n\n<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n<tr>\n  <td width=\"100%\"><b>Delivery Note Header</b></td>\n</tr>\n</table>\n<TABLE WIDTH='99%' border=\"0\" cellspacing=\"1\" cellpadding=\"0\" align=\"center\" class=\"table_bg\">\n<FORM NAME='frmMain' METHOD='POST'>\n<input type='hidden' name='ag_supplier' value='".toCharArray();
    _jsp_string13 = "</TD>\n  <TD width='15%' class='table_header_center'>Delivery Date</TD>\n  <TD width='19%' class='table_bg_bright'>".toCharArray();
    _jsp_string12 = "</TD>\n  <TD width='15%' class='table_header_center'>Supplier ID</TD>\n  <TD width='18%' class='table_bg_bright'>".toCharArray();
    _jsp_string19 = "</td>\n  <td></td>\n  <td align='right'>".toCharArray();
    _jsp_string1 = "\n\n\n".toCharArray();
    _jsp_string23 = "\n    <input type='button' value=' Print ' onclick='fnPrint(this.form);'>\n    <input type='button' value='Go To List' onclick='fnList(this.form);'>\n  </td>\n</tr>\n<tr>\n  <td width=\"100%\" height=\"10\"></td>\n</tr>\n</FORM>\n</table>\n".toCharArray();
    _jsp_string18 = "\n<tr class='table_header_center'>\n  <td colspan='5'>TOTAL</td>\n  <td align='right'>".toCharArray();
    _jsp_string24 = "\n</td></tr></table>\n</BODY>\n</HTML>\n".toCharArray();
    _jsp_string8 = "'>\n<input type='hidden' name='del_note_date' value='".toCharArray();
    _jsp_string3 = "\nfunction fnAddPOs(frm) {\n  var winAddPOs = window.open(\"\",\"winAddPOs\", \"toolbar=no,menubar=no,resizable=no,scrollbars=yes,width=860,height=700\");\n\n  if (winAddPOs) {\n    frm.target = winAddPOs.name;\n    frm.actionFlag.value = 'AP';\n    frm.action = './delivery_note_issue_list.jsp';\n    frm.submit();\n    winAddPOs.focus();\n  }\n}\n\nfunction fnDeletePOs(frm) {\n  if (frm.po_no) {\n    var isSelected = false;\n    \n    if (frm.po_no.length) {\n      for (var i = 0; i < frm.po_no.length; i++) {\n        if (frm.po_no[i].checked) {\n          isSelected = frm.po_no[i].checked;\n          break;\n        }\n      }\n    } else {\n      isSelected = frm.po_no.checked;\n    }\n    \n    if (!isSelected) {\n      alert('Select POs you want to delete.');\n      return;\n    }\n    \n    if (confirm('Do you want to delete the selected POs from this delivery note?')) {\n      frm.target = self.name;\n      frm.actionFlag.value = 'DP';\n      frm.action = './delivery_note_save.jsp';\n      frm.submit();\n    }\n  }\n}\n\nfunction fnUpdate(frm)\n{\n  if (confirm('Do you want to update this delivery note?')) {\n    frm.target = self.name;\n    frm.action = './delivery_note_save.jsp';\n    frm.actionFlag.value = 'U';\n    frm.submit();\n  }\n}\n\nfunction fnDelete(frm)\n{\n  if (confirm('Do you want to delete this delivery note?')) {\n    frm.target = self.name;\n    frm.action = './delivery_note_save.jsp';\n    frm.actionFlag.value = 'D';\n    frm.submit();\n  }\n}\n".toCharArray();
    _jsp_string20 = "</td>\n  <td align='right'>".toCharArray();
    _jsp_string16 = "</TD>\n  <TD class='table_header_center'>PIC</TD>\n  <TD class='table_bg_bright'>".toCharArray();
    _jsp_string22 = "\n    <input type='button' value=' Add POs ' onclick='fnAddPOs(this.form);'>\n    <input type='button' value=' Delete POs ' onclick='fnDeletePOs(this.form);'>\n    <input type='button' value='Update Delivery Note' onclick='fnUpdate(this.form);'>\n    <input type='button' value='Delete Delivery Note' onclick='fnDelete(this.form);'>\n".toCharArray();
    _jsp_string11 = "'>\n<input type='hidden' name='actionFlag'>\n<TR>\n  <TD width='15%' class='table_header_center'>Supplier Name</TD>\n  <TD width='18%' class='table_bg_bright'>".toCharArray();
    _jsp_string6 = "'>\n<input type='hidden' name='ag_month' value='".toCharArray();
    _jsp_string17 = "</TD>\n</TR>\n</TABLE>\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n<tr>\n  <td width=\"100%\" height=\"15\"></td>\n</tr>\n</table>\n\n<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n<tr>\n  <td width=\"100%\"><b>Delivery Note Detail List</b></td>\n</tr>\n</table>\n<TABLE width='99%' border=0 CELLPADDING=0 CELLSPACING=1 align=center class=\"table_bg\">\n<TR class='table_header_center'>\n  <TD width='3%'><input type='checkbox' name='tmpCheck' onclick='fnSelect(this.form);'></TD>\n  <TD width='6%'>No</TD>\n  <TD width='13%'>Po No</TD>\n  <TD width='13%'>Style No</TD>\n  <TD width='13%'>Brand</TD>\n  <TD width='13%'>P/L Qty</TD>\n  <TD width='13%'>P/L Del Date</TD>\n  <TD width='13%'>D/N Qty</TD>\n  <TD width='13%'>No of CTN</TD>\n</TR>\n".toCharArray();
    _jsp_string10 = "'>\n<input type='hidden' name='ref_no' value='".toCharArray();
    _jsp_string0 = "\n\n\n\n\n\n".toCharArray();
    _jsp_string14 = "</TD>\n</TR>\n<TR>\n  <TD class='table_header_center'>Reference No</TD>\n  <TD class='table_bg_bright'>".toCharArray();
    _jsp_string9 = "'>\n<input type='hidden' name='supplier_id' value='".toCharArray();
  }
}