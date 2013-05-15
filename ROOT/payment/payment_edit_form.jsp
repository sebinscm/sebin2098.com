<%@page import="java.sql.*" %>
<%@page import="java.net.*" %>
<%@page import="java.text.*" %>
<%@page import="dbconn.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/common/calendar/calendar.htm" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";
String today = DateUtil.getToday("yyyy/MM/dd");
int iRet = 0;
int iRet2 = 0;
Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
DataProcess dataProcess = null;
String outS = "";
String sql = "";
String outS2 = "";
String sql2 = "";

String ag_supplier = request.getParameter("ag_supplier");
String ag_supplier_type = request.getParameter("ag_supplier_type");
String ag_month = request.getParameter("ag_month");
String ag_year = request.getParameter("ag_year");
String ag_search_inv_no = request.getParameter("ag_search_inv_no");
String inv_no = request.getParameter("inv_no");
String sup_id = request.getParameter("sup_id");
String buyer_id = request.getParameter("buyer_id");
//out.println(inv_no);
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
String invoice_status="";
int total_qty = 0;
String closed_msg="";
double total_net_price_sum = 0d;
double total_air_price_sum = 0d;
double total_amount = 0d;

double total_paid_sum = 0d;
double total_claim_sum = 0d;
double total_balance_sum = 0d;

boolean isEditable = false;

try {

  matrix = new dbconn.MatrixDataSet();
  matrix2 = new dbconn.MatrixDataSet();
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
  }

  // read invoice header info
  sql = " select date_format(invoice_date, '%Y/%m/%d'), " +
        "        file_name, " +
        "        date_format(updated, '%Y/%m/%d'), status " +
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
    invoice_status = matrix.getRowData(0).getData(j++);
  }
  // check invoice status is closed
  if (invoice_status.equals("C") ) {
      closed_msg = " 해당  Invoice번호의 Payment가 완료되어 수정할 수 없습니다!";
  } else {
      isEditable = true;
  }   
  
  // read invoice details info
  sql = " select po_no, " +
        "        style_no, " +
        "        qty, " +
        "        price, " +
        "        qty * price, seq " +
        "   from invoice_02t " +
        "  where invoice_no = '" + inv_no + "'"  +
        "    and buyer_id = '" + buyer_id   + "'" +   
        "    and sup_id = '" + sup_id   + "'"  +
        "  order by po_no asc ";

  //out.println(sql); if (true) return;
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  
  sql2 = " select  SEQ_NO,INVOICE_NO,    "
						+" date_format(pay_date, '%Y/%m/%d'),      "
						+" PAY_AMT,       "
						+" PAY_COMMENT,   "
						+" CLOSE_YN,      "
						+" CLAIM_AMOUNT,  "
						+" CLAIM_COMMENT, "
						+" date_format(claim_date, '%Y/%m/%d'),    "
						+" date_format(updated, '%Y/%m/%d'),       "
						+" UPDATED_ID     "
			+ " from payment_01t       "			
			+ " where invoice_no = '" + inv_no + "'" 
	       + "          and buyer = '" + buyer_id   + "'" 
	       + "          and supplier = '" + sup_id   + "'"  
	       + "          order by pay_date "; 
   iRet2 = dataProcess.RetrieveData(sql2, matrix2, conn);
   //out.println(sql2);


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

  total_qty += qty;
  total_amount += total_price;

  outS += "<tr align='right' bgcolor='" + (i%2 == 0 ? "#FFFFF0" : "#EEEEE0") + "'>" +
          "<td align='center'>" + seqno + "</td>" +
          "<td align='center'>" + po_no + "</td>" +
          "<td align='center'>" + style_no + "</td>" +
          "<td>" + StringUtil.formatNumber(qty, QTY_FORMAT) + "</td>" +
          "<td>$" + StringUtil.formatNumber(unit_price, MONEY_FORMAT) + "</td>" +
          "<td>$" + StringUtil.formatNumber(total_price, MONEY_FORMAT) + "</td>" +
          "</tr>" ;
}

