<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
request.setCharacterEncoding("euc-kr");
String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "#####0.00";

String fromUrl = request.getParameter("fromUrl");
String po_no = request.getParameter("po_no_selected");
String style_no = request.getParameter("style_selected");
String buyer_id = request.getParameter("buyer_selected");

String buyer_code = request.getParameter("buyer_code");
String supplier_code = request.getParameter("supplier_code");
String subsupplier_code = request.getParameter("subsupplier_code");
String sgr_code = request.getParameter("sgr_code");
String pgr_code = request.getParameter("pgr_code");
String season_code = request.getParameter("season_code");
String input_flag = request.getParameter("update_flag");

String ag_supplier = request.getParameter("ag_supplier");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_orderby = request.getParameter("ag_orderby");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");

String main_width = request.getParameter("main_width");
String main_qty = request.getParameter("main_qty");  
String main_unit_price = request.getParameter("main_unit_price");
String main_total = request.getParameter("main_total");
String main_text = request.getParameter("main_text");

String color_width = request.getParameter("color_width");
String color_qty = request.getParameter("color_qty");  
String color_unit_price = request.getParameter("color_unit_price");
String color_total = request.getParameter("color_total");
String color_text = request.getParameter("color_text");

String inner_width = request.getParameter("inner_width");
String inner_qty = request.getParameter("inner_qty");  
String inner_unit_price = request.getParameter("inner_unit_price");
String inner_total = request.getParameter("inner_total");
String inner_text = request.getParameter("inner_text");

String subcode1 = request.getParameter("subcode1");
String subcode2 = request.getParameter("subcode2");
String subcode3 = request.getParameter("subcode3");
String subcode4 = request.getParameter("subcode4");
String subcode5 = request.getParameter("subcode5");
String subcode6 = request.getParameter("subcode6");

String sub1_width = request.getParameter("sub1_width");
String sub1_qty = request.getParameter("sub1_qty");  
String sub1_unit_price = request.getParameter("sub1_unit_price");
String sub1_total = request.getParameter("sub1_total");
String sub1_text = request.getParameter("sub1_text");

String sub2_width = request.getParameter("sub2_width");
String sub2_qty = request.getParameter("sub2_qty");  
String sub2_unit_price = request.getParameter("sub2_unit_price");
String sub2_total = request.getParameter("sub2_total");
String sub2_text = request.getParameter("sub2_text");

String sub3_width = request.getParameter("sub3_width");
String sub3_qty = request.getParameter("sub3_qty");  
String sub3_unit_price = request.getParameter("sub3_unit_price");
String sub3_total = request.getParameter("sub3_total");
String sub3_text = request.getParameter("sub3_text");

String sub4_width = request.getParameter("sub4_width");
String sub4_qty = request.getParameter("sub4_qty");  
String sub4_unit_price = request.getParameter("sub4_unit_price");
String sub4_total = request.getParameter("sub4_total");
String sub4_text = request.getParameter("sub4_text");

String sub5_width = request.getParameter("sub5_width");
String sub5_qty = request.getParameter("sub5_qty");  
String sub5_unit_price = request.getParameter("sub5_unit_price");
String sub5_total = request.getParameter("sub5_total");
String sub5_text = request.getParameter("sub5_text");

String sub6_width = request.getParameter("sub6_width");
String sub6_qty = request.getParameter("sub6_qty");  
String sub6_unit_price = request.getParameter("sub6_unit_price");
String sub6_total = request.getParameter("sub6_total");
String sub6_text = request.getParameter("sub6_text");

String sub7_width = request.getParameter("sub7_width");
String sub7_qty = request.getParameter("sub7_qty");  
String sub7_unit_price = request.getParameter("sub7_unit_price");
String sub7_total = request.getParameter("sub7_total");
String sub7_text = request.getParameter("sub7_text");

String sub8_width = request.getParameter("sub8_width");
String sub8_qty = request.getParameter("sub8_qty");  
String sub8_unit_price = request.getParameter("sub8_unit_price");
String sub8_total = request.getParameter("sub8_total");
String sub8_text = request.getParameter("sub8_text");

