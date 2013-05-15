<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<!--@ page errorPage="/error.jsp" %-->
<%@ include file="/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/calendar/calendar.htm" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
String po_no = request.getParameter("po_no_selected");

String ag_supplier = request.getParameter("ag_supplier");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_status = request.getParameter("ag_status");
String ag_orderby = request.getParameter("ag_orderby");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");

request.setCharacterEncoding("euc-kr"); 
String fromUrl = "buyer_amend_details.jsp";
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

String buyer_addr1 = "";
String buyer_addr2 = "";
String buyer_fax = "";
String buyer_phone = "";

String supplier_addr1 = "";
String supplier_addr2 = "";
String supplier_fax = "";
String supplier_phone = "";
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
String reorder_seq   = "";
String ship_type="";
String amend_date   = "";
String buyerconfirm_text ="";
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
	      + "   COMMENTS,TOTAL_QTY,date_format(ORDER_DATE,'%Y/%m/%d'),date_format(ARRIVAL_DATE,'%Y/%m/%d'),po_type,reorder_seq, "
	      + "  date_format(AMEND_DATE,'%Y/%m/%d'),buyer_comments  "
	      + " from purchase_order "
	      + " where order_no = '"+po_no+"' ";
     
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
		  comments = toHtml(comments);
		  total_qty = matrix.getRowData(i).getData(j++);	
		  order_date = matrix.getRowData(i).getData(j++);
		  ship_date = matrix.getRowData(i).getData(j++);
		  ship_type = matrix.getRowData(i).getData(j++);		
		  reorder_seq = matrix.getRowData(i).getData(j++);
		  amend_date = matrix.getRowData(i).getData(j++);		
		  buyerconfirm_text  = matrix.getRowData(i).getData(j++);	
	 }	        
 }

   if ( Integer.parseInt(order_status) > 40 ) {
      page_title="PURCHASE ORDER";
   } else {
   	  page_title="Pre-PURCHASE ORDER";
   	}   
 // set item imagae
    File imgFile = new File(application.getRealPath(_styleImgURL) + File.separator + style_no.toLowerCase() + ".jpg");
	if (imgFile.exists()) {
	  imgUrl = "<img src='" + _styleImgURL + "/" + style_no.toLowerCase() + ".jpg' width='110' height='169'>";
	}
 // get buyer code
  sql = "  select  a.id, a.name,a.phone1,a.fax, concat(a.addr1,' ',a.addr2) as addr , " +
          "  concat(a.surburb,' ',a.state,' ',b.code_name) as addr2   " +
          "  from    login_01t a LEFT OUTER JOIN vg_common_code b ON ( a.country = b.code and b.type='COUNTRY_CODE') " +
          " where   a.user_type = 'B'  and a.id='"+buyer+"' " ;

      

  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    bid  = matrix.getRowData(i).getData(0);
    bname  = matrix.getRowData(i).getData(1);    
    buyer_phone = matrix.getRowData(i).getData(2);
    buyer_fax = matrix.getRowData(i).getData(3);
    buyer_addr1 = matrix.getRowData(i).getData(4);
    buyer_addr2 = matrix.getRowData(i).getData(5);
    
  }
  // get supplier code
     sql = "  select  a.id, a.name,a.phone1,a.fax, concat(a.addr1,' ',a.addr2) as addr , " +
          "  concat(a.surburb,' ',a.state,' ',b.code_name) as addr2   " +
          "  from    login_01t a LEFT OUTER JOIN vg_common_code b ON ( a.country = b.code and b.type='COUNTRY_CODE') " +
          " where   a.user_type = 'S'  and a.id='"+supplier+"' " ;
   
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    sid  = matrix.getRowData(i).getData(0);
    sname  = matrix.getRowData(i).getData(1);
    supplier_phone = matrix.getRowData(i).getData(2);
    supplier_fax = matrix.getRowData(i).getData(3);
    supplier_addr1 = matrix.getRowData(i).getData(4);
    supplier_addr2 = matrix.getRowData(i).getData(5);
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
      + " where order_no = '"+po_no+"' ";

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
  System.out.println("Exception /admin/account/supplier : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}	
}
%>

