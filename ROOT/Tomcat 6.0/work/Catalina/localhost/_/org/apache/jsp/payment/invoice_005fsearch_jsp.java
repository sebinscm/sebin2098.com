package org.apache.jsp.payment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;
import dbconn.*;
import common.util.*;

public final class invoice_005fsearch_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      			"/error.jsp", true, 8192, true);
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

Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;

String supplier_id = "";
String supplier_name = "";
String buyer_id = "";
String buyer_name = "";
String po_no="";
String invoice_no="";
String style_no="";
String invoice_date="";
String tot_amount ="";
String qty ="";
String price="";
String seqno = "";
String outS = "";
int    iRet = 0;
int    iRet2 = 0;
int    i = 0;
int    rcnt = 0;
String sql = "";
String sql2 ="";
String update1 ="";
String update2 ="";
String file_name="";
String file_name2="";
String day = "";
String gp_status ="";
String gp_date ="";
String color_code ="";
int color_count = 0;

String ag_search_inv_no = request.getParameter("ag_search_inv_no");
String ag_year = request.getParameter("ag_year");
String ag_month = request.getParameter("ag_month");
if (ag_search_inv_no == null) ag_search_inv_no = "";
if (ag_year == null) ag_year = "";
if (ag_month == null) ag_month = "";
if (ag_month.equals("") || ag_year.equals("")) {
  ag_month = DateUtil.getToday("MM");
  ag_year = DateUtil.getToday("yyyy");
}

//String today =  ag_month + ag_year.substring(2,4) ;
String today =  ag_year+ag_month  ;

//set sql
sql = " select  " +
      "       a.invoice_no, " +
      "       date_format(a.invoice_date, '%Y/%m/%d'), " +
      "       a.buyer_id, " +
      "       a.sup_id, " +
      "       a.file_name, " +
      "       date_format(a.updated,'%Y/%m/%d'), " +
      "       b.name,c.name, " +
      "       a.gp_status, date_format(gp_date,'%Y/%m/%d') " +
      "  from invoice_01t a  LEFT OUTER JOIN login_01t b ON (a.buyer_id = b.id) " +
      "                               LEFT OUTER JOIN login_01t c  ON (a.sup_id = c.id ) " +
      " where a.invoice_no is not null " ;



if ( !(ag_search_inv_no == null || ag_search_inv_no.length() < 1)) {
  sql += " and  upper(a.invoice_no)  like upper('" + ag_search_inv_no + "%')  " ;
} else {
  sql += "  and date_format(a.invoice_date,'%Y%m') = '" + today + "'" ;
}
sql += " order by a.invoice_no desc ";

