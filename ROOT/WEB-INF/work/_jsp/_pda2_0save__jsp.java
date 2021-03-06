/*
 * JSP generated by Resin-3.1.9 (built Mon, 13 Apr 2009 11:09:12 PDT)
 */

package _jsp;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import java.sql.*;
import common.*;
import dbconn.*;

public class _pda2_0save__jsp extends com.caucho.jsp.JavaPage
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
      
String barcode = request.getParameter("barcode");
String po_no = request.getParameter("po_no");
String ffb_inspector = request.getParameter("ffb_inspector");

String sql = "";
int iRet = 0;
int iCnt = 0;
boolean isSucceeded = false;
String strMsg = "";
DBConnManager dbPool = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
Connection connPronto = null;
PreparedStatement pstmt = null;

try {

  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();
  dbPool = DBConnManager.getInstance();
  connPronto = dbPool.getConnection("pronto");
  connPronto.setAutoCommit(false);

  // check qc info whether the po was entered or not
  sql = " select  po_no "
      + " from    buying.vg_qc_master@aps "
      + " where   po_no = '" + po_no + "' "
      + " and     final_decision is not null ";

  iRet = dataProcess.RetrieveData(sql, matrix, connPronto);

  if (iRet > 0) {
    throw new UserDefinedException("Check your data.");
  }

  // delete and insert data into qc master
  sql = " delete  from buying.vg_qc_master@aps "
      + " where   po_no = ? "
      + " and     final_decision is null ";

  int idx = 0;
  pstmt = connPronto.prepareStatement(sql);
  pstmt.setString(++idx, po_no);
  pstmt.executeUpdate();
  pstmt.close();
  pstmt = null;

  sql = " insert  into buying.vg_qc_master@aps "
      + " ( "
      + "   po_no, scan_date, style_no, supplier_id, supplier, "
      + "   buyer, brand, item_class, item_group, big_season, "
      + "   small_season, colour, size_label, rrp, item_text, "
      + "   ffb_inspector, final_decision, inspect_date, file_name, etc, "
      + "   barcode, ship_date, rec_date, gi_date "
      + " ) "
      + " select  ?, to_char(sysdate, 'yyyymmdd'), substr(a.stock_code, 1, 6), d.cre_accountcode, e.cr_shortname,  "
      + "         f.sys_description, b.sht_category, b.sht_class, a.stock_group, substr(a.stock_code, 7, 2)||'0', "
      + "         substr(a.stock_code, 7, 4), null, null, round(c.wholesale_price*1.1, 2), a.stk_description, "
      + "         ?, '1', null, null, null, "
      + "         a.stk_apn_number, null, to_char(sysdate, 'yyyymmdd'), null "
      + " from    stk5mf1 a "
      + "         left outer join "
      + "         ( "
      + "           select z.stock_group, z.sht_category, z.sht_class "
      + "           from   stkhierachymst0 y "
      + "                  inner join stkhiertree3 z "
      + "                    on y.shm_code = z.sht_class "
      + "                    and y.shm_type = 4 "
      + "         ) b "
      + "           on a.stock_group = b.stock_group "
      + "         left outer join stk5prc c "
      + "           on a.stock_code = c.stock_code "
      + "         left outer join stk5supt d "
      + "           on a.stock_code = d.stock_code "
      + "         left outer join cre5mfi e "
      + "           on d.cre_accountcode = e.cre_accountcode "
      + "         left outer join sys5tbl5 f "
      + "           on a.reorder_buyer = f.sys_tbl_code "
      + "           and f.sys_tbl_type = 'RR' "
      + " where   a.stk_apn_number = ? ";

  idx = 0;
  pstmt = connPronto.prepareStatement(sql);
  pstmt.setString(++idx, po_no);
  pstmt.setString(++idx, ffb_inspector);
  pstmt.setString(++idx, barcode);
  iCnt = pstmt.executeUpdate();
  pstmt.close();
  pstmt = null;

  if (iCnt != 1) {
    throw new UserDefinedException("Could not insert QC master inforamtion. Check your data.");
  }

  // delete and insert data into qc detail
  sql = " delete  from buying.vg_qc_detail@aps "
      + " where   po_no = ? ";

  idx = 0;
  pstmt = connPronto.prepareStatement(sql);
  pstmt.setString(++idx, po_no);
  pstmt.executeUpdate();
  pstmt.close();
  pstmt = null;

  sql = " insert  into buying.vg_qc_detail@aps "
      + " ( "
      + "   po_no, qc_code, qc_code_desc, qc_decision, qc_comment, "
      + "   qc_comm_date, qc_etc, qc_major_fail "
      + " ) "
      + " select  ?, code, code_desc, '1', null, "
      + "         trunc(sysdate), null, 'N' "
      + " from    buying.vg_qc_code@aps "
      + " where   div = 'QC' ";

  idx = 0;
  pstmt = connPronto.prepareStatement(sql);
  pstmt.setString(++idx, po_no);
  iCnt = pstmt.executeUpdate();
  pstmt.close();
  pstmt = null;

  if (iCnt < 1) {
    throw new UserDefinedException("Could not insert QC detail inforamtion. Check your data.");
  }
  
  // update po_style_etc
  sql = " update  po_style_etc@scm "
      + " set     rec_date = trunc(sysdate) "
      + " where   po_no = ? ";

  idx = 0;
  pstmt = connPronto.prepareStatement(sql);
  pstmt.setString(++idx, po_no);
  iCnt = pstmt.executeUpdate();
  pstmt.close();
  pstmt = null;

  connPronto.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { connPronto.rollback(); } catch (Exception ex) {}

  strMsg = ue.getMessage();
} catch (Exception e) {
  try { connPronto.rollback(); } catch (Exception ex) {}

  System.out.println("Exception /pda2_save : " + e.getMessage());
  throw e;
} finally {
  if (pstmt != null) {
    try { pstmt.close(); } catch (Exception e) {}
  }

  if (connPronto != null) {
      DataProcess tmpDataProcess = new dbconn.DataProcess();
      tmpDataProcess.ManipulateData("alter session close database link aps", connPronto);
      tmpDataProcess.ManipulateData("alter session close database link scm", connPronto);
      dbPool.freeConnection("pronto", connPronto);
  }
}