<%!
private String toHtml(String source)
{
    String nl="\n";
    String br="<br>";

    for( int index=0; (index= source.indexOf(nl, index)) >=0 ; index += br.length() )
        source = source.substring(0, index) + br + source.substring( index + nl.length() );
    return source;

}
%>
<html>
	
<head>
<title><%= page_title %></title>
<link href='style_print.css' rel='stylesheet' type='text/css'>
<script language="javaScript" src="/common/js/util.js"></script>
<SCRIPT LANGUAGE=JavaScript>
function fnPrint(frm) {
  //var win = window.open('', "winPrint", "toolbar=no, menubar=no, resizable=no, scrollbars=yes, width=1000, height=900");

  //if (win) {
    frm.action = './buyer_po_print.jsp';  
 //   frm.target = win.name;
    frm.submit();
 // }

}
 function fnBack2(frm) {
  //frm.po_no_selected.value = jf_AllTrim(frm.po_no.value);
  frm.action = "./buyer_order_amend_list.jsp";
  //frm.target = this.name;
  frm.submit();
}
 </SCRIPT> 	
</head>
<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0' >
<table width='650' border='0' cellspacing='0' cellpadding='0' align='center'>
	<FORM name='frmMain'  METHOD=POST>
     <input type='hidden' name='pono' value='<%= po_no %>' >	
    <input type='hidden' name='ag_orderby' value='<%= ag_orderby %>'>
   <input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
   <input type='hidden' name='ag_style_no' value='<%= ag_style_no %>'>
   <input type='hidden' name='ag_from_date' value='<%= ag_from_date %>'>
   <input type='hidden' name='ag_to_date' value='<%= ag_to_date %>'>	
   <input type='hidden' name='fromUrl' value='<%= fromUrl %>'>
<tr><td>
<table width='100%' border='0' cellspacing='0' cellpadding='2'>
<tr>
	<td width='100%' align='right'><font color=red><b>** 본 Purchase Order는 오더 확정 이후에 Amend(변경)가 되었습니다.** </b></td>
  <td width='100%' align='right'><img src='/img/sebin_mid.jpg'></td>
</tr>
</table>
<table width='100%' border='0' cellspacing='0' cellpadding='0'>
<tr>
  <td width='100%' height='10'><hr width='100%' size='1' noshade></td>
</tr>
</table>
<%
 if ( Integer.parseInt(order_status) < 43 ) {
%>
<table width='100%' border='0' cellspacing='0' cellpadding='2'>
<tr valign='top'>
  <td width='54%'><span class='font_title'><%= page_title %></span>
    <br><span class='font_subtitle'><br>P.O. #[<%= po_no %>]</span>
    <span class='font_small_1'><br>DATE: <%= print_date %></span>
    <span class='font_small_1_bold'><br>VENDOR: <%= sname %></span></td>
  <td width='46%'><span class='font_subtitle'>SEBIN ENTERPRISE CO,. LTD.</span>
    <span class='font_small_1'><br>Room#401 No.10 Building,#20-22,Chigang West Road Chigang West Road,HaiZhu District,Guangzhou CHINA
    <br>Phone +86.20.2837.6200 FAX +86.20.2837.6200
    <br>http://www.sebin2098.com</span></td>
</tr>
</table>
<table width='100%' border='1' bordercolor='black' cellspacing='0' cellpadding='2'>
<tr>
  <td width='100%' class='font_small_2'>**주)
    <ul>
      <li>Purchase Order가 Confirm되기 전까지는 정식 PO가 아니며 Pre-Purchase Order입니다.
      <li>본 Pre-Purchase Order는  Pro forma Purchase Order 단계임을 의미하며 정식 PO는 PO가 
      <li>확정되어 Confirm이된 이후에 정식 Purchase Order가 됩니다.</li>
    </ul>
  </td>
