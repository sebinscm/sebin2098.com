package org.apache.jsp.admin.buyer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import dbconn.*;
import javax.naming.*;
import javax.sql.*;
import common.util.*;

public final class sample_005fsheet_005fedit_005fform_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_dependants.add("/bottom_line.jsp");
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
      out.write('\n');
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

String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";

int iRet = 0;
Connection conn = null;
Connection connVGMain = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
String outS = "";
String sql = "";

String fromUrl = "/admin/buyer/original_sample_list.jsp";
String searchItemClass = request.getParameter("searchItemClass");
String searchFromDate = request.getParameter("searchFromDate");
String searchToDate = request.getParameter("searchToDate");
String searchSupplier = request.getParameter("searchSupplier");
String searchItemGroup = request.getParameter("searchItemGroup");
String searchBuyer = request.getParameter("searchBuyer");
String searchSampleNo = request.getParameter("searchSampleNo");
String searchStyleNo = request.getParameter("searchStyleNo");
String searchStatus = request.getParameter("statusOptions");

String sequence_no = request.getParameter("sequence_no");
String sample_no = request.getParameter("sample_no");
String buyer_id = request.getParameter("buyer_id");

if (sequence_no == null) sequence_no = "";
if (sample_no == null) sample_no = "";
if (buyer_id == null) buyer_id = "";

String attached_file1 = "";
String attached_file2 = "";
String attached_file3 = "";
String modified  = "&nbsp;";
String send_date = "&nbsp;";
String return_date = "&nbsp;";
String created  = "&nbsp;";
String buyer_name ="";
String modifier ="";
String remarks ="";
String comments ="";

