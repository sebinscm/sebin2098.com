<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
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
   sql = " select  IFNULL(max(to_number(substr(id,2,4))),'1000') " +
           " from    login_01t " +
           "  where user_type = 'S' and id='S1001'  "; 
  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
       new_id  = matrix.getRowData(i).getData(0);    
  }
  if ( new_id == null || new_id == "") {
     new_id = "S1001";
  } else {
  	 new_id = "S"+(Integer.parseInt(new_id)+1);
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
        "       name,"+
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
        "  where user_type = 'S' and id='S1001' "; 

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
%>
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language=javascript src="/common/js/util.js"></script>
<script language="javascript">
function fnNew(frm) {
  frm.reset();
  frm.suppId.value = '<%=new_id %>';
  frm.suppId.readOnly = true;
  frm.suppId.style.backgroundColor = '#e8e8e8';
  frm.suppName.focus();
}

function fnSave(frm) {
  
  if (!jf_ChkValue(frm.suppName.value)) {
    alert('Input Supplier Name.');
    frm.suppName.select();
    return;
  }

  if (frm.suppName.value.indexOf('"') >= 0) {
    alert('Double quotes(") are not accepted in Supplier Name.');
    frm.suppName.select();
    return;
  }

  
  if ( !frm.email.value) {
  	alert('Input email');
    frm.email.select();
    return;
  } else {
  	var email = frm.email.value.split(',');
    for(i=0; i<email.length; i++) {
      if(email[i].value != '') {
        var emailEx1 = /^([A-Za-z0-9]{0,1})([A-Za-z0-9]{1,15})([A-Za-z0-9-_.]{0,1})([A-Za-z0-9]{1,15})([A-Za-z0-9]{0,1})(@{1})([A-Za-z0-9_]{1,15})(.{1})([A-Za-z0-9_]{2,10})(.{1}[A-Za-z]{2,10})?(.{1}[A-Za-z]{2,10})?$/;
        if(!emailEx1.test(email[i])) {
           alert ('E-mail format is incorrect(Do not include space.)');
           form.email.focus();
           return;
        }
       }
     }  	
  }	  

  if (confirm('Do you really want to save these data?')) {
    frm.action = './company_save.jsp';
    frm.submit();
  }
}

function fnDelete(frm) {
  if (frm.actionFlag.value != 'U' || !frm.suppId.value) {
    alert('Select an item you want to delete.');
    return;
  }

  if (confirm('Do you really want to delete the selected item?')) {
    frm.actionFlag.value = 'D';
    frm.action = './company_save.jsp';
    frm.submit();
  }
}


function fnSetData(strParams) {
  var params = strParams.split('<%= strSep %>');
  var j = 0;

  with (document.form1) {
    suppId.value = params[j++];
    suppName.value = params[j++];
    email.value = params[j++];
    phone1.value = params[j++];
    phone2.value = params[j++];
    fax.value = params[j++];
    contact.value = params[j++];
    addr1.value = params[j++];
    addr2.value = params[j++];
    postcode.value = params[j++];
    surburb.value = params[j++];
    state.value = params[j++];
    jf_fnSetSelectOption(country, params[j++]);
    jf_fnSetSelectOption(supplier_class, params[j++]);
    jf_fnSetSelectOption(use_yn, params[j++]);
    
    actionFlag.value = 'U';
    suppId.readOnly = true;
    suppId.style.backgroundColor = '#e8e8e8';
  }
}
</script>
</head>
<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
<table width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td>

<table width='90%' border='0' cellspacing='0' cellpadding='0' align="center">
<tr>
  <td height='15' colspan='2'></td>
</tr>
<tr>
  <td width='3%'><img src='/img/supplier.jpg'></td>
  <td width='*' class='left_title'>Company Profile Management</td>
</tr>
<tr>
  <td width='100%' height='2' colspan='2'><hr width='100%'></td>
</tr>
<tr>
  <td height='10' colspan='2'></td>
</tr>
</table>

<table width='90%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>
<form name='form1' method='post'>
<input type='hidden' name='actionFlag' value='I'>
* Registered Company ID cannot be changed. Contact System Administrator to change ID. <br>
  
<tr>
  <td width='20%' class='table_header_center'>Company ID(*)</td>
  <td width='30%' class='table_bg_bright'><input type='text' name='suppId' size='5' maxlength='5'></td>
  <td width='20%' class='table_header_center'>Company Name</td>
  <td width='30%' class='table_bg_bright'><input type='text' name='suppName' size='30' maxlength='30'></td>
  <td class='table_header_center'>email</td>
  <td class='table_bg_bright'><input type='text' name='email' size='50' maxlength='50'></td>
</tr>
<tr>  
    <td class='table_header_center'>Phone1</td>
  <td class='table_bg_bright'><input type='text' name='phone1' size='20' maxlength='20'></td>
  <td class='table_header_center'>Phone2</td>
  <td class='table_bg_bright'><input type='text' name='phone2' size='20' maxlength='20'></td>
  <td class='table_header_center'>Fax</td>
  <td class='table_bg_bright'><input type='text' name='fax' size='20' maxlength='20'></td>   
</tr>
<tr>  
  <td class='table_header_center'>Contact</td>
  <td class='table_bg_bright'><input type='text' name='contact' size='30' maxlength='30'></td>
  <td class='table_header_center'>Address1</td>
  <td class='table_bg_bright'><input type='text' name='addr1' size='50' maxlength='50'></td>
  <td class='table_header_center'>Address2</td>
  <td class='table_bg_bright'><input type='text' name='addr2' size='50' maxlength='50'></td>   
</tr>
<tr>  
  <td class='table_header_center'>Post Code</td>
  <td class='table_bg_bright'><input type='text' name='postcode' size='10' maxlength='10'></td>
  <td class='table_header_center'>Surburb</td>
  <td class='table_bg_bright'><input type='text' name='surburb' size='20' maxlength='20'></td>
   <td class='table_header_center'>State</td>
  <td class='table_bg_bright'><input type='text' name='state' size='20' maxlength='20'></td>   
</tr>
<tr>  
  <td class='table_header_center'>Country</td>
  <td class='table_bg_bright'><select name="country"><%= outS02 %></select></td>
  <td class='table_header_center'>Currency</td>
  <td class='table_bg_bright'><select name="supplier_class"><%= outS01 %></select></td> 
  <td class='table_header_center'>Deleted</td>
  <td class='table_bg_bright'><select name='use_yn'>
    <option></option>
    <option value='Y'>YES </option>
    <option value='N'>NO </option></select></td>   
</tr>
</table>
<table width='90%' border='0' cellspacing='0' cellpadding='0' align='center'>
<tr>
  <td height='15'></td>
</tr>
<tr>
  <td align='center'>
  	<%
  	   if ( _adminclass.equals("1")) {
     %>
    <!--input type='button' value='New' onclick='fnNew(this.form);' class="button_default"-->
    <input type='button' value='Save' onclick='fnSave(this.form);' class="button_default">
    <!--input type='button' value='Delete' onclick='fnDelete(this.form);' class="button_default"-->
    <%
    }
    %>
  </td>
</tr>
<tr>
  <td height='5'></td>
</tr>
</table>

<table width='90%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>

<tr class='table_header_center'>
   <td>ID</td>
   <td>Name</td>
   <td>email </td>
   <td>Phone 1</td>
   <td>Phone 2</td>
   <td>Fax </td>
   <td>Contact Person</td>
   <td>Address 1 </td>
   <td>Address 2 </td>
   <td>Postcode </td>
   <td>Surburb </td>
   <td>State </td>
   <td>Country </td>
   <td>Currency</td>
   <td>Deleted </td>
</tr>       
<%= outS %>
</table>
<table width='90%' border='0' cellspacing='0' cellpadding='0' align='center'>
<tr>
  <td height='15'></td>
</tr>
<tr>
  <td align='center'>
    <%
  	   if ( _adminclass.equals("1")) {
     %>
    <!--input type='button' value='New' onclick='fnNew(this.form);' class="button_default"-->
    <input type='button' value='Save' onclick='fnSave(this.form);' class="button_default">
    <!--input type='button' value='Delete' onclick='fnDelete(this.form);' class="button_default"-->
    <%
    }
    %>
  </td>
</tr>
</table>
</form>
<%
out.println(CopyRightLogo());
%>
</tr></td></table>
</body>
</html>