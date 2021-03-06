<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/calendar/calendar.htm" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_orderby = request.getParameter("ag_orderby");
String ag_style_no = request.getParameter("ag_style_no");

String style_no_selected = request.getParameter("style_no_selected");
request.setCharacterEncoding("euc-kr"); 
if (ag_style_no == null || ag_style_no =="") {
   ag_style_no = style_no_selected;
}
if (style_no_selected == null || style_no_selected =="") {
    //style_no_selected = "noimage";
    style_no_selected = ag_style_no;
}
String DATE_FORMAT = "yyyy/MM/dd hh:mm aa";
String imgUrl = "<font color=red>Image<br>Not Ready</font>";
String page_title = "";

String print_date = DateUtil.getFmtDateString(new java.util.Date(), DATE_FORMAT);
int iRet = 0;
int iRet2 = 0;
String strSep = "|!^";
String outS = "";

String sql = "";
String today = DateUtil.getToday("yyyy/MM/dd");

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
String local_price ="";
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
String amend_date   = "";
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
DataProcess dataProcess = null;

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
 // Select PO master  
  sql = "  Select ORDER_NO ,  STYLE , SEASON ,  SGR ,  PGR  , "
	      + "   FABRIC, ITEM_TEXT, SUP_STOCK_CODE, VENDOR_PRICE,  date_format(INITIAL_DEL_DATE,'%Y/%m/%d'), "
	      + "   TRANS_TYPE , ORDER_STATUS ,CURRENCY_CODE, BRAND , "
	      + "   BUYER,SUPPLIER  , SUBSUPPLIER, date_format(DELIVERY_DATE,'%Y/%m/%d'), "
	      + "   SIZC_1,SIZC_2,SIZC_3,SIZC_4,SIZC_5,SIZC_6, "
	      + "   COMMENTS,TOTAL_QTY,date_format(ORDER_DATE,'%Y/%m/%d'),date_format(ARRIVAL_DATE,'%Y/%m/%d'),PO_TYPE,LOCAL_PRICE,REORDER_SEQ, "
	      + "  date_format(AMEND_DATE,'%Y/%m/%d') "
	      + " from purchase_order "
	      + " where style = '"+ag_style_no+"' " 
	      + " and buyer = '" + scmid + "' ";
//out.println(sql);	      
  iRet = dataProcess.RetrieveData(sql, matrix, conn);	  
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
		  amend_date = matrix.getRowData(i).getData(j++);						
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
%>
<html>
<head>	
<title><%= page_title %></title>
<link href='style_print.css' rel='stylesheet' type='text/css'>
<script language='javascript' src='/common/js/util.js'></script>
<script language=JavaScript>
function fnSubmit(frm) {
  frm.submit();
}

</script>
</head>
<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0' >
<table width='700' border='0' cellspacing='0' cellpadding='0' >
<tr>
  <td height='15' colspan='2'></td>
</tr>
<tr>
  <td width='3%'><img src='/img/address.jpg'></td>
  <td width='*' class='left_title'><font size=4><b>Style Detail</b></font></td>
</tr>
<tr>
  <td width='700' height='2' colspan='2'><hr width='100%'></td>
</tr>
<tr>
  <td height='10' colspan='2'></td>
</tr>
</table>	
<table border='0' width='700' >
<form name='frmMain' method='post' action='./buyer_item_history_list.jsp'>
	<input type='hidden' name='ag_style_no' value='<%= ag_style_no %>'>
<input type='hidden' name='ag_from_date' value='<%= ag_from_date %>'>
<input type='hidden' name='ag_to_date' value='<%= ag_to_date %>'>
<tr>
<TD align=center width=100%> <INPUT TYPE='button' VALUE="Back" onclick='fnSubmit(this.form);'>
</td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>
<table width='700' border='1' bordercolor='black' cellspacing='0' cellpadding='0'>
<tr><td>
<table width='700' border='1' cellspacing='0' cellpadding='0' align='center' bordercolor='black'>
  <tr class='table_header'>
    <td width="21%" height="16" >*PO#</td>
    <td width="21%" height="16" >*Style#</td>
    <td width="23%" height="16" >*Buyer</td>
    <td width="35%" colspan="2" height="16" >Supplier</td>
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
    <td width="19%" height="22" >Material</td>
    <td width="16%" height="22" >BRAND</td>
  </tr>
  <tr class='table_list_center'>
    <td width="21%" height="27" ><%=trans_type%></td>
    <td width='21%' ><%= ship_date %></td>
    <td width="23%" height="27" ><%=season%></td>
    <td width="19%" height="27" ><%=mname%></td>
    <td width="16%" height="27" ><%= brand %></td>
  </tr>
  <tr class='table_header'>
    <td width="21%" height="22" >Shipping Type</td>
    <td width="21%" height="22" >Re-order SEQ</td>
    <td width="23%" height="22"  colspan=3 ></td>
    <!--td width="19%" height="22" ></td>
    <td width="16%" height="22" ></td-->
  </tr>
  <tr class='table_list_center'>
    <td width="21%" height="27" ><%=ship_type%></td>
    <td width='21%' height="27" ><%=reorder_seq%></td>
    <td width="23%" height="27" colspan=3></td>
    <!--td width="19%" height="27" ></td>
    <td width="16%" height="27" ></td-->
  </tr>
  
  <tr class='table_header'>
    <td width="21%" height="28" >*Item text</td>
    <td width="79%" colspan="4" height="28" ><%= itemtext %></td>
  </tr>  
  <tr class='table_list_center'>  	 
  	<td  align='center'><%= imgUrl %></td>    
    <td width="79%" colspan="4" height="202" ><TEXTAREA name="contents" cols="80" rows="14"  ><%= comments %></TEXTAREA></td>
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
</form>
<%
out.println(CopyRightLogo());
%>
</body>

</html>