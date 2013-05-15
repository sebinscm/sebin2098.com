package org.apache.jsp.account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.*;
import java.sql.*;
import dbconn.*;
import java.text.*;
import javax.naming.*;
import javax.sql.*;

public final class view_005fprofile_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_dependants = new java.util.ArrayList(2);
    _jspx_dependants.add("/bottom_line.jsp");
    _jspx_dependants.add("/login_check.jsp");
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
      			"../error.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write('\n');
      out.write('\r');
      out.write('\n');

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

      out.write("\r\n");
      out.write("\r\n");

SimpleDateFormat dd = new SimpleDateFormat("yyyyMMdd");
String sdate = dd.format(new java.util.Date());
String id      = "";
String pw      = "";
String name    = "";
String email   = "";
String phone1  = "";
String phone2  = "";
String fax     = "";
String contact = "";
String addr1   = "";
String addr2   = "";
String postcode= "";
String surburb = "";
String state   = "";
String country   = "";

int iRet = 0;
int iRet2 = 0;
String outS = "";
String outS02 = "";
String sql = "";
String sql2 = "";

Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
DataProcess dataProcess = null;

try {

  matrix = new dbconn.MatrixDataSet();
  matrix2 = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
 
  // Read profile info
  sql = "select id," +
        "       passwd," +
        "       trim(name),"+
        "       email,"+
        "       phone1,"+
        "       phone2,"+
        "       fax,"+
        "       contact,"+
        "       addr1,"+
        "       addr2,"+
        "       postcode,"+
        "       surburb,"+
        "       state, country "+
        "  from login_01t " +
        " where id = '" + scmid + "'" ;
  // get country base code
  sql2 = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'COUNTRY_CODE' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  iRet2 = dataProcess.RetrieveData(sql2, matrix2, conn);

} catch (Exception e) {
  System.out.println("Exception /account/index : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}	
}

if (iRet > 0) {
  int j = 0;
  id      = matrix.getRowData(0).getData(j++);
  pw      = matrix.getRowData(0).getData(j++);
  name    = matrix.getRowData(0).getData(j++);
  email   = matrix.getRowData(0).getData(j++);
  phone1  = matrix.getRowData(0).getData(j++);
  phone2  = matrix.getRowData(0).getData(j++);
  fax     = matrix.getRowData(0).getData(j++);
  contact = matrix.getRowData(0).getData(j++);
  addr1   = matrix.getRowData(0).getData(j++);
  addr2   = matrix.getRowData(0).getData(j++);
  postcode= matrix.getRowData(0).getData(j++);
  surburb = matrix.getRowData(0).getData(j++);
  state   = matrix.getRowData(0).getData(j++);
  country   = matrix.getRowData(0).getData(j++);
}

 for (int i = 0; i < iRet2; i++) {
    String countryCode  = matrix2.getRowData(i).getData(0);
    String countryName  = matrix2.getRowData(i).getData(1);
     outS02  += "<option value=\"" + countryCode + "\"";    
    if ( country.equals(countryCode) ) {
       outS02  += " SELECTED ";  
    }
    outS02  += ">" + countryName+ "</option>";
  }

      out.write("\r\n");
      out.write("<HTML>\r\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script language=JavaScript>\r\n");
      out.write("function Submit()\r\n");
      out.write("{\r\n");
      out.write("  var yn\r\n");
      out.write("  yn = confirm(\" Are you sure to update your profile ?  \");\r\n");
      out.write("  \r\n");
      out.write("  if ( yn == true ) {\r\n");
      out.write("    frmMain.method = \"POST\";\r\n");
      out.write("    frmMain.action = \"buyer_profile_update.jsp\";\r\n");
      out.write("    frmMain.submit();\r\n");
      out.write("  }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function pwchange()\r\n");
      out.write("{\r\n");
      out.write("  frmMain.action = \"../initpass.jsp\";\r\n");
      out.write("  frmMain.submit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function Back()\r\n");
      out.write("{\r\n");
      out.write("  history.back();\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\r\n");
      out.write("<table width=\"840\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n");
      out.write("<tr><td>\r\n");
      out.write("\r\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"15\" colspan=\"2\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"3%\"><img src=\"/img/title_icon.gif\"></td>\r\n");
      out.write("  <td width=\"*\" class=\"left_title\">Buyer Profile</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"2\" colspan=\"2\"><hr width=\"100%\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<table width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align='center'>\r\n");
      out.write("<TR>\r\n");
      out.write("  <td width=100%><font color=red>Note) *Buyer ID cannot be changed.</font></td>\r\n");
      out.write("</TR>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<TABLE cellSpacing=1 cellPadding=2 width=\"90%\" border=0 align='center' class=\"table_bg\">\r\n");
      out.write("<FORM NAME=\"frmMain\" METHOD=\"POST\" ACTION=\"profile_update.jsp\">\r\n");
      out.write("<TBODY>\r\n");
      out.write("  <TR>\r\n");
      out.write("    <TD ALIGN=CENTER bgcolor=#ccccff>*Buyer ID</TD>\r\n");
      out.write("    <TD ALIGN=left class=\"table_bg_bright\"><input readonly type=text name=id value=");
      out.print(id);
      out.write(" > </TD>\r\n");
      out.write("  </TR>\r\n");
      out.write("  <TR>\r\n");
      out.write("    <TD ALIGN=CENTER bgcolor=#ccccff>Buyer Name</TD>\r\n");
      out.write("    <TD ALIGN=left class=\"table_bg_bright\"><textarea readonly style=\"overflow:hidden\" NAME=name rows=1 cols=40>");
      out.print(name);
      out.write("</textarea></TD>\r\n");
      out.write("  </TR>\r\n");
      out.write("  <TR>\r\n");
      out.write("    <TD ALIGN=CENTER bgcolor=\"#F4F2AE\">Email</TD>\r\n");
      out.write("    <TD ALIGN=LEFT class=\"table_bg_bright\"><textarea  style=\"overflow:hidden\"  NAME=email rows=1 cols=30>");
      out.print(email);
      out.write("</textarea></TD>\r\n");
      out.write("  </TR>\r\n");
      out.write("  <TR>\r\n");
      out.write("    <TD ALIGN=CENTER bgcolor=\"#F4F2AE\">Phone</TD>\r\n");
      out.write("    <TD ALIGN=LEFT class=\"table_bg_bright\"><textarea  style=\"overflow:hidden\" NAME=phone1 rows=1 cols=30 >");
      out.print(phone1);
      out.write("</textarea></TD>\r\n");
      out.write("  </TR>\r\n");
      out.write("  <TR>\r\n");
      out.write("    <TD ALIGN=CENTER bgcolor=\"#F4F2AE\">Mobile Phone</TD>\r\n");
      out.write("    <TD ALIGN=LEFT class=\"table_bg_bright\"><textarea  style=\"overflow:hidden\" NAME=phone2 rows=1 cols=30>");
      out.print(phone2);
      out.write("</textarea> </TD>\r\n");
      out.write("  </TR>\r\n");
      out.write("  <TR>\r\n");
      out.write("    <TD ALIGN=CENTER bgcolor=\"#F4F2AE\">Fax</TD>\r\n");
      out.write("    <TD ALIGN=LEFT class=\"table_bg_bright\"><textarea  style=\"overflow:hidden\" NAME=fax rows=1 cols=30 >");
      out.print(fax);
      out.write("</textarea></TD>\r\n");
      out.write("  </TR>\r\n");
      out.write("  <TR>\r\n");
      out.write("    <TD ALIGN=CENTER bgcolor=\"#F4F2AE\">Contact Name</TD>\r\n");
      out.write("    <TD ALIGN=LEFT class=\"table_bg_bright\"><textarea  style=\"overflow:hidden\" NAME=contact  rows=1 cols=30>");
      out.print(contact);
      out.write("</textarea></TD>\r\n");
      out.write("  </TR>\r\n");
      out.write("  <TR>\r\n");
      out.write("    <TD ALIGN=CENTER bgcolor=\"#F4F2AE\">Address1</TD>\r\n");
      out.write("    <TD ALIGN=LEFT class=\"table_bg_bright\"><textarea  style=\"overflow:hidden\" NAME=addr1   rows=1 cols=30>");
      out.print(addr1);
      out.write("</textarea></TD>\r\n");
      out.write("  </TR>\r\n");
      out.write("  <TR>\r\n");
      out.write("    <TD ALIGN=CENTER bgcolor=\"#F4F2AE\">Address2</TD>\r\n");
      out.write("    <TD ALIGN=LEFT class=\"table_bg_bright\"><textarea  style=\"overflow:hidden\" NAME=addr2   rows=1 cols=30 >");
      out.print(addr2);
      out.write("</textarea></TD>\r\n");
      out.write("  </TR>\r\n");
      out.write("  <TR>\r\n");
      out.write("    <TD ALIGN=CENTER bgcolor=\"#F4F2AE\">Post Code</TD>\r\n");
      out.write("    <TD ALIGN=LEFT class=\"table_bg_bright\"><textarea  style=\"overflow:hidden\" NAME=postcode  rows=1 cols=30>");
      out.print(postcode);
      out.write("</textarea></TD>\r\n");
      out.write("  </TR>\r\n");
      out.write("  <TR>\r\n");
      out.write("    <TD ALIGN=CENTER bgcolor=\"#F4F2AE\">Surburb</TD>\r\n");
      out.write("    <TD ALIGN=LEFT class=\"table_bg_bright\"><textarea  style=\"overflow:hidden\" NAME=surburb  rows=1 cols=30 >");
      out.print(surburb);
      out.write("</textarea></TD>\r\n");
      out.write("  </TR>\r\n");
      out.write("  <TR>\r\n");
      out.write("    <TD ALIGN=CENTER bgcolor=\"#F4F2AE\">State</TD>\r\n");
      out.write("    <TD ALIGN=LEFT class=\"table_bg_bright\"><input type=text NAME=state value=");
      out.print(state);
      out.write("></TD>\r\n");
      out.write("  </TR>\r\n");
      out.write("  <TR>\r\n");
      out.write("    <TD ALIGN=CENTER bgcolor=\"#F4F2AE\">Country</TD>\r\n");
      out.write("    <TD ALIGN=LEFT class=\"table_bg_bright\"><SELECT NAME=country>");
      out.print(outS02);
      out.write("</SELECT></TD>\r\n");
      out.write("  </TR>\r\n");
      out.write("</TABLE>\r\n");
      out.write("\r\n");
      out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align='center'>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"15\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"15\">\r\n");
      out.write("    <INPUT TYPE=BUTTON VALUE=\" Update \" ONCLICK=\"Submit()\">\r\n");
      out.write("    <INPUT TYPE=BUTTON VALUE=\"Password change\" ONCLICK=\"pwchange()\">\r\n");
      out.write("  </td>\r\n");
      out.write("</tr>\r\n");
      out.write("</FORM>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");

out.println(CopyRightLogo());

      out.write("\r\n");
      out.write("\r\n");
      out.write("</td></tr></table>\r\n");
      out.write("</BODY>\r\n");
      out.write("</HTML>\r\n");
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
