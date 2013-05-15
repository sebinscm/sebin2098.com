package org.apache.jsp.ordermanagement;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;
import common.*;
import common.util.*;
import dbconn.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.mail.HtmlEmail;

public final class shipment_005fissue_005fsave_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


//-------------------------------------------
// CopyRightLogo
//
//-------------------------------------------
String CopyRightLogo()
{
  String str;
  str = "<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center' >";
  str += "<tr><td width='100%' height='2' align='center' colspan='2'>";
  str += "<HR color='#5BA3C1' width=100% size=1></td></tr>";
  str += "<tr><td width='40%'align='right'><img src='/img/sebin_small.jpg'></td>";
  str += " <td width='60%' align='left'><FONT size=2 color=778899>";
  str += "&copy;Copyright 2011 ";
  str += "Sebin Trading Enterprise Co,. Ltd. All Rights Reserved.<BR>";
  str += "Contact to <FONT color=blue><A href='mailto:scm@sebin2098.com'>scm@sebin2098.com</A>";
  str += " for more information.</FONT>";
  str += "</td></tr></table>";

  return (String)str;
}

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(3);
    _jspx_dependants.add("/admin/login_check.jsp");
    _jspx_dependants.add("/common/CommonVars.jsp");
    _jspx_dependants.add("/bottom_line.jsp");
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!--%@page errorPage=\"/error.jsp\" %-->\n");

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
      out.write('\n');
      out.write('\n');

response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

// variables
boolean isSucceeded = false;
String strMsg = "";
String invoice_no =  "";
String buyer_id =  "";
String supplier_id =  "";
int iCnt = 0;
int iRet = 0;
String sql = "";
String sql2 = "";
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
Connection conn = null;
PreparedStatement pstmt = null;
PreparedStatement pstmt2 = null;
HashMap params = new HashMap();               // for parameter
List poNoList = new ArrayList();
List styleNoList = new ArrayList();
List seasonList = new ArrayList();
List transTypeList = new ArrayList();
List orderQtyList = new ArrayList();
List totalamtList = new ArrayList();
List unitpriceList = new ArrayList();
String savePath = application.getRealPath(_shipmentFileUrl) + File.separator;   // file path

// Jakarta Commons Project FileUpload
// -> http://jakarta.apache.org/commons/fileupload/
DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setRepository(new File(_uploadPath));                 // Set factory constraints
ServletFileUpload upload = new ServletFileUpload(factory);    // Create a new file upload handler
upload.setSizeMax(_maxFileSize);                              // Set overall request size constraint
List items = upload.parseRequest(request);                    // Parse the request

