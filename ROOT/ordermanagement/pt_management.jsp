<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/calendar/calendar.htm" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
String ag_supplier = request.getParameter("ag_supplier");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_status = request.getParameter("ag_status");
String ag_orderby = request.getParameter("ag_orderby");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");

String search_pono = request.getParameter("po_no_selected");
String fromUrl = "admin_order_list.jsp";

if (search_pono == null || search_pono =="") {
    search_pono = "PO201110000";
}
String DATE_FORMAT = "yyyy/MM/dd hh:mm aa";
String imgUrl = "<font color=red>Image<br>Not Ready</font>";
String page_title = "";

String print_date = DateUtil.getFmtDateString(new java.util.Date(), DATE_FORMAT);
int iRet = 0;
int iRet2 = 0;
int iRet3 = 0;
String strSep = "|!^";
String outS = "";
String outS2 = "";

String sql = "";
String sql3 = "";
String today = DateUtil.getToday("yyyy/MM/dd");

String ptseq = "";
String pt_date = "";
String pt_info = "";
String po_no = "";

String supplier_addr = "Supplier address here";
String supplier_fax = " FAX Number here";
String supplier_phone = "Phone here";
String bid ="";
String bname="";
String sid="";
String sname="";
String pgrcode="";
String pgrname="";
String sgrcode="";
String sgrname="";
String mcode="";
String mname="";
String curcode="";
String curname="";
String subid="";
String subname="";
String pono = "";
String style_no  = "";
String season   = "";
String sgr   = "";
String pgr   = "";
String fabric   = "";
String itemtext   = "";
String sup_style_no   = "";
String unitprice   = "";
String init_delivery_date   = "";
String trans_type   = "";
String order_status   = "";
String currency   = "";
String brand    = "";
String buyer = "";
String supplier = "";
String subsupplier   = "";
String delivery_date   = "";
String ship_type="";
String local_price="";
String reorder_seq ="";
String size_1    = "";
String size_2    = "";
String size_3    = "";
String size_4    = "";
String size_5    = "";
String size_6    = "";  
String comments = "";
String total_qty = "";
String order_date = "";
String ship_date = "";
int last_cnt=0;
// for po details
String[] col = new String[5];
String[] qty1 = new String[6];
String[] qty2 = new String[6];
String[] qty3 = new String[6];
String[] qty4 = new String[6];
String[] qty5 = new String[6];
String[] qty6 = new String[6];
String[]  siztotal_qty = new String[6];
// initialize array
for (int i = 0; i < col.length; i++) {
  col[i] = "";
}
for (int i = 0; i < qty1.length; i++) {
  qty1[i] = "";
}
for (int i = 0; i < qty2.length; i++) {
  qty2[i] = "";
}
for (int i = 0; i < qty3.length; i++) {
  qty3[i] = "";
}
for (int i = 0; i < qty4.length; i++) {
  qty4[i] = "";
}
for (int i = 0; i < qty5.length; i++) {
  qty5[i] = "";
}
for (int i = 0; i < qty6.length; i++) {
  qty6[i] = "";
}
for (int i = 0; i <  siztotal_qty.length; i++) {
   siztotal_qty[i] = "";
}
Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
DataProcess dataProcess = null;
sql3 = " select  seq, po_no, date_format(pt_date, '%Y/%m/%d'), pt_info "
    + " from  gp_input "
    +  " where  seq is not null  "
    + (!search_pono.equals("") ? " and    po_no ='" + search_pono + "' " : "");

