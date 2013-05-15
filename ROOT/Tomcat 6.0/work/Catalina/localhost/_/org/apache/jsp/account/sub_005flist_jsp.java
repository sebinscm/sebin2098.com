package org.apache.jsp.account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import javax.naming.*;
import javax.sql.*;
import common.util.*;
import dbconn.*;

public final class sub_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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

SimpleDateFormat dd = new SimpleDateFormat("yyyyMMdd");
int iRet = 0;
String strSep = "|!^";
String outS = "";
String sql = "";
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
String user_type   = "";
String user_group   = "";
String supplier_class   = "";
String use_yn   = "";
String ship_port = "";
String outS01 = "";
String outS02 = "";
String outS03 = "";
Connection conn = null;
dbconn.MatrixDataSet matrix = null;
dbconn.DataProcess dataProcess = null;
String new_id ="";
try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
 // 신규 ID번호 생성	
   sql = " select  IFNULL(max(cast(substr(id,2,4) as signed)),'1000') " +
           " from    login_01t " +
           "  where user_type = 'P'  "; 
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
       new_id  = matrix.getRowData(i).getData(0);    
  }
  if ( new_id == null || new_id == "") {
     new_id = "P1001";
  } else {
  	 new_id = "P"+(Integer.parseInt(new_id)+1);
  }     
 // get currency base code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'CURRENCY' "
      + " order by sort_order asc";

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String currencyCode  = matrix.getRowData(i).getData(0);
    String currencyName  = matrix.getRowData(i).getData(1);
    outS01  += "<option value=\"" + currencyCode + "\"";    
    outS01  += ">" + currencyName + "</option>";
  }
   // get country base code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'COUNTRY_CODE' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String countryCode  = matrix.getRowData(i).getData(0);
    String countryName  = matrix.getRowData(i).getData(1);
    outS02  += "<option value=\"" + countryCode + "\"";    
    outS02  += ">" + countryName + "</option>";
  }
  // get shipping port base code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'SHIPPING_PORT' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String portCode  = matrix.getRowData(i).getData(0);
    String portName  = matrix.getRowData(i).getData(1);
    outS03  += "<option value=\"" + portCode + "\"";    
    outS03  += ">" + portName + "</option>";
  }      
  // Read Buyer List
   sql = "select id," +
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
        "       state," +
        "       country," +
        "       supplier_class, " +
        "       delete_yn " +
        "  from login_01t " +
        "  where user_type = 'P'  "; 

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

} catch (Exception e) {
  System.out.println("Exception /admin/account/sub_list : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}	
}

for (int i = 0; i < iRet; i++) {
  int j = 0;
  id      = matrix.getRowData(i).getData(j++);
  name    = matrix.getRowData(i).getData(j++);
  email   = matrix.getRowData(i).getData(j++);
  phone1  = matrix.getRowData(i).getData(j++);
  phone2  = matrix.getRowData(i).getData(j++);
  fax     = matrix.getRowData(i).getData(j++);
  contact = matrix.getRowData(i).getData(j++);
  addr1   = matrix.getRowData(i).getData(j++);
  addr2   = matrix.getRowData(i).getData(j++);
  postcode= matrix.getRowData(i).getData(j++);
  surburb = matrix.getRowData(i).getData(j++);
  state   = matrix.getRowData(i).getData(j++);
  country   = matrix.getRowData(i).getData(j++);
  supplier_class   = matrix.getRowData(i).getData(j++);
  use_yn   = matrix.getRowData(i).getData(j++);
  String bgColor = "#fffff0";
  if (i%2 > 0) bgColor = "#eeeee0";

  String strLink = "<a href=\"javascript:fnSetData('"
                  + id + strSep
                  + StringUtil.replaceScriptString(name) + strSep
                  + StringUtil.replaceScriptString(email) + strSep
                  + phone1 + strSep
                  + phone2 + strSep
                  + fax + strSep
                  + StringUtil.replaceScriptString(contact) + strSep
                  + StringUtil.replaceScriptString(addr1) + strSep 
                  + StringUtil.replaceScriptString(addr2) + strSep                  
                  + postcode + strSep
                  + StringUtil.replaceScriptString(surburb) + strSep 
                  + StringUtil.replaceScriptString(state) + strSep 
                  + StringUtil.replaceScriptString(country) + strSep
                  + supplier_class + strSep  
                  + use_yn + strSep
                  + "')\">" + id + "</a>";
  
  outS += "<tr align='center' style='background-color:" + bgColor + ";'>"
        + " <td>" + strLink + "</td>"
        + " <td align='left'>" + name + "</td>"
        + " <td>" + email + "</td>"
        + " <td>" + phone1 + "</td>"
        + " <td>" + phone2 + "</td>"
        + " <td>" + fax + "</td>"
        + " <td>" + contact + "</td>"
        + " <td>" + addr1 + "</td>"
        + " <td>" + addr2 + "</td>"
        + " <td>" + postcode + "</td>"
        + " <td>" + surburb + "</td>"
        + " <td>" + state + "</td>"
        + " <td>" + country + "</td>"
        + " <td>" + supplier_class + "</td>"
        + " <td>" + use_yn + "</td>"
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
      out.write("  frm.suppId.value = '");
      out.print(new_id );
      out.write("';\n");
      out.write("  frm.suppId.readOnly = true;\n");
      out.write("  frm.suppId.style.backgroundColor = '#e8e8e8';\n");
      out.write("  frm.suppName.focus();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnSave(frm) {\n");
      out.write("  if (!jf_ChkValue(frm.suppId.value)) {\n");
      out.write("    alert('Please input new button first to create new supplier!');\n");
      out.write("    frm.suppId.select();\n");
      out.write("    return;\n");
      out.write("  }\t\n");
      out.write("  \n");
      out.write("  if (!jf_ChkValue(frm.suppName.value)) {\n");
      out.write("    alert('Input Supplier Name.');\n");
      out.write("    frm.suppName.select();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (frm.suppName.value.indexOf('\"') >= 0) {\n");
      out.write("    alert('Double quotes(\") are not accepted in Supplier Name.');\n");
      out.write("    frm.suppName.select();\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  \n");
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
      out.write("           alert ('E-mail format is incorrect.(Do not include space.)');\n");
      out.write("           form.email.focus();\n");
      out.write("           return;\n");
      out.write("        }\n");
      out.write("       }\n");
      out.write("     }  \t\n");
      out.write("  }\t  \n");
      out.write("\n");
      out.write("  if (confirm('Do you really want to save these data?')) {\n");
      out.write("    frm.action = './sub_save.jsp';\n");
      out.write("    frm.submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function fnDelete(frm) {\n");
      out.write("  if (frm.actionFlag.value != 'U' || !frm.suppId.value) {\n");
      out.write("    alert('Select an item you want to delete.');\n");
      out.write("    return;\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  if (confirm('Do you really want to delete the selected item?')) {\n");
      out.write("    frm.actionFlag.value = 'D';\n");
      out.write("    frm.action = './sub_save.jsp';\n");
      out.write("    frm.submit();\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("function fnSetData(strParams) {\n");
      out.write("  var params = strParams.split('");
      out.print( strSep );
      out.write("');\n");
      out.write("  var j = 0;\n");
      out.write("\n");
      out.write("  with (document.form1) {\n");
      out.write("    suppId.value = params[j++];\n");
      out.write("    suppName.value = params[j++];\n");
      out.write("    email.value = params[j++];\n");
      out.write("    phone1.value = params[j++];\n");
      out.write("    phone2.value = params[j++];\n");
      out.write("    fax.value = params[j++];\n");
      out.write("    contact.value = params[j++];\n");
      out.write("    addr1.value = params[j++];\n");
      out.write("    addr2.value = params[j++];\n");
      out.write("    postcode.value = params[j++];\n");
      out.write("    surburb.value = params[j++];\n");
      out.write("    state.value = params[j++];\n");
      out.write("    jf_fnSetSelectOption(country, params[j++]);\n");
      out.write("    jf_fnSetSelectOption(supplier_class, params[j++]);\n");
      out.write("    jf_fnSetSelectOption(use_yn, params[j++]);\n");
      out.write("    \n");
      out.write("    actionFlag.value = 'U';\n");
      out.write("    suppId.readOnly = true;\n");
      out.write("    suppId.style.backgroundColor = '#e8e8e8';\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>\n");
      out.write("<table width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td>\n");
      out.write("\n");
      out.write("<table width='90%' border='0' cellspacing='0' cellpadding='0' align=\"center\">\n");
      out.write("<tr>\n");
      out.write("  <td height='15' colspan='2'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width='3%'><img src='/img/supplier.jpg'></td>\n");
      out.write("  <td width='*' class='left_title'>Manufacturer Management</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td width='100%' height='2' colspan='2'><hr width='100%'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td height='10' colspan='2'></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width='90%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\n");
      out.write("<form name='form1' method='post'>\n");
      out.write("<input type='hidden' name='actionFlag' value='I'>\n");
      out.write("* Registered ID cannot be changed. If you want to change ID, delete and create again. <br>\n");
      out.write("  Click 'New\" to create new manufacturer. ID will be named automatically.\n");
      out.write("<tr>\n");
      out.write("  <td width='20%' class='table_header_center'>ID(*)</td>\n");
      out.write("  <td width='30%' class='table_bg_bright'><input type='text' name='suppId' size='5' maxlength='5'></td>\n");
      out.write("  <td width='20%' class='table_header_center'>Name</td>\n");
      out.write("  <td width='30%' class='table_bg_bright'><input type='text' name='suppName' size='30' maxlength='30'></td>\n");
      out.write("  <td class='table_header_center'>email</td>\n");
      out.write("  <td class='table_bg_bright'><input type='text' name='email' size='50' maxlength='50'></td>\n");
      out.write("</tr>\n");
      out.write("<tr>  \n");
      out.write("    <td class='table_header_center'>Phone1</td>\n");
      out.write("  <td class='table_bg_bright'><input type='text' name='phone1' size='20' maxlength='20'></td>\n");
      out.write("  <td class='table_header_center'>Phone2</td>\n");
      out.write("  <td class='table_bg_bright'><input type='text' name='phone2' size='20' maxlength='20'></td>\n");
      out.write("  <td class='table_header_center'>Fax</td>\n");
      out.write("  <td class='table_bg_bright'><input type='text' name='fax' size='20' maxlength='20'></td>   \n");
      out.write("</tr>\n");
      out.write("<tr>  \n");
      out.write("  <td class='table_header_center'>Contact</td>\n");
      out.write("  <td class='table_bg_bright'><input type='text' name='contact' size='30' maxlength='30'></td>\n");
      out.write("  <td class='table_header_center'>Address1</td>\n");
      out.write("  <td class='table_bg_bright'><input type='text' name='addr1' size='50' maxlength='50'></td>\n");
      out.write("  <td class='table_header_center'>Address2</td>\n");
      out.write("  <td class='table_bg_bright'><input type='text' name='addr2' size='50' maxlength='50'></td>   \n");
      out.write("</tr>\n");
      out.write("<tr>  \n");
      out.write("  <td class='table_header_center'>Post Code</td>\n");
      out.write("  <td class='table_bg_bright'><input type='text' name='postcode' size='10' maxlength='10'></td>\n");
      out.write("  <td class='table_header_center'>Surburb</td>\n");
      out.write("  <td class='table_bg_bright'><input type='text' name='surburb' size='20' maxlength='20'></td>\n");
      out.write("   <td class='table_header_center'>State</td>\n");
      out.write("  <td class='table_bg_bright'><input type='text' name='state' size='20' maxlength='20'></td>   \n");
      out.write("</tr>\n");
      out.write("<tr>  \n");
      out.write("  <td class='table_header_center'>Country</td>\n");
      out.write("  <td class='table_bg_bright'><select name=\"country\">");
      out.print( outS02 );
      out.write("</select></td>\n");
      out.write("  <td class='table_header_center'>Currency</td>\n");
      out.write("  <td class='table_bg_bright'><select name=\"supplier_class\">");
      out.print( outS01 );
      out.write("</select></td> \n");
      out.write("  <td class='table_header_center'>Deleted</td>\n");
      out.write("  <td class='table_bg_bright'><select name='use_yn'>\n");
      out.write("    <option></option>\n");
      out.write("    <option value='Y'>YES </option>\n");
      out.write("    <option value='N'>NO </option></select></td>   \n");
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
      out.write("    <input type='button' value='New' onclick='fnNew(this.form);' class=\"button_default\">\n");
      out.write("    <input type='button' value='Save' onclick='fnSave(this.form);' class=\"button_default\">\n");
      out.write("    <input type='button' value='Delete' onclick='fnDelete(this.form);' class=\"button_default\">\n");
      out.write("    ");

    }
    
      out.write("\n");
      out.write("  </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("  <td height='5'></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<table width='90%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>\n");
      out.write("\n");
      out.write("<tr class='table_header_center'>\n");
      out.write("   <td>ID</td>\n");
      out.write("   <td>Name</td>\n");
      out.write("   <td>email </td>\n");
      out.write("   <td>Phone 1</td>\n");
      out.write("   <td>Phone 2</td>\n");
      out.write("   <td>Fax </td>\n");
      out.write("   <td>Contact Person</td>\n");
      out.write("   <td>Address 1 </td>\n");
      out.write("   <td>Address 2 </td>\n");
      out.write("   <td>Postcode </td>\n");
      out.write("   <td>Surburb </td>\n");
      out.write("   <td>State </td>\n");
      out.write("   <td>Country </td>\n");
      out.write("   <td>Currency</td>\n");
      out.write("   <td>Deleted </td>\n");
      out.write("</tr>       \n");
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
      out.write("    <input type='button' value='New' onclick='fnNew(this.form);' class=\"button_default\">\n");
      out.write("    <input type='button' value='Save' onclick='fnSave(this.form);' class=\"button_default\">\n");
      out.write("    <input type='button' value='Delete' onclick='fnDelete(this.form);' class=\"button_default\">\n");
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
