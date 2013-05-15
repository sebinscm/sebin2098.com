package org.apache.jsp.admin.codes;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import common.util.*;
import dbconn.*;

public final class code_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_dependants.add("/admin/login_check.jsp");
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
      			"/error.jsp", true, 8192, true);
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

      out.write('\r');
      out.write('\n');
      out.write('\n');
      out.write("\r\n");
      out.write("\r\n");

response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

String searchCatalogType = request.getParameter("searchCatalogType");
String selectedCatalogTypeName = "";    // 선택된 Catalog Type 이름

int iRet = 0;
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
String strSep = "|!^";
String outS01 = "";
String outS02 = "";
String sql = "";

try {

  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  // Read Catalog Type List
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = '0' "
      + " order by code asc";

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  for (int i = 0; i < iRet; i++) {
    String catalogCode  = matrix.getRowData(i).getData(0);
    String catalogName  = matrix.getRowData(i).getData(1);

    if (searchCatalogType == null && i == 0) {
      // 검색 조건이 없을 경우 첫번째 항목을 검색 조건으로 세팅함.
      searchCatalogType = catalogCode;
    }

    outS01  += "<option value=\"" + catalogCode + "\"";
    if (catalogCode.equals(searchCatalogType)) {
      outS01 += " selected";
      selectedCatalogTypeName = catalogName;
    }
    outS01  += ">" + catalogName + "</option>";
  }

  // Catalog Type에 해당하는 Catalog List를 읽어온다.
   sql = " select  code, code_name, type, description,use_yn, "
      + "         sort_order, related_code "
      + " from    vg_common_code "
      + " where   type = '" + searchCatalogType + "' "
      + " order by sort_order asc";
  
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  for (int i = 0; i < iRet; i++) {
    String catalogCode      = matrix.getRowData(i).getData(0);
    String catalogName      = matrix.getRowData(i).getData(1);
    String catalogType     = matrix.getRowData(i).getData(2);
    String catalogDesc      = matrix.getRowData(i).getData(3);
    String useYn          = matrix.getRowData(i).getData(4);
    String sort_order      = matrix.getRowData(i).getData(5);
    String related_code     = matrix.getRowData(i).getData(6);

    String strLink = "<a href=\"javascript:fnSetData('"
                    + catalogCode + strSep + catalogName + strSep + catalogType
                    + strSep + sort_order + strSep + useYn  
                    + strSep + related_code + strSep + StringUtil.replace(StringUtil.replaceScriptString(catalogDesc), "\n", "\\n")
                    + "')\">" + catalogName + "</a>";

    outS02 += "<tr align='center' class='table_list' onmouseover=\"this.style.backgroundColor='#F6F5E3'\" onmouseout=\"this.style.backgroundColor='#ffffff'\">"
            + "  <td>" + catalogCode  + "</td>"
            + "  <td align='left'>" + strLink     + "</td>"
            + "  <td>" + catalogType              + "</td>"
            + "  <td>" + selectedCatalogTypeName  + "</td>"
            + "  <td>" + sort_order         + "</td>"
            + "  <td>" + related_code             + "</td>"
            + "  <td>" + (useYn.equals("Y") ? "Yes" : "No") + "</td>"
            + "  <td align='left'>" + catalogDesc + "</td>"
            + "</tr>";
  }

  if (iRet == 0 ) {
    outS02 += "<tr><td width='100%' align='center' colspan='8' class='table_list'>Data are Not found.</td></tr>";
  }

} catch (Exception e) {
  System.out.println("Exception catalog_list : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}	
}

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title></title>\r\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\r\n");
      out.write("<!--script language=\"javaScript\" src=\"/common/js/popup.js\"></script-->\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("function fnSearch(frm) {\r\n");
      out.write("  frm.action=\"./code_list.jsp\";\r\n");
      out.write("  frm.submit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function fnNew(frm) {\r\n");
      out.write("  frm.actionFlag.value = \"I\";   // insert\r\n");
      out.write("  frm.catalogCode.value = \"\";\r\n");
      out.write("  frm.catalogName.value = \"\";\r\n");
      out.write("  frm.catalogType.value = \"");
      out.print(searchCatalogType );
      out.write("\";\r\n");
      out.write("  frm.catalogDesc.value = \"\";\r\n");
      out.write("  frm.sort_order.value = \"\";\r\n");
      out.write("  frm.related_code.value = \"\";\r\n");
      out.write("  frm.useYn.selectedIndex = 0;\r\n");
      out.write("  frm.catalogDesc.value = \"\";\r\n");
      out.write("  frm.catalogCode.setAttribute('readOnly',false);\r\n");
      out.write("  frm.catalogCode.style.backgroundColor = \"white\";\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function fnSetData(strParams) {\r\n");
      out.write("  var params = strParams.split(\"");
      out.print( strSep );
      out.write("\");\r\n");
      out.write("  var i = 0;\r\n");
      out.write("\r\n");
      out.write("  with (document.form2) {\r\n");
      out.write("    actionFlag.value = \"U\";       // update\r\n");
      out.write("    catalogCode.value = params[i++];\r\n");
      out.write("    catalogName.value = params[i++];\r\n");
      out.write("    catalogType.value = params[i++];\r\n");
      out.write("    sort_order.value = params[i++];\r\n");
      out.write("    jf_fnSetSelectOption(useYn, params[i++]);\r\n");
      out.write("    related_code.value = params[i++];\r\n");
      out.write("    catalogDesc.value = params[i++];\r\n");
      out.write("    catalogCode.setAttribute('readOnly',true);\r\n");
      out.write("    catalogCode.style.backgroundColor = \"#e8e8e8\";\r\n");
      out.write("  }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function fnSave(frm) {\r\n");
      out.write("  if (!jf_ChkValue(frm.catalogCode.value)) {\r\n");
      out.write("    alert(\"Input CODE.\");\r\n");
      out.write("    frm.catalogCode.focus();\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("  if (!jf_ChkValue(frm.catalogName.value)) {\r\n");
      out.write("    alert(\"Input CODE NAME.\");\r\n");
      out.write("    frm.catalogName.focus();\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write("  if (!jf_ChkValue(frm.catalogType.value)) {\r\n");
      out.write("    alert(\"Input CODE TYPE.\");\r\n");
      out.write("    frm.catalogType.focus();\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write("  if (!jf_ChkValue(frm.catalogType.value)) {\r\n");
      out.write("    alert(\"Input SORT ORDER.\");\r\n");
      out.write("    frm.sort_order.focus();\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write(" \r\n");
      out.write("  // 큰 따옴표는 허용하지 않음.\r\n");
      out.write("  frm.catalogCode.value = frm.catalogCode.value.replace(/\"/g, \"'\");\r\n");
      out.write("  frm.catalogName.value = frm.catalogName.value.replace(/\"/g, \"'\");  \r\n");
      out.write("\r\n");
      out.write("  if (jf_ChkValue(frm.catalogDesc.value)) {\r\n");
      out.write("    frm.catalogDesc.value = frm.catalogDesc.value.replace(/\"/g, \"'\");\r\n");
      out.write("\r\n");
      out.write("    if (!jf_IsValidStrLength(frm.catalogDesc.value, 500)) {\r\n");
      out.write("      alert(\"Check the length of CATALOG DESCRIPTION(Max length - 500).\");\r\n");
      out.write("      frm.catalogDesc.focus();\r\n");
      out.write("      return;\r\n");
      out.write("    }\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("  if (!confirm(\"Do you really want to save these data?\")) {\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("  frm.action=\"./code_save.jsp\";\r\n");
      out.write("  frm.submit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function fnDelete(frm) {\r\n");
      out.write("  if (!frm.catalogCode.value) {\r\n");
      out.write("    alert(\"Select an item you want to delete.\");\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("  if (!confirm(\"Do you really want to delete a selected item?\")) {\r\n");
      out.write("    return;\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("  frm.actionFlag.value = \"D\";   // delete\r\n");
      out.write("\r\n");
      out.write("  frm.action=\"./code_save.jsp\";\r\n");
      out.write("  frm.submit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\r\n");
      out.write("<CENTER>\t\r\n");
      out.write("<table width='99%' border='0' cellspacing='0' cellpadding='0' align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td height='15' colspan='2'></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width='3%'><img src='/img/update.jpg'></td>\r\n");
      out.write("  <td width='*' class='left_title'>CODE Management</td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width='100%' height='2' colspan='2'><hr width='100%'></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td height='10' colspan='2'></td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<table width=\"700\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" class=\"table_bg\">\r\n");
      out.write("<form name=\"form1\" method=\"post\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" align=\"right\" class=\"table_bg_bright\">CODE TYPE : <select name=\"searchCatalogType\">");
      out.print( outS01 );
      out.write("</select>\r\n");
      out.write("    &nbsp;&nbsp;\r\n");
      out.write("    <input type=\"button\" value=\"SEARCH\" onclick=\"fnSearch(this.form);\" class=\"button_default\">&nbsp;</td>\r\n");
      out.write("</tr>\r\n");
      out.write("</form>\r\n");
      out.write("</table>\r\n");
      out.write("<table width=\"700\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<font color=red>* Please contact system administrator to modify existing codes.</font>\r\n");
      out.write("<table width=\"700\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" class=\"table_bg\">\r\n");
      out.write("<form name=\"form2\" method=\"post\">\r\n");
      out.write("<input type=\"hidden\" name=\"actionFlag\" value=\"I\">\r\n");
      out.write("<input type=\"hidden\" name=\"searchCatalogType\" value=\"");
      out.print( searchCatalogType );
      out.write("\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"20%\" class=\"table_header_center\">TYPE NAME</td>\r\n");
      out.write("  <td width=\"30%\" class=\"table_bg_bright\"><input type=\"text\" name=\"selectedCatalogTypeName\" value=\"");
      out.print( selectedCatalogTypeName );
      out.write("\" size=\"30\" maxlength=\"100\" readonly class=\"input_text_readonly\"></td>\r\n");
      out.write("  <td width=\"20%\" class=\"table_header_center\">CODE(*)</td>\r\n");
      out.write("  <td width=\"30%\" class=\"table_bg_bright\"><input type=\"text\" name=\"catalogCode\" size=\"20\" maxlength=\"10\" class=\"input_text\" readOnly=\"true\" ></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td class=\"table_header_center\">CODE NAME</td>\r\n");
      out.write("  <td colspan=\"3\" class=\"table_bg_bright\"><input type=\"text\" name=\"catalogName\" size=\"30\" maxlength=\"30\" class=\"input_text\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td class=\"table_header_center\">TYPE CODE</td>\r\n");
      out.write("  <td class=\"table_bg_bright\"><input type=\"text\" name=\"catalogType\" size=\"20\" maxlength=\"20\" class=\"input_text\" readonly></td>\r\n");
      out.write("  <td class=\"table_header_center\">SORT ORDER</td>\r\n");
      out.write("  <td class=\"table_bg_bright\"><input type=\"text\" name=\"sort_order\" size=\"20\" maxlength=\"10\" class=\"input_text\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td class=\"table_header_center\">CODE USE</td>\r\n");
      out.write("  <td class=\"table_bg_bright\"><select name=\"useYn\"><option value=\"Y\" selected>Yes</option><option value=\"N\">No</option></select></td>\r\n");
      out.write("  <td class=\"table_header_center\">RELATED CODE</td>\r\n");
      out.write("  <td class=\"table_bg_bright\"><input type=\"text\" name=\"related_code\" size=\"10\" maxlength=\"20\" class=\"input_text\" ></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>  \r\n");
      out.write("  <td class=\"table_header_center\" >CODE DESCRIPTION</td>\r\n");
      out.write("  <td class=\"table_bg_bright\" colspan=\"3\" > <textarea name=\"catalogDesc\" cols=\"100\" rows=\"3\" class=\"input_textfield\"></textarea></td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<table width=\"700\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" align=\"center\">\r\n");
      out.write("  \t                             \t    ");

  	  								 if ( _adminclass.equals("1")) {
     								
      out.write("\r\n");
      out.write("  \t                             <input type=\"button\" value=\"NEW\" onclick=\"fnNew(this.form);\" class=\"button_default\">\r\n");
      out.write("                                  <input type=\"button\" value=\"SAVE\" onclick=\"fnSave(this.form);\" class=\"button_default\">\r\n");
      out.write("                                  <input type=\"reset\" value=\"CANCEL\" class=\"button_default\">\r\n");
      out.write("                                  <input type=\"button\" value=\"DELETE\" onclick=\"fnDelete(this.form);\" class=\"button_default\">\r\n");
      out.write("                                  </td>\r\n");
      out.write("                                  ");
 } 
      out.write("\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"50%\"></td>\r\n");
      out.write("  <td width=\"*\" align=\"right\">TOTAL : ");
      out.print( iRet );
      out.write("&nbsp;</td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" class=\"table_bg\">\r\n");
      out.write("<tr class=\"table_header_center\">\r\n");
      out.write("  <td width=\"8%\">CODE</td>\r\n");
      out.write("  <td width=\"8%\">NAME</td>\r\n");
      out.write("  <td width=\"8%\">TYPE CODE</td>\r\n");
      out.write("  <td width=\"10%\">TYPE NAME</td>\r\n");
      out.write("  <td width=\"8%\">SORT ORDER</td>\r\n");
      out.write("  <td width=\"8%\">RELATED CODE</td>\r\n");
      out.write("  <td width=\"6%\">USE?</td>\r\n");
      out.write("  <td width=\"28%\">DESCRIPTION</td>\r\n");
      out.write("</tr>\r\n");
      out.print( outS02 );
      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<table width=\"700\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("  <td width=\"100%\" align=\"center\">\r\n");
      out.write("  \t    ");

  	   if ( _adminclass.equals("1")) {
     
      out.write("\r\n");
      out.write("  \t                              <input type=\"button\" value=\"NEW\" onclick=\"fnNew(this.form);\" class=\"button_default\">\r\n");
      out.write("                                  <input type=\"button\" value=\"SAVE\" onclick=\"fnSave(this.form);\" class=\"button_default\">\r\n");
      out.write("                                  <input type=\"reset\" value=\"CANCEL\" class=\"button_default\">\r\n");
      out.write("                                  <input type=\"button\" value=\"DELETE\" onclick=\"fnDelete(this.form);\" class=\"button_default\">\r\n");
      out.write("       ");
 } 
      out.write("                           \r\n");
      out.write("      </td>\r\n");
      out.write("                                  \r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</form>\r\n");

out.println(CopyRightLogo());

      out.write("\r\n");
      out.write("</td></tr></table>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
