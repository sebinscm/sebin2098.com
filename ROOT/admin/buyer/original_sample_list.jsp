<%@page import="java.io.*" %>
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
<%@ include file="/common/calendar/calendar.htm" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String imgUrl = "<font color=red>Image<br>Not Ready</font>";
Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix1 = null;
MatrixDataSet matrix2 = null;
MatrixDataSet matrix3 = null;
MatrixDataSet matrix4 = null;
MatrixDataSet matrix5 = null;
MatrixDataSet matrix6 = null;
DataProcess dataProcess = null;

String sequenceNo     = "";
String sampleNo      = "";
String item_class    = "";

String inputDate       = "";
String item_group_name      = "";

String qty            = "";
String season          = "";
String buyer           = "";
String buyer_id           = "";
String supplier          = "";

String sendingDate    = "";
String returnDate     = "";
String remarks         = "";
String styleNo         = "";
String order_status    = "";  
String status_name    = "";   
String remarks2        = "";
String buyer_name     = "";   

String seqno = "";
String outS = "";
int    iRet = 0;
int iRet2 = 0;
int iRet3 = 0;
int iRet4 = 0;
int iRet5 = 0;
int iRet6 = 0;
int    rcnt = 0;
String sql2 = "";
String sql3 = "";
String sql4 = "";
String sql5 = "";
String sql6 = "";
String cntSql = "";
String mainSql = "";
String conditionSql = "";
String file_name1="";
String file_name2="";
String file_name3="";

String day = "";
String color_code ="";
int color_count = 0;

String fromUrl = "/admin/buyer/original_sample_list.jsp";
String searchItemClass = request.getParameter("searchItemClass");
String searchFromDate = request.getParameter("searchFromDate");
String searchToDate = request.getParameter("searchToDate");
String searchSupplier = request.getParameter("searchSupplier");
String searchItemGroup = request.getParameter("searchItemGroup");
String searchBuyer = request.getParameter("searchBuyer");
String searchSampleNo = request.getParameter("searchSampleNo");
String searchStyleNo = request.getParameter("searchStyleNo");
String searchStatus = request.getParameter("statusOptions");
String _InOutInputDate = (String) session.getAttribute("_InOutInputDate");
String _InOutItemGroup = (String) session.getAttribute("_InOutItemGroup");

//if (_InOutSgr == null) _InOutSgr = "";
if (_InOutInputDate == null) _InOutInputDate = "";
if (_InOutItemGroup == null) _InOutItemGroup = "";
if (searchStatus == null) searchStatus = "";
if (searchItemClass == null) searchItemClass = "";
if (searchFromDate == null || searchToDate == null) {
  searchFromDate = DateUtil.getRelativeDateString(new java.util.Date(), 0, 0, -30, "yyyy/MM/dd");
  searchToDate = DateUtil.getToday("yyyy/MM/dd");
}
if (searchSupplier == null) searchSupplier = "";
if (searchItemGroup == null) searchItemGroup = "";
//if (searchBuyer == null) searchBuyer = (_admingroup.equals("B") ? _adminname.toUpperCase() : "");
if (searchBuyer == null) searchBuyer = "";
if (searchSampleNo == null) { 
    searchSampleNo = "";
} else {
	searchSampleNo = searchSampleNo.trim();
}	    
if (searchStyleNo == null) { 
    searchStyleNo = "";
} else {
	searchStyleNo = searchStyleNo.trim();
}	   

//set sql
mainSql = " select  a.sequence_no, a.sample_no, a.item_class, date_format(a.input_date, '%Y/%m/%d'), "
        + "         a.item_group, a.qty, a.season, upper(a.buyer), a.supplier,  "
        + "          date_format(a.sending_date, '%Y/%m/%d'),  date_format(a.return_date, '%Y/%m/%d'),"
        + "         ifnull(a.remarks,' '), a.style_no, a.status, b.code_name, ifnull(a.comments,' '), c.name,a.afile1_name,a.afile2_name,a.afile3_name "
        + " from    VG_SAMPLE_IN_OUT a LEFT OUTER JOIN VG_COMMON_CODE b  ON (a.status=b.code and b.type='ORDER_STATUS')  " 
        + "                                              LEFT OUTER JOIN login_01t c ON ( a.buyer = c.id )  "
        + "         where a.sequence_no > 0  ";     

