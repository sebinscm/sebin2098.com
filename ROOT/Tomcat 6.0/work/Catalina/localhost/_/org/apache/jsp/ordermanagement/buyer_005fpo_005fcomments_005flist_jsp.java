package org.apache.jsp.ordermanagement;

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

public final class buyer_005fpo_005fcomments_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_dependants = new java.util.ArrayList(4);
    _jspx_dependants.add("/login_check.jsp");
    _jspx_dependants.add("/bottom_line.jsp");
    _jspx_dependants.add("/common/CommonVars.jsp");
    _jspx_dependants.add("/common/calendar/calendar.htm");
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
      out.write("<Div id='popCal' style='POSITION:absolute;visibility:hidden;border:1px ridge;width:10'>\n");
      out.write("  <iframe name=\"popFrame\" src=\"/common/calendar/popcjs.htm\" frameborder=\"0\" style=\"border:1 solid #EBF6FD\"  frameborder=\"0\" scrolling=\"no\" width=176 height=215>\n");
      out.write("  </iframe>\n");
      out.write("</DIV>\n");
      out.write("<!--SCRIPT event=onclick() for=document>document.all['popCal'].style.visibility = \"hidden\";</SCRIPT-->\n");
      out.write("<script language='javascript'>\n");
      out.write("function setVisibility() {\n");
      out.write("  document.all['popCal'].style.visibility = 'hidden';\n");
      out.write("}\n");
      out.write("\n");
      out.write("document.onclick = setVisibility;\n");
      out.write("</script>");
      out.write('\n');
      out.write('\n');

Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;


String seqno = "";
String outS = "";
int    iRet = 0;

String seqNo     = "" ;  
String orderNo       = "" ;  
String supplier_remarks        = "";
String buyer_remarks         = "";
String supplier_id        = "";
String buyer_id          = "";
String supplier_updated    = "";
String buyer_updated    = "";


String day = "";
String color_code ="";
int color_count = 0;

String fromUrl = request.getParameter("fromUrl ");
String curPage = request.getParameter("curPage");
String pageSize = request.getParameter("pageSize");
String ag_supplier = request.getParameter("ag_supplier");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_status = request.getParameter("ag_status");
String ag_orderby = request.getParameter("ag_orderby");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");

String po_no = request.getParameter("po_no_selected");
//set sql
String sql = " select  seqno,order_no, supplier_remarks,buyer_remarks, supplier_id,buyer_id,date_format(supplier_updated, '%Y/%m/%d'), "
        + "        date_format(buyer_updated, '%Y/%m/%d')  "
        + " from    PO_COMMENTS   "
        + "         where order_no = '"+po_no+"' " 
        + " order by seqno ";     