boolean isEditable = false;

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

    // read invoice header info
  sql = " select date_format(a.modified_date, '%Y/%m/%d'), " +
        "        a.afile1_name, a.afile2_name, a.afile3_name, " +
        "        date_format(a.sending_date, '%Y/%m/%d'),date_format(a.return_date, '%Y/%m/%d'),c.name ," +
        "        date_format(a.input_date, '%Y/%m/%d'), a.modifier,a.remarks, a.comments "  +
        "   from VG_SAMPLE_IN_OUT a  LEFT OUTER JOIN login_01t c ON ( a.buyer = c.id )  " +
        "   where a.sequence_no = '" + sequence_no   + "'";

 // out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  if (iRet > 0) {
    int j = 0;
    modified = matrix.getRowData(0).getData(j++);
    attached_file1 = matrix.getRowData(0).getData(j++);
    attached_file2 = matrix.getRowData(0).getData(j++);
    attached_file3 = matrix.getRowData(0).getData(j++);
    send_date = matrix.getRowData(0).getData(j++);
    return_date = matrix.getRowData(0).getData(j++);
    buyer_name = matrix.getRowData(0).getData(j++);
    created = matrix.getRowData(0).getData(j++);    
    modifier= matrix.getRowData(0).getData(j++);   
    remarks = matrix.getRowData(0).getData(j++);    
    comments= matrix.getRowData(0).getData(j++);   
  }

    
} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception invoice_edit_form : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}


      out.write("\n");
      out.write("<HTML>\n");
      out.write("<HEAD>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<SCRIPT LANGUAGE=JavaScript>\n");
      out.write("\n");
      out.write("\n");
      out.write("function fnUpdate(frm)\n");
      out.write("{\n");
      out.write("  if (!frm.attached_file1.value && !frm.attached_file2.value && !frm.attached_file3.value ) {\n");
      out.write("    alert('Select the file first to edit.');\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("   \n");
      out.write("  if (confirm('Do you want to replace with new file?')) {\n");
      out.write("    frm.action = './sample_sheet_update.jsp';\n");
      out.write("    frm.submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("function fnList(frm) {\n");
      out.write("  //frm.target = self.name;\n");
      out.write("  frm.action = 'original_sample_list.jsp';\n");
      out.write("  frm.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnDownload(file) {\n");
      out.write("  with (document.form2) {\n");
      out.write("    attachFile.value = file;\n");
      out.write("    attachRealFile.value = file;\n");
      out.write("    action = './download.jsp';\n");
      out.write("    target = 'hiddenFrm';\n");
      out.write("    submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("</SCRIPT>\n");
      out.write("</HEAD>\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\n");
      out.write("<table width=\"1000\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr><td>\n");
      out.write("\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"3%\"><img src=\"/img/title_icon.gif\"></td>\n");
      out.write("  <td width=\"*\" class=\"left_title\">Sample Sheet Details</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\"><b>Sample Detail</b></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<TABLE WIDTH='95%' border=\"0\" cellspacing=\"1\" cellpadding=\"0\" align=\"center\" class=\"table_bg\">\n");
      out.write("<FORM NAME='frmMain' METHOD='POST' enctype=\"multipart/form-data\">\n");
      out.write(" <input type='hidden' name='searchFromDate' value='");
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
      out.write("  <input type='hidden' name='sequence_no' value='");
      out.print( sequence_no );
      out.write("'>\n");
      out.write("  <input type='hidden' name='sample_no' value='");
      out.print( sample_no );
      out.write("'>\n");
      out.write("  <input type='hidden' name='buyer_id' value='");
      out.print( buyer_id );
      out.write("'>\n");
      out.write("  \n");
      out.write("<TR>\n");
      out.write("  <TD width='150' class='table_header_center'>Sample No.</TD>\n");
      out.write("  <TD width='200' class='table_bg_bright'>");
      out.print( sample_no );
      out.write("</TD>\n");
      out.write("  <TD width='100' class='table_header_center'> Updated</TD>\n");
      out.write("  <TD width='150' class='table_bg_bright'>");
      out.print( modified );
      out.write("</TD>\n");
      out.write("   <TD width='200' class='table_header_center'> Sent date </TD>\n");
      out.write("  <TD width='100' class='table_bg_bright'>");
      out.print( send_date );
      out.write("</TD>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("  <TD width='150' class='table_header_center'>Buyer</TD>\n");
      out.write("  <TD width='200' class='table_bg_bright'>");
      out.print( buyer_name );
      out.write("</TD>\n");
      out.write("  <TD width='100' class='table_header_center'> Created</TD>\n");
      out.write("  <TD width='150' class='table_bg_bright'>");
      out.print( created );
      out.write("</TD>\n");
      out.write("   <TD width='200' class='table_header_center'>Updated ID</TD>\n");
      out.write("  <TD width='100' class='table_bg_bright'>");
      out.print( modifier );
      out.write("</TD>\n");
      out.write("</TR>\n");
      out.write("<TR>\n");
      out.write("  <TD width='150' class='table_header_center'>Sample Sheet</TD>\n");
      out.write("  <TD width='200' class='table_bg_bright' colspan=2 ><a href=\"javascript:fnDownload('");
      out.print( attached_file1 );
      out.write("');\">");
      out.print( attached_file1 );
      out.write("</a></TD> \n");
      out.write("  <TD  width='100' class='table_bg_bright' colspan=3><input type='file' name='attached_file1' size='60' maxlength='200'></TD>\n");
      out.write(" </TR>\n");
      out.write(" <TR>\n");
      out.write("   <TD width='150' class='table_header_center'>Request Sheet</TD>\n");
      out.write("  <TD  width='200'class='table_bg_bright' colspan=2><a href=\"javascript:fnDownload('");
      out.print( attached_file2 );
      out.write("');\">");
      out.print( attached_file2 );
      out.write("</a></TD>\n");
      out.write("  <TD   width='100' class='table_bg_bright' colspan=3><input type='file' name='attached_file2' size='60' maxlength='200'></TD>\n");
      out.write("  </TR>\n");
      out.write("  <TR>\n");
      out.write("  <TD width='150' class='table_header_center'>Amend Sheet</TD>\n");
      out.write("  <TD width='200' class='table_bg_bright' colspan=2><a href=\"javascript:fnDownload('");
      out.print( attached_file3 );
      out.write("');\">");
      out.print( attached_file3 );
      out.write("</a></TD>\n");
      out.write("  <TD  width='100' class='table_bg_bright' colspan=3><input type='file' name='attached_file3' size='60' maxlength='200'></TD>\n");
      out.write("</TR>\n");
      out.write("  <TR>\n");
      out.write("   <TD  class='table_header_center' colspan=3>Supplier comments</TD>\n");
      out.write("   <TD  class='table_header_center'colspan=3 >Buyer comments</TD>\n");
      out.write(" </TR>\n");
      out.write(" \n");
      out.write("   <TR>\n");
      out.write("  <TD class='table_header_center' colspan=3><textarea  name=\"remarks\" cols=\"70\" rows=\"15\" >");
      out.print( remarks );
      out.write("</textarea></td>\n");
      out.write("  <TD class='table_header_center' colspan=3><textarea  name=\"comments\" cols=\"70\" rows=\"15\" >");
      out.print( comments );
      out.write("</textarea></td>\n");
      out.write("   </TR>\n");
      out.write("\n");
      out.write("</FORM>\n");
      out.write("</TABLE>\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("  ** Click 'Edit File' if you want to edit sheet file.\n");
      out.write("\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align='center'>\n");
      out.write("<form name='form1' method='post'>\n");
      out.write(" <input type='hidden' name='searchFromDate' value='");
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
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\">\n");
      out.write("    <input type='button' value=' Edit File ' onclick='fnUpdate(document.frmMain);'>\n");
      out.write("    <input type='button' value='Go To List' onclick='fnList(this.form);'>\n");
      out.write("  </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\n");
      out.write("</tr>\n");
      out.write("</form>\n");
      out.write("<form name='form2' method='post'>\n");
      out.write("<input type='hidden' name='attachPath' value='");
      out.print( _specSheetUrl  );
      out.write("'>\n");
      out.write("<input type='hidden' name='attachFile'>\n");
      out.write("<input type='hidden' name='attachRealFile'>\n");
      out.write("</form>\n");
      out.write("</table>\n");

out.println(CopyRightLogo());

      out.write("\n");
      out.write("</td></tr></table>\n");
      out.write("<iframe name='hiddenFrm' src='' width='0' height='0' frameborder='0'></iframe>\n");
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
