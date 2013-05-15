package org.apache.jsp.admin.adminuser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import common.util.*;
import dbconn.*;

public final class list_jsp extends org.apache.jasper.runtime.HttpJspBase
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

int iRet = 0;
String strSep = "|!^";
String outS = "";
String sql = "";
//out.println(_adminclass);
Connection conn = null;
dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();

  // Read Admin User List
  sql = " select  adminid, adminname, password, admintype, "
      + "         admingroup, approval, adminclass,email "
      + " from    admin_01t "
      + " order by admingroup, adminclass, adminid asc ";

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

} catch (Exception e) {
  System.out.println("Exception /admin/adminuser/list : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}	
}

for (int i = 0; i < iRet; i++) {
  int j = 0;

  String adminId    = matrix.getRowData(i).getData(j++);
  String adminName  = matrix.getRowData(i).getData(j++);
  String password   = matrix.getRowData(i).getData(j++);
  String adminType  = matrix.getRowData(i).getData(j++);
  String adminGroup = matrix.getRowData(i).getData(j++);
  String approval     = matrix.getRowData(i).getData(j++);
  String adminClass = matrix.getRowData(i).getData(j++);
  String email      = matrix.getRowData(i).getData(j++);

  String bgColor = "#fffff0";
  if (i%2 > 0) bgColor = "#eeeee0";

  String strLink = "<a href=\"javascript:fnSetData('"
                  + adminId + strSep
                  + StringUtil.replaceScriptString(adminName) + strSep
                  + StringUtil.replaceScriptString(password) + strSep
                  + adminType + strSep
                  + adminGroup + strSep
                  + approval + strSep
                  + adminClass+ strSep
                  + email 
                  + "')\">" + adminId + "</a>";

  String adminTypeName = "";
  if (adminType.equals("H")) adminTypeName = "Head Office";
  else if (adminType.equals("N")) adminTypeName = "etc";
  String adminGroupName = "";
  if (adminGroup.equals("A")) adminGroupName = "System Administrator";
  else if (adminGroup.equals("B")) adminGroupName = "PO Administrator";
  else if (adminGroup.equals("N")) adminGroupName = "Generic User";

  String approvalName = "";
  if (approval.equals("Y")) approvalName = "Yes";
  else if (approval.equals("N")) approvalName = "No";

  String adminClassName = "";
  if (adminClass.equals("1")) adminClassName = "Input";
  else if (adminClass.equals("2")) adminClassName = "Search";

  outS += "<tr align='center' style='background-color:" + bgColor + ";'>"
        + " <td>" + strLink + "</td>"
        + " <td align='left'>" + adminName + "</td>"
        + " <td>" + adminTypeName + "</td>"
        + " <td>" + adminGroupName + "</td>"
        + " <td>" + approvalName + "</td>"
        + " <td>" + adminClassName + "</td>"
        + " <td>" + email + "</td>"
        + "</tr>";
}

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title></title>\n");
      out.write("<link href=\"/common/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<script language=javascript src=\"/common/js/util.js\"></script>\n");
      out.write("<script language=\"javascript\">\n");
      out.write("function fnNew(frm) {\n");
      out.write("  frm.reset();\n");
      out.write("  frm.adminId.readOnly = false;\n");
      out.write("  frm.adminId.style.backgroundColor = '#ffffff';\n");
      out.write("  frm.password.readOnly = false;\n");
      out.write("  frm.password.style.backgroundColor = '#ffffff';\n");
      out.write("  frm.adminId.focus();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnSave(frm) {\n");
      out.write("  if (!jf_IsNumeric(frm.adminId.value)) {\n");
      out.write("    alert('Input Admin ID. Numbers are only accepted.');\n");
      out.write("    frm.adminId.select();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (!jf_ChkValue(frm.adminName.value)) {\n");
      out.write("    alert('Input Admin Name.');\n");
      out.write("    frm.adminName.select();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (frm.adminName.value.indexOf('\"') >= 0) {\n");
      out.write("    alert('Double quotes(\") are not accepted in Admin Name.');\n");
      out.write("    frm.adminName.select();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (!frm.password.value) {\n");
      out.write("    alert('Input Password.');\n");
      out.write("    frm.password.select();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (frm.password.value.indexOf('\"') >= 0) {\n");
      out.write("    alert('Double quotes(\") are not accepted in Password.');\n");
      out.write("    frm.password.select();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (frm.adminType.selectedIndex == 0) {\n");
      out.write("    alert('Input Type!');\n");
      out.write("    frm.adminType.focus();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (frm.adminGroup.selectedIndex == 0) {\n");
      out.write("    alert('Input Admin Group.');\n");
      out.write("    frm.adminGroup.focus();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("  if ( !frm.email.value) {\n");
      out.write("  \talert('Input email');\n");
      out.write("    frm.email.select();\n");
      out.write("    return;\n");
      out.write("  } else {\n");
      out.write("  \tvar email = frm.email.value.split(',');\n");
      out.write("    for(i=0; i<email.length; i++) {\n");
      out.write("      if(email[i].value != '') {\n");
      out.write("        var emailEx1 = /^([A-Za-z0-9]{0,1})([A-Za-z0-9]{1,15})([A-Za-z0-9-_.]{0,1})([A-Za-z0-9]{1,15})([A-Za-z0-9]{0,1})(@{1})([A-Za-z0-9_]{1,15})(.{1})([A-Za-z0-9_]{2,10})(.{1}[A-Za-z]{2,10})?(.{1}[A-Za-z]{2,10})?$/;\n");
      out.write("        if(!emailEx1.test(email[i])) {\n");
      out.write("           alert ('E-mail format is incorrect(Do not include space.)');\n");
      out.write("           form.email.focus();\n");
      out.write("           return;\n");
      out.write("        }\n");
      out.write("       }\n");
      out.write("     }  \t\n");
      out.write("  }\t  \n");
      out.write("  //if (frm.adminGroup.value == 'B') {\n");
      out.write("  //  if (frm.brand.selectedIndex == 0) {\n");
      out.write("  //    alert('Input Type!');\n");
      out.write("  //    frm.brand.focus();\n");
      out.write("  //    return;\n");
      out.write("  //  }\n");
      out.write("\n");
      out.write("  if (frm.adminClass.selectedIndex == 0) {\n");
      out.write("      alert('Input Class.');\n");
      out.write("      frm.adminClass.focus();\n");
      out.write("      return;\n");
      out.write("  }\n");
      out.write("  \n");
      out.write("  \n");
      out.write("  if (confirm('Do you really want to save these data?')) {\n");
      out.write("    // if the user is not a buyer, clear brand, class values.\n");
      out.write("    //if (frm.adminGroup.value != 'B') {\n");
      out.write("    //  frm.brand.selectedIndex = 0;\n");
      out.write("    //  frm.adminClass.selectedIndex = 0;\n");
      out.write("    //}\n");
      out.write("\n");
      out.write("    // if the user belongs to Non-Apparel buyer, clear the brand value.\n");
      out.write("    //if (frm.adminClass.value == '2') {\n");
      out.write("    //  alert('You have no permission to save it.');\n");
      out.write("    //   frm.adminClass.focus();\n");
      out.write("    //}\n");
      out.write("    \n");
      out.write("    frm.action = './save.jsp';\n");
      out.write("    frm.submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnDelete(frm) {\n");
      out.write("  if (frm.actionFlag.value != 'U' || !frm.adminId.value) {\n");
      out.write("    alert('Select an item you want to delete.');\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (confirm('Do you really want to delete the selected item?')) {\n");
      out.write("    frm.actionFlag.value = 'D';\n");
      out.write("    frm.action = './save.jsp';\n");
      out.write("    frm.submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnInitPasswd(frm) {\n");
      out.write("  if (frm.actionFlag.value != 'U' || !frm.adminId.value) {\n");
      out.write("    alert('Select an item you want to initialize.');\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (confirm('Do you really want to initialize the selected item?')) {\n");
      out.write("    frm.actionFlag.value = 'P';\n");
      out.write("    frm.action = './save.jsp';\n");
      out.write("    frm.submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnSetData(strParams) {\n");
      out.write("  var params = strParams.split('");
      out.print( strSep );
      out.write("');\n");
      out.write("  var j = 0;\n");
      out.write("\n");
      out.write("  with (document.form1) {\n");
      out.write("    adminId.value = params[j++];\n");
      out.write("    adminName.value = params[j++];\n");
      out.write("    password.value = params[j++];\n");
      out.write("    jf_fnSetSelectOption(adminType, params[j++]);\n");
      out.write("    jf_fnSetSelectOption(adminGroup, params[j++]);\n");
      out.write("    jf_fnSetSelectOption(approval, params[j++]);\n");
      out.write("    jf_fnSetSelectOption(adminClass, params[j++]);\n");
      out.write("    email.value = params[j++];\n");
      out.write("\n");
      out.write("    actionFlag.value = 'U';\n");
      out.write("    adminId.readOnly = true;\n");
      out.write("    adminId.style.backgroundColor = '#e8e8e8';\n");
      out.write("    password.readOnly = true;\n");
      out.write("    password.style.backgroundColor = '#e8e8e8';\n");
      out.write("  }\n");
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
      out.write("  <td width='3%'><img src='/img/image1.gif'></td>\n");
      out.write("  <td width='*' class='left_title'>Sebin User Management</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width='100%' height='2' colspan='2'><hr width='100%'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td height='10' colspan='2'></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("* The password will be reset with '1111' if you click 'Reset Password'. It is not recommanded to reset the password unless you login first time or forgotten.\n");
      out.write("<table width='90%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\n");
      out.write("<form name='form1' method='post'>\n");
      out.write("<input type='hidden' name='actionFlag' value='I'>\n");
      out.write("<tr>\n");
      out.write("  <td width='20%' class='table_header_center'>Admin ID(*)</td>\n");
      out.write("  <td width='30%' class='table_bg_bright'><input type='text' name='adminId' size='30' maxlength='10'></td>\n");
      out.write("  <td width='20%' class='table_header_center'>Admin Name(*)</td>\n");
      out.write("  <td width='30%' class='table_bg_bright'><input type='text' name='adminName' size='30' maxlength='30'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td class='table_header_center'>Password(*)</td>\n");
      out.write("  <td class='table_bg_bright'><input type='password' name='password' size='30' maxlength='20'></td>\n");
      out.write("  <td class='table_header_center'>Type(*)</td>\n");
      out.write("  <td class='table_bg_bright'><select name='adminType'>\n");
      out.write("    <option></option>\n");
      out.write("    <option value='H'>Head Office</option></select></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td class='table_header_center'>Admin Group(*)</td>\n");
      out.write("  <td class='table_bg_bright'><select name='adminGroup'>\n");
      out.write("    <option></option>\n");
      out.write("    <option value='N'>Generic User </option>\n");
      out.write("    <option value='A'>System Administrator </option>\n");
      out.write("    <option value='B'>PO Administrator </option></td>\n");
      out.write("  <td class='table_header_center'> Payer </td>\n");
      out.write("  <td class='table_bg_bright'><select name='approval'>\n");
      out.write("    <option></option>\n");
      out.write("    <option value='Y'>Yes </option>\n");
      out.write("    <option value='N'>No </option></select></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td class='table_header_center'>email</td>\n");
      out.write("  <td class='table_bg_bright'><input type='text' name='email' size='40' maxlength='40'></td>\n");
      out.write("  <td class='table_header_center'>Permission</td>\n");
      out.write("  <td class='table_bg_bright'><select name='adminClass'>\n");
      out.write("    <option></option>\n");
      out.write("    <option value='1'>Input </option>\n");
      out.write("    <option value='2'>Search </option></select></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<table width='90%' border='0' cellspacing='0' cellpadding='0' align='center'>\n");
      out.write("<tr>\n");
      out.write("  <td height='15'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td align='center'>\n");
      out.write("  \t");

  	   if ( _adminclass.equals("1")) {
     
      out.write("\n");
      out.write("\t    <input type='button' value='New' onclick='fnNew(this.form);' class=\"button_default\">\n");
      out.write("\t    <input type='button' value='Save' onclick='fnSave(this.form);' class=\"button_default\">\n");
      out.write("\t    <input type='button' value='Delete' onclick='fnDelete(this.form);' class=\"button_default\">\n");
      out.write("\t    <input type='button' value='Reset Password' onclick='fnInitPasswd(this.form);' class=\"button_medium\">\n");
      out.write("    ");

      } 
     
      out.write("\n");
      out.write("    \n");
      out.write("  </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td height='5'></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width='90%' border='0' cellspacing='0' cellpadding='0' align='center'>\n");
      out.write("<tr>\n");
      out.write("  <td></td>\n");
      out.write("  <td align='right'>Total : ");
      out.print( iRet );
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("<table width='90%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\n");
      out.write("<tr class='table_header_center'>\n");
      out.write("  <td>User ID</td>\n");
      out.write("  <td>User Name</td>\n");
      out.write("  <td>Type</td>\n");
      out.write("  <td>User Group</td>\n");
      out.write("  <td>Payer</td> \n");
      out.write("  <td>Permission</td>\n");
      out.write("  <td>email </td>\n");
      out.write("</tr>\n");
      out.print( outS );
      out.write("\n");
      out.write("</table>\n");
      out.write("<table width='90%' border='0' cellspacing='0' cellpadding='0' align='center'>\n");
      out.write("<tr>\n");
      out.write("  <td height='15'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td align='center'>\n");
      out.write("    ");

  	   if ( _adminclass.equals("1")) {
     
      out.write("\n");
      out.write("\t    <input type='button' value='New' onclick='fnNew(this.form);' class=\"button_default\">\n");
      out.write("\t    <input type='button' value='Save' onclick='fnSave(this.form);' class=\"button_default\">\n");
      out.write("\t    <input type='button' value='Delete' onclick='fnDelete(this.form);' class=\"button_default\">\n");
      out.write("\t    <input type='button' value='Reset Password' onclick='fnInitPasswd(this.form);' class=\"button_medium\">\n");
      out.write("    ");

      } 
     
      out.write("\n");
      out.write("  </td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("</form>\n");

out.println(CopyRightLogo());

      out.write("\n");
      out.write("</tr></td></table>\n");
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