try {

  // Read items
  Iterator iter = items.iterator();

  while (iter.hasNext()) {
    FileItem item = (FileItem) iter.next();

    if (item.isFormField()) {
      // Process a regular form field
      String name = item.getFieldName();

      if (name.equals("po_no")) {
        poNoList.add(item.getString());
      } else if (name.equals("style_no")) {
        styleNoList.add(item.getString());
      } else if (name.equals("season")) {
        seasonList.add(item.getString());
      } else if (name.equals("trans_type")) {
        transTypeList.add(item.getString());
      } else if (name.equals("order_qty")) {
        orderQtyList.add(item.getString());
      } else if (name.equals("total_amount")) {
        totalamtList.add(item.getString());
       } else if (name.equals("unit_price")) {
        unitpriceList.add(item.getString());  
      } else {
        params.put(name, item.getString());
      }
    }
  }

  // check duplication
  invoice_no = (String) params.get("invoice_no");
  buyer_id = (String) params.get("buyer_id");
  supplier_id = (String) params.get("supplier_id");
  //out.println(buyer_id);
  //if (true) return;
  if (invoice_no == null || invoice_no.trim().equals("")) {
    throw new UserDefinedException("Invoice No is missing. Check your data.");
  }

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();
  
  sql = " select  invoice_no "
      + " from    shipment_01t "
      + " where   invoice_no = '" + invoice_no + "' "
      + " and     buyer_id = '" + buyer_id + "' ";
  
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  
  if (iRet > 0) {
    throw new UserDefinedException("This shipment exists. There is the same invoice no(" + invoice_no + "). Check your data.");
  }

  // process attached files
  iter = items.iterator();

  while (iter.hasNext()) {
    FileItem item = (FileItem) iter.next();

    if (!item.isFormField()) {
      // process attached files
      String fieldName = item.getFieldName();
      String fileType = fieldName.substring(0, 2).toUpperCase();
      String fileName = item.getName();

      int pos = fileName.lastIndexOf("\\");
      if (pos < 0) fileName.lastIndexOf("/");

      String attachFileName = fileName.substring(pos+1);

      // check File Size
      if (item.getSize() == 0) {
        throw new UserDefinedException("Cannot process your file(" + attachFileName + "). The file size is zero. Check your file.");
      }

      String ext = "";
      pos = attachFileName.lastIndexOf(".");

      if (pos >= 0) {
        ext = attachFileName.substring(pos);
      }

      String realFileName = buyer_id + "_" + fileType + "_" + invoice_no + ext;
      File writeFile = new File(savePath + realFileName);

      if (writeFile.exists()) {
        writeFile.delete();
      }

      item.write(writeFile);
      params.put(fieldName, realFileName);
    }
  }

  // store shipment info
  // insert shipment header info
  sql = " insert into shipment_01t "
      + " ( "
      + "   invoice_no, supplier_id, issue_date, shipping_port, handover_date, "
      + "   shipping_type, nominated_forwarder, bl_filename, iv_filename, pl_filename, "
      + "   confirm_status, update_date,buyer_id, created_id "
      + " ) "
      + " values "
      + " ( "
      + "   ?, ?, str_to_date(?, '%Y/%m/%d'), ?, str_to_date(?, '%Y/%m/%d'), "
      + "   ?, ?, ?, ?, ?, "
      + "   'N', sysdate(), ?, ? "
      + " ) ";

  int j = 0;
  conn.setAutoCommit(false);
  pstmt = conn.prepareStatement(sql);
  pstmt.setString(++j, invoice_no);
  pstmt.setString(++j, (String) params.get("supplier_id"));
  pstmt.setString(++j, (String) params.get("issue_date"));
  pstmt.setString(++j, (String) params.get("shipping_port"));
  pstmt.setString(++j, (String) params.get("handover_date"));
  pstmt.setString(++j, (String) params.get("shipping_type"));
  pstmt.setString(++j, (String) params.get("nominated_forwarder"));
  pstmt.setString(++j, (String) params.get("bl_filename"));
  pstmt.setString(++j, (String) params.get("iv_filename"));
  pstmt.setString(++j, (String) params.get("pl_filename"));
  pstmt.setString(++j, (String) params.get("buyer_id"));
  pstmt.setString(++j, _adminid);
  //out.println(supplier_id);
  pstmt.executeUpdate();
  pstmt.close();
  pstmt = null;
  
  // insert shipment details info
  String[] poNoArray = (String[]) poNoList.toArray(new String[0]);
  String[] styleNoArray = (String[]) styleNoList.toArray(new String[0]);
  String[] seasonArray = (String[]) seasonList.toArray(new String[0]);
  String[] transTypeArray = (String[]) transTypeList.toArray(new String[0]);
  String[] orderQtyArray = (String[]) orderQtyList.toArray(new String[0]);
  String[] totalAmtArray = (String[]) totalamtList.toArray(new String[0]);

  sql = " insert into shipment_02t "
      + " ( "
      + "   po_no, style_no, invoice_no, supplier_id, season, "
      + "   trans_type, order_qty, total_amount, input_date, input_id,buyer_id "
      + " ) "
      + " values "
      + " ( "
      + "   ?, ?, ?, ?, ?, ?, ?, ?, sysdate(), ?, ? "
      + " ) ";

  pstmt = conn.prepareStatement(sql);
  
  for (int i = 0; i < poNoArray.length; i++) {
    j = 0;
    
    pstmt.setString(++j, poNoArray[i]);
    pstmt.setString(++j, styleNoArray[i]);
    pstmt.setString(++j, invoice_no);
    pstmt.setString(++j, supplier_id);
    pstmt.setString(++j, seasonArray[i]);
    pstmt.setString(++j, transTypeArray[i]);
    pstmt.setString(++j, orderQtyArray[i]);
    pstmt.setString(++j, totalAmtArray[i]);
    pstmt.setString(++j, _adminid);
    pstmt.setString(++j, buyer_id);    
    //out.println(poNoArray[i]);
    //out.println(styleNoArray[i]);
    //out.println(invoice_no);
    //out.println(supplier_id);
    //out.println(seasonArray[i]);
    //out.println( transTypeArray[i]);
    //out.println(orderQtyArray[i]);
    //out.println( totalAmtArray[i]);
    //out.println(supplier_id);
    //if (true) return;    
    
    pstmt.executeUpdate();   
   
    // PO status Update 73->75=Shipmemnt작성
    sql2 = " update purchase_order set order_status = '75', shipment_no= '"+ invoice_no+"' "
            +  " where order_no = '"+poNoArray[i]+"' " 
            +  "     and buyer = '" + buyer_id + "' "
            + "      and supplier = '" + supplier_id + "' " ;
    pstmt2 = conn.prepareStatement(sql2);            
    pstmt2.executeUpdate(); 
    pstmt2.close();    
  }
  
  pstmt.close();
  pstmt = null;
  //if (true) return;  
  conn.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  strMsg = ue.getMessage();
  System.out.println("Exception shipment_issue_save : " + ue.getMessage());
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  System.out.println("Exception maintenance save : " + e.getMessage());
  throw e;
} finally {
  if (pstmt != null) {
    try { pstmt.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
  }
}

// result message
String nextUrl = "";

if (isSucceeded) {
  strMsg = "The data has been successfully processed.";
  nextUrl = "./shipment_view.jsp";
} else {
  strMsg = "The operation failed.\\n" + strMsg;
  nextUrl = "./shipment_issue_list.jsp";
}

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<form name='form1' method='post'>\n");

if (isSucceeded) {

      out.write("\n");
      out.write("<input type='hidden' name='invoice_no' value='");
      out.print( invoice_no );
      out.write("'>\n");
      out.write("<input type='hidden' name='supplier_id' value='");
      out.print( supplier_id );
      out.write("'>\n");
      out.write("<input type='hidden' name='buyer_id' value='");
      out.print( buyer_id );
      out.write('\'');
      out.write('>');
      out.write('\n');

} else {

      out.write("\n");
      out.write("<input type='hidden' name='ag_from_date' value='");
      out.print( (String) params.get("ag_from_date") );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_to_date' value='");
      out.print( (String) params.get("ag_to_date") );
      out.write("'>\n");
      out.write("<input type='hidden' name='ag_po_no' value='");
      out.print( (String) params.get("ag_po_no") );
      out.write('\'');
      out.write('>');
      out.write('\n');

}

      out.write("\n");
      out.write("</form>\n");
      out.write("<script language='javascript'>\n");
      out.write("alert(\"");
      out.print( strMsg );
      out.write("\");\n");
      out.write("form1.action = '");
      out.print( nextUrl );
      out.write("';\n");
      out.write("form1.submit();\n");
      out.write("</script>\n");
      out.write("</body>\n");
      out.write("</html>\n");
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
