<%@page import="java.sql.*" %>
<%@page import="java.net.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="java.text.*" %>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/common/calendar/calendar.htm" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
int iRet = 0;
String strSep = "|!^";
String outS = "";
String outS01 = "";
String outS02 = "";
String outS03 = "";
String outS04 = "";
String outS05 = "";
String outS06 = "";
String outS07 = "";
String outS08 = "";
String outS09 = "";
String outS10 = "";
String sql = "";
String fromUrl = "PO_Details.jsp";
String today = DateUtil.getToday("yyyy/MM/dd");
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
 // get buyer code
  sql = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'B' and delete_yn='N' "
      + " order by id asc";

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String bid  = matrix.getRowData(i).getData(0);
    String bname  = matrix.getRowData(i).getData(1);
    outS01  += "<option value=\"" + bid + "\"";    
    outS01  += ">" + bname +"-"+bid+ "</option>";
  }
  // get supplier code
  sql = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'S' and delete_yn='N' "
      + " order by id asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String sid  = matrix.getRowData(i).getData(0);
    String sname  = matrix.getRowData(i).getData(1);
    outS02  += "<option value=\"" + sid + "\"";    
    outS02  += ">" + sname + "</option>";
  } 
     // get PGR code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'PGR' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String pgrcode  = matrix.getRowData(i).getData(0);
    String pgrname  = matrix.getRowData(i).getData(1);
    outS03  += "<option value=\"" + pgrcode + "\"";    
    outS03  += ">" + pgrname + "</option>";
  }
  // get SGR code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'SGR' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String sgrcode  = matrix.getRowData(i).getData(0);
    String sgrname  = matrix.getRowData(i).getData(1);
    outS04  += "<option value=\"" + sgrcode + "\"";    
    outS04  += ">" + sgrname + "</option>";
  }
  // get MATERIAL code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'MATERIAL' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String mcode  = matrix.getRowData(i).getData(0);
    String mname  = matrix.getRowData(i).getData(1);
    outS05  += "<option value=\"" + mcode + "\"";    
    outS05  += ">" + mname + "</option>";
  }
  
   // get Currency code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'CURRENCY' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String curcode  = matrix.getRowData(i).getData(0);
    String curname  = matrix.getRowData(i).getData(1);
    outS06  += "<option value=\"" + curcode + "\"";    
    outS06  += ">" + curname + "</option>";
  }
  // get SUBsupplier code
  sql = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'P' and delete_yn='N'  "
      + " order by id asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String subid  = matrix.getRowData(i).getData(0);
    String subname  = matrix.getRowData(i).getData(1);
    outS07  += "<option value=\"" + subid + "\"";    
    outS07  += ">" + subname + "</option>";
  } 
  // get SEASON code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'SEASON' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String season_code  = matrix.getRowData(i).getData(0);
    String season_name  = matrix.getRowData(i).getData(1);
    outS08  += "<option value=\"" + season_code + "\"";    
    outS08  += ">" + season_name + "</option>";
  }
  
  // get Ship type
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'SHIP_TYPE' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String ship_code  = matrix.getRowData(i).getData(0);
    String ship_name  = matrix.getRowData(i).getData(1);
    outS09  += "<option value=\"" + ship_code + "\"";    
    outS09  += ">" + ship_name + "</option>";
  }
} catch (Exception e) {
  System.out.println("Exception /admin/account/supplier : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}	
}
%>
<html>
<head>
<title>Create Purchase Order</title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<script language="javaScript" src="/common/js/validate2.js"></script>
<script language="javascript">

function fnSave(frm) { 
  if (!frm.styno.value) {
    alert('Input style no!');
    frm.styno.focus();
    return;
  }
  if (!frm.buyer.value) {
    alert('Input Buyer!');
    frm.buyer.focus();
    return;
  }
   if (!frm.pgr.value) {
    alert('Input PGR!');
    frm.pgr.focus();
    return;
  }
   if (!frm.sgr.value) {
    alert('Input SGR!');
    frm.sgr.focus();
    return;
  }
  if (!frm.unitprice.value) {
    alert('Input Unit Price!');
    frm.unitprice.focus();
    return;
  }
  if (!frm.local_price.value) {
    alert('Input Local Price!');
    frm.local_price.focus();
    return;
  }
  if (!frm.itemtext.value) {
    alert('Input Item text!');
    frm.itemtext.focus();
    return;
  }
    if (!frm.reorder.value) {
    alert('Input reorder sequence!');
    frm.reorder.focus();
    return;
  }
  if (!frm.size1.value) {
    alert('Input at least one Size type!');
    frm.size1.focus();
    return;
  }
  if (!frm.col_1.value) {
    alert('Input at least one color and qty!');
    frm.col_1.focus();
    return;
  }
  if (confirm('Do you really want to save these data?')) { 
    frm.action = './order_input.jsp';
    frm.submit();
  }
}

function Change() {
  num1 = form1.aqty_1.value;
  if( num1.length == 0 ) {
    num1 = "0";
    form1.aqty_1.value = "0";
  }
  num2 = form1.aqty_2.value;
  if( num2.length == 0 ) {
    num2 = "0";
    form1.aqty_2.value = "0";
  }
  num3 = form1.aqty_3.value;
  if( num3.length == 0 ) {
    num3 = "0";
    form1.aqty_3.value = "0";
  }
 num4 = form1.aqty_4.value;
  if( num4.length == 0 ) {
    num4 = "0";
    form1.aqty_4.value = "0";
  }
   num5 = form1.aqty_5.value;
  if( num5.length == 0 ) {
    num5 = "0";
    form1.aqty_5.value = "0";
  }
 num6 = form1.aqty_6.value;
  if( num6.length == 0 ) {
    num6 = "0";
    form1.aqty_6.value = "0";
  }
  

  var tmpTotal = eval(num1) + eval(num2) + eval(num3) + eval(num4) + eval(num5)
                  + eval(num6) 
  form1.aqtytot.value = tmpTotal;
}
function Change2() {
  num1 = form1.bqty_1.value;
  if( num1.length == 0 ) {
    num1 = "0";
    form1.bqty_1.value = "0";
  }
  num2 = form1.bqty_2.value;
  if( num2.length == 0 ) {
    num2 = "0";
    form1.bqty_2.value = "0";
  }
  num3 = form1.bqty_3.value;
  if( num3.length == 0 ) {
    num3 = "0";
    form1.bqty_3.value = "0";
  }
 num4 = form1.bqty_4.value;
  if( num4.length == 0 ) {
    num4 = "0";
    form1.bqty_4.value = "0";
  }
   num5 = form1.bqty_5.value;
  if( num5.length == 0 ) {
    num5 = "0";
    form1.bqty_5.value = "0";
  }
 num6 = form1.bqty_6.value;
  if( num6.length == 0 ) {
    num6 = "0";
    form1.bqty_6.value = "0";
  }
  

  var tmpTotal = eval(num1) + eval(num2) + eval(num3) + eval(num4) + eval(num5)
                  + eval(num6) 
  form1.bqtytot.value = tmpTotal;
}
function Change3() {
  num1 = form1.cqty_1.value;
  if( num1.length == 0 ) {
    num1 = "0";
    form1.cqty_1.value = "0";
  }
  num2 = form1.cqty_2.value;
  if( num2.length == 0 ) {
    num2 = "0";
    form1.cqty_2.value = "0";
  }
  num3 = form1.cqty_3.value;
  if( num3.length == 0 ) {
    num3 = "0";
    form1.cqty_3.value = "0";
  }
 num4 = form1.cqty_4.value;
  if( num4.length == 0 ) {
    num4 = "0";
    form1.cqty_4.value = "0";
  }
   num5 = form1.cqty_5.value;
  if( num5.length == 0 ) {
    num5 = "0";
    form1.cqty_5.value = "0";
  }
 num6 = form1.cqty_6.value;
  if( num6.length == 0 ) {
    num6 = "0";
    form1.cqty_6.value = "0";
  }
  

  var tmpTotal = eval(num1) + eval(num2) + eval(num3) + eval(num4) + eval(num5)
                  + eval(num6) 
  form1.cqtytot.value = tmpTotal;
}
function Change4() {
  num1 = form1.dqty_1.value;
  if( num1.length == 0 ) {
    num1 = "0";
    form1.dqty_1.value = "0";
  }
  num2 = form1.dqty_2.value;
  if( num2.length == 0 ) {
    num2 = "0";
    form1.dqty_2.value = "0";
  }
  num3 = form1.dqty_3.value;
  if( num3.length == 0 ) {
    num3 = "0";
    form1.dqty_3.value = "0";
  }
 num4 = form1.dqty_4.value;
  if( num4.length == 0 ) {
    num4 = "0";
    form1.dqty_4.value = "0";
  }
   num5 = form1.dqty_5.value;
  if( num5.length == 0 ) {
    num5 = "0";
    form1.dqty_5.value = "0";
  }
 num6 = form1.dqty_6.value;
  if( num6.length == 0 ) {
    num6 = "0";
    form1.dqty_6.value = "0";
  }
  

  var tmpTotal = eval(num1) + eval(num2) + eval(num3) + eval(num4) + eval(num5)
                  + eval(num6) 
  form1.dqtytot.value = tmpTotal;
}
function Change5() {
  num1 = form1.eqty_1.value;
  if( num1.length == 0 ) {
    num1 = "0";
    form1.eqty_1.value = "0";
  }
  num2 = form1.eqty_2.value;
  if( num2.length == 0 ) {
    num2 = "0";
    form1.eqty_2.value = "0";
  }
  num3 = form1.eqty_3.value;
  if( num3.length == 0 ) {
    num3 = "0";
    form1.eqty_3.value = "0";
  }
 num4 = form1.eqty_4.value;
  if( num4.length == 0 ) {
    num4 = "0";
    form1.eqty_4.value = "0";
  }
   num5 = form1.eqty_5.value;
  if( num5.length == 0 ) {
    num5 = "0";
    form1.eqty_5.value = "0";
  }
 num6 = form1.eqty_6.value;
  if( num6.length == 0 ) {
    num6 = "0";
    form1.eqty_6.value = "0";
  }
  

  var tmpTotal = eval(num1) + eval(num2) + eval(num3) + eval(num4) + eval(num5)
                  + eval(num6) 
  form1.eqtytot.value = tmpTotal;
}

function ValidCh(Value)
{
   bRetVal = true;

   for (i=0; i<Value.length; i++)
   {
       if ('1234567890.'.lastIndexOf(Value.substr(i,1)) == -1)
           bRetVal = false;
   }
   return bRetVal;
}

function displayLeng( sz, id )
{
    var form = document.form1;
    var obj  = document.getElementById( id );


    if (form[id].value.length > sz)
    {
        if (event.keyCode != '8') //백스페이스는 지우기작업시 바이트 체크하지 않기 위해서
        {
            alert( 'You can input '+sz+' characters.');
        }
        form[id].value = form[id].value.substring(0, sz);
    }


    document.getElementById(id+'_bytes').innerHTML = form[id].value.length+" 자";
}
</script>
</head>

<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>	
<table width='99%' border='0' cellspacing='0' cellpadding='0' align="center">
<tr>
  <td height='15' colspan='2'></td>
</tr>
<tr>
  <td width='3%'><img src='/img/btnPO.gif'></td>
  <td width='*' class='left_title'>Create Pre-Purchase Order</td>
</tr>
<tr>
  <td width='100%' height='2' colspan='2'><hr width='100%'></td>
</tr>
<tr>
  <td height='10' colspan='2'></td>
</tr>
</table>
<table width='840' border='0' cellspacing='0' cellpadding='0'>
<tr><td>
(*)marked item must be filled in. Style# should be numeric only. Style# will be create as "SubGroup Code+Style#" when the PO is created. 	
<table width='100%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>
    <form name="form1" method="POST">
	<INPUT TYPE=HIDDEN NAME=input_flag VALUE='INSERT' >
	<input type='hidden' name='fromUrl' value='<%= fromUrl %>'>
  <tr class="table_header_center">
    <td width="21%" height="16" class='table_header_center'>*PO#</td>
    <td width="21%" height="16" class='table_header_center'>*Style#</td>
    <td width="23%" height="16" class='table_header_center'>*Buyer</td>
    <td width="35%" colspan="2" height="16" class='table_header_center'>Supplier</td>
  </tr>
  <tr class="table_header_center">
    <td width="21%" height="23" class='table_bg_bright'>Auto-Create<!--input type='text' name='pono' size='15' maxlength='15' class='input_text' disabled='true'--></td>
    <td width="21%" height="23" class='table_bg_bright'><input type='text'  name='styno' size='10' maxlength='10' class='input_text'></td>
    <td width="23%" height="23" class='table_bg_bright'><select name="buyer" ><%=outS01%></select></td>
    <td width="35%" colspan="2" height="23" class='table_bg_bright'><select name="supplier"><%=outS02%></select></td>
  </tr>
  <tr class="table_header_center">
    <td width="21%" height="16" class='table_header_center'>*Product Group</td>
    <td width="21%" height="16" class='table_header_center'>*Sub group</td>
    <td width="23%" height="16" class='table_header_center'>*Unit Price</td>
    <td width="19%" height="16" class='table_header_center'>Order Date</td>
    <td width="16%" height="16" class='table_header_center'>Arrival Date</td>
  </tr>
  <tr class="table_header_center">
    <td width="21%" height="23" class='table_bg_bright'><select name="pgr"><%=outS03%></select></td>
    <td width="21%" height="23" class='table_bg_bright'><select name="sgr"><%=outS04%></select></td>
    <td width="23%" height="23" class='table_bg_bright'><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='unitprice' size='10' maxlength='10' class='input_text_right'>
    	   &nbsp;&nbsp;<select name="currency"><%=outS06%></select></td>
    <td width='19%' class="table_bg_bright"><input type='text' name='orderdate' value='<%= today %>' size='12' readonly class='input_text'>
    <img src="/img/calendar.gif" style="cursor:hand" align="absmiddle" onclick="javascript:popFrame.fPopCalendar(this, document.form1.orderdate, document.all['popCal'], 'RIGHT', event);"></td>

    <td width='16%' class="table_bg_bright"><input type='text' name='deliverydate'  size='12' readonly class='input_text'>
    <img src="/img/calendar.gif" style="cursor:hand" align="absmiddle" onclick="javascript:popFrame.fPopCalendar(this, document.form1.deliverydate, document.all['popCal'], 'RIGHT', event);"></td>
  </tr>
  <tr class="table_header_center">
    <td width="21%" height="22" class='table_header_center'>Ship type</td>
    <td width="21%" height="22" class='table_header_center'>Material</td>
    <td width="23%" height="22" class='table_header_center'>*Season</td>
    <td width="19%" height="22" class='table_header_center'>Manufacturer</td>
    <td width="16%" height="22" class='table_header_center'>Task Number</td>
  </tr>
  <tr class="table_header_center">
    <td width="21%" height="27" class='table_bg_bright'><select name="shiptype"><%=outS09%></select></td>
    <td width='21%' class="table_bg_bright"><select name="material"><%=outS05%></select></td>
    <td width="23%" height="27" class='table_bg_bright'><SELECT NAME=season><%=outS08%></SELECT></td>
    <td width="19%" height="27" class='table_bg_bright'><select name="subsupplier"><%=outS07%></select></td>
    <td width="16%" height="27" class='table_bg_bright'><input type='text' name='supstyno' size='20' maxlength='20' class='input_text'></td>
  </tr>
  <tr class="table_header_center">
    <td width="21%" height="22" class='table_header_center'>BRAND</td>
    <td width="21%" height="22" class='table_header_center'>Shipping Type</td>
    <td width="23%" height="22" class='table_header_center'>Local Price(RMB)</td>
    <td width="19%" height="22" class='table_header_center'>Re-Order SEQ</td>
    <td width="16%" height="22" class='table_header_center'>PO from Buyer</td>
  </tr>
  <tr class="table_header_center">
    <td width="21%" height="27" class='table_bg_bright'><input type='text' name='brand' size='20' maxlength='20' class='input_text'></td>
    <td width='21%' height="27" class="table_bg_bright"><SELECT NAME=deltype>
      <OPTION VALUE="SHIP">SHIP</OPTION>
      <OPTION VALUE="AIR">AIR</OPTION>
      </SELECT></td>
    <td width="23%" height="27" class='table_bg_bright'><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='local_price' size='10' maxlength='10' class='input_text_right'></td>
    <td width="19%" height="27" class='table_bg_bright'><input type='text' name='reorder' size='10' maxlength='10' class='input_text'></td>
    <td width="16%" height="27" class='table_bg_bright'><input type="file" name="poFromBuyer"></td>
  </tr>
  
  <tr class="table_header_center">
    <td width="21%" height="28" class='table_header_center'>*Item text</td>
    <td width="79%" colspan="4" height="28" class='table_bg_bright'><input type='text' name='itemtext' size='100' maxlength='100' class='input_text'></td>
  </tr>  
  <tr class="table_header_center">  	 
  	<td class='table_list_no_height' align='center'>Comments<br>(Max 4000char)</td>    
    <td width="79%" colspan="4" height="202" class='table_bg_bright'><TEXTAREA id=chk1 onkeyup='displayLeng(4000,"chk1");' name="contents" cols="100" rows="14"></TEXTAREA><div name='chk1_bytes' id='chk1_bytes'></div></td>
  </tr>  
</table>
<table width='840' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>
  <tr class="table_header_center">
    <td width="20%" rowspan="2" class='table_header_center' height="38">*Color</td>
    <td width="67%" colspan="6" class='table_header_center' height="16">*Size</td>
    <td width="13%" rowspan="2" class='table_header_center' height="38">TOTAL</td>
  </tr>
  <tr class="table_header_center">
    <td width="11%" class='table_header_center' height="21"><font size="2"><input type='text' name='size1' size='10' maxlength='10' class='input_text'></font></td>
    <td width="11%" class='table_header_center' height="21"><font size="2"><input type='text' name='size2' size='10' maxlength='10' class='input_text'></font></td>
    <td width="11%" class='table_header_center'  height="21"><font size="2"><input type='text' name='size3' size='10' maxlength='10' class='input_text'></font></td>
    <td width="11%" class='table_header_center' height="21"><font size="2"><input type='text' name='size4' size='10' maxlength='10' class='input_text'></font></td>
    <td width="11%" class='table_header_center' height="21"><font size="2"><input type='text' name='size5' size='10' maxlength='10' class='input_text'></font></td>
    <td width="12%" class='table_header_center' height="21"><font size="2"><input type='text' name='size6' size='10' maxlength='10' class='input_text'></font></td>
  </tr>
  <tr class="table_header_center">
    <td width="20%" height="16" class='table_bg_bright'><input type='text' name='col_1' size='20' maxlength='15' class='input_text'></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='aqty_1'  onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change()"></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='aqty_2'  onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change()"></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='aqty_3'  onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change()"></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='aqty_4'  onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change()"></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='aqty_5'  onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change()"></td>
    <td width="12%" height="16" class='table_bg_bright'><input type='text' name='aqty_6' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change()"></td>
    <td width="13%" height="16" class='table_bg_bright'><input type='text' name='aqtytot' size='5' maxlength='5' class='input_text' readonly ></td>
  </tr>
  <tr class="table_header_center">
    <td width="20%" height="16" class='table_bg_bright'><input type='text' name='col_2' size='20' maxlength='15' class='input_text'></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='bqty_1' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change2()"></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='bqty_2' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change2()"></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='bqty_3' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change2()"></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='bqty_4' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change2()"></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='bqty_5' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change2()"></td>
    <td width="12%" height="16" class='table_bg_bright'><input type='text' name='bqty_6' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change2()"></td>
    <td width="13%" height="16" class='table_bg_bright'><input type='text' name='bqtytot' size='5' maxlength='5' class='input_text' readonly></td>
  </tr>
  <tr class="table_header_center">
    <td width="20%" height="16" class='table_bg_bright'><input type='text' name='col_3' size='20' maxlength='15' class='input_text'></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='cqty_1' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change3()"></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='cqty_2' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change3()"></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='cqty_3' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change3()"></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='cqty_4' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change3()"></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='cqty_5' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change3()"></td>
    <td width="12%" height="16" class='table_bg_bright'><input type='text' name='cqty_6' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change3()"></td>
    <td width="13%" height="16" class='table_bg_bright'><input type='text' name='cqtytot'  size='5' maxlength='5' class='input_text' readonly ></td>
  </tr>
  <tr class="table_header_center">
    <td width="20%" height="16" class='table_bg_bright'><input type='text' name='col_4' size='20' maxlength='15' class='input_text'></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='dqty_1' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change4()"></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='dqty_2' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change4()"></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='dqty_3' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change4()"></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='dqty_4' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change4()"></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='dqty_5' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change4()"></td>
    <td width="12%" height="16" class='table_bg_bright'><input type='text' name='dqty_6' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change4()"></td>
    <td width="13%" height="16" class='table_bg_bright'><input type='text' name='dqtytot' size='5' maxlength='5' class='input_text' readonly></td>
  </tr>
  <tr class="table_header_center">
    <td width="20%" height="16" class='table_bg_bright'><input type='text' name='col_5' size='20' maxlength='15' class='input_text'></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='eqty_1' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change5()"></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='eqty_2' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change5()"></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='eqty_3' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change5()"></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='eqty_4' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change5()"></td>
    <td width="11%" height="16" class='table_bg_bright'><input type='text' name='eqty_5' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change5()"></td>
    <td width="12%" height="16" class='table_bg_bright'><input type='text' name='eqty_6' onkeypress="return jf_EventNumberCheck();" size='5' maxlength='5' class='input_text' onBlur="Change5()"></td>
    <td width="13%" height="16" class='table_bg_bright'><input type='text' name='eqtytot'  size='5' maxlength='5' class='input_text' readonly></td>
  </tr>
  <!--tr class="table_header_center">
    <td width="20%" class='table_header_center' height="16">Grand Total</td>
    <td width="11%" class='table_header_center' height="16"><input type='text' name='tqty_1' readonly onfocus='this.blur()' size='5' maxlength='5' class='input_text'></td>
    <td width="11%" class='table_header_center' height="16"><input type='text' name='tqty_2' readonly onfocus='this.blur()' size='5' maxlength='5' class='input_text'></td>
    <td width="11%" class='table_header_center' height="16"><input type='text' name='tqty_3' readonly onfocus='this.blur()' size='5' maxlength='5' class='input_text'></td>
    <td width="11%" class='table_header_center' height="16"><input type='text' name='tqty_4' readonly onfocus='this.blur()' size='5' maxlength='5' class='input_text'></td>
    <td width="11%" class='table_header_center' height="16"><input type='text' name='tqty_5' readonly onfocus='this.blur()' size='5' maxlength='5' class='input_text'></td>
    <td width="12%" class='table_header_center' height="16"><input type='text' name='tqty_6' readonly onfocus='this.blur()' size='5' maxlength='5' class='input_text'></td>
    <td width="13%" class='table_header_center' height="16"><input type='text' name='tqty_7' readonly onfocus='this.blur()' size='5' maxlength='5' class='input_text'></td>
  </tr-->                                                       
</table>
<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'>
<tr>
  <td height='15'></td>
</tr>
<tr>
  <td align='center'>
    <input type='button' value='Save' onclick='fnSave(this.form);'>
  </td>
</tr>
</table>
</form>
<%
out.println(CopyRightLogo());
%>
</tr></td>
</table>

</body>

</html>