try {

  matrix = new dbconn.MatrixDataSet();
  matrix2 = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
 // Select PO master  
  sql = "  Select ORDER_NO ,  STYLE , SEASON ,  SGR ,  PGR  , "
	      + "   FABRIC, ITEM_TEXT, SUP_STOCK_CODE, format(VENDOR_PRICE,2) , date_format(initial_del_date, '%Y/%m/%d'), "
	      + "   TRANS_TYPE , ORDER_STATUS ,CURRENCY_CODE, BRAND , "
	      + "   BUYER,SUPPLIER  , SUBSUPPLIER, date_format(delivery_date, '%Y/%m/%d'), "
	      + "   SIZC_1,SIZC_2,SIZC_3,SIZC_4,SIZC_5,SIZC_6, "
	      + "   COMMENTS,TOTAL_QTY,date_format(order_date, '%Y/%m/%d'),date_format(arrival_date, '%Y/%m/%d'),PO_TYPE,format(LOCAL_PRICE,2),REORDER_SEQ "
	      + " from purchase_order "
	      + " where backorder_flag='N' "
	      + (!search_pono.equals("") ? " and    upper(order_no) = upper('" + search_pono + "' )"  : "");

//out.println(sql);	      
  iRet = dataProcess.RetrieveData(sql, matrix, conn);	  
  iRet3= dataProcess.RetrieveData(sql3, matrix2, conn);
  if ( iRet > 0 ) {    
	  for (int i = 0; i < iRet; i++) {
		  int j = 0;
		  pono = matrix.getRowData(i).getData(j++);
		  style_no  = matrix.getRowData(i).getData(j++);
		  season   = matrix.getRowData(i).getData(j++);
		  sgr   = matrix.getRowData(i).getData(j++);
		  pgr   = matrix.getRowData(i).getData(j++);
		  fabric   = matrix.getRowData(i).getData(j++);
		  itemtext   = matrix.getRowData(i).getData(j++); 
		  sup_style_no   = matrix.getRowData(i).getData(j++);
		  unitprice   = matrix.getRowData(i).getData(j++);
		  init_delivery_date   = matrix.getRowData(i).getData(j++);
		  trans_type   = matrix.getRowData(i).getData(j++);
		  order_status   = matrix.getRowData(i).getData(j++); 
		  currency   = matrix.getRowData(i).getData(j++); 
		  brand    = matrix.getRowData(i).getData(j++);
		  buyer = matrix.getRowData(i).getData(j++);
		  supplier = matrix.getRowData(i).getData(j++);
		  subsupplier   = matrix.getRowData(i).getData(j++);
		  delivery_date   = matrix.getRowData(i).getData(j++);
		  size_1    = matrix.getRowData(i).getData(j++);
		  size_2    = matrix.getRowData(i).getData(j++);
		  size_3    = matrix.getRowData(i).getData(j++);
		  size_4    = matrix.getRowData(i).getData(j++);
		  size_5    = matrix.getRowData(i).getData(j++);
		  size_6    = matrix.getRowData(i).getData(j++);		  
		  comments = matrix.getRowData(i).getData(j++);
		  total_qty = matrix.getRowData(i).getData(j++);	
		  order_date = matrix.getRowData(i).getData(j++);
		  ship_date = matrix.getRowData(i).getData(j++);
		  ship_type = matrix.getRowData(i).getData(j++);	
		  local_price = matrix.getRowData(i).getData(j++);
		  reorder_seq = matrix.getRowData(i).getData(j++);				
	 }	        
 }
   
 // set item imagae
    File imgFile = new File(application.getRealPath(_styleImgURL) + File.separator + style_no.toLowerCase() + ".jpg");
	if (imgFile.exists()) {
	  imgUrl = "<img src='" + _styleImgURL + "/" + style_no.toLowerCase() + ".jpg' width='110' height='169'>";
	}
 // get buyer code
  sql = " select  id, name "
      + " from    login_01t  "
      + " where   user_type = 'B'  and id='"+buyer+"' "
      + " order by id asc";

  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    bid  = matrix.getRowData(i).getData(0);
    bname  = matrix.getRowData(i).getData(1);    
  }
  // get supplier code
  sql = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'S' and id='"+supplier+"' "
      + " order by id asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    sid  = matrix.getRowData(i).getData(0);
    sname  = matrix.getRowData(i).getData(1);
   } 
     // get PGR code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'PGR' and code='"+pgr+"' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
     pgrcode  = matrix.getRowData(i).getData(0);
     pgrname  = matrix.getRowData(i).getData(1);
   }     
  // get SGR code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'SGR'  and code='"+sgr+"' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
     sgrcode  = matrix.getRowData(i).getData(0);
     sgrname  = matrix.getRowData(i).getData(1);   
  }
  // get MATERIAL code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'MATERIAL' and code='"+fabric+"' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
     mcode  = matrix.getRowData(i).getData(0);
     mname  = matrix.getRowData(i).getData(1);
   }   
   // get Currency code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'CURRENCY' and code='"+currency+"' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    curcode  = matrix.getRowData(i).getData(0);
    curname  = matrix.getRowData(i).getData(1);    
  }
  // get SUBsupplier code
  sql = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'P' and id='"+subsupplier+"' "
      + " order by id asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    subid  = matrix.getRowData(i).getData(0);
    subname  = matrix.getRowData(i).getData(1);    
  } 
  
 // Select PO details
  sql = " select  colour,total_qty,sqty_1,sqty_2,sqty_3,sqty_4,sqty_5,sqty_6 "
      + " from    purchase_order_line "
      + " where order_no = '"+pono+"' ";

  iRet2 = dataProcess.RetrieveData(sql, matrix, conn);
  // set po lines 
  if ( iRet2 > 0 ) {   
	  for (int i = 0; i < iRet2; i++) {
	    int k = 0;
	    col[i] = matrix.getRowData(i).getData(k++);
	    siztotal_qty[i] = matrix.getRowData(i).getData(k++);
	    qty1[i] = matrix.getRowData(i).getData(k++);
	    qty2[i] = matrix.getRowData(i).getData(k++);
	    qty3[i] = matrix.getRowData(i).getData(k++);
	    qty4[i] = matrix.getRowData(i).getData(k++);
	    qty5[i] = matrix.getRowData(i).getData(k++);
	    qty6[i] = matrix.getRowData(i).getData(k++);    
	 
       if ( i == 0 ) {
        last_cnt = 1;   
	    outS += "<tr class='table_list_center'>"
	          + "  <td width='20%' height='16' >"+col[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty1[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty2[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty3[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty4[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty5[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty6[i]+"</td>"
	          + "  <td width='13%' height='16' >"+siztotal_qty[i]+"</td>"
	          + "</tr>";
	    }
	    if ( i == 1 ) {
	     last_cnt = 2; 
	    outS += "<tr class='table_list_center'>"
	          + "  <td width='20%' height='16' >"+col[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty1[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty2[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty3[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty4[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty5[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty6[i]+"</td>"
	          + "  <td width='13%' height='16' >"+siztotal_qty[i]+"</td>"
	          + "</tr>";
	    }
	    if ( i == 2 ) {
	     last_cnt = 3; 
	    outS += "<tr class='table_list_center'>"
	          + "  <td width='20%' height='16' >"+col[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty1[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty2[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty3[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty4[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty5[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty6[i]+"</td>"
	          + "  <td width='13%' height='16' >"+siztotal_qty[i]+"</td>"
	          + "</tr>";
	    }
	    if ( i == 3 ) {
	      last_cnt = 4;  
	    outS += "<tr class='table_list_center'>"
	          + "  <td width='20%' height='16' >"+col[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty1[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty2[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty3[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty4[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty5[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty6[i]+"</td>"
	          + "  <td width='13%' height='16' >"+siztotal_qty[i]+"</td>"
	          + "</tr>";
	    }
	    if ( i == 4 ) {
	      last_cnt = 5;   
	    outS += "<tr class='table_list_center'>"
	          + "  <td width='20%' height='16' >"+col[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty1[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty2[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty3[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty4[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty5[i]+"</td>"
	          + "  <td width='11%' height='16' >"+qty6[i]+"</td>"
	          + "  <td width='13%' height='16' >"+siztotal_qty[i]+"</td>"
	          + "</tr>";
	    }
	          
	  } 
	  
	}
   
} catch (Exception e) {
  System.out.println("Exception /admin/ordermanagement/product_info : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}	
}
if ( iRet3 > 0 ) {
	for (int i = 0; i < iRet3; i++) {
	  int j = 0;
	  ptseq = matrix2.getRowData(i).getData(j++);
	  po_no = matrix2.getRowData(i).getData(j++);
	  pt_date = matrix2.getRowData(i).getData(j++);
	  pt_info = matrix2.getRowData(i).getData(j++);
	
	  String bgColor = "#fffff0";
	  if (i%2 > 0) bgColor = "#eeeee0";
	
	  String strLink = "<a href=\"javascript:fnSetData('"
	                  + ptseq + strSep
	                //  + po_no + strSep
	                  + pt_date + strSep
	                  + StringUtil.replaceScriptString(pt_info) + strSep
	                  + "')\">" + ptseq + "</a>";	  
	
	  outS2 += "<tr align='center' style='background-color:" + bgColor + ";'>"
	        + " <td>" + strLink + "</td>"
	 //       + " <td>" + po_no + "</td>"
	        + " <td>" + pt_date + "</td>"
	        + " <td>" + pt_info + "</td>"
	        + "</tr>";
	}
} else {
   outS2 +="<tr align='center' ><td align='center' colspan='3' ><font color=red>There is no PT# information! </font></td></tr>";
}		
%>
<html>
<head>
<title><%= page_title %></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language=javascript src="/common/js/util.js"></script>
<script language="javascript">

function fnSubmit(frm) {
  if (!jf_ChkValue(frm.po_no_selected.value)) {
    alert("Input PO#.");
    frm.po_no_selected.select();
    return;
  }

  frm.submit();
}
function fnNew(frm) {
  frm.reset();
  frm.seqno.readOnly = true;
  frm.seqno.style.backgroundColor = '#e8e8e8';
  frm.pt_date.focus();
}

function fnSave(frm) {
  if (!jf_ChkValue(frm.pt_date.value)) {
    alert('Enter PT# date!');
    frm.pt_date.select();
    return;
  }
 if (!jf_ChkValue(frm.pt_info.value)) {
    alert('Input note!');
    frm.pt_info.select();
    return;
  }
  if (confirm('Do you really want to save these data?')) {
    frm.action = './pt_update.jsp';
    frm.submit();
  }
}

function fnDelete(frm) {
  if (frm.actionFlag.value != 'U' || !frm.seqno.value) {
    alert('Select PT# first to be deleted!');
    return;
  }

  if (confirm('Do you really want to delete the selected item?')) {
    frm.actionFlag.value = 'D';
    frm.action = './pt_update.jsp';
    frm.submit();
  }
}

function fnSetData(strParams) {
  var params = strParams.split('<%= strSep %>');
  var j = 0;

  with (document.form1) {
    seqno.value = params[j++];
    pt_date.value = params[j++];
    pt_info.value = params[j++];

    actionFlag.value = 'U';
    seqno.readOnly = true;
    seqno.style.backgroundColor = '#e8e8e8';
  }
}
function fnBack(frm) {
  frm.action = "<%= fromUrl %>";
  frm.submit();
}

</script>
</head>
<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0' >
<table width="99%" border="0" cellspacing="0" cellpadding="0" >
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/btnCategories.gif"></td>
  <td width="*" class="left_title"><font size='2'><b> Purchase Order - PT# Management</b></font></td>
</tr>
<tr>
  <td width="700" height="2" colspan="2"><hr width="700"></td>
</tr>
</table>
* Search PO# first then update its detail from the list below. Please input search query. 
<TABLE WIDTH='700' border="0" cellspacing="1" cellpadding="0"  >
<form NAME='frmMain' METHOD='POST' action='./pt_management.jsp'>
<TR>
  <TD width='5%' class='table_header_center'>PO#</TD>
  <TD width='20%' class='table_bg_bright' > <input type=text name='po_no_selected' value="<%= search_pono %>"> </td>  
  <TD width='15%' class='table_bg_bright' ><input  type='button' value="Search" onclick='fnSubmit(this.form);'></TD>
</TR>
<tr>
  <td width="700" height="10"  colspan="3"></td>
</tr>
</form>
</TABLE>
1) PO Detail
<table width='700' border='0' bordercolor='black' cellspacing='0' cellpadding='0'>
<tr><td>
<table width='700' border='1' cellspacing='1' cellpadding='2' align='center' bordercolor='black' >
  <tr class='table_header'>
    <td width="21%" height="16" >*PO#</td>
    <td width="21%" height="16" >*Style#</td>
    <td width="23%" height="16" >*Buyer</td>
    <td width="35%" colspan="2" height="16" >Supplier</td>
    <td  align='center' rowspan="8"><%= imgUrl %></td>    
  </tr>
  <tr class='table_list_center'>
    <td width="21%" height="23" ><%=pono%></td>
    <td width="21%" height="23" ><%=style_no%></td>
    <td width="23%" height="23" ><%=bname%></td>
    <td width="35%" colspan="2" height="23" ><%=sname%></td>
  </tr>
  <tr class='table_header'>
    <td width="21%" height="16" >*Product Group</td>
    <td width="21%" height="16" >*Sub group</td>
    <td width="23%" height="16" >*Unit Price</td>
    <td width="19%" height="16" >Order date</td>
    <td width="16%" height="16" >Delivery date</td>
  </tr>
  <tr class='table_list_center'>
    <td width="21%" height="23" ><%=pgrname%></td>
    <td width="21%" height="23" ><%=sgrname%></td>
    <td width="23%" height="23" ><%=unitprice%> &nbsp;&nbsp;<%=curname%></td>
    <td width='19%' ><%= order_date %></td>
    <td width='16%' ><%= delivery_date %></td>
  </tr>
  <tr class='table_header'>
    <td width="21%" height="22" >Ship type</td>
    <td width="21%" height="22" >Ship date</td>
    <td width="23%" height="22" >*Season</td>
    <td width="19%" height="22" >Manufacturer</td>
    <td width="16%" height="22" >Supplier sty#</td>
  </tr>
  <tr class='table_list_center'>
    <td width="21%" height="27" ><%=trans_type%></td>
    <td width='21%' ><%= ship_date %></td>
    <td width="23%" height="27" ><%=season%></td>
    <td width="19%" height="27" ><%=subname%></td>
    <td width="16%" height="27" ><%= sup_style_no %></td>
  </tr>
  <tr class='table_header'>
    <td width="21%" height="22" c>Material </td>
    <td width="21%" height="22" c>BRAND</td>
    <td width="23%" height="22" c>Shipping Type</td>
    <td width="19%" height="22" c>Local Price</td>
    <td width="16%" height="22" c>Re-order SEQ</td>
  </tr>
  <tr class='table_list_center'>
    <td width="21%" height="27" ><%=mname%></td>
    <td width='21%' height="27" ><%= brand %></td>
    <td width="23%" height="27" ><%=ship_type%></td>
    <td width="19%" height="27" ><%=local_price%></td>
    <td width="16%" height="27" ><%=reorder_seq%></td>
  </tr>
   
</table>

<table width='700' border='1' cellspacing='1' cellpadding='2' align='center' bordercolor='black'>
  <tr class='table_header'>
    <td width="20%" rowspan="2" height="38">*Color</td>
    <td width="67%" colspan="6" height="16">*Size</td>
    <td width="13%" rowspan="2" height="38">TOTAL</td>
  </tr>
  <tr class='table_header'>
    <td width="11%" height="21"><font size="2"><%= size_1 %></font></td>
    <td width="11%" height="21"><font size="2"><%= size_2 %></font></td>
    <td width="11%"  height="21"><font size="2"><%= size_3 %></font></td>
    <td width="11%" height="21"><font size="2"><%= size_4 %></font></td>
    <td width="11%" height="21"><font size="2"><%= size_5 %></font></td>
    <td width="12%" height="21"><font size="2"><%= size_6 %></font></td>
  </tr>
<%=outS%>                                               
</table>
</tr></td>
</table>
2) PT# List
<table width='700' border='0'  cellspacing='0' cellpadding='0'>
<tr>
  <td></td>
  <td align='right'>Total : <%= iRet3 %></td>
</tr>
</table>
<table width='700' border='0'  cellspacing='0' cellpadding='0'>
<tr class='table_header_center'>
  <td>SEQ</td>
  <td>PT# DATE</td>
  <td colspan="2">ºñ °í </td>
</tr>
<%= outS2 %>
</table>
<font size=2 color=blue > 3) Click "Create New" button to add new PT#. </font><br>
*Click 'seq' coloum to edit PT# detail then save it.
<table width='700' border='0'  cellspacing='0' cellpadding='0'>
<form name='form1' method='post'>
<input type='hidden' name='actionFlag' value='I'>
<input type='hidden' name='po_no' value='<%= pono %>'>
<input type='hidden' name='ag_orderby' value='<%= ag_orderby %>'>
<input type='hidden' name='ag_status' value='<%= ag_status %>'>
<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
<input type='hidden' name='ag_style_no' value='<%= ag_style_no %>'>
<input type='hidden' name='ag_supplier' value='<%= ag_supplier %>'>
<input type='hidden' name='ag_from_date' value='<%= ag_from_date %>'>
<input type='hidden' name='ag_to_date' value='<%= ag_to_date %>'>	
<tr>
  <td width='20%' class='table_header_center'>SEQ(*)</td>
  <td width='30%' bgcolor = '#e8e8e8' ><input type='text' name='seqno' size='30' maxlength='10' readonly ></td>
  <td width='20%' class='table_header_center'>PT# DATE (*)</td>
  <td width='30%' class='table_bg_bright'><input type='text' name='pt_date' size='10' value='<%= pt_date %>' style='cursor:hand' readonly
    onclick="javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);"><a href="javascript:fnClearDate(form1.pt_date)"></td>
</tr>
<tr>
  <td class='table_header_center'>Note</td>
  <td class='table_bg_bright' colspan="3"><input type='text' name='pt_info' size='100' maxlength='100'></td>
</tr>
</table>
<table width='700' border='0'  cellspacing='0' cellpadding='0'>
<tr>
  <td height='15'></td>
</tr>
</table>
<table width='700' border='0'  cellspacing='0' cellpadding='0'>
<tr>
  <td height='15'></td>
</tr>
<tr>
  <td align='center' colspan='2' >
  	  <input type='button' value='Go Back' onclick='fnBack(this.form);' class="button_default">
  	 <%
  	   if ( _adminclass.equals("1")) {
     %>     
    <input type='button' value='Create New' onclick='fnNew(this.form);' class="button_default">
    <input type='button' value='Save' onclick='fnSave(this.form);' class="button_default">
    <input type='button' value='Delete' onclick='fnDelete(this.form);' class="button_default">
      <% } %>
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