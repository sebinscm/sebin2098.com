<%@page import="java.io.*" %>
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
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";
String po_no = request.getParameter("po_no_selected");
String style_no = request.getParameter("style_selected");
String buyer_id = request.getParameter("buyer_selected");

String ag_supplier = request.getParameter("ag_supplier");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_orderby = request.getParameter("ag_orderby");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");


request.setCharacterEncoding("euc-kr"); 
String fromUrl = request.getParameter("fromUrl");
if (fromUrl == null) fromUrl = request.getHeader("Referer");
String imgUrl = "<font color=red>Image<br>Not Ready</font>";
int iRet = 0;
int iRet2 = 0;
String confirm_msg="";
String strSep = "|!^";
String outS = "";
String outSub1="";
String outSub2="";
String outSub3="";
String outSub4="";
String outSub5="";
String outSub6="";
String update_flag="";

String sql = "";
String sql2 = "";
String today = DateUtil.getToday("yyyy/MM/dd");

String buyer_code="";
String supplier_code ="";
String subsupplier_code="";
String sgr_code ="";
String pgr_code ="";
String season_code ="";
String  pono         ="";
String  style          ="";
String  season         ="";
String  sgr            ="";
String  pgr            ="";
String  reorder_seq    ="";
String  sub_supplier   ="";
String  buyer          ="";
String  supplier       ="";
String  main_width     ="";
String  cost_status ="";
double main_qty       =0d;
double main_unit_price=0d;
double main_total    =0d;
String  main_text      ="";
double  color_qty     =0d;   
String  color_width    ="";
double color_unit_price=0d;   
double color_total   =0d;   
String  color_text     ="";
double  inner_qty      =0d;   
String  inner_width    ="";
double inner_unit_price=0d;   
String  inner_text     ="";
double inner_total  =0d;   
double make_price     =0d;   
String  make_text     ="";
String  sub1_width     ="";
double  sub1_qty       =0d;   
double  sub1_unit_price=0d;   
double  sub1_total   =0d;   
String  sub1_text      ="";
String  sub2_width     ="";
double sub2_qty       =0d;   
double sub2_unit_price=0d;   
double sub2_total    =0d;   
String  sub2_text      ="";
String  sub3_width     ="";
double sub3_qty       =0d;   
double sub3_unit_price=0d;   
double sub3_total    =0d;   
String  sub3_text      ="";
String  sub4_width     ="";
double  sub4_qty       =0d;   
double  sub4_unit_price=0d;   
double  sub4_total    =0d;   
String  sub4_text      ="";
String  sub5_width     ="";
double  sub5_qty      =0d;   
double  sub5_unit_price=0d;   
double  sub5_total    =0d;   
String  sub5_text      ="";

String  sub6_width     ="";
double  sub6_qty       =0d;   
double  sub6_unit_price=0d;   
double  sub6_total   =0d;   
String  sub6_text      ="";

String  sub7_width     ="";
double  sub7_qty      =0d;   
double  sub7_unit_price=0d;   
double  sub7_total    =0d;   
String  sub7_text      ="";

String  sub8_width     ="";
double sub8_qty       =0d;   
double sub8_unit_price=0d;   
double sub8_total    =0d;   
String  sub8_text      ="";

String  sub9_width     ="";
double  sub9_qty       =0d;   
double  sub9_unit_price=0d;   
double  sub9_total    =0d;   
String  sub9_text      ="";


double  cost_price    =0d;   
double rrp_price   =  0d;
double  profit        =0d;   
String  content        ="";
String  status         ="";
String  supname       ="";
double  unit_price = 0d;
double  total_price  =0d;   
String subcode1 ="";
String subcode2 ="";
String subcode3 ="";
String subcode4 ="";
String subcode5 ="";
String subcode6 ="";
String scode  = "";
String sname  = "";

Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
DataProcess dataProcess = null;