//out.println(sql);
try {

  matrix = new MatrixDataSet();
   dataProcess = new DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  iRet = dataProcess.RetrieveData( sql, matrix, conn);
  

} catch (Exception e) {
  System.out.println("Exception invoice_search : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

if (iRet > 0 ) {
  for (int i=0; i < iRet; i++) {
     int j = 0;    
   seqNo     = matrix.getRowData(i).getData(j++);   
   orderNo       = matrix.getRowData(i).getData(j++);       
   supplier_remarks        = matrix.getRowData(i).getData(j++);
   buyer_remarks        = matrix.getRowData(i).getData(j++);
   supplier_id       = matrix.getRowData(i).getData(j++);
   buyer_id          = matrix.getRowData(i).getData(j++);
   supplier_updated   = matrix.getRowData(i).getData(j++);
   buyer_updated   = matrix.getRowData(i).getData(j++);
   
   
    
    if( color_count > 0 ) {
      color_code = "#EEEEE0";
      color_count = 0;
    }else {
      color_code = "#FFFFF0";
      color_count = 1;
    }

    outS += "<tr bgcolor=" + color_code + ">" +
            "<td align=center > <font size=2>" + seqNo   + " </font></td>" +         
            "<td align=center > <font size=2>" + orderNo + " </font></td>" +
            "<td align=center > <font size=2><TEXTAREA  cols=70 rows=10  >"+ supplier_remarks+"</TEXTAREA></font></td>" +
            "<td align=center > <font size=2>" + supplier_id  + " </font></td>" +
            "<td align=center > <font size=2>" +  supplier_updated  + " </font></td>" + 
            "<td align=center > <font size=2><TEXTAREA  cols=70 rows=10  >"+ buyer_remarks+"</TEXTAREA></font></td>" +
            "<td align=center > <font size=2>" + buyer_id  + " </font></td>" +
            "<td align=center > <font size=2>" +  buyer_updated  + " </font></td>" + 
            "</tr>";
  } //end of for
} else {
	 outS += "<td align=center colspan=8 > <font size=2> No comment found. </font></td>" ;
}	//end of if



      out.write("\n");
      out.write("<HTML>\n");
      out.write("<HEAD>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\n");
      out.write("<SCRIPT LANGUAGE=JavaScript>\n");
      out.write("\n");
      out.write("function fnBack(frm) {\n");
      out.write("  //frm.action = \"");
      out.print( fromUrl );
      out.write("\";\n");
      out.write("  //frm.target = this.name;\n");
      out.write("  //frm.submit();\n");
      out.write("  history.back();\n");
      out.write("}\n");
      out.write("\n");
      out.write("</SCRIPT>\n");
      out.write("</HEAD>\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"15\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"3%\"><img src=\"/img/btnCategories.gif\"></td>\n");
      out.write("  <td width=\"*\" class=\"left_title\">PO Comment History</td>\n");
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
      out.write("<FORM NAME=frmMain action=\"original_sample_list.jsp\" METHOD=POST >\n");
      out.write("\t<INPUT TYPE=HIDDEN NAME=fromUrl VALUE= '");
      out.print( fromUrl );
      out.write("' >\n");
      out.write("\t<INPUT TYPE=HIDDEN NAME=pono VALUE='");
      out.print(po_no);
      out.write("' >\t\n");
      out.write("\t<INPUT TYPE=HIDDEN NAME=ag_orderby value='");
      out.print( ag_orderby );
      out.write("'>\n");
      out.write("    <INPUT TYPE=HIDDEN NAME=ag_status value='");
      out.print( ag_status );
      out.write("'>\n");
      out.write("   <INPUT TYPE=HIDDEN NAME=ag_po_no value='");
      out.print( ag_po_no );
      out.write("'>\n");
      out.write("   <INPUT TYPE=HIDDEN NAME=ag_style_no value='");
      out.print( ag_style_no );
      out.write("'>\n");
      out.write("   <INPUT TYPE=HIDDEN NAME=ag_supplier value='");
      out.print( ag_supplier );
      out.write("'>\n");
      out.write("   <INPUT TYPE=HIDDEN NAME=ag_from_date value='");
      out.print( ag_from_date );
      out.write("'>\n");
      out.write("   <INPUT TYPE=HIDDEN NAME=ag_to_date value='");
      out.print( ag_to_date );
      out.write("'>\t\t\n");
      out.write("<tr>\n");
      out.write("  <td height='15'></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<TABLE width='100%' border=0 cellpadding=0 cellspacing=1 align='center' class='table_bg'>\n");
      out.write("<tr class='table_header_center'>\n");
      out.write("<TD width='20' ><FONT size=2>Seq No. </FONT></TD>\n");
      out.write("<TD width='50'><FONT size=2>PO No. </FONT></TD>\n");
      out.write("<TD width='70'><FONT size=2>Remarks</FONT></TD>\n");
      out.write("<TD width='50'<FONT size=2>user ID </FONT></TD>\n");
      out.write("<TD width='50'><FONT size=2>Updated </FONT></TD>\n");
      out.write("<TD width='70'><FONT size=2>Buyer Remarks</FONT></TD>\n");
      out.write("<TD width='50'><FONT size=2>Buyer ID </FONT></TD>\n");
      out.write("<TD width='50'><FONT size=2>Updated </FONT></TD>\n");
      out.write("</tr>\n");
      out.print(outS);
      out.write("\n");
      out.write("</FORM>\n");
      out.write("</TABLE>\n");
      out.write("<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'>\n");
      out.write("<tr>\n");
      out.write("  <td height='15'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td align='center'>\n");
      out.write("    <input type='button' value='Go back' onclick='fnBack(this.form);'>\n");
      out.write("  </td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");

out.println(CopyRightLogo());

      out.write("\n");
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
