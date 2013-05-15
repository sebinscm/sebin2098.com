package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import dbconn.*;

public final class menu_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/login_check.jsp");
    _jspx_dependants.add("/common/CommonVars.jsp");
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=euc-kr");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!--%@ page errorPage=\"/error.jsp\" %-->\n");

response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0);
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1

String scmid = "";
String scmnm = "";
String usertype = "";
String usergroup = "";
String scmsupid = "";
String _buyer_email ="";
String _supplier_email="";

try{
  scmid = (String) session.getAttribute("scmid");


  if (scmid == null || scmid.length() == 0 || scmid.equals("null") ) {     
    response.sendRedirect("/login_first.html");
    return;
  }
  

  scmnm = (String) session.getAttribute("scmnm");
  scmsupid = (String) session.getAttribute("scmsupid");
  usertype = (String) session.getAttribute("usertype");
  if (usertype == null) usertype = "";

  usergroup = (String) session.getAttribute("usergroup");
  if (usergroup == null) usergroup = "";
  _buyer_email = (String) session.getAttribute("buyer_email");
  _supplier_email = (String) session.getAttribute("supplier_email");
  
  //session.setMaxInactiveInterval(60*60);

}catch( Exception e ) {
  response.sendRedirect("/login_first.html");
  return;
}

      out.write('\n');

// MY SQL DB
//String _mysqlJdbcDriver = "com.mysql.jdbc.Driver";
//String _urlLogin = "jdbc:mysql://10.2.1.247:3306";
//String _userLogin = "user";
//String _pwLogin = "password";

// MS-SQL DB
//String _mssqlJdbcDriver = "com.microsoft.jdbc.sqlserver.SQLServerDriver";
//String _urlFutura = "jdbc:microsoft:sqlserver://10.2.1.228:1433";
//String _userFutura = "user";
//String _pwFutura = "password";


// Management Notice Upload path
String _ManagementNoticeUploadUrl = "/admin/notice/upload";

// Uplod
//String _uploadPath = "../../var/tmp";
String _uploadPath = "C:/SCM_MYSQL/ROOT/var/tmp";
String _uploadPath2 = "C:/SCM_MYSQL/ROOT/var/tmp";
long _maxFileSize = 50*1024*1024;

// SCM Image Path
String _SCMIMGURL = "http://www.sebin2098.com/images/";

// style image path
String _styleImgURL = "/images";

// Fault return invoice File URL
String _faultReturnInvoiceFileURL = "/images/Return";

// Memo °ü·Ã º¯¼ö
String _memoDataUrl = "/memo/upload";


// Spec Sheet path
String _specSheetUrl = "/spec_sheet_files";

// Notice URL
// Notice
String _noticeDataUrl = "/notice_new/upload";


// Sample Image Url
String _sampleImageUrl = "/images/SAMPLE_IMAGE";

// barcode file Image Url
String _barcodeFileUrl = "/images/Barcode";

// Invoice file path
String _invoiceFileUrl = "/payment/inv_files";

// shipment file path
String _shipmentFileUrl = "/ordermanagement/shipment_upload";

// SMTP MAIL SERVER
String SMTP_SERVER = "smtp.gmail.com";
String SMTP_USER ="scm@sebin2098.com";
String SMTP_PASSWORD ="gavi1004";

// System Admin Mail Address
String _systemAdminEmail = "scm@sebin2098.com";
String _systemAdminName = "SCM Administrator";

//  MU rate
double _MURate = 0.25;

// Ex-Factory Price Rate
double _EXRate = 0.04;


// Ex-Factory Price Rate 
double _EXRate2 = 0.04;


      out.write(' ');
      out.write('\n');
      out.write('\n');

String menus = "";

int iRet = 0;
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
String sql = "";

// for New Icon..
String OrderManagementMenu = "Order Management";
String POConformationMenu = "PO Confirmation";
String OrderAmendmentMenu = "Order Amendment";
String ServicesAndSupportMenu = "Services & Support";
String DocumentsMenu = "Documents";

