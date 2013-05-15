<%@page import="java.sql.*" %>
<%@page import="dbconn.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";

int iRet = 0;
Connection conn = null;
Connection connVGMain = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
String outS = "";
String sql = "";

String ag_supplier = request.getParameter("ag_supplier");
String ag_supplier_type = request.getParameter("ag_supplier_type");
String ag_month = request.getParameter("ag_month");
String ag_year = request.getParameter("ag_year");
String ag_search_inv_no = request.getParameter("ag_search_inv_no");
String chk_status = request.getParameter("chk_status");
String inv_no = request.getParameter("inv_no");
String sup_id = request.getParameter("sup_id");
String buyer_id = request.getParameter("buyer_id");
//out.println(chk_status);
//out.println(sup_id);
//out.println(buyer_id);

if (ag_supplier == null) ag_supplier = "";
if (ag_supplier_type == null) ag_supplier_type = "";
if (ag_month == null) ag_month = "";
if (ag_year == null) ag_year = "";
if (ag_search_inv_no == null) ag_search_inv_no = "";
if (inv_no == null) inv_no = "";
if (sup_id == null) sup_id = "";

String issue_date = "";
String attached_file = "";
String update_date = "";
int total_qty = 0;
double total_net_price_sum = 0d;
double total_air_price_sum = 0d;
double total_amount = 0d;
boolean isEditable = false;

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  // check whether this invoice can be editable
  int iCnt = 0;
 
  sql = " select  count(b.po_no) "
      + " from    invoice_01t a "
      + "         inner join invoice_02t b "
      + "           on a.invoice_no = b.invoice_no "
      + "           and a.sup_id = b.sup_id "
      + "           and a.buyer_id = b.buyer_id "
      + " where   a.invoice_no = '" + inv_no + "' "
      + " and     a.sup_id = '" + sup_id + "' "
      + " and     a.buyer_id = '" + buyer_id + "' " 
      + " and     b.po_no in ( "
      + "           select  order_no "
      + "           from    purchase_order "
      + "           where   order_status = '90' "
      + "         ) ";

 //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  if (iRet > 0) {
    iCnt = Integer.parseInt(matrix.getRowData(0).getData(0));
    if (iCnt > 0) isEditable = true;
  }

  // read invoice header info
  sql = " select date_format(invoice_date, '%Y/%m/%d'), " +
        "        file_name, " +
        "        date_format(updated, '%Y/%m/%d') " +
        "   from invoice_01t " +
        "  where invoice_no = '" + inv_no + "'" +
        "    and buyer_id = '" + buyer_id   + "'" +        
        "    and sup_id = '" + sup_id   + "'";

  //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  if (iRet > 0) {
    int j = 0;
    issue_date = matrix.getRowData(0).getData(j++);
    attached_file = matrix.getRowData(0).getData(j++);
    update_date = matrix.getRowData(0).getData(j++);
  }

  // read invoice details info
  sql = " select po_no, " +
        "        style_no, " +
        "        qty, " +
        "        price, " +
        "        qty * price,  seq " +
        "   from invoice_02t " +
        "  where upper(invoice_no) = upper('" + inv_no + "') "  +
        "    and buyer_id = '" + buyer_id   + "'" +   
        "    and sup_id = '" + sup_id   + "'"  +
        "  order by po_no ";

  //out.println(sql); 
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  
} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception invoice_edit_form : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

for (int i = 0; i < iRet; i++) {
  int j = 0;
  String po_no = matrix.getRowData(i).getData(j++);
  String style_no = matrix.getRowData(i).getData(j++);
  int qty = Integer.parseInt(matrix.getRowData(i).getData(j++));
  double unit_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  double total_price = Double.parseDouble(matrix.getRowData(i).getData(j++));
  String seqno = matrix.getRowData(i).getData(j++);
  //double net_price = unit_price - disc_price;
  //double net_price_sum = qty*net_price;
  //double air_price_sum = qty*air_price;
  //double amount = (net_price_sum + air_price_sum)*1.1;

  total_qty += qty;
  //total_net_price_sum += net_price_sum;
  //total_air_price_sum += air_price_sum;
  total_amount += total_price;

  outS += "<tr align='right' bgcolor='" + (i%2 == 0 ? "#FFFFF0" : "#EEEEE0") + "'>" +
          "<td align='center'>" +
            (isEditable && _adminid != null ? "<input type='checkbox' name='po_no' value='" + po_no + "'>" : "") + "</td>" +
          "<td align='center'>" + seqno + "</td>" +
          "<td align='center'>" + po_no + "</td>" +
          "<td align='center'>" + style_no + "</td>" +
          "<td>" + StringUtil.formatNumber(qty, QTY_FORMAT) + "</td>" +
          "<td>$" + StringUtil.formatNumber(unit_price, MONEY_FORMAT) + "</td>" +
          "<td>$" + StringUtil.formatNumber(total_price, MONEY_FORMAT) + "</td>" +
          "</tr>" ;
}
%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE=JavaScript>

