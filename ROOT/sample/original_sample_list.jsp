<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="common.util.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/common/calendar/calendar.htm" %>
<%@ include file="/common/getPageList.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String imgUrl = "<font color=red>Image<br>Not Ready</font>";
String curPage = request.getParameter("curPage");
String pageSize = request.getParameter("pageSize");
String searchItemClass = request.getParameter("searchItemClass");
String searchFromDate = request.getParameter("searchFromDate");
String searchToDate = request.getParameter("searchToDate");
String searchItemGroup = request.getParameter("searchItemGroup");
String searchBuyer = request.getParameter("searchBuyer");
String searchSampleNo = request.getParameter("searchSampleNo");
String searchStyleNo = request.getParameter("searchStyleNo");
String searchStatus = request.getParameter("statusOptions");
//String searchNotReceivedOnly = request.getParameter("searchNotReceivedOnly");
//String styleNo="-";

if (searchStatus == null) searchStatus = "";

if (curPage == null) curPage = "1";
if (pageSize == null) pageSize = "20";

if (searchItemClass == null) searchItemClass = "";
if (searchFromDate == null || searchToDate == null) {
  searchFromDate = DateUtil.getRelativeDateString(new java.util.Date(), 0, 0, -30, "yyyy/MM/dd");
  searchToDate = DateUtil.getToday("yyyy/MM/dd");
}

if (searchItemGroup == null) searchItemGroup = "";

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

// paging 관련 변수
int iCurPage = 1;
int iPageSize = 20;
int iTotalPage = 1;
int iPageBlockSize = 10;
int iTotalCnt = 0;
int iBeginRownum = 0;
int iEndRownum = 0;
String pageList = "";
int iRet = 0;
int iRet2 = 0;
int iRet3 = 0;
int iRet4 = 0;
int iRet5 = 0;
int iRet6 = 0;
int iRet7 = 0;
String strSep = "|!^";
String outS = "";
String sql = "";
String cntSql = "";
String mainSql = "";
String conditionSql = "";
String sql2 = "";
String sql3 = "";
String sql4 = "";
String sql5 = "";
String sql6 = "";
String sql7 = "";
try {
  iCurPage = Integer.parseInt(curPage);
  iPageSize = Integer.parseInt(pageSize);
} catch (NumberFormatException ne) {}


Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix1 = null;
MatrixDataSet matrix2 = null;
MatrixDataSet matrix3 = null;
MatrixDataSet matrix4 = null;
MatrixDataSet matrix5 = null;
MatrixDataSet matrix6 = null;
MatrixDataSet matrix7 = null;
DataProcess dataProcess = null;

// read from session
//String _InOutSgr = (String) session.getAttribute("_InOutSgr");
String _InOutInputDate = (String) session.getAttribute("_InOutInputDate");
String _InOutItemGroup = (String) session.getAttribute("_InOutItemGroup");

//if (_InOutSgr == null) _InOutSgr = "";
if (_InOutInputDate == null) _InOutInputDate = "";
if (_InOutItemGroup == null) _InOutItemGroup = "";

// set query
cntSql =  " select count(*) from VG_SAMPLE_IN_OUT a left outer join VG_COMMON_CODE b  "
              + "               on ( a.status=b.code and b.type='ORDER_STATUS' ) ";                     


mainSql = " select  a.sequence_no, a.sample_no, a.item_class, date_format(a.input_date, '%Y/%m/%d'), "
        + "         a.item_group, a.qty, a.season, upper(a.buyer), a.supplier,  "
        + "         date_format(a.sending_date, '%Y/%m/%d'), date_format(a.return_date, '%Y/%m/%d'), "
        + "         ifnull(a.remarks,' '), a.style_no, a.status, b.code_name,ifnull(a.comments,' ') "
        + " from    VG_SAMPLE_IN_OUT a left outer join VG_COMMON_CODE b " 
        + "                on (  a.status=b.code and b.type='ORDER_STATUS' ) "
        + " where a.sequence_no is not null "  ;      

