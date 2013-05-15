<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@page import="java.util.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<%@page import="common.util.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
DataProcess dataProcess = null;

String supplier_id = "";
String supplier_name = "";
String buyer_id = "";
String buyer_name = "";
String po_no="";
String invoice_no="";
String style_no="";
String invoice_date="";
String tot_amount ="";
String qty ="";
String price="";
String seqno = "";
String outS = "";
int    iRet = 0;
int    iRet2 = 0;
int    i = 0;
int    rcnt = 0;
String sql = "";
String sql2 ="";
String update1 ="";
String update2 ="";
String file_name="";
String file_name2="";
String day = "";
String gp_status ="";
String gp_date ="";
String color_code ="";
int color_count = 0;

String ag_search_inv_no = request.getParameter("ag_search_inv_no");
String ag_yn = request.getParameter("ag_yn");
String ag_buyer = request.getParameter("ag_buyer");
String ag_year = request.getParameter("ag_year");
String ag_month = request.getParameter("ag_month");
if (ag_search_inv_no == null) ag_search_inv_no = "";
if (ag_buyer == null) ag_buyer = "";
if (ag_yn == null) ag_yn = "All";
if (ag_year == null) ag_year = "";
if (ag_month == null) ag_month = "";
if (ag_month.equals("") || ag_year.equals("")) {
  ag_month = DateUtil.getToday("MM");
  ag_year = DateUtil.getToday("yyyy");
}

//String today =  ag_month + ag_year.substring(2,4) ;
String today =  ag_year+ag_month  ;

//set sql
sql = " select  " +
      "       a.invoice_no, " +
      "       date_format(a.invoice_date,'%Y/%m/%d'), " +
      "       a.buyer_id, " +
      "       a.sup_id, " +
      "       a.file_name, " +
      "       date_format(a.updated,'%Y/%m/%d'), " +
      "       b.name,c.name, " +
      "       a.gp_status, date_format(gp_date,'%Y/%m/%d') " +
      "  from invoice_01t a  LEFT OUTER JOIN login_01t b ON (a.buyer_id = b.id) " +
      "                               LEFT OUTER JOIN login_01t c  ON (a.sup_id = c.id ) " +
      " where a.invoice_no is not null " ;


if ( !(ag_search_inv_no == null || ag_search_inv_no.length() < 1)) {
  sql += " and  upper(a.invoice_no)  like upper('" + ag_search_inv_no + "%')  " ;
} else {
  sql += "  and date_format(a.invoice_date,'%Y%m') = '" + today + "'" ;
}
if (!ag_buyer.equals("")) {
      sql += " and    a.buyer_id = '" + ag_buyer + "' ";
    }
if (!ag_yn.equals("All")) {
      sql += " and    a.gp_status = '" + ag_yn + "' ";
    }    
    
    
sql += " order by a.invoice_no desc ";

