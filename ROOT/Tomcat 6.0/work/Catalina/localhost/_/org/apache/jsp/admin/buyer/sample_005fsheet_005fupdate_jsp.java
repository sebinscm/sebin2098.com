package org.apache.jsp.admin.buyer;

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

public final class sample_005fsheet_005fupdate_jsp extends org.apache.jasper.runtime.HttpJspBase
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


String searchItemClass = "";
String searchFromDate = "";
String searchToDate = "";
String searchSupplier = "";
String searchItemGroup = "";
String searchBuyer = "";
String searchSampleNo = "";
String searchStyleNo = "";
String searchStatus = "";


// variables
boolean isSucceeded = false;
String strMsg = "";
String sequence_no =  "";
String buyer_id =  "";
String sample_no =  "";

int iCnt = 0;
int iRet = 0;
String sql = "";
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
Connection conn = null;
PreparedStatement pstmt = null;

HashMap params = new HashMap();               // for parameter
String savePath = application.getRealPath(_specSheetUrl ) + File.separator;   // file path

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
      params.put(name, item.getString());
    }
  }

  // database process
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();
  
  // check shipment  
  sequence_no= (String) params.get("sequence_no");
  sample_no= (String) params.get("sample_no");
  buyer_id = (String) params.get("buyer_id");
  
  searchItemClass =(String) params.get("searchItemClass");
  searchFromDate = (String) params.get("searchFromDate");
  searchToDate =  (String) params.get("searchToDate");
  searchSupplier = (String)  params.get("searchSupplier");
  searchItemGroup= (String)  params.get("searchItemGroup");
  searchBuyer =  (String) params.get("searchBuyer");
  searchSampleNo = (String) params.get("searchSampleNo");
  searchStyleNo = (String) params.get("searchStyleNo");
  searchStatus =  (String) params.get("statusOptions");
  
  
  

   // process attached files
  iter = items.iterator();

  while (iter.hasNext()) {
    FileItem item = (FileItem) iter.next();

    if (!item.isFormField()) {
      // process attached files
      String fieldName = item.getFieldName();
      String fileName = item.getName();

      // if filename is empty then skip
      if (fileName == null || fileName.equals("")) {
        continue;
      }

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

      String fileType = fieldName.substring(0, 2).toUpperCase();
      String realFileName =  sample_no+"_"+fileName;
      File writeFile = new File(savePath + realFileName);

      if (writeFile.exists()) {
        writeFile.delete();
      }

      item.write(writeFile);
      params.put(fieldName, realFileName);
    }
  }

  // update shipment header info
  sql = " update  VG_SAMPLE_IN_OUT "
      + " set     modifier =  ? , "
      + (params.get("attached_file1") != null ? " afile1_name = ?, " : "")
      + (params.get("attached_file2") != null ? " afile2_name = ?, " : "")
      + (params.get("attached_file3") != null ? " afile3_name = ?, " : "")
       + "        modified_date = sysdate()  "
       + " where  sequence_no = ? ";

  //out.println((String) params.get("handover_date"));
  //if (true) return;
  int j = 0;
  conn.setAutoCommit(false);
  pstmt = conn.prepareStatement(sql);
  pstmt.setString(++j, _adminid);


  if(params.get("attached_file1") != null) {
    pstmt.setString(++j, (String) params.get("attached_file1"));
  }
  if(params.get("attached_file2") != null) {
    pstmt.setString(++j, (String) params.get("attached_file2"));
  }
  if(params.get("attached_file3") != null) {
    pstmt.setString(++j, (String) params.get("attached_file3"));
  }
  pstmt.setString(++j, sequence_no);
  iCnt = pstmt.executeUpdate();
  pstmt.close();
  pstmt = null;

  if (iCnt != 1) {
    throw new UserDefinedException("Cannot update this shipment. Check your data.");
  }

  conn.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  strMsg = ue.getMessage();
  System.out.println("Exception sample sheet_pdate : " + ue.getMessage());
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  System.out.println("Exception ample sheet_update : " + e.getMessage());
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
String nextUrl = "./sample_sheet_edit_form.jsp";

if (isSucceeded) {
  strMsg = "The data has been successfully processed.";
} else {
  strMsg = "The operation failed.\\n" + strMsg;
}

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<form name='form1' method='post'>\n");
      out.write("    <input type='hidden' name='sequence_no' value='");
      out.print( sequence_no );
      out.write("'  >\n");
      out.write("   <input type='hidden' name='buyer_id' value='");
      out.print( buyer_id  );
      out.write("'>\n");
      out.write("   <input type='hidden' name='sample_no' value='");
      out.print( sample_no  );
      out.write("' >\n");
      out.write("    <input type='hidden' name='searchFromDate' value='");
      out.print( searchFromDate );
      out.write("'>\n");
      out.write("  <input type='hidden' name='searchToDate' value='");
      out.print( searchToDate );
      out.write("'>\n");
      out.write("  <input type='hidden' name='searchBuyer' value='");
      out.print( searchBuyer );
      out.write("'>\n");
      out.write("  <input type='hidden' name='searchItemClass' value='");
      out.print( searchItemClass );
      out.write("'>\n");
      out.write("  <input type='hidden' name='searchSupplier' value='");
      out.print( searchSupplier );
      out.write("'>\n");
      out.write("  <input type='hidden' name='searchItemGroup' value='");
      out.print( searchItemGroup );
      out.write("'>\n");
      out.write("  <input type='hidden' name='searchSampleNo' value='");
      out.print( searchSampleNo );
      out.write("'>\n");
      out.write("  <input type='hidden' name='statusOptions' value='");
      out.print( searchStatus );
      out.write("'>\n");
      out.write("  <input type='hidden' name='searchStyleNo' value='");
      out.print( searchStyleNo );
      out.write("'>\n");
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
