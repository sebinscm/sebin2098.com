package org.apache.jsp.admin.menu;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import dbconn.*;
import common.util.*;

public final class menu_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write('\n');

response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

String menuType = request.getParameter("menuType");
if (menuType == null) menuType = "S";

int iRet = 0;
int iRet2 = 0;
String strSep = "|!^";
String outS = "";
String parentMenus = "";
String defaultParentMenus = "";
String userGroups = "";
String titleName = "";
String legend = "";

String sql = "";
Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
MatrixDataSet matrix3 = null;
MatrixDataSet matrix4 = null;
DataProcess dataProcess = null;

try {

  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
  matrix = new MatrixDataSet();
  matrix2 = new MatrixDataSet();
  matrix3 = new MatrixDataSet();
  matrix4 = new MatrixDataSet();
  dataProcess = new DataProcess();

  // Read Parent Menu List ///////////////////////////////////////////
  sql = " select  seqno,  user_group,  menuname,  sort_no "
      + " from    menu_t "
      + " where   menu_type = '" + menuType + "' "
      + " and     parent_no = 1 "
      + " order by user_group, sort_no ";

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  // Read Menu List /////////////////////////////////////////////////////
  sql = " select  m.seqno,  m.user_group,  m.menuname,  m.menuurl,  m.sort_no,  p.menuname,  m.parent_no "
      + " from    menu_t m left outer join menu_t p on( m.parent_no = p.seqno ) "
      + " where   m.menu_type = '" + menuType + "' "
      + " order by user_group, sort_no ";

  iRet2 = dataProcess.RetrieveData(sql, matrix2, conn);

  // read menu type info ///////////////////////////
  sql = " select  code_name "
      + " from    vg_common_code "
      + " where   type = 'USER_TYPE' "
      + " and     code = '" + menuType + "' ";
      
  dataProcess.RetrieveData(sql, matrix3, conn);

  // read user group code info  /////////////////////////////////////////
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'USER_GROUP' "
      + " and     ( related_code =  '" + menuType + "' " + (!menuType.equals("S") ? " or related_code = '0' " : "") + " ) "
      + " and     use_yn = 'Y' "
      + " order by sort_order ";

  dataProcess.RetrieveData(sql, matrix4, conn);

} catch (Exception e) {
  System.out.println("Exception menu_list : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}	
}

// Set Title Name, User Group, Legend ///////////////////////////////////////
/*
if (menuType.equals("S")) {
  userGroups = "<option value='D' selected>DDP Supplier</option>"
             + "<option value='F'>FOB Supplier</option>";
  titleName = "Supplier";
  //legend = "";
} else if (menuType.equals("A")) {
  userGroups = "<option value='S'>Administrator</option>"
             + "<option value='A' selected>Normal User</option>"
             + "<option value='B'>Buyer</option>"
             + "<option value='V'>VBA User</option>";
  titleName = "Admin";
  legend = "**User Group : S-Administrator, A-Normal User, B-Buyer, V-VBA User";
} else if (menuType.equals("P")) {
  userGroups = "<option value='A' selected>Administrator</option>"
             + "<option value='C'>Finance/Account</option>"
             + "<option value='M'>MR</option>"
             + "<option value='S'>Shipping Management</option>";
  titleName = "APESS";
  legend = "**User Group : A-Administrator, C-Finance/Account, M-MR, S-Shipping Management";
}
*/
// Title Name
if (matrix3.getRowCount() > 0) {
  titleName = matrix3.getRowData(0).getData(0);
}

// User Group, Legend
legend = "**User Group : ";

for (int i = 0; i < matrix4.getRowCount(); i++) {
  int j = 0;
  String code = matrix4.getRowData(i).getData(j++);
  String codeName = matrix4.getRowData(i).getData(j++);

  userGroups += "<option value='" + code + "'>" + codeName + "</option>";
  legend += (i > 0 ? ", " : "") + code + "-" + codeName;
}

// Set Parent Menu List /////////////////////////////////////////////////////
String defaultUserGroup = "D";
//if (menuType.equals("A")) defaultUserGroup = "A";
//else if (menuType.equals("P")) defaultUserGroup = "A";
if (!menuType.equals("S")) defaultUserGroup = "A";

for (int i = 0; i < iRet; i++) {
  int j = 0;
  String seqNo            = matrix.getRowData(i).getData(j++);
  String userGroup        = matrix.getRowData(i).getData(j++);
  String menuName         = matrix.getRowData(i).getData(j++);
  String sortNo           = matrix.getRowData(i).getData(j++);

  // parent Menu Array javascript 생성.
  parentMenus += "parentMenus[" + i + "] = [\"" + userGroup + "\", \""
              + seqNo + "\", \"" + menuName + "\", \"" + sortNo + "\"];\n";

  // default Parent Menu List
  if (defaultUserGroup.equals(userGroup)) {
    defaultParentMenus += "<option value='" + seqNo + "'>" + sortNo + "_" + menuName + "</option>";
  }
}

// Set Menu List ////////////////////////////////////////////////////////////
String tmpUserGroup = "";
String bgColor = "";

for (int i = 0; i < iRet2; i++) {
  int j = 0;
  String seqNo            = matrix2.getRowData(i).getData(j++);
  String userGroup        = matrix2.getRowData(i).getData(j++);
  String menuName         = matrix2.getRowData(i).getData(j++);
  String menuUrl          = matrix2.getRowData(i).getData(j++);
  String sortNo           = matrix2.getRowData(i).getData(j++);
  String parentMenuName   = matrix2.getRowData(i).getData(j++);
  String parentNo         = matrix2.getRowData(i).getData(j++);

  String strLink = "<a href=\"javascript:fnSetData('"
                  + seqNo + strSep + userGroup + strSep + menuName
                  + strSep + menuUrl + strSep + sortNo + strSep + parentNo
                  + "')\">" + menuName + "</a>";

/*
  String bgColor = "";
  if (menuType.equals("S")) {
    if (userGroup.equals("N")) bgColor = "#ffc0cb";
  } else if (menuType.equals("A")) {
    if (userGroup.equals("A")) bgColor = "#ffc0cb";
    else if (userGroup.equals("B")) bgColor = "#fffff0";
    else if (userGroup.equals("S")) bgColor = "#e6e6fa";
    else if (userGroup.equals("V")) bgColor = "#53FF53";
  } else if (menuType.equals("P")) {
    if (userGroup.equals("A")) bgColor = "#ffc0cb";
    else if (userGroup.equals("C")) bgColor = "#fffff0";
    else if (userGroup.equals("M")) bgColor = "#e6e6fa";
    else if (userGroup.equals("S")) bgColor = "#ffa500";
  }
*/
  if (!tmpUserGroup.equals(userGroup)) {
    tmpUserGroup = userGroup;
    
    if (bgColor.equals("")) bgColor = "#CDD736";
    else bgColor = "";
  }

  outS += "<tr align='center' class='table_list' style='background-color:" + bgColor + ";'>"
        + "  <td>" + userGroup  + "</td>"
        + "  <td align='left'>" + strLink + "</td>"
        + "  <td align='left'>" + menuUrl + "</td>"
        + "  <td align='left'>" + parentMenuName + "</td>"
        + "  <td>" + sortNo     + "</td>"
        + "</tr>";
}

if (iRet == 0 ) {
  outS += "<tr><td width='100%' align='center' colspan='5' class='table_list'>Data are Not found.</td></tr>";
}

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title></title>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script language=\"javaScript\" src=\"/common/js/util.js\"></script>\n");
      out.write("<script language=\"javascript\">\n");
      out.write("var parentMenus = new Array();\n");
      out.print( parentMenus );
      out.write("\n");
      out.write("\n");
      out.write("function fnNew(frm) {\n");
      out.write("  with (frm) {\n");
      out.write("    reset();\n");
      out.write("    fnSetParentMenu(frm);\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnSetData(strParams) {\n");
      out.write("  var params = strParams.split(\"");
      out.print( strSep );
      out.write("\");\n");
      out.write("\n");
      out.write("  with (document.form1) {\n");
      out.write("    var i = 0;\n");
      out.write("    actionFlag.value = \"U\";       // update\n");
      out.write("    seqNo.value = params[i++];\n");
      out.write("\n");
      out.write("    jf_fnSetSelectOption(userGroup, params[i++]);\n");
      out.write("    fnSetParentMenu(document.form1);\n");
      out.write("\n");
      out.write("    menuName.value = params[i++];\n");
      out.write("    menuUrl.value = params[i++];\n");
      out.write("    sortNo.value = params[i++];\n");
      out.write("    jf_fnSetSelectOption(parentNo, params[i++]);\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnSetParentMenu(frm) {\n");
      out.write("  var selectedUserGroup = frm.userGroup.options[frm.userGroup.selectedIndex].value;\n");
      out.write("  var parentNoLength = frm.parentNo.options.length;\n");
      out.write("\n");
      out.write("  // clear PARENT MENU options except HOME option\n");
      out.write("  for (var i = 0; i < parentNoLength - 1; i++) {\n");
      out.write("    frm.parentNo.options[1] = null;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  // User Group에 해당하는 Parent Menu Setting\n");
      out.write("  for (var i = 0; i < parentMenus.length; i++) {\n");
      out.write("    if (selectedUserGroup == parentMenus[i][0]) {\n");
      out.write("      var oOption = document.createElement(\"OPTION\");\n");
      out.write("      oOption.text = parentMenus[i][3] + \"_\" + parentMenus[i][2];\n");
      out.write("      oOption.value = parentMenus[i][1];\n");
      out.write("      frm.parentNo.add(oOption);\n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnSave(frm) {\n");
      out.write("  if (!jf_ChkValue(frm.menuName.value)) {\n");
      out.write("    alert(\"Input MENU NAME.\");\n");
      out.write("    frm.menuName.focus();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  frm.menuName.value = frm.menuName.value.replace(/\"/g, \"'\");\n");
      out.write("\n");
      out.write("  if (frm.parentNo.selectedIndex > 0 && !jf_ChkValue(frm.menuUrl.value)) {\n");
      out.write("    alert(\"Input MENU URL.\");\n");
      out.write("    frm.menuUrl.focus();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (!jf_ChkValue(frm.sortNo.value)) {\n");
      out.write("    alert(\"Input SORT ORDER.\");\n");
      out.write("    frm.sortNo.focus();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  // Sort Order의 첫글자는 Parent의 Sort Order와 같아야 함.\n");
      out.write("  // 단, Parent가 HOME인 경우에는 Sort Order의 첫글자가 같을 필요는 없음.\n");
      out.write("  // 또한, Sort Order는 Parent의 Sort Order보다 커야 함.\n");
      out.write("  var selectedParentNoText = frm.parentNo.options[frm.parentNo.selectedIndex].text;\n");
      out.write("  var parentSortOrder = selectedParentNoText.substring(0, selectedParentNoText.indexOf(\"_\"));\n");
      out.write("\n");
      out.write("  if (frm.parentNo.selectedIndex > 0) {\n");
      out.write("    if (parentSortOrder.charAt(0) != frm.sortNo.value.charAt(0)) {\n");
      out.write("      alert(\"The first letter of the SORT ORDER should be same with the one of the sort order of the PARENT MENU.\");\n");
      out.write("      frm.sortNo.select();\n");
      out.write("      return;\n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (parentSortOrder >= frm.sortNo.value) {\n");
      out.write("    alert(\"The SORT ORDER should be bigger than the sort order of the PARENT MENU.\");\n");
      out.write("    frm.sortNo.select();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (!confirm(\"Do you really want to save these data?\")) {\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  frm.action=\"./menu_save.jsp\";\n");
      out.write("  frm.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnDelete(frm) {\n");
      out.write("  if (!frm.seqNo.value) {\n");
      out.write("    alert(\"Select an item you want to delete.\");\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (!confirm(\"Do you really want to delete a selected item?\")) {\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  frm.actionFlag.value = \"D\";   // delete\n");
      out.write("  frm.action=\"./menu_save.jsp\";\n");
      out.write("  frm.submit();\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>\n");
      out.write("<table width='840' border='0' cellspacing='0' cellpadding='0'><tr><td>\n");
      out.write("\n");
      out.write("<table width='99%' border='0' cellspacing='0' cellpadding='0' align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td height='15' colspan='2'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width='3%'><img src='/img/Window-Group.gif'></td>\n");
      out.write("  <td width='*' class='left_title'>&nbsp;");
      out.print( titleName );
      out.write("&nbsp;Menu Management</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width='100%' height='2' colspan='2'><hr width='100%'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td height='10' colspan='2'></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width=\"90%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" class=\"table_bg\">\n");
      out.write("<form name=\"form1\" method=\"post\">\n");
      out.write("<input type=\"hidden\" name=\"actionFlag\" value=\"I\">\n");
      out.write("<input type=\"hidden\" name=\"menuType\" value=\"");
      out.print( menuType );
      out.write("\">\n");
      out.write("<input type=\"hidden\" name=\"seqNo\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"20%\" class=\"table_header_center\">USER GROUP(*)</td>\n");
      out.write("  <td width=\"30%\" class=\"table_bg_bright\"><select name=\"userGroup\" onchange=\"fnSetParentMenu(this.form);\">\n");
      out.write("    ");
      out.print( userGroups );
      out.write("\n");
      out.write("    </select></td>\n");
      out.write("  <td width=\"20%\" class=\"table_header_center\">PARENT MENU(*)</td>\n");
      out.write("  <td width=\"30%\" class=\"table_bg_bright\"><select name=\"parentNo\">\n");
      out.write("    <option value='1'>000_HOME</option>\n");
      out.write("    ");
      out.print( defaultParentMenus );
      out.write("\n");
      out.write("    </select></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td class=\"table_header_center\">MENU NAME(*)</td>\n");
      out.write("  <td colspan=\"3\" class=\"table_bg_bright\"><input type=\"text\" name=\"menuName\" size=\"90\" maxlength=\"100\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td class=\"table_header_center\">LINK TO URL</td>\n");
      out.write("  <td colspan=\"3\" class=\"table_bg_bright\"><input type=\"text\" name=\"menuUrl\" size=\"90\" maxlength=\"200\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td class=\"table_header_center\">SORT ORDER(*)</td>\n");
      out.write("  <td colspan=\"3\" class=\"table_bg_bright\"><input type=\"text\" name=\"sortNo\" size=\"20\" maxlength=\"5\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" align=\"center\">\n");
      out.write("  \t                              ");

  	   if ( _adminclass.equals("1")) {
     
      out.write("\n");
      out.write("  \t                              <input type=\"button\" value=\"NEW\" onclick=\"fnNew(this.form);\" class=\"button_default\">\n");
      out.write("                                  <input type=\"button\" value=\"SAVE\" onclick=\"fnSave(this.form);\" class=\"button_default\">\n");
      out.write("                                  <input type=\"button\" value=\"DELETE\" onclick=\"fnDelete(this.form);\" class=\"button_default\"></td>\n");
      out.write("        ");
 } 
      out.write("                          \n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\" colspan=\"2\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"70%\" class=\"font_blue\">");
      out.print( legend );
      out.write("</td>\n");
      out.write("  <td width=\"*\" align=\"right\">TOTAL : ");
      out.print( iRet2 );
      out.write("&nbsp;</td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<table width=\"99%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" class=\"table_bg\">\n");
      out.write("<tr class=\"table_header_center\">\n");
      out.write("  <td width=\"5%\">USER GROUP</td>\n");
      out.write("  <td width=\"30%\">MENU NAME</td>\n");
      out.write("  <td width=\"35%\">MENU URL</td>\n");
      out.write("  <td width=\"25%\">PARENT NAME</td>\n");
      out.write("  <td width=\"5%\">SORT ORDER</td>\n");
      out.write("</tr>\n");
      out.print( outS );
      out.write("\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" height=\"10\"></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width=\"100%\" align=\"center\">\n");
      out.write("  \t");

  	   if ( _adminclass.equals("1")) {
     
      out.write("\n");
      out.write("  \t                              <input type=\"button\" value=\"NEW\" onclick=\"fnNew(this.form);\" class=\"button_default\">\n");
      out.write("                                  <input type=\"button\" value=\"SAVE\" onclick=\"fnSave(this.form);\" class=\"button_default\">\n");
      out.write("                                  <input type=\"button\" value=\"DELETE\" onclick=\"fnDelete(this.form);\" class=\"button_default\"></td>\n");
      out.write("       ");
 } 
      out.write("                           \n");
      out.write("</tr>\n");
      out.write("</form>\n");
      out.write("</table>\n");
      out.write("\n");

out.println(CopyRightLogo());

      out.write("\n");
      out.write("</tr></td></table>\n");
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