function fnSendInv(frm)
{
  if (confirm('해당 Invoice번호로 해당Buyer에게 대금청구 처리를 하시겠습니다?')) {
    frm.target = self.name;
    frm.action = './invoice_edit_save.jsp';
    frm.actionFlag.value = 'SD';
    frm.submit();
  }
}

function fnAddPOs(frm) {
  var winAddPOs = window.open("","winAddPOs", "toolbar=no,menubar=no,resizable=no,scrollbars=yes,width=950,height=700");

  if (winAddPOs) {
    frm.target = winAddPOs.name;
    frm.actionFlag.value = 'AP';
    frm.action = './invoice_confirm_search.jsp';
    frm.submit();
    winAddPOs.focus();
  }
}

function fnDeletePOs(frm) {
  if (frm.po_no) {
    var isSelected = false;

    if (frm.po_no.length) {
      for (var i = 0; i < frm.po_no.length; i++) {
        if (frm.po_no[i].checked) {
          isSelected = frm.po_no[i].checked;
          break;
        }
      }
    } else {
      isSelected = frm.po_no.checked;
    }

    if (!isSelected) {
      alert('Select POs you want to delete.');
      return;
    }

    if (confirm('등록된 Invoice에서 선택한  PO를 삭제하시겠습니끼?')) {
      frm.target = self.name;
      frm.actionFlag.value = 'DP';
      frm.action = './invoice_edit_save.jsp';
      frm.submit();
    }
  }
}

function fnUpdate(frm)
{
  if (!frm.new_invoice_file.value) {
    alert('Input new invoice file name.');
    //frm.new_invoice_file.focus();
    return;
  }

  var idx;
  var fName = frm.new_invoice_file.value;

  idx = fName.lastIndexOf("\\");
  if (idx < 0) idx = fName.lastIndexOf("/");
  
  fName = fName.substr(idx+1);
  idx = fName.lastIndexOf(".");
  if (idx >= 0) fName = fName.substring(0, idx);

  if (frm.inv_no.value.toUpperCase() != fName.toUpperCase() ) {
    alert('새로 변경할 Invoice화일이름('+fName+')이 Invoice번호( '+frm.inv_no.value+' )와 다릅니다. 화일이름과 Invoice번호가 같아야 합니다.\nNew Invoice File이름을 체크하세요!');
    return;
  }
  
  if (confirm('새로운 Invoice화일로 변경하시겠습니까?')) {
    frm.target = self.name;
    frm.action = './invoice_edit_update.jsp';
    frm.submit();
  }
}

function fnDelete(frm)
{
  if (confirm('해당 Invoice번호를 전체를  삭제 하시겠습니까?')) {
    frm.target = self.name;
    frm.action = './invoice_edit_save.jsp';
    frm.actionFlag.value = 'D';
    frm.submit();
  }
}

function fnDelete(frm)
{
  if (confirm('해당 Invoice번호를 전체를  삭제 하시겠습니까?')) {
    frm.target = self.name;
    frm.action = './invoice_edit_save.jsp';
    frm.actionFlag.value = 'D';
    frm.submit();
  }
}

function fnSelect(frm) {
  if (frm.po_no) {
    if (frm.po_no.length) {
      for (var i = 0; i < frm.po_no.length; i++) {
        frm.po_no[i].checked = frm.tmpCheck.checked;
      }
    } else {
      frm.po_no.checked = frm.tmpCheck.checked;
    }
  }
}

function fnList(frm) {
  frm.target = self.name;
  frm.action = './<%= _adminid != null ? "invoice_search" : "invoice_search" %>.jsp';
  frm.submit();
}

function fnDownload(file) {
  with (document.form2) {
    attachFile.value = file;
    attachRealFile.value = file;
    action = '/common/download.jsp';
    target = 'hiddenFrm';
    submit();
  }
}
</SCRIPT>
</HEAD>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="840" border="0" cellspacing="0" cellpadding="0">
<tr><td>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/title_icon.gif"></td>
  <td width="*" class="left_title">Invoice Details</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%"><b>Invoice Header</b></td>
</tr>
</table>
<TABLE WIDTH='95%' border="0" cellspacing="1" cellpadding="0" align="center" class="table_bg">
<FORM NAME='frmMain' METHOD='POST' enctype="multipart/form-data">
<input type='hidden' name='ag_buyer' value='<%= buyer_id %>'>
<input type='hidden' name='ag_supplier' value='<%= sup_id %>'>
<input type='hidden' name='ag_supplier_type' value='<%= ag_supplier_type %>'>
<input type='hidden' name='ag_month' value='<%= ag_month %>'>
<input type='hidden' name='ag_year' value='<%= ag_year %>'>
<input type='hidden' name='ag_search_inv_no' value='<%= ag_search_inv_no %>'>
<input type='hidden' name='inv_no' value='<%= inv_no %>'>
<input type='hidden' name='sup_id' value='<%= sup_id %>'>
<input type='hidden' name='buyer_id' value='<%= buyer_id %>'>
<input type='hidden' name='chk_status' value='<%= chk_status %>'>