String sub9_width = request.getParameter("sub9_width");
String sub9_qty = request.getParameter("sub9_qty");  
String sub9_unit_price = request.getParameter("sub9_unit_price");
String sub9_total = request.getParameter("sub9_total");
String sub9_text = request.getParameter("sub9_text");

String make_price = request.getParameter("make_price");
String make_text = request.getParameter("make_text");
String cost_price = request.getParameter("cost_price");
String profit = request.getParameter("profit");
String total_price = request.getParameter("total_price");
String content = request.getParameter("content");

if ( main_unit_price == "" || main_unit_price == null ) main_unit_price ="0"; 
if ( main_total == "" || main_total == null ) main_total ="0"; 
if ( main_qty == "" || main_qty == null ) main_qty ="0"; 

if ( color_unit_price == "" || color_unit_price == null ) color_unit_price ="0"; 
if ( color_total == "" || color_total == null ) color_total ="0"; 
if ( color_qty == "" || color_qty == null ) color_qty ="0"; 

if ( inner_unit_price == "" || inner_unit_price == null ) inner_unit_price ="0"; 
if ( inner_total == "" || inner_total == null ) inner_total ="0"; 
if ( inner_qty == "" || inner_qty == null ) inner_qty ="0"; 

if ( sub1_unit_price == "" || sub1_unit_price == null ) sub1_unit_price ="0"; 
if ( sub1_total == "" || sub1_total == null ) sub1_total ="0"; 

if ( sub2_unit_price == "" || sub2_unit_price == null ) sub2_unit_price ="0"; 
if ( sub2_total == "" || sub1_total == null ) sub2_total ="0"; 

if ( sub3_unit_price == "" || sub3_unit_price == null ) sub3_unit_price ="0"; 
if ( sub3_total == "" || sub3_total == null ) sub3_total ="0"; 

if ( sub4_unit_price == "" || sub4_unit_price == null ) sub4_unit_price ="0"; 
if ( sub4_total == "" || sub4_total == null ) sub4_total ="0"; 

if ( sub5_unit_price == "" || sub5_unit_price == null ) sub5_unit_price ="0"; 
if ( sub5_total == "" || sub5_total == null ) sub5_total ="0"; 

if ( sub6_unit_price == "" || sub6_unit_price == null ) sub6_unit_price ="0"; 
if ( sub6_total == "" || sub6_total == null ) sub6_total ="0"; 

if ( sub7_unit_price == "" || sub7_unit_price == null ) sub7_unit_price ="0"; 
if ( sub7_total == "" || sub7_total == null ) sub7_total ="0"; 

if ( sub8_unit_price == "" || sub8_unit_price == null ) sub8_unit_price ="0"; 
if ( sub8_total == "" || sub8_total == null ) sub8_total ="0"; 

if ( sub9_unit_price == "" || sub9_unit_price == null ) sub9_unit_price ="0"; 
if ( sub9_total == "" || sub9_total == null ) sub9_total ="0"; 

if ( sub1_qty == "" || sub1_qty == null ) sub1_qty ="0"; 
if ( sub2_qty == "" || sub2_qty == null ) sub2_qty ="0"; 
if ( sub3_qty == "" || sub3_qty == null ) sub3_qty ="0"; 
if ( sub4_qty == "" || sub4_qty == null ) sub4_qty ="0"; 
if ( sub5_qty == "" || sub5_qty == null ) sub5_qty ="0"; 
if ( sub6_qty == "" || sub6_qty == null ) sub6_qty ="0"; 
if ( sub7_qty == "" || sub7_qty == null ) sub7_qty ="0"; 
if ( sub8_qty == "" || sub8_qty == null ) sub8_qty ="0"; 
if ( sub9_qty == "" || sub9_qty == null ) sub9_qty ="0"; 

if ( make_price == "" || make_price == null ) make_price ="0"; 
if ( cost_price == "" || cost_price == null ) cost_price ="0"; 
if (total_price == "" || total_price == null ) total_price ="0"; 
if (profit == "" || profit == null ) profit ="0"; 

