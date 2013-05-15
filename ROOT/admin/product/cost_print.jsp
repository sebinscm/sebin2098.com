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
String strSep = "|!^";
String outS = "";
String outSub1="&nbsp;";
String outSub2="&nbsp;";
String outSub3="&nbsp;";
String outSub4="&nbsp;";
String outSub5="&nbsp;";
String outSub6="&nbsp;";
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
	sql = " select  a.reorder_seq,ifnull(a.vendor_price,0), ifnull(a.local_price,0), ifnull(a.total_qty,0) * ifnull(a.vendor_price,0) , b.name, "
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
  } 

	File imgFile = new File(application.getRealPath(_styleImgURL) + File.separator + style_no.toLowerCase() + ".jpg");
	if (imgFile.exists()) {
		imgUrl = "<img src='" + _styleImgURL + "/" + style_no.toLowerCase() + ".jpg' width='208' height='302'>";
	}
  } else {
  	  update_flag ="INSERT";   
      outS = " <font color=red size=2> * There is no information of registered production cost. Please register it first.*</font>";
  }
  
         // get SUB code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'SUB_MAT' "
      + " order by sort_order asc";
  iRet2 = dataProcess.RetrieveData(sql, matrix2, conn);  
  for (int i = 0; i < iRet2; i++) {
     scode  = matrix2.getRowData(i).getData(0);
     sname  = matrix2.getRowData(i).getData(1); 
     if ( subcode1.equals(scode) ) {
        outSub1  =  sname;  
     }           
   }
   
   
   for (int i = 0; i < iRet2; i++) {
      scode   = matrix2.getRowData(i).getData(0);
      sname  = matrix2.getRowData(i).getData(1);        
      if ( subcode2.equals(scode) ) {
       outSub2  =  sname; 
      }
  } 
  
 
  for (int i = 0; i < iRet2; i++) {
      scode   = matrix2.getRowData(i).getData(0);
      sname  = matrix2.getRowData(i).getData(1);      
      if ( subcode3.equals(scode) ) {
         outSub3  =  sname; 
      }
     
   } 
   
  
  for (int i = 0; i < iRet2; i++) {
      scode   = matrix2.getRowData(i).getData(0);
      sname  = matrix2.getRowData(i).getData(1);   
      if ( subcode4.equals(scode) ) {
          outSub4  =  sname;  
     }
     
   } 
   
   
  for (int i = 0; i < iRet2; i++) {
      scode   = matrix2.getRowData(i).getData(0);
      sname  = matrix2.getRowData(i).getData(1);    
      if ( subcode5.equals(scode) ) {
        outSub4  =  sname;  
      }
    
   } 
     
  for (int i = 0; i < iRet2; i++) {
      scode   = matrix2.getRowData(i).getData(0);
      sname  = matrix2.getRowData(i).getData(1);
       
      if ( subcode6.equals(scode) ) {
        outSub6  =  sname;  
      }       
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
<link href='style_print.css' rel='stylesheet' type='text/css'>
<script language="javaScript" src="/common/js/util.js"></script>
<script language="javaScript" src="/common/js/validate2.js"></script>
<script language="javascript">

function fnBack(frm) {
  frm.action = "<%= fromUrl %>";
  frm.target = this.name;
  frm.submit();
}

</script>
</head>
<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0' onload='window.print();'>
<table width='99%' border='0' cellspacing='0' cellpadding='0' align="center">
<tr>
  <td height='15' colspan='2'></td>
</tr>
<tr>
  <td height='10' colspan='2'></td>
</tr>
</table>
<table width='650' border='0' cellspacing='0' cellpadding='0'>
<tr><td>
<table width='100%' border='1' cellspacing='1' cellpadding='2' align='center' bordercolor='black' >
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
    
   <tr >
	   <td    align=center colspan='2' ><img src='/img/sebin_mid.jpg' ></td>
	   <td  align=center colspan='5'><font size=4 ><b> Producttion Cost Detail </b></font> </td>
	   <td    align=right  >Date: <%= today %> </td>
   </tr>			
  <tr class='table_header'>
    <td width="12%"    height="41"><font face="Arial">Style.No<br>Style No.</font></td>
    <td width="14%"     height="41"><%= sgr_code %><%= style_no %> </td>
     <td width="54%"    height="41" colspan="5"><font face="Arial"> Manufacturer</font></td>
    <td width="15%"    height="41" rowspan="2"> SEBIN <font face="Arial"></font></td>
  </tr>
  <tr class='table_header'>
    <td width="12%"    height="45"><font face="Arial"> Manufacturer</font></td>
    <td width="14%"    height="45"><%= supname %></td>
    <td width="14%"    height="45" ><font face="Arial"> Description</font></td>
    <td width="10%"    height="45"><font face="Arial"> Width</font></td>
    <td width="10%"    height="45"><font face="Arial"> Length(m)</font></td>
    <td width="10%"    height="45"><font face="Arial"> Unit Price (Won)</font></td>
    <td width="10%"    height="45"><font face="Arial"> Total (Won)</font></td>   
  </tr>
  <tr class='table_list_center'>
    <td width="12%"    ><font face="Arial"> Re-Order SEQ </font></td>
    <td width="14%"    >&nbsp;<%= reorder_seq %> </td>
    <td width="14%"    >&nbsp;<font face="Arial"> Main Fabric </font></td>
    <td width="10%"    >&nbsp;<%= main_width %></td>
    <td width="10%"    >&nbsp;<%=main_qty%></td>
    <td width="10%"    >&nbsp;<%=StringUtil.formatNumber(main_unit_price, MONEY_FORMAT)%></td>
    <td width="10%"    >&nbsp;<%= StringUtil.formatNumber(main_total, MONEY_FORMAT) %> </td>
    <td width="15%"    >&nbsp;<%= main_text %> </td>
  </tr>
  <tr class='table_list_center'>
    <td width="26%"    height="225" rowspan="18" colspan="2"> <%= imgUrl %>  </td>
    <td width="14%"    height="16" ><font face="Arial"> Colored Fabric </font></td>
    <td width="10%"    height="16">&nbsp;<%= color_width %></td>                                                                                                                                                              
    <td width="10%"    height="16">&nbsp;<%=color_qty%></td>
    <td width="10%"    height="16">&nbsp;<%=StringUtil.formatNumber(color_unit_price, MONEY_FORMAT)%></td>
    <td width="10%"    height="16">&nbsp;<%= StringUtil.formatNumber(color_total, MONEY_FORMAT) %></td>                                                                                                                                                             
    <td width="15%"    height="16">&nbsp;<%= color_text %> </td>                                                                                                                                                              
  </tr>
  <tr class='table_list_center'>
    <td width="14%"    height="16" ><font face="Arial">Inner Fabric </font></td>
    <td width="10%"    height="16">&nbsp;<%= inner_width %></td>                                                                                                                                                              
    <td width="10%"    height="16">&nbsp;<%=inner_qty%></td>
    <td width="10%"    height="16">&nbsp;<%=StringUtil.formatNumber(inner_unit_price, MONEY_FORMAT)%></td>
    <td width="10%"    height="16">&nbsp;<%= StringUtil.formatNumber(inner_total, MONEY_FORMAT) %> </td>                                                                                                                                                             
    <td width="15%"    height="16">&nbsp;<%= inner_text %> </td>                                                                                                                                                              
  </tr>
  <tr class='table_header'>
    <td    height="16" colspan="6"><font face="Arial">Sub-Material</font></td>
   </tr> 
  <tr class='table_list_center'>
    <td width="14%"    height="16" > &nbsp;<%= outSub1 %> </td>
    <td width="10%"    height="33">&nbsp;<%= sub1_width %></td>                                                                                                                                                        
    <td width="10%"    height="33">&nbsp;<%=sub1_qty%></td>
    <td width="10%"    height="33">&nbsp;<%= StringUtil.formatNumber(sub1_unit_price, MONEY_FORMAT) %></td>
    <td width="10%"    height="33">&nbsp;<%= StringUtil.formatNumber(sub1_total, MONEY_FORMAT) %> </td>                                                                                                                                                       
    <td width="15%"    height="33">&nbsp;<%= sub1_text %>  </td>                                                                                                                                                       
  </tr>
  <tr class='table_list_center'>
    <td width="14%"    height="16" >&nbsp; <%= outSub2 %> </td>
    <td width="10%"    height="33">&nbsp;<%= sub2_width %></td>                                                                                                                                                        
    <td width="10%"    height="33">&nbsp;<%=sub2_qty%></td>
    <td width="10%"    height="33">&nbsp;<%= StringUtil.formatNumber(sub2_unit_price, MONEY_FORMAT) %></td>
    <td width="10%"    height="33">&nbsp;<%= StringUtil.formatNumber(sub2_total, MONEY_FORMAT) %> </td>                                                                                                                                                       
    <td width="15%"    height="33">&nbsp;<%= sub2_text %>  </td>                                                                                                                                                         
  </tr>
  <tr class='table_list_center'>
    <td width="14%"    height="33">&nbsp; <%= outSub3 %> </td>
    <td width="10%"    height="33">&nbsp;<%= sub3_width %></td>                                                                                                                                                        
    <td width="10%"    height="33">&nbsp;<%=sub3_qty%></td>
    <td width="10%"    height="33">&nbsp;<%= StringUtil.formatNumber(sub3_unit_price, MONEY_FORMAT) %></td>
    <td width="10%"    height="33">&nbsp;<%= StringUtil.formatNumber(sub3_total, MONEY_FORMAT) %> </td>                                                                                                                                                       
    <td width="15%"    height="33">&nbsp;<%= sub3_text %>  </td>                                                                                                                                                         
  </tr>
  <tr class='table_list_center'>
    <td width="14%"    height="38" > &nbsp;<%= outSub4 %> </td>
     <td width="10%"    height="33">&nbsp;<%= sub4_width %></td>                                                                                                                                                        
    <td width="10%"    height="33">&nbsp;<%=sub4_qty%></td>
    <td width="10%"    height="33">&nbsp;<%= StringUtil.formatNumber(sub4_unit_price, MONEY_FORMAT) %></td>
    <td width="10%"    height="33">&nbsp;<%= StringUtil.formatNumber(sub4_total, MONEY_FORMAT) %> </td>                                                                                                                                                       
    <td width="15%"    height="33">&nbsp;<%= sub4_text %>  </td>                                                                                                                                                        
  </tr>
  <tr class='table_list_center'>
    <td width="14%"    height="33">&nbsp; <%= outSub5 %> </td>
    <td width="10%"    height="33">&nbsp;<%= sub5_width %></td>                                                                                                                                                        
    <td width="10%"    height="33">&nbsp;<%=sub5_qty%></td>
    <td width="10%"    height="33">&nbsp;<%= StringUtil.formatNumber(sub5_unit_price, MONEY_FORMAT) %></td>
    <td width="10%"    height="33">&nbsp;<%= StringUtil.formatNumber(sub5_total, MONEY_FORMAT) %> </td>                                                                                                                                                       
    <td width="15%"    height="33">&nbsp;<%= sub5_text %>  </td>                                                                                                                                                         
  </tr>
  <tr class='table_list_center'>
  	 <td width="14%"    height="33">&nbsp; <%= outSub6 %> </td>
    <td width="10%"    height="33">&nbsp;<%= sub6_width %></td>                                                                                                                                                        
    <td width="10%"    height="33">&nbsp;<%=sub6_qty%></td>
    <td width="10%"    height="33">&nbsp;<%= StringUtil.formatNumber(sub6_unit_price, MONEY_FORMAT) %></td>
    <td width="10%"    height="33">&nbsp;<%= StringUtil.formatNumber(sub6_total, MONEY_FORMAT) %> </td>                                                                                                                                                       
    <td width="15%"    height="33">&nbsp;<%= sub6_text %> </td>                                                                                                                                                        
  </tr>
  <tr class='table_header'>
    <td width="14%"    height="16" colspan="6"><font face="Arial">Misc.</font></td>
   </tr>
  <tr class='table_list_center'>
    <td width="2%"    height="13" ><font face="Arial">Washing Cost</font></td>
        <td width="10%"    height="33">&nbsp;<%= sub7_width %></td>                                                                                                                                                        
    <td width="10%"    height="33">&nbsp;<%=sub7_qty%></td>
    <td width="10%"    height="33">&nbsp;<%= StringUtil.formatNumber(sub7_unit_price, MONEY_FORMAT) %></td>
    <td width="10%"    height="33">&nbsp;<%= StringUtil.formatNumber(sub7_total, MONEY_FORMAT) %> </td>                                                                                                                                                       
    <td width="15%"    height="33">&nbsp;<%= sub7_text %>  </td>                                                                                                                                                     
  </tr>
  <tr class='table_list_center'>
    <td width="12%"    height="16" ><font face="Arial">Dying Cost</font></td>
    <td width="10%"    height="33">&nbsp;<%= sub8_width %></td>                                                                                                                                                        
    <td width="10%"    height="33">&nbsp;<%=sub8_qty%></td>
    <td width="10%"    height="33">&nbsp;<%= StringUtil.formatNumber(sub8_unit_price, MONEY_FORMAT) %></td>
    <td width="10%"    height="33">&nbsp;<%= StringUtil.formatNumber(sub8_total, MONEY_FORMAT) %> </td>                                                                                                                                                       
    <td width="15%"    height="33">&nbsp;<%= sub8_text %>  </td>                                                                                                                                                          
  </tr>
  <tr class='table_list_center'>
    <td width="12%"    height="33" ><font face="Arial">Wrapping Cost</font></td>
    <td width="10%"    height="33">&nbsp;<%= sub9_width %></td>                                                                                                                                                        
    <td width="10%"    height="33">&nbsp;<%=sub9_qty%></td>
    <td width="10%"    height="33">&nbsp;<%= StringUtil.formatNumber(sub9_unit_price, MONEY_FORMAT) %></td>
    <td width="10%"    height="33">&nbsp;<%= StringUtil.formatNumber(sub9_total, MONEY_FORMAT) %> </td>                                                                                                                                                       
    <td width="15%"    height="33">&nbsp;<%= sub9_text %>  </td>                                                                                                                                                        
  </tr>  
  <tr class='table_header'>
    <td width="14%"    height="16" colspan="6"><font face="Arial">Processing Cost</font></td>
   </tr>
   <tr class='table_list_center'>
   	<td width="14%"    height="16" ><font face="Arial"> Processing Cost </font></td>
    <td width="10%"    height="16" colspan="4" align="right">&nbsp;<%= StringUtil.formatNumber(make_price, MONEY_FORMAT) %></td>
    <td width="15%"    height="16">&nbsp;<%= make_text %> </td>
  </tr>
  <tr class='table_list_center'>
    <td width="14%"    height="16" ><font face="Arial">*Product Cost </font></td>
    <!--td width="10%"    height="16"><%= StringUtil.formatNumber(unit_price, MONEY_FORMAT) %></td-->
    <td width="10%"    height="16" colspan="4" align="right">&nbsp;<%= StringUtil.formatNumber(cost_price, MONEY_FORMAT) %></td>
    <td width="15%"    height="16">&nbsp; </td>
  </tr>
  <tr class='table_list_center'>
    <td width="14%"    height="34" ><font face="Arial">*Profit </font></td>
    <td width="10%"    height="34" colspan="4" align="right">&nbsp;<%= StringUtil.formatNumber(profit, MONEY_FORMAT) %></td>
    <td width="15%"    height="34"><%= content %></td>
  </tr>
  <tr class='table_list_center'>
    <td width="14%"    height="27" ><font face="Arial">*Final Factory Price </font></td>
   <!--td width="10%"    height="27"> <%= StringUtil.formatNumber(rrp_price, MONEY_FORMAT) %>  </td-->
    <td width="10%"    height="27" colspan="4" align="right">&nbsp; <%= StringUtil.formatNumber(total_price, MONEY_FORMAT) %></td>
    <td width="15%"    height="27">&nbsp;</td>
  </tr>
 </table>
<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'>
<tr>
  <td height='15'></td>
</tr>
<tr>
  <td align='center'>
    <input type='button' value='Back' onclick='fnBack(this.form);'>
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