if (searchStyleNo.equals("")) {
	if (searchSampleNo.equals("")) {
			  conditionSql = " and a.input_date between str_to_date('" + searchFromDate + "', '%Y/%m/%d') "
			               + "         and  str_to_date('" + searchToDate + "', '%Y/%m/%d') ";
			  
			  if (!searchItemGroup.equals("")) {
			    conditionSql += " and    a.item_group = '" + searchItemGroup + "' ";
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
conditionSql += " and    upper(a.buyer) = '" + scmid + "' ";
conditionSql += " order by date_format(a.input_date, '%Y/%m/%d') desc, a.sample_no desc ";
//out.println(mainSql+conditionSql);
// read PGR code
sql2 = " select  code, code_name "
     + " from   vg_common_code "
     + " where  type = 'PGR' "
     + " and     use_yn ='Y' " 
     + " order by code ";


// ORDER STATUS
 sql3 = " select code,code_name  from vg_common_code " +
                   " where type='ORDER_STATUS' and use_yn='Y'  and code between '00' and '30'  order by sort_order ";
// ORDER STATUS
 sql7 = " select code,code_name  from vg_common_code " +
                   " where type='ORDER_STATUS' and use_yn='Y'  and code in ('22','24','35') order by sort_order ";                   
// set SGR
sql4 = " select  code, code_name "
     + " from   vg_common_code "
     + " where  type = 'SGR' "
     + " and     use_yn ='Y' " 
     + " order by code ";
// Buyer
sql5 = "  select  id,upper(name) "
     + "  from   login_01t "
     + "  where   user_type = 'B' and id = '"+scmid+"' "
     + "  order by name ";
//Supplier
sql6 = "  select  id, name "
     + "  from    login_01t "
     + "  where   user_type = 'S'  "
     + "  order by name ";

try {
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  matrix1 = new MatrixDataSet();
  matrix2 = new MatrixDataSet();
  matrix3 = new MatrixDataSet();
  matrix4 = new MatrixDataSet();
  matrix5 = new MatrixDataSet();
  matrix6 = new MatrixDataSet();
  matrix7 = new MatrixDataSet();
   dataProcess = new DataProcess();

  // read total count
  //out.println(cntSql+conditionSql);
  //if (true) return;
   dataProcess.RetrieveData(cntSql + conditionSql, matrix1, conn);
   iTotalCnt = Integer.parseInt(matrix1.getRowData(0).getData(0));
   iTotalPage = (iTotalCnt - 1)/iPageSize + 1;   

  if (iCurPage > iTotalPage) {
    iCurPage = iTotalPage;
    curPage = iCurPage + "";
  }

  iBeginRownum = (iCurPage - 1)*iPageSize + 1;
  iEndRownum = iBeginRownum + iPageSize - 1;

  // read original sample history by condition
  sql = "    SELECT T2.* FROM( "
          +"        SELECT @RNUM:=@RNUM+1 AS RM, T1.* "
          +"           FROM(  "
          +            mainSql + conditionSql 
          +  ") AS T1, (SELECT @RNUM:=0 ) R )  AS T2 "
          + "   WHERE RM >= " + iBeginRownum+"  AND RM <= " + iEndRownum;
          
      
  //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);


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
  
  // read supplier
  iRet7 = dataProcess.RetrieveData(sql7, matrix7, conn);

} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }
  System.out.println("Exception in admin_po_status : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
     conn.close();
  }
}

// print out history list
for (int i = 0; i < iRet; i++) {
  int j = 0;
  j++;                  // Skip reading rnum
  String sequenceNo     = matrix.getRowData(i).getData(j++);
  String sampleNo       = matrix.getRowData(i).getData(j++);    
  String item_class     = matrix.getRowData(i).getData(j++);
  //String itemClassNm    = matrix.getRowData(i).getData(j++);
  String inputDate      = matrix.getRowData(i).getData(j++);
  String item_group     = matrix.getRowData(i).getData(j++);
  //String itemGroupNm    = matrix.getRowData(i).getData(j++);
  String qty            = matrix.getRowData(i).getData(j++);
  String season          = matrix.getRowData(i).getData(j++);
  //String placeNm        = matrix.getRowData(i).getData(j++);
  String buyer          = matrix.getRowData(i).getData(j++);
  String supplier       = matrix.getRowData(i).getData(j++);
  //String supplierNm     = matrix.getRowData(i).getData(j++);
  String sendingDate    = matrix.getRowData(i).getData(j++);
  String returnDate     = matrix.getRowData(i).getData(j++);
  String remarks        = matrix.getRowData(i).getData(j++);
  String styleNo        = matrix.getRowData(i).getData(j++);
  String order_status        = matrix.getRowData(i).getData(j++);
  String status_name        = matrix.getRowData(i).getData(j++);
  String remarks2        = matrix.getRowData(i).getData(j++);
  String bgColor = "#fffff0";
  if (i%2 > 0) bgColor = "#eeeee0";

  
  // if the sending date is more than 28 day compare to Today and
  // the sample is not received then set the back ground color to red
  if (!sendingDate.equals("") && returnDate.equals("")) {
    String FourWeeksAgo = DateUtil.getRelativeDateString(new java.util.Date(), 0, 0, -28, "yyyyMMdd");
    
    if ((sendingDate.substring(6)+sendingDate.substring(3, 5)+sendingDate.substring(0, 2)).compareTo(FourWeeksAgo) <= 0) {
      bgColor = "#FF0000";
    }
  }
   File imgFile = new File(application.getRealPath(_sampleImageUrl) + File.separator + sampleNo.toLowerCase()  + ".jpg");
	if (imgFile.exists()) {
	  imgUrl = "<img src='" + _sampleImageUrl + "/" + sampleNo.toLowerCase() + ".jpg' width='50' height='70'>";
	} else {
		  imgUrl = "<img src='" + _sampleImageUrl + "/noimage.jpg' width='50' height='70'>";
	}	
  
  //String strLink = "<a href=\"javascript:fnView('" + seqno + "')\">" + StringUtil.convertTextToHtml(title) + "</a>";
  String strLink = "<a href=\"javascript:fnSetData('"  
                 + sequenceNo + strSep
                 + sampleNo + strSep
                 + item_class + strSep
                 + inputDate + strSep
                 + item_group + strSep
                 + qty + strSep
                 + season + strSep
                 + StringUtil.replaceScriptString(buyer) + strSep
                 + supplier + strSep
                 + sendingDate + strSep
                 + returnDate + strSep
                 + styleNo + strSep
                 + order_status + strSep
                 + StringUtil.replace(StringUtil.replaceScriptString(remarks), "\n", "\\n") + strSep
                 + StringUtil.replace(StringUtil.replaceScriptString(remarks2), "\n", "\\n")
                 + "')\">"                  
                 + sampleNo + " </a>";

  if (!styleNo.equals("-")) {
     styleNo = "<a href=\"javascript:fnOpenStyleWin('" + styleNo + "')\">"   + styleNo + "</a>";
  }
  
  outS += "<tr align='center' style='background-color:" + bgColor + ";'>"
         + " <td>" + imgUrl + "</td>"
        + " <td align='left'>" + strLink + "</td>"
        + " <td>" + inputDate + "</td>"
        + " <td>" + item_class + "</td>"
        + " <td>" + item_group + "</td>"
        + " <td>" + qty + "</td>"
        + " <td>" + season + "</td>"
        + " <td align='left'>" + buyer + "</td>"
        + " <td align='left'>" + supplier + "</td>"
        + " <td align='left'>" + status_name + "</td>"
        + " <td>" + sendingDate + "</td>"
        + " <td>" + returnDate + "</td>"
        + "  <td><a href=\"javascript:fnViewComments('" + sequenceNo + "')\">  Comment History </a></td>"
        + " <td>" + styleNo + "</td>"
        + "</tr>";     
}

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


// new order status list
String new_statusOptions = "<option></option>";

for (int i = 0; i < iRet7; i++) {
  int j = 0;
  String new_code = matrix7.getRowData(i).getData(j++);
  String new_code_name = matrix7.getRowData(i).getData(j++);
  new_statusOptions += "<option value='" + new_code + "'>" + new_code_name + "</option>";    
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
String searchBuyerOptions = "<option value=''" + (scmid.equals("") ? " selected" : "") + ">All</option>";
for (int i = 0; i < iRet5; i++) {
  String bid = matrix5.getRowData(i).getData(0);
  String bname = matrix5.getRowData(i).getData(1);

  buyerOptions += "<option value='" + bid + "'"
                + (scmid.equals(bid) ? " selected" : "") + ">" + bname.toUpperCase() + "</option>";
  searchBuyerOptions += "<option value='" + bid + "'"
                      + (scmid.equals(bid) ? " selected" : "") + ">" + bname.toUpperCase() + "</option>";
}
// print supplier
String supplierOptions = "<option></option>";
for (int i = 0; i < iRet6; i++) {
  int j = 0;
  String sid = matrix6.getRowData(i).getData(j++);
  String sname = matrix6.getRowData(i).getData(j++);

  supplierOptions += "<option value='" + sid + "'>" + sname + "</option>";  
}

// Paging.
pageList = getPageList(iCurPage, iTotalCnt, iPageSize, iPageBlockSize);
%>
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language=javascript src="/common/js/util.js"></script>
<script language="javascript">
function fnGoPage(page) {
  with (document.form3) {
    curPage.value = page;
    target = this.name;
    action = "./original_sample_list.jsp";
    submit();
  }
}

function fnSearch(frm) {
  frm.action="./original_sample_list.jsp";
  frm.target = this.name;
  frm.submit();
}


function fnSave(frm) {
  
  
  if (!jf_ChkValue(frm.returnDate.value)) {
    alert('Input confirm date!');
    frm.returnDate.select();
    return;
  }
  //alert(frm.new_order_status.selectedIndex);
   if (frm.new_order_status.selectedIndex == 0) {
    alert('Select Request Status!');
    frm.new_order_status.focus();
    return;
  }
  if (frm.remarks2.value) {
    if (!jf_IsValidStrLength(frm.remarks2.value, 4000)) {
      alert("Check the length of Remarks(Max length : 4000).");
      frm.remarks.focus();
      return;
    }
    
    frm.remarks2.value = frm.remarks2.value.replace(/"/g, "'");
  }

  if (confirm('Do you really want to save these data?')) {
    frm.action = './original_sample_save.jsp';
    frm.submit();
  }
}


function fnSetData(strParams) {
  var params = strParams.split('<%= strSep %>');
  var j = 0;

  with (document.form2) {
    sequenceNo.value = params[j++];
    sampleNo.value = params[j++];
    jf_fnSetSelectOption(item_class, params[j++]);
    inputDate.value = params[j++];
    jf_fnSetSelectOption(item_group, params[j++]);
    qty.value = params[j++];
    season.value= params[j++];
    buyer.selectedIndex = 0;
    jf_fnSetSelectOption(buyer, params[j++]);
    jf_fnSetSelectOption(supplier, params[j++]);
    sendingDate.value = params[j++];
    returnDate.value = params[j++];
    styleNo.value = params[j++];
    jf_fnSetSelectOption(order_status, params[j++]);
    remarks.value = params[j++];
    remarks2.value = params[j++];
    actionFlag.value = 'U';
    //item_class.disabled = true;
    //place.disabled = true;
  }

  document.all['sampleImage'].src = '<%= _sampleImageUrl %>/' + document.form2.sampleNo.value.toLowerCase() + '.jpg';
  document.all['popSampleImage'].style.visibility = 'visible';
}

function fnOpenStyleWin(style_no)
{
  var url = '/ordermanagement/buyer_product_info.jsp?ag_style_no=' + style_no;
  var win = window.open(url, "styleWin", "toolbar=no,menubar=no,resizable=no,scrollbars=yes,width=860,height=600");
  if (win) win.focus();
}

function fnViewComments(seq_no_selected) {
  form3.seq_no_selected.value = seq_no_selected;
  form3.action = "./sample_comments_list.jsp";
  form3.submit();
}

function fnExcel(frm, withImage) {
  if (confirm("Do you want to download these data as an excel file?"))
  {
    frm.action="./original_sample_in_out_excel.jsp";
    frm.target = hidenFrame.name;
    frm.withImage.value = withImage;
    frm.submit();
  }
}

function displayLeng( sz, id )
{
    var form = document.form2;
    var obj  = document.getElementById( id );


    if (form[id].value.length > sz)
    {
        if (event.keyCode != '8') //백스페이스는 지우기작업시 바이트 체크하지 않기 위해서
        {
            alert( sz+' characters only.');
        }
        form[id].value = form[id].value.substring(0, sz);
    }


    document.getElementById(id+'_bytes').innerHTML = form[id].value.length+" 자";
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
  <td width='3%'><img src='/img/btnPO.gif'></td>
  <td width='*' class='left_title'>Original Sample Management</td>
</tr>
<tr>
  <td width='100%' height='2' colspan='2'><hr width='100%'></td>
</tr>
<tr>
  <td height='10' colspan='2'></td>
</tr>
</table>
</td></tr>
</table>
 Search Query
<table width="1000" border="0" cellspacing="0" cellpadding="0"><tr><td width='1000'>
  <table width='99%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>
  <form name='form1' method='post'>
  <tr>
    <td width='9%' class='table_header_center'>PGR</td>
    <td width='21%' class='table_bg_bright'><select name='searchItemClass'><%= searchItemClassOptions %></select></td>
    <td width='9%' class='table_header_center'>SGR</td>
    <td width='19%' class='table_bg_bright'><select name='searchItemGroup'><%= searchItemGroupOptions %></select></td>
    <td width='9%' class='table_header_center'>Date</td>
    <td width='24%' class='table_bg_bright'><input type='text' name='searchFromDate' value='<%= searchFromDate %>' size='10' style='cursor:hand'
      readonly onclick="javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);">
      ~
      <input type='text' name='searchToDate' value='<%= searchToDate %>' size='10' style='cursor:hand'
      readonly onclick="javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);"></td>
    <td width="9%" class="table_bg_bright_center" rowspan='3'><input type='button' value='Search' onclick='fnSearch(this.form);'></td>
  </tr>
  <tr>
    <td class='table_header_center'>PO Status</td>
    <td class='table_bg_bright' ><SELECT NAME='statusOptions'>  <%= searchstatusOptions %></SELECT></select></td>
    <TD width='10%'class='table_header_center'>Sample No</TD>
    <TD width='20%' class='table_bg_bright'> <input type='text' name='searchSampleNo' value='<%= searchSampleNo %>' size='13' maxlength='11'> </td>
    <td class='table_header_center'>Style Number</td>
    <td class='table_bg_bright'><input type='text' name='searchStyleNo' value='<%= searchStyleNo %>' size='13' maxlength='11'></td>
  </tr>  
  </form>
  </table>
</table>
  <table width='99%' border='0' cellspacing='0' cellpadding='0' align='center'>
  <tr>
    <td height='15'><b>Sample Detail :</b></td>
  </tr>
  </table>
  <table width="1000" border="0" cellspacing="0" cellpadding="0">  	
  <tr>
  	<td width='*'>
  <table width='100%' border='0' class='table_bg' cellspacing='0' cellpadding='0' align='center'>
  <tr><td width='10%' class='table_header_center'>Sample Image </td></tr><tr>
    <td width='100%' height='170' align='right' class='table_bg_bright' ><div id='popSampleImage' style='position:relative;visibility:hidden;border:0px;'>
      <img id='sampleImage' src='' width='110' height='169'>
      </div></td>
  </tr>
  </table>
</td><td width='1000'>
  <table width='99%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>
  <form name='form2' method='post'>
  <input type="hidden" name="curPage" value="<%= curPage %>">
  <input type="hidden" name="pageSize" value="<%= pageSize %>">
  <input type='hidden' name='searchFromDate' value='<%= searchFromDate %>'>
  <input type='hidden' name='searchToDate' value='<%= searchToDate %>'>
  <input type='hidden' name='searchBuyer' value='<%= searchBuyer %>'>
  <input type='hidden' name='searchItemClass' value='<%= searchItemClass %>'>
  <input type='hidden' name='searchItemGroup' value='<%= searchItemGroup %>'>
  <input type='hidden' name='searchSampleNo' value='<%= searchSampleNo %>'>
  <input type='hidden' name='statusOptions' value='<%= searchStatus %>'>
  <input type='hidden' name='searchStyleNo' value='<%= searchStyleNo %>'>
  <input type='hidden' name='actionFlag' value='I'>
  <input type='hidden' name='sequenceNo' value=''>
  <tr>
    <td width='10%' class='table_header_center'>Sample No</td>
    <td width='11%' class='table_bg_bright'><input type='text' name='sampleNo' size='13' maxlength='11' tabindex='-1' style='background-color : #e8e8e8'></td>
    <td class='table_header_center'>Supplier</td>
    <td class='table_bg_bright' colspan='3'><select name='supplier' ><%= supplierOptions %></select></td>   
    <td width='9%' class='table_header_center'>Buyer</td>
    <td width='28%' class='table_bg_bright'><select name='buyer' ><%= buyerOptions %></select></td>
  </tr>
  <tr>
    <td class='table_header_center'>Date</td>
    <td class='table_bg_bright'><input type='text' name='inputDate' value='<%= _InOutInputDate %>' size='10' readonly style='background-color : #e8e8e8' ></td>
    <td class='table_header_center'>Qty</td>
    <td width='9%' class='table_bg_bright'><input type='text' name='qty' value='1' size='5' maxlength='5' readonly  style='background-color : #e8e8e8'></td>
    <td width='10%' class='table_header_center'>Season</td>
    <td width='13%' class='table_bg_bright'><input type='text' name='season'  size='10' maxlength='10' style='background-color : #e8e8e8'></td>
    <td class='table_header_center' >Style No.</td>
    <td class='table_bg_bright' ><input type='text' name='styleNo'  size='20' maxlength='20' readonly style='background-color : #e8e8e8'></td>
  </tr>
  <tr>
    <td class='table_header_center'>SGR</td>
    <td class='table_bg_bright' colspan='3'><select name='item_group' disabled ><%= itemGroupOptions %></select></td>
    <td class='table_header_center'>Shipping Date</td>
    <td class='table_bg_bright'><input type='text' name='sendingDate' size='10' readonly style='background-color : #e8e8e8'></td>
     <td class='table_header_center'>(*)Confirmed Date</td>
    <td class='table_bg_bright'><input type='text' name='returnDate' size='10' style='cursor:hand'
      readonly onclick="javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);"></td>  
  </tr>
  <tr>
    <td width='10%' class='table_header_center'>PGR</td>
    <td width='32%' class='table_bg_bright' colspan='3'><select name='item_class' disabled ><%= itemClassOptions %></select></td>
    <td class='table_header_center' >Progress</td>
  	 <td class='table_bg_bright' ><select name='order_status' disabled><%= statusOptions %></td>
  	<td width='10%' class='table_header_center'>(*)Request Status</td>
    <td width='32%' class='table_bg_bright' colspan='3'><select name='new_order_status' ><%= new_statusOptions %></select></td>  
  </tr>
  <tr>
  	<td width='10%' class='table_header_center' rowspan='3'>Comments from<br>(Supplier)</td>
  	<td class='table_bg_bright' colspan='4' rowspan='3'><textarea  name="remarks" cols="20" rows="10" style="width:100%;" readonly style='background-color : #e8e8e8' ></textarea></td>
  	<td width='10%' class='table_header_center' rowspan='3'>(*)Comments from<br>(Buyer)</td>
  	<td class='table_bg_bright' colspan='3' rowspan='3'><textarea id=chk1 onkeyup='displayLeng(4000,"chk1");' name="remarks2" cols="20" rows="10" style="width:100%;"  ></textarea><div name='chk1_bytes' id='chk1_bytes'></div></td>
  </tr>
  </table>
</td>
  
</tr>
</table>

<table width="840" border="0" cellspacing="0" cellpadding="0"><tr><td>
<table width='99%' border='0' cellspacing='0' cellpadding='0' align='center'>
<tr>
  <td height='15'>* Only (*) marked detail can be edited. <br><font color=red>* If you update the sample detail, the information will be emailed to the supplier automatically.<br>
  	* Email will be sent to the necessary supplier and/or sample manager by changing the Request Status to [Receive Sample(22)],[Request Design Modification(24)],[Request Order(35)].</font></td>
</tr>
<tr>
  <td height='15'><font color=red>** It may take some time to complete updating all information and send email. Please wait until the process complete. **</font></td>
</tr>
<tr>
  <td align='center'>
    <input type='button' value='Update' onclick='fnSave(this.form);'>
    <!--input type='button' value='Excel' onclick="fnExcel(document.form3, '');"-->
     <!--input type='button' value='Excel with Image' onclick="fnExcel(document.form3, 'Y');"-->
  </td>
</tr>
<tr>
  <td height='5'></td>
</tr>
</form>
</table>
<table width='99%' border='0' cellspacing='0' cellpadding='0' align='center'>
<form name='form3' method='post'>
<input type="hidden" name="curPage" value="<%= curPage %>">
<input type='hidden' name='searchFromDate' value='<%= searchFromDate %>'>
<input type='hidden' name='searchToDate' value='<%= searchToDate %>'>
<input type='hidden' name='searchItemClass' value='<%= searchItemClass %>'>
<input type='hidden' name='searchItemGroup' value='<%= searchItemGroup %>'>
<input type='hidden' name='searchSampleNo' value='<%= searchSampleNo %>'>
<input type='hidden' name='statusOptions' value='<%= searchStatus %>'>
<input type='hidden' name='searchStyleNo' value='<%= searchStyleNo %>'>
<input type="hidden" name="seq_no_selected" >
<input type="hidden" name="withImage" value="">
<tr>
  <td width="50%">
    Page Size :
    <select name="pageSize" onChange="fnGoPage(1)">
      <option value="20" <%= pageSize.equals("20") ? "selected" : "" %>>20</option>
      <option value="50" <%= pageSize.equals("50") ? "selected" : "" %>>50</option>
      <option value="100" <%= pageSize.equals("100") ? "selected" : "" %>>100</option>
    </select></td>
  <td width="*" align="right" valign="bottom">TOTAL : <%= iTotalCnt %>, Current Page : <%= iCurPage %> / <%= iTotalPage %>&nbsp;</td>
</tr>
</table>
</td></tr></table>

<table width="1220" border="0" cellspacing="0" cellpadding="0"><tr><td>
<table width='99%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>
<tr class='table_header_center'>
	<td>Image </td>
  <td>Sample No</td>
  <td>Date</td>
  <td>PGR</td>
  <!--td>Group Name</td-->
  <td>SGR</td>
  <td>Qty</td>
  <td>Season</td>
  <td>Buyer ID</td>
  <td>Supplier ID</td>
  <td>Status</td>
  <td>Sending Date</td>
  <td>Receiving Date</td>
  <td >Remarks</td>
  <td>Style No</td>
</tr>
<%= outS %>
</table>
</td></tr></table>

<table width="840" border="0" cellspacing="0" cellpadding="0"><tr><td>
<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="10"></td>
</tr>
<tr>
  <td width="100%" align="center"><%= pageList %></td>
</tr>
</form>
</table>
<%
out.println(CopyRightLogo());
%>
</tr></td></table>
<iframe width="0" height="0" name="hidenFrame"></iframe>
</body>
</html>