for (int i = 0; i < iRet2; i++) {
  int j = 0;
  String seq_no = matrix2.getRowData(i).getData(j++);
  String invoice_no = matrix2.getRowData(i).getData(j++);
  String pay_date = matrix2.getRowData(i).getData(j++);
  double pay_amt = Double.parseDouble(matrix2.getRowData(i).getData(j++));
  String pay_comment = matrix2.getRowData(i).getData(j++);
  String close_yn = matrix2.getRowData(i).getData(j++);
  double claim_amt = Double.parseDouble(matrix2.getRowData(i).getData(j++));
  String claim_comment = matrix2.getRowData(i).getData(j++);
  String claim_date = matrix2.getRowData(i).getData(j++);
  String updated = matrix2.getRowData(i).getData(j++);
  String updated_id = matrix2.getRowData(i).getData(j++);

  total_paid_sum += pay_amt;
  total_claim_sum += claim_amt; 

  outS2 += "<tr align='right' bgcolor='" + (i%2 == 0 ? "#FFFFF0" : "#EEEEE0") + "'>" +
                "<td align='center'>" ;
   if (isEditable && _adminid != null) {   
             outS2 += " <input type='button' value='삭제' onclick='fnDelete(this.form);'>"  +
                           "<input type='checkbox' name='seq_no' value='" + seq_no + "' ></td>" ;
    } else {
            outS2 += "&nbsp; </td>";
    }	                       
    outS2 += "<td align='center'>" + invoice_no + "</td>" +   
		          "<td>$" + StringUtil.formatNumber(pay_amt, MONEY_FORMAT) + "</td>" +
		          "<td align='center'>" + pay_date + "</td>" +
		           "<td align='center'>" + pay_comment + "</td>" +
		           "<td>$" + StringUtil.formatNumber(claim_amt, MONEY_FORMAT) + "</td>" +
		          "<td align='center'>" + claim_date + "</td>" +
		          "<td align='center'>" + claim_comment + "</td>" +
		          "<td align='center'>" + close_yn + "</td>" +
		          "<td align='center'>" + updated + "</td>" +
		          "<td align='center'>" + updated_id + "</td>" +
		          "</tr>" ;
}
   total_balance_sum = (total_amount -total_paid_sum+total_claim_sum);
   outS2 +=  "<tr align='right' bgcolor='#F6CECE'><td align='center'>&nbsp;</td><td align='center'>입금계</td>" +
                  "<td>$" + StringUtil.formatNumber( total_paid_sum, MONEY_FORMAT) + "</td>" +
                  "<td align='center'>&nbsp;</td>" +
                 "<td align='center'>Claim계</td>" +
                 "<td>$" + StringUtil.formatNumber( total_claim_sum, MONEY_FORMAT) + "</td>" +                 
                  "<td align='center'>잔금계</td>" +
                 "<td align='center'>$" + StringUtil.formatNumber(total_balance_sum, MONEY_FORMAT) +"</td>" +
                 "<td colspan='3'>&nbsp;</td>" +
                 "</tr>";
%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<script language="javaScript" src="/common/js/validate2.js"></script>
<SCRIPT LANGUAGE=JavaScript>

function fnSendInv(frm)
{
  if (confirm('해당 Invoice번호로 해당Buyer에게 대금청구를 하시겠습니다?')) {
    frm.target = self.name;
    frm.action = './invoice_edit_save.jsp';
    frm.actionFlag.value = 'SD';
    frm.submit();
  }
}

function fnAdd(frm) {
	if (confirm('Payment에 대한 입금을 추가하시겠습니까?')) {
		if (!frm.pay_amt.value) {
			   if (!frm.pay_date.value) {
			    alert('금액을 입력하세요!');			    
			    return;
		  }
	    }
	  if (!frm.pay_date.value) {
	  	    if (!frm.pay_date.value) {
		    alert('일자를 입력하세요!');		  
		    return;
		  }
	  }  
	  if ( frm.close_yn.value = 'Y' ) {
	      if (! confirm('Payment마감을 선택하셨습니다.마감이 되면 수정이 불가능합니다. 마감을 하시겠습니까?')) {
	          return;	
	      }
	  }
	  frm.actionFlag.value = 'ADD';
	  frm.action = './admin_payment_update.jsp';
	  frm.submit();
   } 
}

function fnDelete(frm) {
  if (frm.seq_no) {
    var isSelected = false;

    if (frm.seq_no.length) {
      for (var i = 0; i < frm.seq_no.length; i++) {
        if (frm.seq_no[i].checked) {
          isSelected = frm.seq_no[i].checked;
          break;
        }
      }
    } else {
      isSelected = frm.seq_no.checked;
    }

    if (!isSelected) {
      alert('삭제할 레코드를 선택하세요!');
      return;
    }

    if (confirm('Payment리스트에서 선택한 레코드를 삭제 하시겠습니끼?')) {
      frm.target = self.name;
      frm.actionFlag.value = 'DEL';
      frm.action = './admin_payment_update.jsp';
      frm.submit();
    }
  }
}


function fnSelect(frm) {
  if (frm.seq_no) {
    if (frm.seq_no.length) {
      for (var i = 0; i < frm.seq_no.length; i++) {
        frm.seq_no[i].checked = frm.tmpCheck.checked;
      }
    } else {
      frm.seq_no.checked = frm.tmpCheck.checked;
    }
  }
}