// 부자재코드를 선택으로 변경시 기존 입력값 초기화 
if ( subcode1 =="" || subcode1.equals("N") || subcode1 == null ) {
      subcode1="";
      sub1_width ="";
      sub1_text ="";
      sub1_qty ="0";
      sub1_total ="0"; 
      sub1_unit_price ="0"; 
 }     
if ( subcode2 =="" || subcode2.equals("N") || subcode2 == null ) {
      subcode2="";
      sub2_width ="";
      sub2_text ="";
      sub2_qty ="0";
      sub2_total ="0"; 
      sub2_unit_price ="0"; 
 
} 
if ( subcode3 =="" || subcode3.equals("N") || subcode3 == null ) { 
      subcode3="";
      sub3_width ="";
      sub3_text ="";
      sub3_qty ="0";
      sub3_total ="0"; 
      sub3_unit_price ="0"; 
}  
if ( subcode4 =="" || subcode4.equals("N") || subcode4 == null ) { 
      subcode4="";
      sub4_width ="";
      sub4_text ="";
      sub4_qty ="0";
      sub4_total ="0"; 
      sub4_unit_price ="0"; 
}  
if ( subcode5 =="" || subcode5.equals("N") || subcode5 == null ) {
      subcode5="";
      sub5_width ="";
      sub5_text ="";
      sub5_qty ="0";
      sub5_total ="0"; 
      sub5_unit_price ="0"; 
}  
if ( subcode6 =="" || subcode6.equals("N") || subcode6 == null ) { 
   subcode6="";
   sub6_width ="";
   sub6_text ="";
   sub6_qty ="0";
   sub6_total ="0"; 
   sub6_unit_price ="0"; 
}
if ( sub1_width =="" || sub1_width == null ) sub1_width="";
if ( sub2_width =="" || sub2_width == null ) sub2_width="";
if ( sub3_width =="" || sub3_width == null ) sub3_width="";
if ( sub4_width =="" || sub4_width == null ) sub4_width="";
if ( sub5_width =="" || sub5_width == null ) sub5_width="";
if ( sub6_width =="" || sub6_width == null ) sub6_width="";
if ( sub7_width =="" || sub7_width == null ) sub7_width="";
if ( sub8_width =="" || sub8_width == null ) sub8_width="";
if ( sub9_width =="" || sub9_width == null ) sub9_width="";

if ( sub1_text =="" || sub1_text == null ) sub1_text="";
if ( sub2_text =="" || sub2_text == null ) sub2_text="";
if ( sub3_text =="" || sub3_text == null ) sub3_text="";
if ( sub4_text =="" || sub4_text == null ) sub4_text="";
if ( sub5_text =="" || sub5_text == null ) sub5_text="";
if ( sub6_text =="" || sub6_text == null ) sub6_text="";
if ( sub7_text =="" || sub7_text == null ) sub7_text="";
if ( sub8_text =="" || sub8_text == null ) sub8_text="";
if ( sub9_text =="" || sub9_text == null ) sub9_text="";

if ( main_text =="" || main_text == null ) main_text="";
if ( color_text =="" || color_text == null ) color_text="";
if ( inner_text =="" || inner_text == null ) inner_text="";
if ( content =="" || content == null ) content="";