//out.println(sql);
//if (true) return;
try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

} catch (Exception e) {
  System.out.println("Exception invoice_search : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

if (iRet > 0 ) {
  for (i=0; i < iRet; i++) {
    invoice_no = matrix.getRowData(i).getData(0);
    invoice_date = matrix.getRowData(i).getData(1);
    buyer_id  = matrix.getRowData(i).getData(2);
    supplier_id  = matrix.getRowData(i).getData(3);
    file_name2  = matrix.getRowData(i).getData(4);
    update1     = matrix.getRowData(i).getData(5);
    buyer_name = matrix.getRowData(i).getData(6);
    supplier_name = matrix.getRowData(i).getData(7);
    gp_status = matrix.getRowData(i).getData(8);
    gp_date = matrix.getRowData(i).getData(9);
    
    if( color_count > 0 ) {
      color_code = "#EEEEE0";
      color_count = 0;
    }else {
      color_code = "#FFFFF0";
      color_count = 1;
    }

    outS += "<tr bgcolor=" + color_code + ">" +
            "<td align=center > <font size=2>" + (i+1) + "</font></td>" +
            "<td align=center > <font size=2>" + invoice_date + " </font></td>" +
            "<td align=center > <font size=2>" + buyer_id + " </font></td>" +
            "<td align=center > <font size=2>" + buyer_name + " </font></td>" +
            "<td align=center > <font size=2>" + supplier_id + " </font></td>" +
            "<td align=center > <font size=2>" + supplier_name + " </font></td>" +
            "<td align=center > <font size=2> <a href=\"javascript:fnView('" + invoice_no + "', '" + supplier_id + "','" + buyer_id + "', '" + gp_status + "')\">" + invoice_no + "</font></td>" +
	         "<td align=center > <font size=2> <a href=\"javascript:fnDownload('" + file_name2 + "');\">" + file_name2 + "</a></font></td> " +
            "<td align=center > <font size=2>" + update1 + "</font></td>" +
            "<td align=center > <font size=2>" + gp_status + "</font></td>" +
            "<td align=center > <font size=2>" + gp_date + "</font></td>" +
            "</tr>";
  } //end of for
} //end of if

// create ag_year optiones
String optionYears = "";
int thisYear = Integer.parseInt(DateUtil.getToday("yyyy"));
for (int k = thisYear - 4; k <= thisYear; k++) {
  optionYears += "<option value='" + k + "' " + (ag_year.equals(k + "") ? "selected" : "") +">" + k + "</option>";
}

      out.write("\n");
      out.write("<HTML>\n");
      out.write("<HEAD>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<SCRIPT LANGUAGE=JavaScript>\n");
      out.write("function fnDownload(file) {\n");
      out.write("  with (document.form2) {\n");
      out.write("    attachFile.value = file;\n");
      out.write("    attachRealFile.value = file;\n");
      out.write("    action = '/common/download.jsp';\n");
      out.write("    //target = 'hiddenFrm';\n");
      out.write("    submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnView(inv_no, sup_id,buyer_id,chk_status) {\n");
      out.write("  document.frmMain.inv_no.value = inv_no;\n");
      out.write("  document.frmMain.sup_id.value = sup_id;\n");
      out.write("  document.frmMain.buyer_id.value = buyer_id;\n");
      out.write("   document.frmMain.chk_status.value = chk_status;\n");
      out.write("  document.frmMain.action = './invoice_edit_form.jsp';\n");
      out.write("  document.frmMain.submit();\n");
      out.write("}\n");
      out.write("</SCRIPT>\n");
      out.write("</HEAD>\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\n");
      out.write("<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr><td>\n");
      out.write("\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"3%\"><img src=\"/img/title_icon.gif\"></td>\n");
      out.write("  <td width=\"*\" class=\"left_title\">Invoice List</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<TABLE width=900 border='0' align='center'>\n");
      out.write("<FORM NAME=frmMain action=\"invoice_search.jsp\" METHOD=POST >\n");
      out.write("\t<input type='hidden' name='chk_status'>\n");
      out.write("<input type='hidden' name='inv_no'>\n");
      out.write("<input type='hidden' name='sup_id'>\n");
      out.write("<input type='hidden' name='buyer_id'>\n");
      out.write("<tr>\n");
      out.write("  <td height='15'></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<TABLE WIDTH=750 border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" class='table_bg'>\n");
      out.write("<TR>\n");
      out.write("  <TD width='20%' class='table_header_center'>Issue Date</TD>\n");
      out.write("  <TD width='20%' class='table_bg_bright'>\n");
      out.write("  <SELECT NAME=ag_year>");
      out.print( optionYears );
      out.write("</SELECT>\t\n");
      out.write("  <SELECT NAME=ag_month>\n");
      out.write("  <OPTION ");
 if(ag_month.equals("01")) out.print("SELECTED"); 
      out.write(">01</OPTION>\n");
      out.write("  <OPTION ");
 if(ag_month.equals("02")) out.print("SELECTED"); 
      out.write(">02</OPTION>\n");
      out.write("  <OPTION ");
 if(ag_month.equals("03")) out.print("SELECTED"); 
      out.write(">03</OPTION>\n");
      out.write("  <OPTION ");
 if(ag_month.equals("04")) out.print("SELECTED"); 
      out.write(">04</OPTION>\n");
      out.write("  <OPTION ");
 if(ag_month.equals("05")) out.print("SELECTED"); 
      out.write(">05</OPTION>\n");
      out.write("  <OPTION ");
 if(ag_month.equals("06")) out.print("SELECTED"); 
      out.write(">06</OPTION>\n");
      out.write("  <OPTION ");
 if(ag_month.equals("07")) out.print("SELECTED"); 
      out.write(">07</OPTION>\n");
      out.write("  <OPTION ");
 if(ag_month.equals("08")) out.print("SELECTED"); 
      out.write(">08</OPTION>\n");
      out.write("  <OPTION ");
 if(ag_month.equals("09")) out.print("SELECTED"); 
      out.write(">09</OPTION>\n");
      out.write("  <OPTION ");
 if(ag_month.equals("10")) out.print("SELECTED"); 
      out.write(">10</OPTION>\n");
      out.write("  <OPTION ");
 if(ag_month.equals("11")) out.print("SELECTED"); 
      out.write(">11</OPTION>\n");
      out.write("  <OPTION ");
 if(ag_month.equals("12")) out.print("SELECTED"); 
      out.write(">12</OPTION>\n");
      out.write("  </SELECT>  \n");
      out.write("  <TD width='20%' class='table_header_center'>Invoice No.</TD>\n");
      out.write("  <TD width='20%' class='table_bg_bright'><input type=text name=ag_search_inv_no value='");
      out.print( ag_search_inv_no );
      out.write("'>\n");
      out.write("  </TD>\n");
      out.write("  <TD width='20%' class='table_bg_bright_center'>\n");
      out.write("  <INPUT TYPE=BUTTON VALUE=\"Search\" ONCLICK=submit()>\n");
      out.write("  </TD>\n");
      out.write("</TR>\n");
      out.write("</TABLE>\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("* Click the Invoice number to see the detail from the invoice list below. \n");
      out.write("<TABLE width='100%' border=0 cellpadding=0 cellspacing=1 align='center' class='table_bg'>\n");
      out.write("<tr class='table_header_center'>\n");
      out.write("<TD width=3%><FONT size=2>No </FONT></TD>\n");
      out.write("<TD width=3%><FONT size=2>Issue Date </FONT></TD>\n");
      out.write("<TD width=3%><FONT size=2>Buyer ID </FONT></TD>\n");
      out.write("<TD width=15%><FONT size=2>Buyer Name </FONT></TD>\n");
      out.write("<TD width=3%><FONT size=2>Suppler ID </FONT></TD>\n");
      out.write("<TD width=15%><FONT size=2>Suppler Name </FONT></TD>\n");
      out.write("<TD width=15%><FONT size=2>Invoice No. </FONT></TD>\n");
      out.write("<TD width=15%><FONT size=2>Invoice File </FONT></TD>\n");
      out.write("<TD width=3%><FONT size=2>Updated  </FONT></TD>\n");
      out.write("<TD width=5%><FONT size=2>Invoiced</FONT></TD>\n");
      out.write("<TD width=10%><FONT size=2>Invoice Date </FONT></TD>\n");
      out.write("</tr>\n");
      out.print(outS);
      out.write("\n");
      out.write("</FORM>\n");
      out.write("<form name='form2' method='post'>\n");
      out.write("<input type='hidden' name='attachPath' value='");
      out.print( _invoiceFileUrl );
      out.write("'>\n");
      out.write("<input type='hidden' name='attachFile'>\n");
      out.write("<input type='hidden' name='attachRealFile'>\n");
      out.write("</form>\n");
      out.write("</TABLE>\n");

out.println(CopyRightLogo());

      out.write("\n");
      out.write("</td></tr></table>\n");
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