function fnList(frm) {
  frm.target = self.name;
  frm.action = './<%= _adminid != null ? "admin_payment_list" : "admin_payment_list" %>.jsp';
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
<table width="850" border="0" cellspacing="0" cellpadding="0">
<tr><td>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/title_icon.gif"></td>
  <td width="*" class="left_title"> Payment처리</td>
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
  <td width="100%">Invoice Header</td>
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
</FORM>
</TABLE>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>
<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%">Invoice Detail List</td>
</tr>
</table>
<TABLE width='95%' border=0 CELLPADDING=0 CELLSPACING=1 align=center class="table_bg">
<TR class='table_header_center'>
  <TD>Seq.</TD>
  <TD>PO No.</TD>
  <TD>Style No.</TD>
  <TD>Qty</TD>
  <TD>Unit Price</TD>
  <TD>Amount </TD>
</TR>
<%= outS %>
<tr class='table_header_center'>
  <td colspan='3'>Total</td>
  <td align='right'><%= StringUtil.formatNumber(total_qty, QTY_FORMAT) %></td>
  <TD>&nbsp;</TD>
  <td align='right'>$<%= StringUtil.formatNumber(total_amount, MONEY_FORMAT) %></td>
</tr>
<form name='form2' method='post'>
<input type='hidden' name='attachPath' value='<%= _invoiceFileUrl %>'>
<input type='hidden' name='attachFile'>
<input type='hidden' name='attachRealFile'>
</form>
</TABLE>
<tr><td>
</TABLE>	
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>[ Buyer대금결재 입력처리 ]</b> <font color=red> <%= closed_msg%></font><br>
&nbsp;&nbsp;&nbsp;&nbsp;    ** Payment내역을 일자별로 입력하세요. 일시불 입금처리 혹은 분활로 여러번 입금처리가 가능합니다.
<TABLE width='100%' border=0 CELLPADDING=0 CELLSPACING=1 align=center class="table_bg">
<form name='form1' method='post'>
<input type='hidden' name='ag_supplier' value='<%= sup_id %>'>
<input type='hidden' name='ag_buyer' value='<%= buyer_id %>'>
<input type='hidden' name='ag_supplier_type' value='<%= ag_supplier_type %>'>
<input type='hidden' name='ag_month' value='<%= ag_month %>'>
<input type='hidden' name='ag_year' value='<%= ag_year %>'>
<input type='hidden' name='ag_search_inv_no' value='<%= ag_search_inv_no %>'>
<input type='hidden' name='inv_no' value='<%= inv_no %>'>
<input type='hidden' name='sup_id' value='<%= sup_id %>'>
<input type='hidden' name='buyer_id' value='<%= buyer_id %>'>
<input type='hidden' name='actionFlag'>	
<TR class='table_header_center'>
  <TD><input type='checkbox' name='tmpCheck' onclick='fnSelect(this.form);'></TD>
  <TD>Invoice번호</TD>
  <TD>입금금액</TD>
  <TD>입급일자</TD>
  <TD>비고</TD>
  <TD>Claim금액</TD>
  <TD>Claim일자</TD>
  <TD>비고</TD>
  <TD>마감여부</TD>
  <TD>입력일자</TD>
  <TD>입력자</TD>
</TR>
<%
 if (!invoice_status.equals("C") ) {
%>
<tr align='right' bgcolor="#FFFFF0" >
    <td align='center'><input type='button' value='추가' onclick='fnAdd(this.form);'></td><td align='center'><%=inv_no%></td>
    <td><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='pay_amt' size='10' maxlength='10' class='input_text_right'></td>
    <td align='center'><input type='text' name='pay_date'  size='15' readonly class='input_text'>
    <img src="/img/calendar.gif" style="cursor:hand" align="absmiddle" onclick="javascript:popFrame.fPopCalendar(this, document.form1.pay_date, document.all['popCal'], 'RIGHT', event);"></td>
    <td><input type='text' name='pay_comment'  size='20'  class='input_text'></td>
    <td><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='claim_amt' size='10' maxlength='10' class='input_text_right'></td>
    <td align='center'><input type='text' name='claim_date' size='15' readonly class='input_text'>
    <img src="/img/calendar.gif" style="cursor:hand" align="absmiddle" onclick="javascript:popFrame.fPopCalendar(this, document.form1.claim_date, document.all['popCal'], 'RIGHT', event);"></td>
    <td align=center ><input type='text' name='claim_comment'  size='30'  class='input_text'></td>
    <td align='center'><SELECT NAME=close_yn>
      <OPTION VALUE="Y" >YES</OPTION>
      <OPTION VALUE="N" selected >NO</OPTION>
      </SELECT></td></td>
    <td align='center'><%= today %></td>
    <td align='center'><%=_adminid%></td>
</tr>
<%
}
%>
<%= outS2 %>	
 <tr>
  <td  align=center colspan='10'>   
    <input type='button' value='Go To List' onclick='fnList(this.form);'>
  </td>
</tr>
</form>
</table>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
<iframe name='hiddenFrm' src='' width='0' height='0' frameborder='0'></iframe>
</BODY>
</HTML>
