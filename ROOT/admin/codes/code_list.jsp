<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
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
%>
<!DOCTYPE html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<!--script language="javaScript" src="/common/js/popup.js"></script-->
<script language="javascript">
function fnSearch(frm) {
  frm.action="./code_list.jsp";
  frm.submit();
}

function fnNew(frm) {
  frm.actionFlag.value = "I";   // insert
  frm.catalogCode.value = "";
  frm.catalogName.value = "";
  frm.catalogType.value = "<%=searchCatalogType %>";
  frm.catalogDesc.value = "";
  frm.sort_order.value = "";
  frm.related_code.value = "";
  frm.useYn.selectedIndex = 0;
  frm.catalogDesc.value = "";
  frm.catalogCode.readOnly = false;
  frm.catalogCode.style.backgroundColor = "white";
}


function fnSetData(strParams) {
  var params = strParams.split("<%= strSep %>");
  var i = 0;

  with (document.form2) {
    actionFlag.value = "U";       // update
    catalogCode.value = params[i++];
    catalogName.value = params[i++];
    catalogType.value = params[i++];
    sort_order.value = params[i++];
    jf_fnSetSelectOption(useYn, params[i++]);
    related_code.value = params[i++];
    catalogDesc.value = params[i++];
    catalogCode.readOnly = true;
    catalogCode.style.backgroundColor = "#e8e8e8";
  }
}