String sql = "";
String sql2 = "";
int iCnt = 0;
int iRet = 0;
boolean isSucceeded = false;
String strMsg = "";
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
Connection conn = null;
PreparedStatement pstmt = null;
try {
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();

 if ( input_flag.equals("INSERT") ) {
  // query for update
	    sql =  "  Insert into cost_01t "
          + "  ( "
          + "  ORDER_NO     ,  "
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
			+"  MAIN_TOTAL     ,  "
			+"  MAIN_TEXT       ,  "
			
			+"  COLOR_WIDTH     ,  "
			+"  COLOR_QTY       ,  "
			+"  COLOR_UNIT_PRICE,  "
			+"  COLOR_TOTAL    ,  "
			+"  COLOR_TEXT      ,  "
			
			+"  INNER_WIDTH     ,  "
			+"  INNER_QTY       ,  "
			+"  INNER_UNIT_PRICE,  "
			+"  INNER_TOTAL      ,  "
			+"  INNER_TEXT    ,  "
			
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
			
			+"  USERID ,           "
			+"  UPDATED         "
			+ " )  VALUES ( " 
			+ " ?,?,?,?,?,?,?,?, "
			
			+ " ?,?,?,?,?, " 
			+ " ?,?,?,?,?, " 
			+ " ?,?,?,?,?, " 	
			
			+ " ?,?, "
			
			+ " ?,?,?,?,?, " 
			+ " ?,?,?,?,?, " 
			+ " ?,?,?,?,?, " 		
			+ " ?,?,?,?,?, " 	
			+ " ?,?,?,?,?, " 	
			+ " ?,?,?,?,?, " 
			+ " ?,?,?,?,?, " 					
			+ " ?,?,?,?,?, " 
			+ " ?,?,?,?,?, " 		
					
			+ " ?,?,?,?,?, " 	
			
			+ " ?,?,?,?,?,?, " 
							
			+ " ?,sysdate() ) " ;	
	  int idx = 0;
	  conn.setAutoCommit(false);
	
	  pstmt = conn.prepareStatement(sql);	
	  pstmt.setString(++idx, po_no.toUpperCase());
	  pstmt.setString(++idx, style_no.toUpperCase());
	  pstmt.setString(++idx, season_code.toUpperCase());
	  pstmt.setString(++idx, sgr_code);
	  pstmt.setString(++idx, pgr_code);
	  pstmt.setString(++idx, subsupplier_code);
	  pstmt.setString(++idx, buyer_code);
	  pstmt.setString(++idx, supplier_code);
	  
	  pstmt.setString(++idx, main_width);
	  pstmt.setString(++idx, main_qty);
	  pstmt.setString(++idx, main_unit_price);
	  pstmt.setString(++idx, main_total);
	  pstmt.setString(++idx, main_text);
	  
	  pstmt.setString(++idx, color_width);
	  pstmt.setString(++idx, color_qty);
	  pstmt.setString(++idx, color_unit_price);
	  pstmt.setString(++idx, color_total);
	  pstmt.setString(++idx, color_text);

	  pstmt.setString(++idx, inner_width);
	  pstmt.setString(++idx, inner_qty);
	  pstmt.setString(++idx, inner_unit_price);
	  pstmt.setString(++idx, inner_total);
	  pstmt.setString(++idx, inner_text);
	  
	  pstmt.setString(++idx, make_price);
	  pstmt.setString(++idx, make_text); 

	  pstmt.setString(++idx, sub1_width);
	  pstmt.setString(++idx, sub1_qty);
	  pstmt.setString(++idx, sub1_unit_price);
	  pstmt.setString(++idx, sub1_total);
	  pstmt.setString(++idx, sub1_text);
	  
	  pstmt.setString(++idx, sub2_width);
	  pstmt.setString(++idx, sub2_qty);
	  pstmt.setString(++idx, sub2_unit_price);
	  pstmt.setString(++idx, sub2_total);
	  pstmt.setString(++idx, sub2_text);

	  pstmt.setString(++idx, sub3_width);
	  pstmt.setString(++idx, sub3_qty);
	  pstmt.setString(++idx, sub3_unit_price);
	  pstmt.setString(++idx, sub3_total);
	  pstmt.setString(++idx, sub3_text);

	  pstmt.setString(++idx, sub4_width);
	  pstmt.setString(++idx, sub4_qty);
	  pstmt.setString(++idx, sub4_unit_price);
	  pstmt.setString(++idx, sub4_total);
	  pstmt.setString(++idx, sub4_text);
	  
	  pstmt.setString(++idx, sub5_width);
	  pstmt.setString(++idx, sub5_qty);
	  pstmt.setString(++idx, sub5_unit_price);
	  pstmt.setString(++idx, sub5_total);
	  pstmt.setString(++idx, sub5_text);	  	  
	  
	  pstmt.setString(++idx, sub6_width);
	  pstmt.setString(++idx, sub6_qty);
	  pstmt.setString(++idx, sub6_unit_price);
	  pstmt.setString(++idx, sub6_total);
	  pstmt.setString(++idx, sub6_text);		  
	  
	  pstmt.setString(++idx, sub7_width);
	  pstmt.setString(++idx, sub7_qty);
	  pstmt.setString(++idx, sub7_unit_price);
	  pstmt.setString(++idx, sub7_total);
	  pstmt.setString(++idx, sub7_text);	
	  
	  pstmt.setString(++idx, sub8_width);
	  pstmt.setString(++idx, sub8_qty);
	  pstmt.setString(++idx, sub8_unit_price);
	  pstmt.setString(++idx, sub8_total);
	  pstmt.setString(++idx, sub8_text);		  

	  pstmt.setString(++idx, sub9_width);
	  pstmt.setString(++idx, sub9_qty);
	  pstmt.setString(++idx, sub9_unit_price);
	  pstmt.setString(++idx, sub9_total);
	  pstmt.setString(++idx, sub9_text);		
	  
	  pstmt.setString(++idx, cost_price);
	  pstmt.setString(++idx, total_price);
	  pstmt.setString(++idx, profit);	
	  pstmt.setString(++idx, content);		    
	  pstmt.setString(++idx,"N");		   
	  
	  pstmt.setString(++idx, subcode1);
	  pstmt.setString(++idx, subcode2);	 	  
	  pstmt.setString(++idx, subcode3);	 
	  pstmt.setString(++idx, subcode4);	 
	  pstmt.setString(++idx, subcode5);	 
	  pstmt.setString(++idx, subcode6);	 
	  
	  pstmt.setString(++idx, _adminid);	 
	  iCnt = pstmt.executeUpdate();
	  if (iCnt != 1) {
	    throw new UserDefinedException("Check your data.");
	  }	
  }
 if ( input_flag.equals("UPDATE") ) {
      // query for update
      sql2 = " update  cost_01t  set "	
			+ "  MAIN_WIDTH     = ?, "
			+ "  MAIN_QTY       = ?, "
			+ "  MAIN_UNIT_PRICE= ?, "
			+ "  MAIN_TOTAL    = ?, "
			+ "  MAIN_TEXT      = ?, "
			  
			+ "  COLOR_WIDTH    = ?, "
			+ "  COLOR_QTY      = ?, "
			+ "  COLOR_UNIT_PRICE=?,  "
			+ "  COLOR_TOTAL   = ?, "
			+ "  COLOR_TEXT     = ?, "  
			  
			+ "  INNER_WIDTH    = ?, "
			+ "  INNER_QTY      = ?, "
			+ "  INNER_UNIT_PRICE=?,  "
			+ "  INNER_TOTAL     = ?, "
			+ "  INNER_TEXT   = ?, "
			
			+ "  MAKE_PRICE     = ?, "
		  + "  MAKE_TEXT     = ?, "
		    
			+ "  SUB1_WIDTH     = ?, "
			+ "  SUB1_QTY       = ?, "
			+ "  SUB1_UNIT_PRICE= ?, "
			+ "  SUB1_TOTAL    = ?, "
			+ "  SUB1_TEXT      = ?, "     
			  
			+ "  SUB2_WIDTH     = ?, "
			+ "  SUB2_QTY       = ?, "
			+ "  SUB2_UNIT_PRICE= ?, "
			+ "  SUB2_TOTAL    = ?, "
			+ "  SUB2_TEXT      = ?, "
			  
			+ "  SUB3_WIDTH     = ?, "
			+ "  SUB3_QTY       = ?, "
			+ "  SUB3_UNIT_PRICE= ?, "
			+ "  SUB3_TOTAL    = ?, "
			+ "  SUB3_TEXT      = ?, "   
			  
			+ "  SUB4_WIDTH     = ?, "
			+ "  SUB4_QTY       = ?, "
			+ "  SUB4_UNIT_PRICE= ?, "
			+ "  SUB4_TOTAL    = ?, "
			+ "  SUB4_TEXT      = ?, "
			  
			+ "  SUB5_WIDTH     = ?, "
			+ "  SUB5_QTY       = ?, "
			+ "  SUB5_UNIT_PRICE= ?, "
			+ "  SUB5_TOTAL    = ?, "
			+ "  SUB5_TEXT      = ?, "   //42
			  
			+ "  SUB6_WIDTH     = ?, "
			+ "  SUB6_QTY       = ?, "
			+ "  SUB6_UNIT_PRICE= ?, "
			+ "  SUB6_TOTAL    = ?, "
			+ "  SUB6_TEXT      = ?, "
			  
			+ "  SUB7_WIDTH     = ?, "
			+ "  SUB7_QTY       = ?, "
			+ "  SUB7_UNIT_PRICE= ?, "
			+ "  SUB7_TOTAL    = ?, "
			+ "  SUB7_TEXT      = ?, "  //52
			  
			+ "  SUB8_WIDTH     = ?, "
			+ "  SUB8_QTY       = ?, "
			+ "  SUB8_UNIT_PRICE= ?, "
			+ "  SUB8_TOTAL    = ?, "
			+ "  SUB8_TEXT      = ?, "
			  
			+ "  SUB9_WIDTH     = ?, "
			+ "  SUB9_QTY       = ?, "
			+ "  SUB9_UNIT_PRICE= ?, "
			+ "  SUB9_TOTAL    = ?, "
			+ "  SUB9_TEXT      = ?, "	 //62
				 														
			+ "  COST_PRICE     = ?, "
			+ "  RRP_PRICE      = ?, "
			+ "  PROFIT         = ?, "
			+ "  CONTENT        = ?, "  //66
			  
			+ "  SUB1_CODE   = ?, "
			+ "  SUB2_CODE   = ?, "
			+ "  SUB3_CODE   = ?, "	
			+ "  SUB4_CODE   = ?, "
			+ "  SUB5_CODE   = ?, "      //71
			+ "  SUB6_CODE   = ?, "	   //72		
			+ "  USERID          = ?, "      //73
			+ "  UPDATED      = sysdate()  "
	       + " where order_no = '"+po_no+"' " 
	       + "       and style = '" + style_no +"' "
	       	+ "       and buyer = '" + buyer_id +"' ";
	  int idx2 = 0;
	  conn.setAutoCommit(false);
	  pstmt = conn.prepareStatement(sql2);
  
	  pstmt.setString(++idx2, main_width);
	  pstmt.setString(++idx2, main_qty);
	  pstmt.setString(++idx2, main_unit_price);
	  pstmt.setString(++idx2, main_total);
	  pstmt.setString(++idx2, main_text);
  
	  pstmt.setString(++idx2, color_width);
	  pstmt.setString(++idx2, color_qty);
	  pstmt.setString(++idx2, color_unit_price);
	  pstmt.setString(++idx2, color_total);
	  pstmt.setString(++idx2, color_text);
	
	  pstmt.setString(++idx2, inner_width);
	  pstmt.setString(++idx2, inner_qty);
	  pstmt.setString(++idx2, inner_unit_price);
	  pstmt.setString(++idx2, inner_total);
	  pstmt.setString(++idx2, inner_text);
	  
	  pstmt.setString(++idx2, make_price);
	  pstmt.setString(++idx2, make_text); 

	  pstmt.setString(++idx2, sub1_width);
	  pstmt.setString(++idx2, sub1_qty);
	  pstmt.setString(++idx2, sub1_unit_price);
	  pstmt.setString(++idx2, sub1_total);
	  pstmt.setString(++idx2, sub1_text);     //22       
	  
	  pstmt.setString(++idx2, sub2_width);
	  pstmt.setString(++idx2, sub2_qty);
	  pstmt.setString(++idx2, sub2_unit_price);
	  pstmt.setString(++idx2, sub2_total);
	  pstmt.setString(++idx2, sub2_text);

	  pstmt.setString(++idx2, sub3_width);
	  pstmt.setString(++idx2, sub3_qty);
	  pstmt.setString(++idx2, sub3_unit_price);
	  pstmt.setString(++idx2, sub3_total);
	  pstmt.setString(++idx2, sub3_text);   //32

	  pstmt.setString(++idx2, sub4_width);
	  pstmt.setString(++idx2, sub4_qty);
	  pstmt.setString(++idx2, sub4_unit_price);
	  pstmt.setString(++idx2, sub4_total);
	  pstmt.setString(++idx2, sub4_text);
	  
	  pstmt.setString(++idx2, sub5_width);
	  pstmt.setString(++idx2, sub5_qty);
	  pstmt.setString(++idx2, sub5_unit_price);
	  pstmt.setString(++idx2, sub5_total);
	  pstmt.setString(++idx2, sub5_text);	  	  //42
	  
	  pstmt.setString(++idx2, sub6_width);
	  pstmt.setString(++idx2, sub6_qty);
	  pstmt.setString(++idx2, sub6_unit_price);
	  pstmt.setString(++idx2, sub6_total);
	  pstmt.setString(++idx2, sub6_text);		  
	  
	  pstmt.setString(++idx2, sub7_width);
	  pstmt.setString(++idx2, sub7_qty);
	  pstmt.setString(++idx2, sub7_unit_price);
	  pstmt.setString(++idx2, sub7_total);
	  pstmt.setString(++idx2, sub7_text);	   //52
	  
	  pstmt.setString(++idx2, sub8_width);
	  pstmt.setString(++idx2, sub8_qty);
	  pstmt.setString(++idx2, sub8_unit_price);
	  pstmt.setString(++idx2, sub8_total);
	  pstmt.setString(++idx2, sub8_text);		  

	  pstmt.setString(++idx2, sub9_width);
	  pstmt.setString(++idx2, sub9_qty);
	  pstmt.setString(++idx2, sub9_unit_price);
	  pstmt.setString(++idx2, sub9_total);
	  pstmt.setString(++idx2, sub9_text);		//62
  
	  pstmt.setString(++idx2, cost_price);
	  pstmt.setString(++idx2, total_price);
	  pstmt.setString(++idx2, profit);	
	  pstmt.setString(++idx2, content);	       //66
  
	  pstmt.setString(++idx2, subcode1);   
	  pstmt.setString(++idx2, subcode2);	 	  
	  pstmt.setString(++idx2, subcode3);	 
	  pstmt.setString(++idx2, subcode4);	 
	  pstmt.setString(++idx2, subcode5);	 
	  pstmt.setString(++idx2, subcode6);  //72
	  pstmt.setString(++idx2, _adminid);	//73
	 	  
	  iCnt = pstmt.executeUpdate();  

	  if (iCnt != 1) {
	    throw new UserDefinedException("Check your data.(Cost_01t master");
	  }
 } 
  // commit;
  conn.commit();

  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  strMsg = ue.getMessage();
  System.out.println("Exception Cost_input : " + ue.getMessage());
} catch (SQLException se) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  strMsg = "Check your data. " + se.getMessage();
  System.out.println("Exception cost_input : " + se.getMessage());
  throw se;
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  strMsg = "Error occurred. " + e.getMessage();
  System.out.println("Exception Cost_input : " + e.getMessage());
  throw e;
} finally {
  if (pstmt != null) {
    try { pstmt.close(); } catch (Exception e) {}
  }
  
  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
  }
}

// final messages..
if (isSucceeded) {
   if ( input_flag.equals("INSERT") ) {
        strMsg = "Style#번호 ( "+sgr_code+style_no+")의 원가내역이 성공적으로 생성이 되었습니다! 확인버튼을 누르시면 전 화면으로 이동됩니다. ";
   }
   if ( input_flag.equals("UPDATE") ) {
        strMsg = "Style#번호 ( "+sgr_code+style_no+") 가 원가내역이 성공적으로 Update 되었습니다! 확인버튼을 누르시면 전 화면으로 이동됩니다. ";
   }     
} else {
  strMsg = "The operation failed.\\n" + StringUtil.replace(StringUtil.replace(strMsg, "\"", "\\\""), "\n", "\\n");  
}
%>
<HTML>
<head>
</head>
<body>
<form name='form1' method='post'>
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
</form>
<script language='javascript'>
alert("<%= strMsg %>");
form1.action = './cost_details_screen.jsp';
form1.submit();
</script>
</BODY>
</HTML>
