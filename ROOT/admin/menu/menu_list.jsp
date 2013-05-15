<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<%@page import="common.util.*" %>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
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
%>
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<script language="javascript">
var parentMenus = new Array();
<%= parentMenus %>

function fnNew(frm) {
  with (frm) {
    reset();
    fnSetParentMenu(frm);
  }
}

function fnSetData(strParams) {
  var params = strParams.split("<%= strSep %>");

  with (document.form1) {
    var i = 0;
    actionFlag.value = "U";       // update
    seqNo.value = params[i++];

    jf_fnSetSelectOption(userGroup, params[i++]);
    fnSetParentMenu(document.form1);

    menuName.value = params[i++];
    menuUrl.value = params[i++];
    sortNo.value = params[i++];
    jf_fnSetSelectOption(parentNo, params[i++]);
  }
}

function fnSetParentMenu(frm) {
  var selectedUserGroup = frm.userGroup.options[frm.userGroup.selectedIndex].value;
  var parentNoLength = frm.parentNo.options.length;

  // clear PARENT MENU options except HOME option
  for (var i = 0; i < parentNoLength - 1; i++) {
    frm.parentNo.options[1] = null;
  }

  // User Group에 해당하는 Parent Menu Setting
  for (var i = 0; i < parentMenus.length; i++) {
    if (selectedUserGroup == parentMenus[i][0]) {
      var oOption = document.createElement("OPTION");
      oOption.text = parentMenus[i][3] + "_" + parentMenus[i][2];
      oOption.value = parentMenus[i][1];
      frm.parentNo.add(oOption);
    }
  }
}

function fnSave(frm) {
  if (!jf_ChkValue(frm.menuName.value)) {
    alert("Input MENU NAME.");
    frm.menuName.focus();
    return;
  }

  frm.menuName.value = frm.menuName.value.replace(/"/g, "'");

  if (frm.parentNo.selectedIndex > 0 && !jf_ChkValue(frm.menuUrl.value)) {
    alert("Input MENU URL.");
    frm.menuUrl.focus();
    return;
  }

  if (!jf_ChkValue(frm.sortNo.value)) {
    alert("Input SORT ORDER.");
    frm.sortNo.focus();
    return;
  }

  // Sort Order의 첫글자는 Parent의 Sort Order와 같아야 함.
  // 단, Parent가 HOME인 경우에는 Sort Order의 첫글자가 같을 필요는 없음.
  // 또한, Sort Order는 Parent의 Sort Order보다 커야 함.
  var selectedParentNoText = frm.parentNo.options[frm.parentNo.selectedIndex].text;
  var parentSortOrder = selectedParentNoText.substring(0, selectedParentNoText.indexOf("_"));

  if (frm.parentNo.selectedIndex > 0) {
    if (parentSortOrder.charAt(0) != frm.sortNo.value.charAt(0)) {
      alert("The first letter of the SORT ORDER should be same with the one of the sort order of the PARENT MENU.");
      frm.sortNo.select();
      return;
    }
  }

  if (parentSortOrder >= frm.sortNo.value) {
    alert("The SORT ORDER should be bigger than the sort order of the PARENT MENU.");
    frm.sortNo.select();
    return;
  }

  if (!confirm("Do you really want to save these data?")) {
    return;
  }

  frm.action="./menu_save.jsp";
  frm.submit();
}

function fnDelete(frm) {
  if (!frm.seqNo.value) {
    alert("Select an item you want to delete.");
    return;
  }

  if (!confirm("Do you really want to delete a selected item?")) {
    return;
  }

  frm.actionFlag.value = "D";   // delete
  frm.action="./menu_save.jsp";
  frm.submit();
}
</script>
</head>
<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
<table width='840' border='0' cellspacing='0' cellpadding='0'><tr><td>

<table width='99%' border='0' cellspacing='0' cellpadding='0' align="center">
<tr>
  <td height='15' colspan='2'></td>
</tr>
<tr>
  <td width='3%'><img src='/img/Window-Group.gif'></td>
  <td width='*' class='left_title'>&nbsp;<%= titleName %>&nbsp;Menu Management</td>
</tr>
<tr>
  <td width='100%' height='2' colspan='2'><hr width='100%'></td>
</tr>
<tr>
  <td height='10' colspan='2'></td>
</tr>
</table>

<table width="90%" border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<form name="form1" method="post">
<input type="hidden" name="actionFlag" value="I">
<input type="hidden" name="menuType" value="<%= menuType %>">
<input type="hidden" name="seqNo">
<tr>
  <td width="20%" class="table_header_center">USER GROUP(*)</td>
  <td width="30%" class="table_bg_bright"><select name="userGroup" onchange="fnSetParentMenu(this.form);">
    <%= userGroups %>
    </select></td>
  <td width="20%" class="table_header_center">PARENT MENU(*)</td>
  <td width="30%" class="table_bg_bright"><select name="parentNo">
    <option value='1'>000_HOME</option>
    <%= defaultParentMenus %>
    </select></td>
</tr>
<tr>
  <td class="table_header_center">MENU NAME(*)</td>
  <td colspan="3" class="table_bg_bright"><input type="text" name="menuName" size="90" maxlength="100"></td>
</tr>
<tr>
  <td class="table_header_center">LINK TO URL</td>
  <td colspan="3" class="table_bg_bright"><input type="text" name="menuUrl" size="90" maxlength="200"></td>
</tr>
<tr>
  <td class="table_header_center">SORT ORDER(*)</td>
  <td colspan="3" class="table_bg_bright"><input type="text" name="sortNo" size="20" maxlength="5"></td>
</tr>
</table>

<table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
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
                                  <input type="button" value="DELETE" onclick="fnDelete(this.form);" class="button_default"></td>
        <% } %>                          
</tr>
</table>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
<tr>
  <td width="70%" class="font_blue"><%= legend %></td>
  <td width="*" align="right">TOTAL : <%= iRet2 %>&nbsp;</td>
</tr>
</table>
<table width="99%" border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<tr class="table_header_center">
  <td width="5%">USER GROUP</td>
  <td width="30%">MENU NAME</td>
  <td width="35%">MENU URL</td>
  <td width="25%">PARENT NAME</td>
  <td width="5%">SORT ORDER</td>
</tr>
<%= outS %>
</table>

<table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
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
                                  <input type="button" value="DELETE" onclick="fnDelete(this.form);" class="button_default"></td>
       <% } %>                           
</tr>
</form>
</table>

<%
out.println(CopyRightLogo());
%>
</tr></td></table>
</body>
</html>