try {

  matrix = new dbconn.MatrixDataSet();
  matrix2 = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  
  // get PO basic info
	sql = " select  a.reorder_seq,ifnull(a.vendor_price,0),ifnull(a.local_price,0), ifnull(a.total_qty,0) * ifnull(a.vendor_price,0) , b.name, "
	             + " a.supplier, a.buyer,a.subsupplier,a.sgr,a.pgr,a.season "
			      + " from   purchase_order a left outer join login_01t  b "
			      + "                              on (a.subsupplier = b.id and b.user_type = 'P' ) "
	             + " where a.order_no = '"+po_no+"' " 
	             + "       and a.style = '" + style_no +"' "
	             + "       and a.buyer = '" + buyer_id +"' ";
	//out.println(sql);
	//if (true) return;	            
	iRet = dataProcess.RetrieveData(sql, matrix, conn);	
	reorder_seq  = matrix.getRowData(0).getData(0);
	unit_price  = Double.parseDouble(matrix.getRowData(0).getData(1));
	rrp_price  = Double.parseDouble(matrix.getRowData(0).getData(2));
//	total_price  = Double.parseDouble(matrix.getRowData(0).getData(3));
	supname  = matrix.getRowData(0).getData(4);  
    supplier_code  = matrix.getRowData(0).getData(5);  	 
    buyer_code  = matrix.getRowData(0).getData(6);  
    subsupplier_code  = matrix.getRowData(0).getData(7);  
    sgr_code  = matrix.getRowData(0).getData(8);  
    pgr_code  = matrix.getRowData(0).getData(9);  
    season_code  = matrix.getRowData(0).getData(10);  
    
  
 // Select cost master  
  sql =  "  Select ORDER_NO     ,  "
			+"  STYLE           ,  "
			+"  SEASON          ,  "
			+"  SGR             ,  "
			+"  PGR             ,  "
			+"  SUB_SUPPLIER    ,  "
			+"  BUYER           ,  "
			+"  SUPPLIER        ,  "
			+"  MAIN_WIDTH      ,  "
			+"  MAIN_QTY        ,  "
			+"  MAIN_UNIT_PRICE ,  "
			+"  MAIN_total     ,  "
			+"  MAIN_TEXT       ,  "
			+"  COLOR_QTY       ,  "
			+"  COLOR_WIDTH     ,  "
			+"  COLOR_UNIT_PRICE,  "
			+"  COLOR_TOTAL    ,  "
			+"  COLOR_TEXT      ,  "
			+"  INNER_QTY       ,  "
			+"  INNER_WIDTH     ,  "
			+"  INNER_UNIT_PRICE,  "
			+"  INNER_TEXT      ,  "
			+"  INNER_TOTAL    ,  "
			+"  MAKE_PRICE      ,  "
		  +"  MAKE_TEXT      ,  "
			+"  SUB1_WIDTH      ,  "
			+"  SUB1_QTY        ,  "
			+"  SUB1_UNIT_PRICE ,  "
			+"  SUB1_TOTAL     ,  "
			+"  SUB1_TEXT       ,  "
			+"  SUB2_WIDTH      ,  "
			+"  SUB2_QTY        ,  "
			+"  SUB2_UNIT_PRICE ,  "
			+"  SUB2_TOTAL     ,  "
			+"  SUB2_TEXT       ,  "
			+"  SUB3_WIDTH      ,  "
			+"  SUB3_QTY        ,  "
			+"  SUB3_UNIT_PRICE ,  "
			+"  SUB3_TOTAL     ,  "
			+"  SUB3_TEXT       ,  "
			+"  SUB4_WIDTH      ,  "
			+"  SUB4_QTY        ,  "
			+"  SUB4_UNIT_PRICE ,  "
			+"  SUB4_TOTAL     ,  "
			+"  SUB4_TEXT       ,  "
			+"  SUB5_WIDTH      ,  "
			+"  SUB5_QTY        ,  "
			+"  SUB5_UNIT_PRICE ,  "
			+"  SUB5_TOTAL     ,  "
			+"  SUB5_TEXT       ,  "
			+"  SUB6_WIDTH      ,  "
			+"  SUB6_QTY        ,  "
			+"  SUB6_UNIT_PRICE ,  "
			+"  SUB6_TOTAL     ,  "
			+"  SUB6_TEXT       ,  "
			+"  SUB7_WIDTH      ,  "
			+"  SUB7_QTY        ,  "
			+"  SUB7_UNIT_PRICE ,  "
			+"  SUB7_TOTAL     ,  "
			+"  SUB7_TEXT       ,  "
			+"  SUB8_WIDTH      ,  "
			+"  SUB8_QTY        ,  "
			+"  SUB8_UNIT_PRICE ,  "
			+"  SUB8_TOTAL     ,  "
			+"  SUB8_TEXT       ,  "
			+"  SUB9_WIDTH      ,  "
			+"  SUB9_QTY        ,  "
			+"  SUB9_UNIT_PRICE ,  "
			+"  SUB9_TOTAL     ,  "
			+"  SUB9_TEXT       ,  "																
			+"  COST_PRICE      ,  "
			+"  RRP_PRICE       ,  "
			+"  PROFIT          ,  "
			+"  CONTENT         ,  "
			+"  STATUS          ,  "
			+"  SUB1_CODE    ,  "
			+"  SUB2_CODE    ,  "
			+"  SUB3_CODE    ,  "	
			+"  SUB4_CODE    ,  "
			+"  SUB5_CODE    ,  "
			+"  SUB6_CODE    ,  "
			+"  STATUS         ,  "
			+"  USERID            "
	       + " from cost_01t "
	       + " where order_no = '"+po_no+"' " 
	       + "       and style = '" + style_no +"' "
	       	+ "       and buyer = '" + buyer_id +"' ";
  // out.println(sql);	      
  iRet = dataProcess.RetrieveData(sql, matrix, conn);	  
  if ( iRet > 0 ) { 
      update_flag ="UPDATE";   
	  for (int i = 0; i < iRet; i++) {
		    int j = 0;
		     pono          =matrix.getRowData(i).getData(j++);
		     style          =matrix.getRowData(i).getData(j++);
			 season         =matrix.getRowData(i).getData(j++);
			 sgr            =matrix.getRowData(i).getData(j++);
			 pgr            =matrix.getRowData(i).getData(j++);
			 sub_supplier   =matrix.getRowData(i).getData(j++);
			 buyer          =matrix.getRowData(i).getData(j++);
			 supplier       =matrix.getRowData(i).getData(j++);
			 main_width     =matrix.getRowData(i).getData(j++);
			 main_qty       =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 main_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 main_total    =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 main_text      =matrix.getRowData(i).getData(j++);
			 color_qty      =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 color_width    =matrix.getRowData(i).getData(j++);
			 color_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 color_total   =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 color_text     =matrix.getRowData(i).getData(j++);
			 inner_qty      =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 inner_width    =matrix.getRowData(i).getData(j++);
			 inner_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 inner_text     =matrix.getRowData(i).getData(j++);
			 inner_total   =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 make_price     =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 make_text     =matrix.getRowData(i).getData(j++);
			 sub1_width     =matrix.getRowData(i).getData(j++);
			 sub1_qty       =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub1_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub1_total    =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub1_text      =matrix.getRowData(i).getData(j++);
			 sub2_width     =matrix.getRowData(i).getData(j++);
			 sub2_qty       =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub2_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub2_total    =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub2_text      =matrix.getRowData(i).getData(j++);
			 sub3_width     =matrix.getRowData(i).getData(j++);
			 sub3_qty       =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub3_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub3_total    =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub3_text      =matrix.getRowData(i).getData(j++);
			 sub4_width     =matrix.getRowData(i).getData(j++);
			 sub4_qty       =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub4_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub4_total    =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub4_text      =matrix.getRowData(i).getData(j++);
			 sub5_width     =matrix.getRowData(i).getData(j++);
			 sub5_qty       =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub5_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub5_total    =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub5_text      =matrix.getRowData(i).getData(j++);
			 sub6_width     =matrix.getRowData(i).getData(j++);
			 sub6_qty       =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub6_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub6_total    =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub6_text      =matrix.getRowData(i).getData(j++);			 
			 sub7_width     =matrix.getRowData(i).getData(j++);
			 sub7_qty       =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub7_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub7_total    =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub7_text      =matrix.getRowData(i).getData(j++);			 
			 sub8_width     =matrix.getRowData(i).getData(j++);
			 sub8_qty       =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub8_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub8_total    =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub8_text      =matrix.getRowData(i).getData(j++);			 
			 sub9_width     =matrix.getRowData(i).getData(j++);
			 sub9_qty       =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub9_unit_price=Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub9_total    =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 sub9_text      =matrix.getRowData(i).getData(j++);			 
			 cost_price     =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 total_price      =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 profit         =Double.parseDouble(matrix.getRowData(i).getData(j++));
			 content        =matrix.getRowData(i).getData(j++);
			 status         =matrix.getRowData(i).getData(j++);
			 subcode1 	 =matrix.getRowData(i).getData(j++);
			 subcode2 	 =matrix.getRowData(i).getData(j++);		
			 subcode3 	 =matrix.getRowData(i).getData(j++);		
			 subcode4 	 =matrix.getRowData(i).getData(j++);		
			 subcode5 	 =matrix.getRowData(i).getData(j++);		
			 subcode6 	 =matrix.getRowData(i).getData(j++);
			 cost_status =matrix.getRowData(i).getData(j++);		
			 		
        } 

		  if ( cost_status.equals("Y") ) {
		      confirm_msg = " <font color=red> (Selected data cannot be edited because the production cost has been confirrmed.)</font>";
		  } else {
		  	  confirm_msg = " <font color=blue>(Production cost of selected data has not been confirmed.)</font>";
		  }	
				 
  } else {
  	  cost_status ="N";   //신규등록
  	  update_flag ="INSERT";   
  	  
      outS = " <font color=red size=2> * There is no information of registered production cost. Please register it first. *</font>";
  }

  File imgFile = new File(application.getRealPath(_styleImgURL) + File.separator + style_no.toLowerCase() + ".jpg");
  if (imgFile.exists()) {
      	    imgUrl = "<img src='" + _styleImgURL + "/" + style_no.toLowerCase() + ".jpg' width='208' height='302'>";
  } else {
	    imgUrl = "<img src='" + _styleImgURL + "/noimage.jpg' width='208' height='320'>";
  }	
         // get SUB code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'SUB_MAT' "
      + " order by sort_order asc";
  iRet2 = dataProcess.RetrieveData(sql, matrix2, conn);  
  outSub1  = "<option value='N' >Select</option>";
  for (int i = 0; i < iRet2; i++) {
     scode  = matrix2.getRowData(i).getData(0);
     sname  = matrix2.getRowData(i).getData(1);     
     outSub1  += "<option value=\"" + scode + "\"";         
     if ( subcode1.equals(scode) ) {
        outSub1  += " SELECTED ";  
     }
     outSub1  += ">"+ sname + "</option >'";        
   }
   
   outSub2  = "<option value='N' >Select</option>";
   for (int i = 0; i < iRet2; i++) {
      scode   = matrix2.getRowData(i).getData(0);
      sname  = matrix2.getRowData(i).getData(1);
      outSub2  += "<option value=\"" + scode + "\"";    
      if ( subcode2.equals(scode) ) {
        outSub2  += " SELECTED ";  
      }
      outSub2  += ">"+ sname + "</option >'";   
  } 
  
  outSub3  ="<option value='N' >Select</option>";
  for (int i = 0; i < iRet2; i++) {
      scode   = matrix2.getRowData(i).getData(0);
      sname  = matrix2.getRowData(i).getData(1);
    outSub3  += "<option value=\"" + scode + "\"";    
    if ( subcode3.equals(scode) ) {
       outSub3  += " SELECTED ";  
    }
    outSub3  += ">"+ sname + "</option >'";   
   } 
   
  outSub4  = "<option value='N' >Select</option>";
  for (int i = 0; i < iRet2; i++) {
      scode   = matrix2.getRowData(i).getData(0);
      sname  = matrix2.getRowData(i).getData(1);
    outSub4  += "<option value=\"" + scode + "\"";    
    if ( subcode4.equals(scode) ) {
       outSub4  += " SELECTED ";  
    }
    outSub4  += ">"+ sname + "</option >'";   
   } 
   
   outSub5  ="<option value='N' >Select</option>";
  for (int i = 0; i < iRet2; i++) {
      scode   = matrix2.getRowData(i).getData(0);
      sname  = matrix2.getRowData(i).getData(1);
    outSub5  += "<option value=\"" + scode + "\"";    
    if ( subcode5.equals(scode) ) {
       outSub5  += " SELECTED ";  
    }
    outSub5  += ">"+ sname + "</option >'";   
   } 
   
  outSub6  = "<option value='N' >Select</option>";
  for (int i = 0; i < iRet2; i++) {
      scode   = matrix2.getRowData(i).getData(0);
      sname  = matrix2.getRowData(i).getData(1);
    outSub6  += "<option value=\"" + scode + "\"";    
    if ( subcode6.equals(scode) ) {
       outSub6  += " SELECTED ";  
    }
    outSub6  += ">"+ sname + "</option >'";   
   } 
} catch (Exception e) {
  System.out.println("Exception /admin/account/supplier : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}	
}
%>
<html>
<head>
<title> </title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<script language="javaScript" src="/common/js/validate2.js"></script>
<script language="javascript">
function fnSave(frm) { 
  if (!frm.cost_price.value) {
    alert('Input production cost!');
    frm.cost_price.focus();
    return;
  }
    if (!frm.total_price.value) {
    alert('Input factory price!');
    frm.total_price.focus();
    return;
  }
   if (!frm.profit.value) {
    alert('Select!');
    frm.profit.focus();
    return;
  }
  if (confirm('Do you really want to save these data?')) { 
    frm.action = './cost_update.jsp';
    frm.submit();
  }
}

function Change() {
  num1 = form1.cost_price.value;
  if( num1.length == 0 ) {
    num1 = "0";
    form1.cost_price.value = "0";
  }
  num2 = form1.total_price.value;
  if( num2.length == 0 ) {
    num2 = "0";
    form1.total_price.value = "0";
  }   

  var tmpTotal = eval(num1) - eval(num2) 
  form1.profit.value = tmpTotal;
}

function fnBack(frm) {
  frm.action = "<%= fromUrl %>";
  frm.target = this.name;
  frm.submit();
}
function fnList(frm)
{ 
  frm.action = "./cost_management.jsp";  
  frm.submit(); 
}

function fnConfirm(frm)
{ 
  if (confirm('Production cost cannot be edited after confirmed. Do you want to confirm the production cost?')) { 	
      frm.action = "./cost_confirm.jsp";  
      frm.submit(); 
  }
}

function fnPrint(frm) {
  //var win = window.open('', "winPrint", "toolbar=no, menubar=no, resizable=no, scrollbars=yes, width=1000, height=900");

  //if (win) {
    frm.action = './cost_print.jsp';  
  //  frm.target = win.name;
    frm.submit();
  //}

}
</script>
</head>
<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>	
<table width='99%' border='0' cellspacing='0' cellpadding='0' align="center">
<tr>
  <td height='15' colspan='2'></td>
</tr>
<tr>
  <td width='3%'><img src='/img/update.jpg'></td>
  <td width='*' class='left_title'>Production cost detail <%= outS %></td>
</tr>
<tr>
  <td width='100%' height='2' colspan='2'><hr width='100%'></td>
</tr>
<tr>
  <td height='10' colspan='2'></td>
</tr>
</table>
<table width='850' border='0' cellspacing='0' cellpadding='0'>
<tr><td>
(*) Marked items must be filled in. The cost should be confirmed by manager only.<br>
   <font color=red>Note) Confirmed price cannot be edited. </font>

