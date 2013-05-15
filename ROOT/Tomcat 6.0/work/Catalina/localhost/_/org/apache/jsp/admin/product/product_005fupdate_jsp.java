package org.apache.jsp.admin.product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;
import common.*;
import dbconn.*;

public final class product_005fupdate_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/admin/login_check.jsp");
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
      out.write("\n");
      out.write("\n");
      out.write("<!--%@ page errorPage=\"/error.jsp\" %-->\n");

response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0);
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1

String _adminid = "";
String _adminname = "";
String _admintype = "";
String _admingroup = "";
String _approval = "";
String _adminclass = "";
String _adminmail = "";

try{

  _adminid = (String) session.getAttribute("adminid");

  if( _adminid == null || _adminid.length() == 0 || _adminid.equals("null") ) {
    response.sendRedirect("/admin/login_first.html");
    return;
  }

  _adminname = (String) session.getAttribute("adminname");
  _admintype = (String) session.getAttribute("admintype");
  _admingroup = (String) session.getAttribute("admingroup");
  _approval = (String) session.getAttribute("approval");
  _adminclass = (String) session.getAttribute("adminclass");
  _adminmail = (String) session.getAttribute("admin_email");
  //session.setMaxInactiveInterval(60*60);

}catch( Exception e ) {
  response.sendRedirect("/admin/login_first.html");
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


      out.write('\n');
      out.write('\n');

String ag_supplier = request.getParameter("ag_supplier");
String ag_season = request.getParameter("ag_season");
String ag_date_type = request.getParameter("ag_date_type");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");
String ag_orderby = request.getParameter("ag_orderby");
String ag_buyer = request.getParameter("ag_buyer");

String po_no[] = request.getParameterValues("po_no");
String po_status[] = request.getParameterValues("ag_po_status");

//String order_date[] = request.getParameterValues("order_date");
String delivery_date[] = request.getParameterValues("delivery_date");
String arrival_date[] = request.getParameterValues("arrival_date");
String received_date[] = request.getParameterValues("received_date");
String contract_date[] = request.getParameterValues("contract_date");               
String fit_confirm_date[] =  request.getParameterValues("fit_confirm_date");          
String pp_confirm_date[] =  request.getParameterValues("pp_confirm_date");           
String pp_requested[] = request.getParameterValues("pp_requested");                        
String mat_order_date[] = request.getParameterValues("mat_order_date");                     
String mat_in_date[] =   request.getParameterValues("mat_in_date");                      
String acc_order_date[] =  request.getParameterValues("acc_order_date");                    
String acc_in_date[] = request.getParameterValues("acc_in_date");                        
String cutting[] =  request.getParameterValues("cutting");                           
String running[] = request.getParameterValues("running");                            
String top_sent[] =  request.getParameterValues("top_sent");                           
String top_confirm[] = request.getParameterValues("top_confirm");                         
String packing_date[] =  request.getParameterValues("packing_date");       
String inhouse_date[] = request.getParameterValues("inhouse_date");        
String go_date[] =  request.getParameterValues("go_date");       
String col_date[] =  request.getParameterValues("col_date");       
String col_in_date[] = request.getParameterValues("col_in_date");       
String pp_in_date[] = request.getParameterValues("pp_in_date");    



String sql = "";
String sql2 = "";
int iRet = 0;
boolean isSucceeded = false;
String strMsg = "";
Connection conn = null;
PreparedStatement pstmt2 = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;

// set array string
String po_nos = "";
for (int i = 0; i < po_no.length; i++) {
  po_nos += (i > 0 ? "," : "") + "'" + po_no[i] + "'";
}

// query for select po list
sql = " select  order_no "
    + " from    purchase_order "
    + " where   order_no in (" + po_nos + ") ";

// query for update
sql2 =  " update   purchase_order "
        + " set  "
        + "   delivery_date = str_to_date(?, '%Y/%m/%d'), " 
        + "   arrival_date = str_to_date(?, '%Y/%m/%d'), " 
        + "   received_date = str_to_date(?, '%Y/%m/%d'), " 
        + "   contract_date = str_to_date(?, '%Y/%m/%d'), "          
        + "   fit_confirm_date = str_to_date(?, '%Y/%m/%d'), "           
        + "   pp_confirm_date = str_to_date(?, '%Y/%m/%d'), "          
        + "   pp_requested = str_to_date(?, '%Y/%m/%d'), "           
        + "   mat_order_date= str_to_date(?, '%Y/%m/%d'), "            
        + "   mat_in_date = str_to_date(?, '%Y/%m/%d'), "          
        + "   acc_order_date  = str_to_date(?, '%Y/%m/%d'), "             
        + "   acc_in_date = str_to_date(?, '%Y/%m/%d'), "        
        + "   cutting = str_to_date(?, '%Y/%m/%d'), "  
        + "   running = str_to_date(?, '%Y/%m/%d'), "
        + "   top_sent = str_to_date(?, '%Y/%m/%d'), "   
        + "   top_confirm = str_to_date(?, '%Y/%m/%d'), "   
        + "   packing_date = str_to_date(?, '%Y/%m/%d'), " 
        + "   inhouse_date = str_to_date(?, '%Y/%m/%d'), " 
        + "   ex_factory_date= str_to_date(?, '%Y/%m/%d'), " 
        + "   col_order_date = str_to_date(?, '%Y/%m/%d'), " 
        + "   col_in_date = str_to_date(?, '%Y/%m/%d'), "
        + "   pp_in_date = str_to_date(?, '%Y/%m/%d'), "
        + "         order_status = ?, "
        + "         modifier = ?, "    
        + "         modified_date = sysdate() "
         + " where   order_no = ? ";

try {

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();

  // po list
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  ArrayList poList = new ArrayList();

  for (int i = 0; i < iRet; i++) {
    poList.add(matrix.getRowData(i).getData(0));
  }

  // insert or update purchase order info
  conn.setAutoCommit(false);
  pstmt2 = conn.prepareStatement(sql2);

  for (int i = 0; i < po_no.length; i++) {
    int j = 0;     
    if (poList.contains(po_no[i])) {
      // update      
      //pstmt2.setString(++j,  order_date[i]);
      pstmt2.setString(++j,  delivery_date[i]);
      pstmt2.setString(++j,  arrival_date[i]);
      pstmt2.setString(++j,  received_date[i] );
      pstmt2.setString(++j,  contract_date[i] );         
      pstmt2.setString(++j,  fit_confirm_date[i] );          
      pstmt2.setString(++j,  pp_confirm_date[i] );         
      pstmt2.setString(++j,  pp_requested[i] );          
      pstmt2.setString(++j,  mat_order_date[i]);           
      pstmt2.setString(++j,  mat_in_date[i] );         
      pstmt2.setString(++j,  acc_order_date[i] );            
      pstmt2.setString(++j,  acc_in_date[i] );       
      pstmt2.setString(++j,  cutting[i] ); 
      pstmt2.setString(++j,  running[i] );
      pstmt2.setString(++j,  top_sent[i] );  
      pstmt2.setString(++j,  top_confirm[i] );  
      pstmt2.setString(++j,  packing_date[i] );
      pstmt2.setString(++j,  inhouse_date[i] );
      pstmt2.setString(++j,  go_date[i] ); 
      pstmt2.setString(++j,  col_date[i] );
      pstmt2.setString(++j,  col_in_date[i] );
      pstmt2.setString(++j,  pp_in_date[i] );
      pstmt2.setString(++j, po_status[i]);
      pstmt2.setString(++j, _adminid);
      pstmt2.setString(++j, po_no[i]);
      pstmt2.executeUpdate();
    }
  }
  conn.commit();
  isSucceeded = true;

} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}
  System.out.println("Exception admin_delivery_status_save : " + e.getMessage());
  throw e;
} finally {  
  if (pstmt2 != null) {
    try { pstmt2.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
  }
}

// result message
if (isSucceeded) strMsg = "The data are successfully processed.";
else strMsg = "The operation failed. Check your data.";

      out.write("\n");
      out.write("<HTML>\n");
      out.write("<head>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<form name='form1' method='post'>\n");
      out.write("<input type='hidden' name='ag_supplier' value='");
      out.print( ag_supplier );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_season' value='");
      out.print( ag_season );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_date_type' value='");
      out.print( ag_date_type );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_from_date' value='");
      out.print( ag_from_date );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_to_date' value='");
      out.print( ag_to_date );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_po_no' value='");
      out.print( ag_po_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_style_no' value='");
      out.print( ag_style_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_orderby' value='");
      out.print( ag_orderby );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_buyer' value='");
      out.print( ag_buyer );
      out.write("'>\n");
      out.write("</form>\n");
      out.write("<script language='javascript'>\n");
      out.write("alert(\"");
      out.print( strMsg );
      out.write("\");\n");
      out.write("form1.action = './product_management.jsp';\n");
      out.write("form1.submit();\n");
      out.write("</script>\n");
      out.write("</BODY>\n");
      out.write("</HTML>\n");
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