<TR>
  <TD width='150' class='table_header_center'>Invoice번호</TD>
  <TD width='*' class='table_bg_bright'><%= inv_no %></TD>
  <TD width='100' class='table_header_center'>Issue Date</TD>
  <TD width='100' class='table_bg_bright'><%= issue_date %></TD>
</TR>
<TR>
  <TD class='table_header_center'>저장된 Invoice File</TD>
  <TD class='table_bg_bright'><a href="javascript:fnDownload('<%= attached_file %>');"><%= attached_file %></a></TD>
  <TD class='table_header_center'>Updated</TD>
  <TD class='table_bg_bright'><%= update_date %></TD>
</TR>
<%
if (chk_status.equals("N") ) {
%>
<TR>
  <TD class='table_header_center'>변경할 New Invoice File</TD>
  <TD class='table_bg_bright' colspan='3'><input type='file' name='new_invoice_file' size='60' maxlength='200'></TD>
</TR>
<%
}
%>
</FORM>
</TABLE>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>
<%
if (chk_status.equals("N") ) {
%>
  ** 저장된 Invoice 화일을 다시 변경하려면 변경할 Invoice화일을 찾아서 선택후 ' Invoice File변경' 버튼을 누르세요.
 <%
} else {
%> 	
    <font color=red size=2 > * 선택하신 자료는 이미 Invoice 청구신청이 되어 수정이 불가능 합니다. <font>
<%
}
%>
<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%"><b>Invoice Detail List</b></td>
</tr>
</table>
<TABLE width='95%' border=0 CELLPADDING=0 CELLSPACING=1 align=center class="table_bg">
<form name='form1' method='post'>
<input type='hidden' name='ag_supplier' value='<%= sup_id %>'>
<input type='hidden' name='ag_buyer' value='<%= buyer_id %>'>
<input type='hidden' name='ag_supplier_type' value='<%= ag_supplier_type %>'>
<input type='hidden' name='ag_month' value='<%= ag_month %>'>
<input type='hidden' name='ag_year' value='<%= ag_year %>'>
<input type='hidden' name='ag_search_inv_no' value='<%= ag_search_inv_no %>'>
<input type='hidden' name='inv_no' value='<%= inv_no %>'>
<input type='hidden' name='sup_id' value='<%= sup_id %>'>
<input type='hidden' name='chk_status' value='<%= chk_status %>'>
<input type='hidden' name='buyer_id' value='<%= buyer_id %>'>
<input type='hidden' name='actionFlag'>
<TR class='table_header_center'>
  <TD><input type='checkbox' name='tmpCheck' onclick='fnSelect(this.form);'></TD>
  <TD>Seq.</TD>
  <TD>PO No.</TD>
  <TD>Style No.</TD>
  <TD>Qty</TD>
  <TD>Unit Price</TD>
  <TD>Amount </TD>
</TR>
<%= outS %>
<tr class='table_header_center'>
  <td colspan='4'>Total</td>
  <td align='right'><%= StringUtil.formatNumber(total_qty, QTY_FORMAT) %></td>
  <TD>&nbsp;</TD>
  <td align='right'>$<%= StringUtil.formatNumber(total_amount, MONEY_FORMAT) %></td>
</tr>
</TABLE>

<table border="0" cellspacing="0" cellpadding="0" align='center'>
<tr>
  <td width="100%" height="10"></td>
</tr>
<tr>
  <td width="100%">
<%
if (chk_status.equals("N") ) {
%>
    <input type='button' value=' Buyer에 대금청구' onclick='fnSendInv(this.form);'>
    <input type='button' value=' Invoice에 PO추가 ' onclick='fnAddPOs(this.form);'>
    <input type='button' value=' Invoice에서 PO삭제 ' onclick='fnDeletePOs(this.form);'>
    <input type='button' value=' Invoice File변경 ' onclick='fnUpdate(document.frmMain);'>
    <!--input type='button' value='Delete Invoice' onclick='fnDelete(this.form);'-->
<%
}

if (chk_status.equals("N") ) {
%>
     <br>
    <input type='button' value=' Invoice전체 삭제 ' onclick='fnDelete(this.form);'>삭제 비밀번호
    <input type='password' name='passwd' size='10' maxlength='6'>
<%
}
%>
    <input type='button' value='Go To List' onclick='fnList(this.form);'>
  </td>
</tr>
<tr>
  <td width="100%" height="10"></td>
</tr>
</form>
<form name='form2' method='post'>
<input type='hidden' name='attachPath' value='<%= _invoiceFileUrl %>'>
<input type='hidden' name='attachFile'>
<input type='hidden' name='attachRealFile'>
</form>
</table>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
<iframe name='hiddenFrm' src='' width='0' height='0' frameborder='0'></iframe>
</BODY>
</HTML>