// query for buyer list
sql2 = " select id, name from login_01t  where user_type = 'B' order by name ";
//out.println(sql);
//if (true) return;
try {

  matrix = new dbconn.MatrixDataSet();
  matrix2 = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  iRet = dataProcess.RetrieveData(sql, matrix, conn);
   // Buyer list
  iRet2 = dataProcess.RetrieveData(sql2, matrix2, conn);

} catch (Exception e) {
  System.out.println("Exception invoice_search : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

if (iRet > 0 ) {
  for (i=0; i < iRet; i++) {
    invoice_no = matrix.getRowData(i).getData(0);
    invoice_date = matrix.getRowData(i).getData(1);
    buyer_id  = matrix.getRowData(i).getData(2);
    supplier_id  = matrix.getRowData(i).getData(3);
    file_name2  = matrix.getRowData(i).getData(4);
    update1     = matrix.getRowData(i).getData(5);
    buyer_name = matrix.getRowData(i).getData(6);
    supplier_name = matrix.getRowData(i).getData(7);
    gp_status = matrix.getRowData(i).getData(8);
    gp_date = matrix.getRowData(i).getData(9);    
    
    if( color_count > 0 ) {
      color_code = "#EEEEE0";
      color_count = 0;
    }else {
      color_code = "#FFFFF0";
      color_count = 1;
    }

    outS += "<tr bgcolor=" + color_code + ">" +
            "<td align=center > <font size=2>" + (i+1) + "</font></td>" +
            "<td align=center > <font size=2>" + invoice_date + " </font></td>" +
            "<td align=center > <font size=2>" + buyer_id + " </font></td>" +
            "<td align=center > <font size=2>" + buyer_name + " </font></td>" +
            "<td align=center > <font size=2>" + supplier_id + " </font></td>" +
            "<td align=center > <font size=2>" + supplier_name + " </font></td>" +
            "<td align=center > <font size=2> <a href=\"javascript:fnView('" + invoice_no + "', '" + supplier_id + "', '" + buyer_id + "')\">" + invoice_no + "</font></td>" +
	         "<td align=center > <font size=2> <a href=\"javascript:fnDownload('" + file_name2 + "');\">" + file_name2 + "</a></font></td> " +
            "<td align=center > <font size=2>" + update1 + "</font></td>" +
            "<td align=center > <font size=2>" + gp_status + "</font></td>" +
            "<td align=center > <font size=2>" + gp_date + "</font></td>" +
            "</tr>";
  } //end of for
} //end of if

// print buyer list
String BuyerList = "<option value=''>All</option>";

for ( i = 0; i < iRet2; i++) {
  int j = 0;
  String search_buyerid = matrix2.getRowData(i).getData(j++);
  String search_buyername = matrix2.getRowData(i).getData(j++);
  BuyerList += "<option value='"+ search_buyerid + "'" 
                + (ag_buyer.equals(search_buyerid) ? " selected" : "") + ">" 
                + search_buyerid + "-" + search_buyername + "</option>";
}

// create ag_year optiones
String optionYears = "";
int thisYear = Integer.parseInt(DateUtil.getToday("yyyy"));
for (int k = thisYear - 4; k <= thisYear; k++) {
  optionYears += "<option value='" + k + "' " + (ag_year.equals(k + "") ? "selected" : "") +">" + k + "</option>";
}
%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE=JavaScript>
function fnDownload(file) {
  with (document.form2) {
    attachFile.value = file;
    attachRealFile.value = file;
    action = '/common/download.jsp';
    //target = 'hiddenFrm';
    submit();
  }
}

function fnView(inv_no, sup_id,buyer_id) {
  document.frmMain.inv_no.value = inv_no;
  document.frmMain.sup_id.value = sup_id;
    document.frmMain.buyer_id.value = buyer_id;
  document.frmMain.action = './payment_edit_form.jsp';
  document.frmMain.submit();
}
</SCRIPT>
</HEAD>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/title_icon.gif"></td>
  <td width="*" class="left_title">Buyer Payement Management</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<TABLE width=900 border='0' align='center'>
<FORM NAME=frmMain action="admin_payment_list.jsp" METHOD=POST >
<input type='hidden' name='inv_no'>
<input type='hidden' name='sup_id'>
<input type='hidden' name='buyer_id'>
<tr>
  <td height='15'></td>
</tr>
</table>

<TABLE WIDTH=950 border="0" cellspacing="1" cellpadding="2" align="center" class='table_bg'>
<TR>
<TD width='10%' class='table_header_center'>Buyer</TD>
  <TD width='30%' class='table_bg_bright' >
    <SELECT NAME='ag_buyer'>
      <%= BuyerList %>
    </SELECT>    
  </td>	
  <TD width='10%' class='table_header_center'>Invoiced</TD>
  <TD width='5%' class='table_bg_bright' >
    <SELECT NAME='ag_yn'>
     <OPTION <% if(ag_yn.equals("A")) out.print("SELECTED"); %>>All</OPTION>
     <OPTION <% if(ag_yn.equals("Y")) out.print("SELECTED"); %>>Y</OPTION>
     <OPTION <% if(ag_yn.equals("N")) out.print("SELECTED"); %>>N</OPTION>
    </SELECT>    
  </td>	
  <TD width='20%' class='table_header_center'>Issue Date</TD>
  <TD width='20%' class='table_bg_bright'>
  <SELECT NAME=ag_year><%= optionYears %></SELECT>	
  <SELECT NAME=ag_month>
  <OPTION <% if(ag_month.equals("01")) out.print("SELECTED"); %>>01</OPTION>
  <OPTION <% if(ag_month.equals("02")) out.print("SELECTED"); %>>02</OPTION>
  <OPTION <% if(ag_month.equals("03")) out.print("SELECTED"); %>>03</OPTION>
  <OPTION <% if(ag_month.equals("04")) out.print("SELECTED"); %>>04</OPTION>
  <OPTION <% if(ag_month.equals("05")) out.print("SELECTED"); %>>05</OPTION>
  <OPTION <% if(ag_month.equals("06")) out.print("SELECTED"); %>>06</OPTION>
  <OPTION <% if(ag_month.equals("07")) out.print("SELECTED"); %>>07</OPTION>
  <OPTION <% if(ag_month.equals("08")) out.print("SELECTED"); %>>08</OPTION>
  <OPTION <% if(ag_month.equals("09")) out.print("SELECTED"); %>>09</OPTION>
  <OPTION <% if(ag_month.equals("10")) out.print("SELECTED"); %>>10</OPTION>
  <OPTION <% if(ag_month.equals("11")) out.print("SELECTED"); %>>11</OPTION>
  <OPTION <% if(ag_month.equals("12")) out.print("SELECTED"); %>>12</OPTION>
  </SELECT>  
  <TD width='20%' class='table_header_center'>Invoice No.</TD>
  <TD width='20%' class='table_bg_bright'><input type=text name=ag_search_inv_no value='<%= ag_search_inv_no %>'>
  </TD>
  <TD width='20%' class='table_bg_bright_center'>
  <INPUT TYPE=BUTTON VALUE="Search" ONCLICK=submit()>
  </TD>
</TR>
</TABLE>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>
* Click the Invoice number to see the detail from the invoice list below. 
<TABLE width='100%' border=0 cellpadding=0 cellspacing=1 align='center' class='table_bg'>
<tr class='table_header_center'>
<TD width=3%><FONT size=2>No </FONT></TD>
<TD width=3%><FONT size=2>Issue Date </FONT></TD>
<TD width=3%><FONT size=2>B.ID </FONT></TD>
<TD width=15%><FONT size=2>Buyer Name </FONT></TD>
<TD width=3%><FONT size=2>S.ID </FONT></TD>
<TD width=15%><FONT size=2>Suppler Name </FONT></TD>
<TD width=15%><FONT size=2>Invoice No. </FONT></TD>
<TD width=15%><FONT size=2>Invoice File </FONT></TD>
<TD width=3%><FONT size=2>Updated  </FONT></TD>
<TD width=3%><FONT size=2>Invoiced</FONT></TD>
<TD width=5%><FONT size=2>Date Invoiced </FONT></TD>
</tr>
<%=outS%>
</FORM>
<form name='form2' method='post'>
<input type='hidden' name='attachPath' value='<%= _invoiceFileUrl %>'>
<input type='hidden' name='attachFile'>
<input type='hidden' name='attachRealFile'>
</form>
</TABLE>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
</BODY>
</HTML>