if (searchStyleNo.equals("")) {
	if (searchSampleNo.equals("")) {
			  conditionSql = " and a.input_date between str_to_date('" + searchFromDate + "', '%Y/%m/%d')  "
			               + "         and  str_to_date('" + searchToDate + "', '%Y/%m/%d') ";
			
			  if (!searchSupplier.equals("")) {
			    conditionSql += " and    a.supplier = '" + searchSupplier + "' ";
			  }
			  
			  if (!searchItemGroup.equals("")) {
			    conditionSql += " and    a.item_group = '" + searchItemGroup + "' ";
			  }
			
			  if (!searchBuyer.equals("")) {
			    conditionSql += " and    upper(a.buyer) = '" + searchBuyer + "' ";
			  }
	} else {  
	  conditionSql = " and a.sample_no like upper('%" + searchSampleNo+ "%')";
	}
} else {
	 conditionSql = "  and a.style_no like upper('%" + searchStyleNo+ "%')";
}	
if (!searchItemClass.equals("")) {
  conditionSql += " and    a.item_class = " + searchItemClass;
}
 if (!searchStatus.equals("")) {
      conditionSql  += " and   status = '" + searchStatus + "' ";
  
  } 

conditionSql += " order by str_to_date(a.input_date, '%Y/%m/%d') desc, a.sample_no desc ";

//out.println(mainSql+ conditionSql);
//if (true) return;
sql2 = " select  code, code_name "
     + " from   vg_common_code "
     + " where  type = 'PGR' "
     + " and     use_yn ='Y' " 
     + " order by code ";


// ORDER STATUS
 sql3 = " select code,code_name  from vg_common_code " +
                   " where type='ORDER_STATUS' and use_yn='Y'  and code between '00' and '30' order by sort_order ";
// set SGR
sql4 = " select  code, code_name "
     + " from   vg_common_code "
     + " where  type = 'SGR' "
     + " and     use_yn ='Y' " 
     + " order by code ";
// Buyer
sql5 = "  select  id,upper(name) "
     + "  from   login_01t "
     + "  where   user_type = 'B' "
     + "  order by name ";
//Supplier
sql6 = "  select  id, name "
     + "  from    login_01t "
     + "  where   user_type = 'S' "
     + "  order by name ";