int POConfirmationCnt = 0;
int OrderAmendmentCnt = 0;
int DocumentsCnt = 0;

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
 /////////////////////////////////////////////////////////////////////////
  // For New Icon
  // count po conformation
  sql =  " select count(*) from purchase_order where backorder_flag = 'N' " 
           + " and order_status='43' and buyer = '"+scmid+"' " ;
  
  
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  if (iRet > 0) POConfirmationCnt = Integer.parseInt(matrix.getRowData(0).getData(0));
  
  // count po amendment
  
  sql = " select count(*) from purchase_order  "
         +  "  where backorder_flag = 'N'  "
         +  " and amend_date > sysdate()-7  "
         +  " and buyer = '"+scmid+"'  and order_status <>'999' " ;
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  if (iRet > 0) OrderAmendmentCnt = Integer.parseInt(matrix.getRowData(0).getData(0));

 
  // Count Documents
  sql = " select  count(*) "
      + " from    notice "
      + " where   create_date > sysdate()-7 ";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  if (iRet > 0) DocumentsCnt = Integer.parseInt(matrix.getRowData(0).getData(0));
  /////////////////////////////////////////////////////////////////////////

  /////////////////////////////////////////////////////////////////////////
  // Read Menu List
  sql = " SELECT  M.PARENT_NO, M.MENUNAME, M.MENUURL, IFNULL(MC.CHILD_CNT, 0) "
      + " FROM    ( "
      + "           SELECT SEQNO, PARENT_NO, MENUNAME, MENUURL, SORT_NO "
      + "           FROM   MENU_T "
      + "           WHERE  MENU_TYPE =  'S' "
      + "           AND    USER_GROUP = '" + usergroup + "' "
      + "           ORDER BY SORT_NO "
      + "         ) M  LEFT OUTER JOIN "
      + "         ( "
      + "           SELECT M1.SEQNO, COUNT(M2.SEQNO) CHILD_CNT "
      + "           FROM   MENU_T M1 LEFT OUTER JOIN MENU_T M2 ON (M1.MENU_TYPE = 'S' AND   M1.SEQNO = M2.PARENT_NO ) "
      + "           WHERE  M1.USER_GROUP = '" + usergroup + "' "
      + "           AND      M1.PARENT_NO = 1 "
      + "           GROUP BY M1.SEQNO "
      + "          ) MC ON (M.SEQNO = MC.SEQNO )   " 
      + " ORDER BY M.SORT_NO ";
  //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  for (int i = 0; i < iRet; i++) {
    int j = 0;
    String newIcon = "";

    String parentNo   = matrix.getRowData(i).getData(j++);
    String menuName   = matrix.getRowData(i).getData(j++);
    String menuUrl    = matrix.getRowData(i).getData(j++);
    int childCnt      = Integer.parseInt(matrix.getRowData(i).getData(j++));

    if (parentNo.equals("1")) {

      if ( (OrderManagementMenu.equals(menuName) && POConfirmationCnt + OrderAmendmentCnt > 0)
          || (ServicesAndSupportMenu.equals(menuName) && DocumentsCnt > 0) ) {
        newIcon = "<img src='/img/ico_new.gif' border='0'>";
      }

      // Parent Menu??寃쎌�
      if (childCnt > 0) {
        menus += "aux1 = insFolder(rootTree, genFolder(\"" + newIcon + menuName + "\", \"" + menuUrl + "\"));\n";
      } else {
        menus += "insItem(rootTree, genItemIcon(\"tree_page.gif\", \"" + newIcon + menuName + "\", \"" + menuUrl + "\"));\n";
      }

    } else {
      if ( (POConformationMenu.equals(menuName) && POConfirmationCnt > 0)
          || (OrderAmendmentMenu.equals(menuName) && OrderAmendmentCnt > 0)
          || (DocumentsMenu.equals(menuName) && DocumentsCnt > 0) ) {
        newIcon = "<img src='/img/ico_new.gif' border='0'>";
      }
      
      menus += "insItem(aux1, genItemIcon(\"tree_page.gif\", \"" + newIcon + menuName + "\", \"" + menuUrl + "\"));\n";

    }

  }
  /////////////////////////////////////////////////////////////////////////

} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception in menu : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}}

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title></title>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<style type=\"text/css\">\n");
      out.write("a:link {text-decoration: none ; color: #020468;}\n");
      out.write("a:visited {text-decoration: none ; color: #666666;}\n");
      out.write("a:active {text-decoration: underline ; color: #0770FF;}\n");
      out.write("a:hover {text-decoration: underline ; color: #0770FF;}\n");
      out.write("</style>\n");
      out.write("<script language=javascript src=\"/common/js/tree_win.js\"></script>\n");
      out.write("<script language=\"javascript\">\n");
      out.write("function LoadLeave()\n");
      out.write("{\n");
      out.write("    clearTimeout(Time_ID);\n");
      out.write("    location.href = \"./menu.jsp\";\n");
      out.write("}\n");
      out.write("function delay()\n");
      out.write("{\n");
      out.write("    Time_ID = setTimeout(\"LoadLeave()\",( 10 * 60 * 1000 ));\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body leftmargin=\"2\" topmargin=\"10\" marginwidth=\"0\" marginheight=\"0\" bgcolor=\"#F7F7F7\" onload=\"delay()\"> \n");
      out.write("<!--body leftmargin=\"2\" topmargin=\"10\" marginwidth=\"0\" marginheight=\"0\" background=\"/img/bgimage2.gif\" onload=\"delay()\"-->\n");
      out.write("<script language=javascript>\n");
      out.write("rootTree = genFolderRoot(\"<img src='/img/tree_base.gif' border='0'> <b>HOME</b>\", \"memo/\");\n");
      out.print( menus );
      out.write("\n");
      out.write("initializeDocument(rootTree);\n");
      out.write("</script>\n");
      out.write("<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" >\n");
      out.write("<tr>\n");
      out.write("  <td align=\"center\" height=\"10\"></td>\n");
      out.write("</tr>\n");
      out.write("\n");
      out.write("<tr>\n");
      out.write("  <td align=\"center\"><a href=\"http://www.sebin2098.com\" target=\"_blank\"><img src=\"/img/sebin_mid.jpg\"></a></td>\n");
      out.write("  </tr>\n");
      out.write("<!--tr>\n");
      out.write("   <td align=\"center\"><a href=\"http://get.adobe.com/reader/\" target=\"_blank\"><img src=\"/img/adobe_reader.png\"></a></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td align=\"center\" class=\"font_small\"><font color=\"#0770FF\" siz=2>Get Adobe Reader</font></td>\n");
      out.write("\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td align=\"center\" class=\"font_small\"><font color=\"#0770FF\" siz=2>Get Adobe Reader</font></td>\n");
      out.write("\n");
      out.write("</tr-->\n");
      out.write(" \n");
      out.write("\n");
      out.write("</table>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