<table width='100%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>
<form name="form1" method="post">
	<INPUT TYPE=HIDDEN NAME=update_flag VALUE='<%= update_flag %>' >
	<input type='hidden' name='ag_orderby' value='<%= ag_orderby %>'>
	<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
	<input type='hidden' name='ag_style_no' value='<%= ag_style_no %>'>
	<input type='hidden' name='ag_supplier' value='<%= ag_supplier %>'>
	<input type='hidden' name='ag_from_date' value='<%= ag_from_date %>'>
	<input type='hidden' name='ag_to_date' value='<%= ag_to_date %>'>
	<input type='hidden' name='fromUrl' value='<%= fromUrl %>'>
	<input type='hidden' name='po_no_selected' value='<%= po_no %>' >
    <input type='hidden' name='style_selected' value='<%= style_no %>' >
    <input type='hidden' name='buyer_selected' value='<%= buyer_id %>' >
    <input type='hidden' name='supplier_code' value='<%= supplier_code %>' >
    <input type='hidden' name='buyer_code' value='<%= buyer_code %>' >
    <input type='hidden' name='subsupplier_code' value='<%= subsupplier_code %>' >
    <input type='hidden' name='sgr_code' value='<%= sgr_code %>' >
    <input type='hidden' name='pgr_code' value='<%= pgr_code %>' >
    <input type='hidden' name='season_code' value='<%= season_code %>' >
    
   <tr class="table_header_center">
	   <td class='table_bg_bright' align=center colspan='8' ><font face="Arial" size=4 ><b> PRODUCTION COST DETAIL </b></font><br><%= confirm_msg %></td>
   </tr>			
  <tr class="table_header_center">
    <td width="12%" class='table_header_center' height="41"><font face="Arial">Style.No<br>Style No.</font></td>
    <td width="14%" class='table_bg_bright'  height="41"><%= sgr_code %><%= style_no %> </td>
     <td width="54%" class='table_header_center' height="41" colspan="5"><font face="Arial"> MANUFACTURING</font></td>
    <td width="15%" class='table_header_center' height="41" rowspan="2"> SEBIN <font face="Arial"></font></td>
  </tr>
  <tr class="table_header_center">
    <td width="12%" class='table_header_center' height="45"><font face="Arial"> Manufacturer </font></td>
    <td width="14%" class='table_bg_bright' height="45"><%= supname %></td>
    <td width="14%" class='table_header_center' height="45" ><font face="Arial"> Description</font></td>
    <td width="10%" class='table_header_center' height="45"><font face="Arial"> Width </font></td>
    <td width="10%" class='table_header_center' height="45"><font face="Arial"> Length(m)</font></td>
    <td width="10%" class='table_header_center' height="45"><font face="Arial"> Unit Price(Won)</font></td>
    <td width="10%" class='table_header_center' height="45"><font face="Arial"> Total(Won)</font></td>
  </tr>
  <tr class="table_header_center">
    <td width="12%" class='table_header_center' ><font face="Arial"> Re-Order SEQ </font></td>
    <td width="14%" class='table_bg_bright' ><%= reorder_seq %> </td>
    <td width="14%" class='table_header_center' ><font face="Arial"> Main Fabric </font></td>
    <td width="10%" class='table_bg_bright' ><input type='text' value='<%= main_width %>' name='main_width' size='10' maxlength='10' class='input_text_right'></td>
    <td width="10%" class='table_bg_bright' ><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='main_qty'   value='<%=main_qty%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' ><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='main_unit_price' value='<%=main_unit_price%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' ><input type='text' value='<%= main_total %>' name='main_total' size='10' maxlength='10' class='input_text_right'> </td>
    <td width="15%" class='table_bg_bright' ><input type='text' value='<%= main_text %>' name='main_text' size='15' maxlength='200' class='input_text'> </td>
  </tr>
  <tr class="table_header_center">
    <td width="26%" class='table_bg_bright' height="225" rowspan="18" colspan="2"> <%= imgUrl %>  </td>
    <td width="14%" class='table_header_center' height="16" ><font face="Arial"> Colored Fabric </font></td>
    <td width="10%" class='table_bg_bright' height="16"><input type='text' value='<%= color_width %>' name='color_width' size='10' maxlength='10' class='input_text_right'></td>
    <td width="10%" class='table_bg_bright' height="16"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='color_qty'   value='<%=color_qty%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="16"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='color_unit_price' value='<%=color_unit_price%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="16"><input type='text' value='<%= color_total %>' name='color_total' size='10' maxlength='10' class='input_text_right'> </td>
    <td width="15%" class='table_bg_bright' height="16"><input type='text' value='<%= color_text %>' name='color_text' size='15' maxlength='200' class='input_text'> </td>
  </tr>
  <tr class="table_header_center">
    <td width="14%" class='table_header_center' height="16" ><font face="Arial">Inner Fabric </font></td>
    <td width="10%" class='table_bg_bright' height="16"><input type='text' value='<%= inner_width %>' name='inner_width' size='10' maxlength='10' class='input_text_right'></td>
    <td width="10%" class='table_bg_bright' height="16"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='inner_qty'   value='<%=inner_qty%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="16"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='inner_unit_price' value='<%=inner_unit_price%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="16"><input type='text' value='<%= inner_total %>' name='inner_total' size='10' maxlength='10' class='input_text_right'> </td>
    <td width="15%" class='table_bg_bright' height="16"><input type='text' value='<%= inner_text %>' name='inner_text' size='15' maxlength='200' class='input_text'> </td>
  </tr>
  <tr class="table_header_center">
    <td class='table_header_center' height="16" colspan="6"><font face="Arial">Sub-Material</font></td>
   </tr> 
  <tr class="table_header_center">
    <td width="14%" class='table_header_center' height="16" ><SELECT name=subcode1 > <%= outSub1 %> </SELECT></td>
     <td width="10%" class='table_bg_bright' height="16"><input type='text' value='<%= sub1_width %>' name='sub1_width' size='10' maxlength='10' class='input_text_right'></td>
    <td width="10%" class='table_bg_bright' height="16"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='sub1_qty'   value='<%=sub1_qty%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="16"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='sub1_unit_price' value='<%=sub1_unit_price%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="16"><input type='text' value='<%= sub1_total %>' name='sub1_total' size='10' maxlength='10' class='input_text_right'> </td>
    <td width="15%" class='table_bg_bright' height="16"><input type='text' value='<%= sub1_text %>' name='sub1_text' size='15' maxlength='200' class='input_text'> </td>
  </tr>
  <tr class="table_header_center">
    <td width="14%" class='table_header_center' height="16" ><SELECT name=subcode2 > <%= outSub2 %> </SELECT></td>
    <td width="10%" class='table_bg_bright' height="16"><input type='text' value='<%= sub2_width %>' name='sub2_width' size='10' maxlength='10' class='input_text_right'></td>
    <td width="10%" class='table_bg_bright' height="16"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='sub2_qty'   value='<%=sub2_qty%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="16"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='sub2_unit_price' value='<%=sub2_unit_price%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="16"><input type='text' value='<%= sub2_total %>' name='sub2_total' size='10' maxlength='10' class='input_text_right'> </td>
    <td width="15%" class='table_bg_bright' height="16"><input type='text' value='<%= sub2_text %>' name='sub2_text' size='15' maxlength='200' class='input_text'> </td>
  </tr>
  <tr class="table_header_center">
    <td width="14%" class='table_header_center' height="33"><SELECT name=subcode3 > <%= outSub3 %> </SELECT></td>
    <td width="10%" class='table_bg_bright' height="33"><input type='text' value='<%= sub3_width %>' name='sub3_width' size='10' maxlength='10' class='input_text_right'></td>
    <td width="10%" class='table_bg_bright' height="33"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='sub3_qty'   value='<%=sub3_qty%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="33"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='sub3_unit_price' value='<%=sub3_unit_price%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="33"><input type='text' value='<%= sub3_total %>' name='sub3_total' size='10' maxlength='10' class='input_text_right'> </td>
    <td width="15%" class='table_bg_bright' height="33"><input type='text' value='<%= sub3_text %>' name='sub3_text' size='15' maxlength='200' class='input_text'> </td>
  </tr>
  <tr class="table_header_center">
    <td width="14%" class='table_header_center' height="38" ><SELECT name=subcode4 > <%= outSub4 %> </SELECT></td>
    <td width="10%" class='table_bg_bright' height="38"><input type='text' value='<%= sub4_width %>' name='sub4_width' size='10' maxlength='10' class='input_text_right'></td>
    <td width="10%" class='table_bg_bright' height="38"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='sub4_qty'   value='<%=sub4_qty%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="38"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='sub4_unit_price' value='<%=sub4_unit_price%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="38"><input type='text' value='<%= sub4_total %>' name='sub4_total' size='10' maxlength='10' class='input_text_right'> </td>
    <td width="15%" class='table_bg_bright' height="38"><input type='text' value='<%= sub4_text %>' name='sub4_text' size='15' maxlength='200' class='input_text'> </td>
  </tr>
  <tr class="table_header_center">
    <td width="14%" class='table_header_center' height="33"><SELECT name=subcode5 > <%= outSub5 %> </SELECT></td>
    <td width="10%" class='table_bg_bright' height="33"><input type='text' value='<%= sub5_width %>' name='sub5_width' size='10' maxlength='10' class='input_text_right'></td>                                                                                                                                                        
    <td width="10%" class='table_bg_bright' height="33"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='sub5_qty'   value='<%=sub5_qty%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="33"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='sub5_unit_price' value='<%=sub5_unit_price%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="33"><input type='text' value='<%= sub5_total %>' name='sub5_total' size='10' maxlength='10' class='input_text_right'> </td>
    <td width="15%" class='table_bg_bright' height="33"><input type='text' value='<%= sub5_text %>' name='sub5_text' size='15' maxlength='200' class='input_text'> </td>
  </tr>
  <tr class="table_header_center">
    <td width="14%" class='table_header_center' height="38" ><SELECT name=subcode6 > <%= outSub6 %> </SELECT></td>
    <td width="10%" class='table_bg_bright' height="38"><input type='text' value='<%= sub6_width %>' name='sub6_width' size='10' maxlength='10' class='input_text_right'></td>
    <td width="10%" class='table_bg_bright' height="38"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='sub6_qty'   value='<%=sub6_qty%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="38"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='sub6_unit_price' value='<%=sub6_unit_price%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="38"><input type='text' value='<%= sub6_total %>' name='sub6_total' size='10' maxlength='10' class='input_text_right'> </td>
    <td width="15%" class='table_bg_bright' height="38"><input type='text' value='<%= sub6_text %>' name='sub6_text' size='15' maxlength='200' class='input_text'> </td>
  </tr>
  <tr class="table_header_center">
    <td width="14%" class='table_header_center' height="16" colspan="6"><font face="Arial">Misc.</font></td>
   </tr>
  <tr class="table_header_center">
    <td width="2%" class='table_header_center' height="13" ><font face="Arial">Washing Cost</font></td>
     <td width="10%" class='table_bg_bright' height="13"><input type='text' value='<%= sub7_width %>' name='sub7_width' size='10' maxlength='10' class='input_text_right'></td>
    <td width="10%" class='table_bg_bright' height="13"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='sub7_qty'   value='<%=sub7_qty%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="13"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='sub7_unit_price' value='<%=sub7_unit_price%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="13"><input type='text' value='<%= sub7_total %>' name='sub7_total' size='10' maxlength='10' class='input_text_right'> </td>
    <td width="15%" class='table_bg_bright' height="13"><input type='text' value='<%= sub7_text %>' name='sub7_text' size='15' maxlength='200' class='input_text'> </td>
  </tr>
  <tr class="table_header_center">
    <td width="12%" class='table_header_center' height="16" ><font face="Arial">Dying Cost</font></td>
    <td width="10%" class='table_bg_bright' height="16"><input type='text' value='<%= sub8_width %>' name='sub8_width' size='10' maxlength='10' class='input_text_right'></td>
    <td width="10%" class='table_bg_bright' height="16"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='sub8_qty'   value='<%=sub8_qty%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="16"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='sub8_unit_price' value='<%=sub8_unit_price%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="16"><input type='text' value='<%= sub8_total %>' name='sub8_total' size='10' maxlength='10' class='input_text_right'> </td>
    <td width="15%" class='table_bg_bright' height="16"> <input type='text' value='<%= sub8_text %>' name='sub8_text' size='15' maxlength='200' class='input_text' > </td>
  </tr>
  <tr class="table_header_center">
    <td width="12%" class='table_header_center' height="33" ><font face="Arial">Wrapping Cost</font></td>
    <td width="10%" class='table_bg_bright' height="33"><input type='text' value='<%= sub9_width %>' name='sub9_width' size='10' maxlength='10' class='input_text_right'></td>
    <td width="10%" class='table_bg_bright' height="33"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='sub9_qty'   value='<%=sub9_qty%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="33"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='sub9_unit_price' value='<%=sub9_unit_price%>' size='10' maxlength='10' class='input_text_right' ></td>
    <td width="10%" class='table_bg_bright' height="33"><input type='text' value='<%= sub9_total %>' name='sub9_total' size='10' maxlength='10' class='input_text_right'> </td>
    <td width="15%" class='table_bg_bright' height="33"><input type='text' value='<%= sub9_text %>' name='sub9_text' size='15' maxlength='200' class='input_text'> </td>
  </tr>  
  <tr class="table_header_center">
    <td width="14%" class='table_header_center' height="16" colspan="6"><font face="Arial">Process Cost</font></td>
   </tr>
   <tr class="table_header_center">
   	<td width="14%" class='table_header_center' height="16" ><font face="Arial"> Process Cost< </font></td>
    <td width="10%" class='table_bg_bright' height="16" colspan="4" align="right"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='make_price' value='<%=make_price%>' size='15' maxlength='15' class='input_text_right' ></td>
    <td width="15%" class='table_bg_bright' height="16"><input type='text' value='<%= make_text %>' name='make_text' size='15' maxlength='200' class='input_text_right'> </td>
  </tr>
  <tr class="table_header_center">
    <td width="14%" class='table_header_center' height="16" ><font face="Arial">*Product Cost </font></td>   
    <td width="10%" class='table_bg_bright' height="16" colspan="4" align="right"><input type='text'  onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='cost_price'   value='<%= cost_price %>' size='15' maxlength='15' class='input_text_right' onBlur='Change()'></td>
    <td width="15%" class='table_bg_bright' height="16">&nbsp; </td>
  </tr>
  <tr class="table_header_center">
    <td width="14%" class='table_header_center' height="34" ><font face="Arial">*Profit </font></td>
    <td width="10%" class='table_bg_bright' height="34" colspan="4" align="right"><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='profit'   value='<%= profit %>' size='15' maxlength='15' class='input_text_right' ></td>
    <td width="15%" class='table_bg_bright' height="34"><input type='text' value='<%= content %>' name='content' size='15' maxlength='200' class='input_text_right'></td>
  </tr>
  <tr class="table_header_center">
    <td width="14%" class='table_header_center' height="27" ><font face="Arial">*Final Factory Price </font></td>
    <td width="10%" class='table_bg_bright' height="27" colspan="4" align="right"> <input type='text'  onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='total_price'   value='<%= total_price %>' size='15' maxlength='15' class='input_text_right' onBlur='Change()' > </td>
    <td width="15%" class='table_bg_bright' height="27">&nbsp;</td>
  </tr>
 </table>
<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'>
<tr>
  <td height='15'></td>
</tr>
<tr>
  <td align='center'>
  	 <%
  	   if ( _adminclass.equals("1") && cost_status.equals("N") ) {
     %>
            <input type='button' value='Save' onclick='fnSave(this.form);'> 
     <%
      } 
     %>
    <input type='button' value='Print' onclick='fnPrint(this.form)'> 
    <input type='button' value=' List ' onclick='fnList(this.form);'>
    <%
      	   if (  _approval.equals("Y") &&  _adminclass.equals("1")  ) {
     %>
           <input type='button' value=' Confirm Price ' onclick='fnConfirm(this.form);'>
           <input type='button' value='Edit' onclick='fnSave(this.form);'> 
     <%
      } 
     %>    
  </td>
</tr>
</table>
</form>
<%
out.println(CopyRightLogo());
%>
</tr></td>
</table>
</body>
</html>