function fnSave(frm) {
  if (!jf_ChkValue(frm.catalogCode.value)) {
    alert("Input CODE.");
    frm.catalogCode.focus();
    return;
  }

  if (!jf_ChkValue(frm.catalogName.value)) {
    alert("Input CODE NAME.");
    frm.catalogName.focus();
    return;
  }
  if (!jf_ChkValue(frm.catalogType.value)) {
    alert("Input CODE TYPE.");
    frm.catalogType.focus();
    return;
  }
  if (!jf_ChkValue(frm.catalogType.value)) {
    alert("Input SORT ORDER.");
    frm.sort_order.focus();
    return;
  }
 
  // 큰 따옴표는 허용하지 않음.
  frm.catalogCode.value = frm.catalogCode.value.replace(/"/g, "'");
  frm.catalogName.value = frm.catalogName.value.replace(/"/g, "'");  

  if (jf_ChkValue(frm.catalogDesc.value)) {
    frm.catalogDesc.value = frm.catalogDesc.value.replace(/"/g, "'");

    if (!jf_IsValidStrLength(frm.catalogDesc.value, 500)) {
      alert("Check the length of CATALOG DESCRIPTION(Max length - 500).");
      frm.catalogDesc.focus();
      return;
    }
  }

  if (!confirm("Do you really want to save these data?")) {
    return;
  }

  frm.action="./code_save.jsp";
  frm.submit();
}

function fnDelete(frm) {
  if (!frm.catalogCode.value) {
    alert("Select an item you want to delete.");
    return;
  }

  if (!confirm("Do you really want to delete a selected item?")) {
    return;
  }

  frm.actionFlag.value = "D";   // delete

  frm.action="./code_save.jsp";
  frm.submit();
}

</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<CENTER>	
<table width='99%' border='0' cellspacing='0' cellpadding='0' align="center">
<tr>
  <td height='15' colspan='2'></td>
</tr>
<tr>
  <td width='3%'><img src='/img/update.jpg'></td>
  <td width='*' class='left_title'>CODE Management</td>
</tr>
<tr>
  <td width='100%' height='2' colspan='2'><hr width='100%'></td>
</tr>
<tr>
  <td height='10' colspan='2'></td>
</tr>
</table>

<table width="700" border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<form name="form1" method="post">
<tr>
  <td width="100%" align="right" class="table_bg_bright">CODE TYPE : <select name="searchCatalogType"><%= outS01 %></select>
    &nbsp;&nbsp;
    <input type="button" value="SEARCH" onclick="fnSearch(this.form);" class="button_default">&nbsp;</td>
</tr>
</form>
</table>
<table width="700" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="10"></td>
</tr>
</table>
<font color=red>* Please contact system administrator to modify existing codes.</font>
<table width="700" border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<form name="form2" method="post">
<input type="hidden" name="actionFlag" value="I">
<input type="hidden" name="searchCatalogType" value="<%= searchCatalogType %>">
<tr>
  <td width="20%" class="table_header_center">TYPE NAME</td>
  <td width="30%" class="table_bg_bright"><input type="text" name="selectedCatalogTypeName" value="<%= selectedCatalogTypeName %>" size="30" maxlength="100" readonly class="input_text_readonly"></td>
  <td width="20%" class="table_header_center">CODE(*)</td>
  <td width="30%" class="table_bg_bright"><input type="text" name="catalogCode" size="20" maxlength="10" class="input_text" readOnly="true" ></td>
</tr>
<tr>
  <td class="table_header_center">CODE NAME</td>
  <td colspan="3" class="table_bg_bright"><input type="text" name="catalogName" size="30" maxlength="30" class="input_text"></td>
</tr>
<tr>
  <td class="table_header_center">TYPE CODE</td>
  <td class="table_bg_bright"><input type="text" name="catalogType" size="20" maxlength="20" class="input_text" readonly></td>
  <td class="table_header_center">SORT ORDER</td>
  <td class="table_bg_bright"><input type="text" name="sort_order" size="20" maxlength="10" class="input_text"></td>
</tr>
<tr>
  <td class="table_header_center">CODE USE</td>
  <td class="table_bg_bright"><select name="useYn"><option value="Y" selected>Yes</option><option value="N">No</option></select></td>
  <td class="table_header_center">RELATED CODE</td>
  <td class="table_bg_bright"><input type="text" name="related_code" size="10" maxlength="20" class="input_text" ></td>
</tr>
<tr>  
  <td class="table_header_center" >CODE DESCRIPTION</td>
  <td class="table_bg_bright" colspan="3" > <textarea name="catalogDesc" cols="100" rows="3" class="input_textfield"></textarea></td>
</tr>
</table>
<table width="700" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="10"></td>
</tr>
<tr>
  <td width="100%" align="center">
  	                             	    <%
  	  								 if ( _adminclass.equals("1")) {
     								%>
  	                             <input type="button" value="NEW" onclick="fnNew(this.form);" class="button_default">
                                  <input type="button" value="SAVE" onclick="fnSave(this.form);" class="button_default">
                                  <input type="reset" value="CANCEL" class="button_default">
                                  <input type="button" value="DELETE" onclick="fnDelete(this.form);" class="button_default">
                                  </td>
                                  <% } %>
</tr>
</table>
<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
<tr>
  <td width="50%"></td>
  <td width="*" align="right">TOTAL : <%= iRet %>&nbsp;</td>
</tr>
</table>
<table width="99%" border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<tr class="table_header_center">
  <td width="8%">CODE</td>
  <td width="8%">NAME</td>
  <td width="8%">TYPE CODE</td>
  <td width="10%">TYPE NAME</td>
  <td width="8%">SORT ORDER</td>
  <td width="8%">RELATED CODE</td>
  <td width="6%">USE?</td>
  <td width="28%">DESCRIPTION</td>
</tr>
<%= outS02 %>
</table>

<table width="700" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="10"></td>
</tr>
<tr>
  <td width="100%" align="center">
  	    <%
  	   if ( _adminclass.equals("1")) {
     %>
  	                              <input type="button" value="NEW" onclick="fnNew(this.form);" class="button_default">
                                  <input type="button" value="SAVE" onclick="fnSave(this.form);" class="button_default">
                                  <input type="reset" value="CANCEL" class="button_default">
                                  <input type="button" value="DELETE" onclick="fnDelete(this.form);" class="button_default">
       <% } %>                           
      </td>
                                  
</tr>
</table>
</form>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
</body>
</html>