try {

  matrix = new MatrixDataSet();
  matrix1 = new MatrixDataSet();
  matrix2 = new MatrixDataSet();
  matrix3 = new MatrixDataSet();
  matrix4 = new MatrixDataSet();
  matrix5 = new MatrixDataSet();
  matrix6 = new MatrixDataSet();
  dataProcess = new DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  iRet = dataProcess.RetrieveData( mainSql+ conditionSql, matrix, conn);
  // read item class
  iRet2 = dataProcess.RetrieveData(sql2, matrix2, conn);

  // read STATUS
  iRet3 = dataProcess.RetrieveData(sql3, matrix3, conn);

  // read item_group
  iRet4 = dataProcess.RetrieveData(sql4, matrix4, conn);

  // read buyer
  iRet5 = dataProcess.RetrieveData(sql5, matrix5, conn);
  
  // read supplier
  iRet6 = dataProcess.RetrieveData(sql6, matrix6, conn);

} catch (Exception e) {
  System.out.println("Exception invoice_search : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
}

if (iRet > 0 ) {
  for (int i=0; i < iRet; i++) {
     int j = 0;      
   sequenceNo     = matrix.getRowData(i).getData(j++);
   sampleNo       = matrix.getRowData(i).getData(j++);    
   item_class     = matrix.getRowData(i).getData(j++);
   inputDate      = matrix.getRowData(i).getData(j++);
   item_group_name     = matrix.getRowData(i).getData(j++);
   qty            = matrix.getRowData(i).getData(j++);
   season          = matrix.getRowData(i).getData(j++);
   buyer          = matrix.getRowData(i).getData(j++);
   supplier       = matrix.getRowData(i).getData(j++);
   sendingDate    = matrix.getRowData(i).getData(j++);
   returnDate     = matrix.getRowData(i).getData(j++);
   remarks        = matrix.getRowData(i).getData(j++);
   styleNo        = matrix.getRowData(i).getData(j++);
   order_status        = matrix.getRowData(i).getData(j++);
   status_name        = matrix.getRowData(i).getData(j++);
   remarks2        = matrix.getRowData(i).getData(j++);
   buyer_name        = matrix.getRowData(i).getData(j++);
   file_name1        = matrix.getRowData(i).getData(j++);
   file_name2       = matrix.getRowData(i).getData(j++);
   file_name3        = matrix.getRowData(i).getData(j++);
    
    File imgFile = new File(application.getRealPath(_sampleImageUrl) + File.separator + sampleNo.toLowerCase()  + ".jpg");
	if (imgFile.exists()) {
	  imgUrl = "<img src='" + _sampleImageUrl + "/" + sampleNo.toLowerCase() + ".jpg' width='50' height='70'>";
	} else {
		  imgUrl = "<img src='" + _sampleImageUrl + "/noimage.jpg' width='50' height='70'>";
	}	
    
    if( color_count > 0 ) {
      color_code = "#EEEEE0";
      color_count = 0;
    }else {
      color_code = "#FFFFF0";
      color_count = 1;
    }

    outS += "<tr bgcolor=" + color_code + ">" +
            " <td>" + imgUrl + "</td>" +
            "<td align=center > <font size=2><a href=\"javascript:fnView('" + sampleNo + "','" + buyer + "', '" + sequenceNo + "')\">" + sampleNo + "</font></td>" +
            "<td align=center > <font size=2>" +  item_group_name   + " </font></td>" +         
            "<td align=center > <font size=2>" +  season  + " </font></td>" +   
            "<td align=center > <font size=2>" + inputDate + " </font></td>" +
            "<td align=center > <font size=2>" + buyer + " </font></td>" +
            "<td align=center > <font size=2>" + buyer_name + " </font></td>" +
            "<td align=center > <font size=2><a href=\"javascript:fnDownload('" + file_name1 + "');\">" + file_name1 + "</a></font></td> " +
            "<td align=center > <font size=2><a href=\"javascript:fnDownload('" + file_name2 + "');\">" + file_name2 + "</a></font></td> " +
 	         "<td align=center > <font size=2><a href=\"javascript:fnDownload('" + file_name3 + "');\">" + file_name3 + "</a></font></td> " +
            "<td align=center > <font size=2>" + sendingDate + "</font></td>" +
            "<td align=center > <font size=2>" + status_name  + "</font></td>" +
            "<td align=center > <font size=2>" + styleNo + "</font></td>" +
            "</tr>";
  } //end of for
} //end of if

// print out dropdown list
// print PGR
String itemClassOptions = "";
String searchItemClassOptions = "";

//if (adminClass.equals("")) {
  itemClassOptions = "<option></option>";
  searchItemClassOptions = "<option value=''" + (searchItemClass.equals("") ? " selected" : "") + ">All</option>";
//}

for (int i = 0; i < iRet2; i++) {
  int j = 0;
  String itemClass    = matrix2.getRowData(i).getData(j++);
  String itemClassNm  = matrix2.getRowData(i).getData(j++);

  itemClassOptions += "<option value='" + itemClass + "'>" + itemClass + "-" + itemClassNm + "</option>";
  searchItemClassOptions += "<option value='" + itemClass + "'"
              + (searchItemClass.equals(itemClass) ? " selected" : "") + ">" + itemClass + "-" + itemClassNm + "</option>";
}

// order status list
String statusOptions = "<option></option>";
String searchstatusOptions = "<option value=''" + (searchStatus.equals("") ? " selected" : "") + ">All</option>";

for (int i = 0; i < iRet3; i++) {
  int j = 0;
  String code = matrix3.getRowData(i).getData(j++);
  String code_name = matrix3.getRowData(i).getData(j++);
  statusOptions += "<option value='" + code + "'>" + code_name + "</option>";
 
  searchstatusOptions += "<option value='" + code + "'"
                         + (searchStatus.equals(code) ? " selected" : "") + ">" + code_name + "</option>";          
}

// print PGR
String itemGroupOptions = "<option></option>";
String searchItemGroupOptions = "<option value=''" + (searchItemGroup.equals("") ? " selected" : "") + ">All</option>";
for (int i = 0; i < iRet4; i++) {
  int j = 0;
  String item_group    = matrix4.getRowData(i).getData(j++);
  String itemGroupNm  = matrix4.getRowData(i).getData(j++);

  itemGroupOptions += "<option value='" + item_group + "'"
              + (_InOutItemGroup.equals(item_group) ? " selected" : "") + ">" + item_group + "-" + itemGroupNm + "</option>";
  searchItemGroupOptions += "<option value='" + item_group + "'"
              + (searchItemGroup.equals(item_group) ? " selected" : "") + ">" + item_group + "-" + itemGroupNm + "</option>";
}

//print buyer
String buyerOptions = "<option></option>";
String searchBuyerOptions = "<option value=''" + (searchBuyer.equals("") ? " selected" : "") + ">All</option>";
for (int i = 0; i < iRet5; i++) {
  String bid = matrix5.getRowData(i).getData(0);
  String bname = matrix5.getRowData(i).getData(1);

  buyerOptions += "<option value='" + bid + "'"
                + (_adminid.equals(bid) ? " selected" : "") + ">" + bname.toUpperCase() +"-"+bid+ "</option>";
  searchBuyerOptions += "<option value='" + bid + "'"
                      + (searchBuyer.equals(bid) ? " selected" : "") + ">" + bname.toUpperCase() +"-"+bid+ "</option>";
}

// print supplier
String supplierOptions = "<option></option>";
String searchSupplierOptions = "<option value=''" + (searchSupplier.equals("") ? " selected" : "") + ">All</option>";
for (int i = 0; i < iRet6; i++) {
  int j = 0;
  String sid = matrix6.getRowData(i).getData(j++);
  String sname = matrix6.getRowData(i).getData(j++);

  supplierOptions += "<option value='" + sid + "'>" + sname + "</option>";
  searchSupplierOptions += "<option value='" + sid + "'"
                         + (searchSupplier.equals(sid) ? " selected" : "") + ">" + sname + "</option>";
}

%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<SCRIPT LANGUAGE=JavaScript>
function fnDownload(file) {
  with (document.form2) {
    attachFile.value = file;
    attachRealFile.value = file;
    action = './download.jsp';
    //target = 'hiddenFrm';
    submit();
  }
}

function fnSearch(frm) { 
    frm.action="./original_sample_list.jsp";    
    frm.submit();
}

function fnView(sampleNo,buyer,sequenceNo) {
  document.frmMain.sample_no.value = sampleNo;
  document.frmMain.buyer_id.value = buyer;
   document.frmMain.sequence_no.value = sequenceNo;
  document.frmMain.action = './sample_sheet_edit_form.jsp';
  document.frmMain.submit();
}
</SCRIPT>
</HEAD>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/title_icon.gif"></td>
  <td width="*" class="left_title">Sample Spec sheet</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<TABLE width=900 border='0' align='center'>
<FORM NAME=frmMain action="original_sample_list.jsp" METHOD=POST >
  <input type='hidden' name='sequence_no' >
   <input type='hidden' name='buyer_id' >
   <input type='hidden' name='sample_no' >
<tr>
  <td height='15'></td>
</tr>
</table>
 Search Query
  <table width='1000' border='0' cellspacing='1' cellpadding='2'  class='table_bg'>
  <form name='form1' method='post'>
  <tr>
    <td width='9%' class='table_header_center'>PGR</td>
    <td width='21%' class='table_bg_bright'><select name='searchItemClass'><%= searchItemClassOptions %></select></td>
    <td width='9%' class='table_header_center'>Buyer</td>
    <td width='19%' class='table_bg_bright'><select name='searchBuyer'><%= searchBuyerOptions %></select></td>
    <td width='9%' class='table_header_center'>Date</td>
    <td width='24%' class='table_bg_bright'><input type='text' name='searchFromDate' value='<%= searchFromDate %>' size='10' style='cursor:hand'
      readonly onclick="javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);">
      ~
      <input type='text' name='searchToDate' value='<%= searchToDate %>' size='10' style='cursor:hand'
      readonly onclick="javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);"></td>
    <td width="9%" class="table_bg_bright_center" rowspan='3'><input type='button' value='Search' onclick='fnSearch(this.form);'></td>
  </tr>
  <tr>
    <td class='table_header_center'>SGR</td>
    <td class='table_bg_bright' ><select name='searchItemGroup'><%= searchItemGroupOptions %></select></td>
    <TD width='10%'class='table_header_center'>Status</TD>
    <TD width='20%' class='table_bg_bright'> <SELECT NAME='statusOptions'>  <%= searchstatusOptions %></SELECT> </td>
    <td class='table_header_center'>Sample No</td>
    <td class='table_bg_bright'><input type='text' name='searchSampleNo' value='<%= searchSampleNo %>' size='13' maxlength='11'></td>
  </tr>
  <tr>
    <td class='table_header_center'>Supplier</td>
    <td class='table_bg_bright' colspan='3'><select name='searchSupplier'><%= searchSupplierOptions %></select></td>
    <td class='table_header_center'>Style No.</td>
    <td class='table_bg_bright'><input type='text' name='searchStyleNo' value='<%= searchStyleNo %>' size='13' maxlength='11'></td>
  </tr>
  </form>
</table>
* Click the Sample Number from the list to edit the Sample detail. 
<TABLE width='100%' border=0 cellpadding=0 cellspacing=1 align='center' class='table_bg'>
<tr class='table_header_center'>
<TD width=5%><FONT size=2>Image </FONT></TD>
<TD width=3%><FONT size=2>Sample No. </FONT></TD>
<TD width=3%><FONT size=2>SGR</FONT></TD>
<TD width=5%><FONT size=2>Season </FONT></TD>
<TD width=5%><FONT size=2>Date </FONT></TD>
<TD width=5%><FONT size=2>Buyer ID </FONT></TD>
<TD width=10%><FONT size=2>Buyer Name </FONT></TD>
<TD width=12%><FONT size=2>Sample Sheet </FONT></TD>
<TD width=12%><FONT size=2>Request Sheet </FONT></TD>
<TD width=12%><FONT size=2>Amend Sheet </FONT></TD>
<TD width=5%><FONT size=2>Sending Date  </FONT></TD>
<TD width=5%><FONT size=2>Status</FONT></TD>
<TD width=3%><FONT size=2>Style No. </FONT></TD>
</tr>
<%=outS%>
</FORM>
<form name='form2' method='post'>
<input type='hidden' name='attachPath' value='<%= _specSheetUrl  %>'>
<input type='hidden' name='attachFile'>
<input type='hidden' name='attachRealFile'>
</form>
</TABLE>
<%
out.println(CopyRightLogo());
%>
</BODY>
</HTML>