// result message
if (isSucceeded) strMsg = "The data are successfully processed.";
else strMsg = "The operation failed.\\n" + strMsg;

      out.write(_jsp_string1, 0, _jsp_string1.length);
      out.print(( barcode ));
      out.write(_jsp_string2, 0, _jsp_string2.length);
      
if (!isSucceeded) {

      out.write(_jsp_string3, 0, _jsp_string3.length);
      out.print(( strMsg ));
      out.write(_jsp_string4, 0, _jsp_string4.length);
      
}

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
    depend = new com.caucho.vfs.Depend(appDir.lookup("pda2_save.jsp"), -8558035907660084L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
  }

  private final static char []_jsp_string0;
  private final static char []_jsp_string3;
  private final static char []_jsp_string5;
  private final static char []_jsp_string4;
  private final static char []_jsp_string2;
  private final static char []_jsp_string1;
  static {
    _jsp_string0 = "\n\n\n\n".toCharArray();
    _jsp_string3 = "\n  alert('".toCharArray();
    _jsp_string5 = "\n  document.form1.submit();\n</script>\n</body>\n</html>\n".toCharArray();
    _jsp_string4 = "');\n".toCharArray();
    _jsp_string2 = "'>\n</form>\n<script language=\"javascript\">\n".toCharArray();
    _jsp_string1 = "\n<html>\n<head>\n<title></title>\n</head>\n<body>\n<form name=\"form1\" method=\"post\" action=\"./pda2.jsp\">\n<input type='hidden' name='searchBarcode' value='".toCharArray();
  }
}