</tr>
</table>
<%
} else {
%>
<table width='100%' border='0' cellspacing='0' cellpadding='2'>
<tr valign='top'>
  <td width='54%'><span class='font_title'><%= page_title %></span>
    <br><span class='font_subtitle'><br>P.O. #[<%= po_no %>]</span>
    <span class='font_small_1'><br>DATE: <%= print_date %></span></td>
  <td width='46%'><span class='font_subtitle'><%= bname %></span>
    <span class='font_small_1'><br><%= buyer_addr1%>,<%= buyer_addr2%>
    <br>Phone: <%=buyer_phone%> FAX: <%=buyer_fax%>
    <br>&nbsp;</span></td>
</tr>
</table>
<table width='100%' border='0' cellspacing='0' cellpadding='0'>
<tr>
  <td width='100%' height='16'></td>
</tr>
</table>
<table width='100%' border='0' cellspacing='0' cellpadding='0'>
<tr>
  <td valign='top' width='54%'><table width='100%' border='0' cellspacing='0' cellpadding='2'>
    <tr>
      <td width='17%' valign='top' class='font_small_1_bold'>VENDOR</td>
      <td width='83%' valign='top' class='font_small_1'><%= sname %>
        <br><%= supplier_addr1 %>,<%= supplier_addr2 %>
        <br>Phone <%= supplier_phone %> Fax <%= supplier_fax %>
        <br>SUPPLIER ID: <%= sid %>
      </td>
    </tr>
  </table></td>
  <td valign='top' width='46%'><table width='100%' border='0' cellspacing='0' cellpadding='2'>
    <tr>
      <td width='14%' valign='top' class='font_small_1_bold'>SHIP<br>TO</td>
      <td width='86%' valign='top' class='font_small_1'><%=bname%>
        <br><%= buyer_addr1%>,<%= buyer_addr2%>
        <br>Phone <%=buyer_phone%> FAX <%=buyer_fax%>
      </td>
    </tr>
  </table></td>
</tr>
</table>
<%
}
%>

<table width='840' border='0' bordercolor='black' cellspacing='0' cellpadding='0'>
<tr><td>
<table width='100%' border='1' cellspacing='1' cellpadding='2' align='center' bordercolor='black' >
  <tr class='table_header'>
    <td width="21%" height="16" >*PO#</td>
    <td width="21%" height="16" >*Style#</td>
    <td width="23%" height="16" >*Buyer</td>
    <td width="35%" colspan="2" height="16" >Supplier</td>
  </tr>
  <tr class='table_list_center'>
    <td width="21%" height="23" ><%=po_no%></td>
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
    <td width="19%" height="22" >하청공장</td>
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
    <td width="21%" height="22" >소재 </td>
    <td width="21%" height="22" >BRAND</td>
    <td width="23%" height="22" >배송형태</td>
    <td width="19%" height="22" >리오더차수</td>
    <td width="16%" height="22" ><font color=red>Amend(변경)일자</font></td>
  </tr>
  <tr class='table_list_center'>
    <td width="21%" height="27" ><%=mname%></td>
    <td width='21%' height="27" ><%= brand %></td>
    <td width="23%" height="27" ><%= ship_type %></td>
    <td width="19%" height="27" ><%= reorder_seq %></td>
    <td width="16%" height="27" ><%= amend_date %></td>
  </tr>
  
  <tr class='table_header'>
    <td width="21%" height="28" >*Item text</td>
    <td width="79%" colspan="4" height="28" ><%= itemtext %></td>
  </tr>  
   <tr class='table_header'>
    <td width="21%" height="28" >Buyer Confirmed text</td>
    <td width="79%" colspan="4" height="28" ><%= buyerconfirm_text  %></td>
  </tr>   
  <tr class='table_list_center' >  	 
  	<td  align='center'><%= imgUrl %></td>    
    <td width="79%" colspan="4" height="202" align='left' VALIGN=TOP><%= comments %></td>
  </tr>  
</table>
<table width='840' border='1' cellspacing='1' cellpadding='2' align='center' bordercolor='black'>
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
</table>
<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'>
<tr>
  <td height='15'></td>
</tr>
<tr>
  <td align='center'>
  	<input type='button' value='PO Print' onclick='fnPrint(this.form)'> &nbsp;&nbsp;&nbsp;&nbsp;
    <input type='button' value='Back' onclick='fnBack2(this.form);'>
  </td>
</tr>
</FORM>
</table>
</body>

</html>