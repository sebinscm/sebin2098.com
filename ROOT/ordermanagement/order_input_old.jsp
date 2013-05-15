<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.net.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@page import="common.*" %>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
request.setCharacterEncoding("euc-kr"); 

String ag_supplier = request.getParameter("ag_supplier");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_status = request.getParameter("ag_status");
String ag_orderby = request.getParameter("ag_orderby");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");
boolean isSucceeded = false;
String strMsg = "";

String today_date = DateUtil.getToday("yyyy/MM/dd");
String this_year = DateUtil.getToday("yyyy");
String this_mmdd = DateUtil.getToday("MM/dd");

String new_year ="";
// Parameter Setting
String input_flag =request.getParameter("input_flag");
String pono = "";
if ( input_flag.equals("UPDATE") || input_flag.equals("COM") ||  input_flag.equals("DEL") ) {
   pono = request.getParameter("pono");
} 
String nextUrl = request.getParameter("fromUrl");
String styno= request.getParameter("styno");
String buyer = request.getParameter("buyer");
String supplier = request.getParameter("supplier");
String subsupplier = request.getParameter("subsupplier");
String pgr= request.getParameter("pgr");
String sgr= request.getParameter("sgr");
String unitprice = request.getParameter("unitprice");
String orderdate = request.getParameter("orderdate");
String deliverydate = request.getParameter("deliverydate");
String shiptype = request.getParameter("shiptype");
//String shipdate = request.getParameter("shipdate");
String season = request.getParameter("season");
String supstyno = request.getParameter("supstyno");
String material= request.getParameter("material");
String brand = request.getParameter("brand");
String currency = request.getParameter("currency");
String deltype= request.getParameter("deltype");
String local_price = request.getParameter("local_price");
String reorder_seq = request.getParameter("reorder");
//String pt3 = request.getParameter("pt3");
String itemtext= request.getParameter("itemtext");
String contents = request.getParameter("contents");
 if ( !orderdate.equals("") )  orderdate = orderdate.substring(0,4)+"/"+orderdate.substring(5,7)+"/"+orderdate.substring(8,10); 
if (  !deliverydate.equals("") )  deliverydate = deliverydate.substring(0,4)+"/"+deliverydate.substring(5,7)+"/"+deliverydate.substring(8,10); 
//shipdate = shipdate.substring(0,4)+"/"+shipdate.substring(5,7)+"/"+shipdate.substring(8,10); 

//if (true) return;
// read size & colour of qty 
String siz_1 = request.getParameter("size1").trim();
String siz_2 = request.getParameter("size2").trim();
String siz_3 = request.getParameter("size3").trim();
String siz_4 = request.getParameter("size4").trim();
String siz_5 = request.getParameter("size5").trim();
String siz_6 = request.getParameter("size6").trim();

// color total qty
String aqtytot = request.getParameter("aqtytot");
if (aqtytot == "" || aqtytot== null ) {
    aqtytot = "0";
}
String bqtytot = request.getParameter("bqtytot");
if (bqtytot == "" || bqtytot== null ) {
    bqtytot = "0";
}
String cqtytot = request.getParameter("cqtytot");
if (cqtytot == ""  || cqtytot== null) {
    cqtytot = "0";
}
String dqtytot = request.getParameter("dqtytot");
if (dqtytot == "" || dqtytot== null) {
    dqtytot = "0";
}
String eqtytot = request.getParameter("eqtytot");
if (eqtytot == "" || eqtytot== null) {
    eqtytot = "0";
}
String total_qty = ""+(Integer.parseInt(aqtytot)+Integer.parseInt(bqtytot) +Integer.parseInt(cqtytot)+Integer.parseInt(dqtytot)+Integer.parseInt(eqtytot));
// read colour of qty 
String[] col = new String[5];
String[] aqty = new String[6];
String[] bqty = new String[6];
String[] cqty = new String[6];
String[] dqty = new String[6];
String[] eqty = new String[6];

for (int i = 0; i < col.length; i++) {  
   if ( request.getParameter("col_" + (i+1)).trim() == "" ) {
        col[i] = ""; 
    } else {
       col[i] = request.getParameter("col_" + (i+1)).trim();     
    }  
   //col[i] = request.getParameter("col_" + (i+1)).trim();  
}
for (int i = 0; i < aqty.length; i++) {
    if ( request.getParameter("aqty_" + (i+1)).trim() == "" ) {
        aqty[i] = ""; 
    } else {
      aqty[i] = request.getParameter("aqty_" + (i+1)).trim();     
    }  
  //aqty[i] = request.getParameter("aqty_" + (i+1)).trim();
}
for (int i = 0; i < bqty.length; i++) {
     if ( request.getParameter("bqty_" + (i+1)).trim() == "" ) {
        bqty[i] = ""; 
    } else {
        bqty[i] = request.getParameter("bqty_" + (i+1)).trim();     
    }  
   // bqty[i] = request.getParameter("bqty_" + (i+1)).trim();
}
for (int i = 0; i < cqty.length; i++) {
     if ( request.getParameter("cqty_" + (i+1)).trim() == "" ) {
        cqty[i] = ""; 
    } else {
        cqty[i] = request.getParameter("cqty_" + (i+1)).trim();     
    }  
}
for (int i = 0; i < dqty.length; i++) {
	  if ( request.getParameter("dqty_" + (i+1)).trim() == "" ) {
	        dqty[i] = ""; 
	    } else {
	        dqty[i] = request.getParameter("dqty_" + (i+1)).trim();     
	    }  
	  //dqty[i] = request.getParameter("dqty_" + (i+1)).trim();
}
for (int i = 0; i < eqty.length; i++) {
    if ( request.getParameter("eqty_" + (i+1)).trim() == "" ) {
       eqty[i] = ""; 
    } else {
       eqty[i] = request.getParameter("eqty_" + (i+1)).trim();     
    }  
  // eqty[i] = request.getParameter("eqty_" + (i+1)).trim();
}

int iCnt = 0;
String sql = "";
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
Connection conn = null;
PreparedStatement pstmt = null;
String buyer_name="";
String supplier_name ="";
String subsupplier_name ="";
String po_year="";
try {
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();

  
  // buyer,supplier,subsupplier name check
  sql = " select name from login_01t where user_type = 'B' and id= '"+buyer+"' " ;
  dataProcess.RetrieveData(sql, matrix, conn);
  buyer_name = matrix.getRowData(0).getData(0);
  
  sql = " select name from login_01t where user_type = 'S' and id= '"+supplier+"' " ;
  dataProcess.RetrieveData(sql, matrix, conn);
  supplier_name = matrix.getRowData(0).getData(0);
  
  sql = " select name from login_01t where user_type = 'P' and id= '"+subsupplier+"' " ;
  dataProcess.RetrieveData(sql, matrix, conn);
  subsupplier_name = matrix.getRowData(0).getData(0);
  
  if ( input_flag.equals("INSERT") ) {
      // next po number check
	  sql =   "  select  ifnull(max(substr(order_no,3,9))+1, concat(cast(date_format(sysdate(),'%Y') as unsigned ),'10000') ) , "
	         + "           cast(concat(cast(date_format(sysdate(),'%Y') as unsigned ),'10000') as unsigned)+1, date_format(sysdate(),'%Y') "
	          + "  from purchase_order ";
	  dataProcess.RetrieveData(sql, matrix, conn); 	     
	  pono = "PO"+matrix.getRowData(0).getData(0);
	  po_year = pono.substring(2,6);	
	  new_year = matrix.getRowData(0).getData(2);
	  if (!po_year.equals(new_year) ) {
	      pono = "PO"+new_year+"10001";
	  }
	  
      // insert data purchase order master
	  sql = " insert  into purchase_order"
	      + " ( "
	      + "   ORDER_NO ,  BACKORDER_FLAG ,  STYLE , SEASON ,  SGR ,  PGR  , "
	      + "   FABRIC, ITEM_TEXT, SUP_STOCK_CODE, VENDOR_PRICE ,  INITIAL_DEL_DATE, "
	      + "   TRANS_TYPE , ORDER_STATUS ,CURRENCY_CODE, BRAND , "
	      + "   BUYER,SUPPLIER  , SUBSUPPLIER, DELIVERY_DATE ,"
	      + "   SIZC_1,SIZC_2,SIZC_3,SIZC_4,SIZC_5,SIZC_6, "
	      + "   UPDATED,USER_NAME,CREATED,BUYER_NAME,SUPPLIER_NAME,SUBSUPPLIER_NAME,"
	      + "   COMMENTS,TOTAL_QTY ,ORDER_DATE,PO_TYPE,LOCAL_PRICE,REORDER_SEQ ";
	  
	  sql += " ) "
	       + " values "
	       + " ( "
	       + "   ?,'N',?,?,?,?, "
	       + "   ?,?,?,?,str_to_date(?, '%Y/%m/%d'), "
	       + "   ?,?,?,?, "
	       + "   ?,?,?,str_to_date(?, '%Y/%m/%d'),"
	       + "   ?,?,?,?,?,?, "
	       + "   sysdate(), ?,sysdate(),?,?,?, "
	       + "   ?,?,str_to_date(?, '%Y/%m/%d'),? ,?, ?  ) " ;
	
	  int idx = 0;
	  conn.setAutoCommit(false);
	
	  pstmt = conn.prepareStatement(sql);
	  pstmt.setString(++idx, pono.toUpperCase());
	  //pstmt.setString(++idx, "N");
	  pstmt.setString(++idx, styno.toUpperCase());
	  pstmt.setString(++idx, season.toUpperCase());
	  pstmt.setString(++idx, sgr);
	  pstmt.setString(++idx, pgr);
	  
	  pstmt.setString(++idx, material);
	  pstmt.setString(++idx, itemtext);
	  pstmt.setString(++idx, supstyno);
	  pstmt.setString(++idx, unitprice);
	  pstmt.setString(++idx, deliverydate);
	  
	  pstmt.setString(++idx, shiptype);
	  pstmt.setString(++idx, "40"); //order status 40 : 오더작성
	  pstmt.setString(++idx, currency);
	  pstmt.setString(++idx,  brand);
	  
	  pstmt.setString(++idx, buyer);
	  pstmt.setString(++idx, supplier);
	  pstmt.setString(++idx, subsupplier);
	  pstmt.setString(++idx, deliverydate);

	  
	  pstmt.setString(++idx, siz_1);
	  pstmt.setString(++idx, siz_2);
	  pstmt.setString(++idx, siz_3);
	  pstmt.setString(++idx, siz_4);
	  pstmt.setString(++idx, siz_5);
	  pstmt.setString(++idx, siz_6);
	  
	  pstmt.setString(++idx, _adminid);
	  pstmt.setString(++idx, buyer_name);
	  pstmt.setString(++idx, supplier_name);
	  pstmt.setString(++idx, subsupplier_name);
	  
	  pstmt.setString(++idx, contents);
	  pstmt.setString(++idx, total_qty);
	  pstmt.setString(++idx, orderdate);
	  pstmt.setString(++idx, deltype);
	  pstmt.setString(++idx, local_price);
	  pstmt.setString(++idx, reorder_seq);
	
	  iCnt = pstmt.executeUpdate();

	  if (iCnt != 1) {
	    throw new UserDefinedException("Check your data.");
	  }
	  
	  
	  
	  
	  // insert data PO detail  
	  if ( col[0].length() > 2  || Integer.parseInt(aqtytot) > 0 ) {
	     insert_podetail(pono, col[0],aqty[0],aqty[1],aqty[2],aqty[3],aqty[4],aqty[5],aqtytot,conn);
	     insert_podetail_history(pono, col[0],aqty[0],aqty[1],aqty[2],aqty[3],aqty[4],aqty[5],aqtytot,conn);
	  }
	  if (col[1].length() > 2 || Integer.parseInt(bqtytot) > 0 ) {
	     insert_podetail(pono, col[1],bqty[0],bqty[1],bqty[2],bqty[3],bqty[4],bqty[5], bqtytot,conn);
	     insert_podetail_history(pono, col[1],bqty[0],bqty[1],bqty[2],bqty[3],bqty[4],bqty[5], bqtytot,conn);
	  } 
	  if (col[2].length() > 2 || Integer.parseInt(cqtytot) > 0 ) {
	     insert_podetail(pono, col[2],cqty[0],cqty[1],cqty[2],cqty[3],cqty[4],cqty[5],cqtytot,conn);
	     insert_podetail_history(pono, col[2],cqty[0],cqty[1],cqty[2],cqty[3],cqty[4],cqty[5],cqtytot,conn);
	  } 
	  if ( col[3].length() > 2 || Integer.parseInt(dqtytot) > 0 ) {
	     insert_podetail(pono, col[3],dqty[0],dqty[1],dqty[2],dqty[3],dqty[4],dqty[5],dqtytot,conn);
	     insert_podetail_history(pono, col[3],dqty[0],dqty[1],dqty[2],dqty[3],dqty[4],dqty[5],dqtytot,conn);
	  }
	  if ( col[4].length() > 2 || Integer.parseInt(eqtytot) > 0 ) {   
	     insert_podetail(pono, col[4],eqty[0],eqty[1],eqty[2],eqty[3],eqty[4],eqty[5], eqtytot,conn);
	     insert_podetail_history(pono, col[4],eqty[0],eqty[1],eqty[2],eqty[3],eqty[4],eqty[5], eqtytot,conn);
	  }  
   } // data insert end
   
   if ( input_flag.equals("DEL") ) {
      conn.setAutoCommit(false);
    
       // delete po detail 
	  sql = "delete from purchase_order where order_no = '"  + pono + "' ";
      pstmt = conn.prepareStatement(sql);
      iCnt = pstmt.executeUpdate();

	   // delete po detail 
	  sql = "delete from purchase_order_history where order_no = '"  + pono + "' ";
      pstmt = conn.prepareStatement(sql);
      iCnt = pstmt.executeUpdate();

	   // delete po comment 
	  sql = "delete from PO_COMMENTS where order_no = '"  + pono + "' ";
      pstmt = conn.prepareStatement(sql);
      iCnt = pstmt.executeUpdate();
      
	   // delete po Lines
	  sql = "delete from purchase_order_line where order_no = '"  + pono + "' ";
      pstmt = conn.prepareStatement(sql);
      iCnt = pstmt.executeUpdate();

      conn.commit();

   } // data insert end
   
   
   if ( input_flag.equals("COM") ) {
      // PO Comments Update
      
      sql = " update  purchase_order set"
	      + "   COMMENTS=? "
	      + "   where order_no = '"  + pono + "' "; 
	
	  int idx = 0;
	  conn.setAutoCommit(false);
	  pstmt = conn.prepareStatement(sql);
	  pstmt.setString(++idx, contents);		  
	  iCnt = pstmt.executeUpdate();  

	  if (iCnt != 1) {
	    throw new UserDefinedException("Check your data.(PO master");
	  }
	   
    // insert..comment  history
    sql = " insert into PO_COMMENTS "
        + " ( "
        + "   ORDER_NO, SUPPLIER_REMARKS, SUPPLIER_ID, SUPPLIER_UPDATED "
        + " ) "
        + " values "
        + " ( "
        + "    ?, ?, ?, sysdate()  "
        + " ) ";
      idx = 1;  
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(idx++, pono.toUpperCase());
      pstmt.setString(idx++, contents);
      pstmt.setString(idx++, _adminid);
      iCnt = pstmt.executeUpdate();
      if (iCnt != 1) {
        throw new UserDefinedException("Check SAMPLE_COMMENTS data.");
      }
      conn.commit();
   }
   
   if ( input_flag.equals("UPDATE") ) {
       sql = " update  purchase_order set"
	      + "   STYLE = ?, "
	      + "   SEASON =?, "
	      + "   SGR =?, "
	      + "   PGR =?, "
	      
	      + "   FABRIC=?, "
	      + "   ITEM_TEXT = ?, "
	      + "   SUP_STOCK_CODE =?, "
	      + "   VENDOR_PRICE = ?, "
	      + "   INITIAL_DEL_DATE = str_to_date(?, '%Y/%m/%d'), "
	      
	      + "   TRANS_TYPE=?, "
	      + "   CURRENCY_CODE=?,"
	      + "   BRAND =?, "
	      
	      + "   BUYER = ?,"
	      + "   SUPPLIER=?,"
	      + "   SUBSUPPLIER=?,"
	      + "   DELIVERY_DATE= str_to_date(?, '%Y/%m/%d'),"
	      
	      + "   SIZC_1=?,"
	      + "   SIZC_2=?,"
	      + "   SIZC_3=?,"
	      + "   SIZC_4=?,"
	      + "   SIZC_5=?,"
	      + "   SIZC_6=?, "
	      
	      + "   UPDATED=sysdate(),"
	      + "   USER_NAME=?,"
	      + "   BUYER_NAME=?,"
	      + "   SUPPLIER_NAME=?,"
	      + "   SUBSUPPLIER_NAME=?,"
	      
	      + "   COMMENTS=?,"
	      + "   TOTAL_QTY=?, "
	      + "   ORDER_DATE= str_to_date(?, '%Y/%m/%d'), "
	      + "   PO_TYPE = ? , "
	      + "   LOCAL_PRICE = ?, "
	      + "   REORDER_SEQ = ? "
	      + "   where order_no = '"  + pono + "' "; 
	
	  int idx = 0;
	  conn.setAutoCommit(false);
	  pstmt = conn.prepareStatement(sql);
	  pstmt.setString(++idx, styno.toUpperCase());
	  pstmt.setString(++idx, season.toUpperCase());
	  pstmt.setString(++idx, sgr);
	  pstmt.setString(++idx, pgr);
	  
	  pstmt.setString(++idx, material);
	  pstmt.setString(++idx, itemtext);
	  pstmt.setString(++idx, supstyno);
	  pstmt.setString(++idx, unitprice);
	  pstmt.setString(++idx, deliverydate);
	  
	  pstmt.setString(++idx, shiptype);
	  pstmt.setString(++idx, currency);
	  pstmt.setString(++idx,  brand);
	  
	  pstmt.setString(++idx, buyer);
	  pstmt.setString(++idx, supplier);
	  pstmt.setString(++idx, subsupplier);
	  pstmt.setString(++idx, deliverydate);
	  
	  pstmt.setString(++idx, siz_1);
	  pstmt.setString(++idx, siz_2);
	  pstmt.setString(++idx, siz_3);
	  pstmt.setString(++idx, siz_4);
	  pstmt.setString(++idx, siz_5);
	  pstmt.setString(++idx, siz_6);
	  
	  pstmt.setString(++idx, _adminid);
	  pstmt.setString(++idx, buyer_name);
	  pstmt.setString(++idx, supplier_name);
	  pstmt.setString(++idx, subsupplier_name);
	  
	  pstmt.setString(++idx, contents);
	  pstmt.setString(++idx, total_qty);
	  pstmt.setString(++idx, orderdate);
	  pstmt.setString(++idx, deltype);
	  pstmt.setString(++idx, local_price);
	  pstmt.setString(++idx, reorder_seq);
	  
	  iCnt = pstmt.executeUpdate();  

	  if (iCnt != 1) {
	    throw new UserDefinedException("Check your data.(PO master");
	  }
	  
	   // insert data purchase order history
	  sql = " insert  into purchase_order_history"
	      + " ( "
	      + "   ORDER_NO ,  BACKORDER_FLAG ,  STYLE , SEASON ,  SGR ,  PGR  , "
	      + "   FABRIC, ITEM_TEXT, SUP_STOCK_CODE, VENDOR_PRICE ,  INITIAL_DEL_DATE, "
	      + "   TRANS_TYPE , ORDER_STATUS ,CURRENCY_CODE, BRAND , "
	      + "   BUYER,SUPPLIER  , SUBSUPPLIER, DELIVERY_DATE ,"
	      + "   SIZC_1,SIZC_2,SIZC_3,SIZC_4,SIZC_5,SIZC_6, "
	      + "   UPDATED,USER_NAME,CREATED,BUYER_NAME,SUPPLIER_NAME,SUBSUPPLIER_NAME,"
	      + "   COMMENTS,TOTAL_QTY ,ORDER_DATE,PO_TYPE,LOCAL_PRICE,REORDER_SEQ ";
	  
	  sql += " ) "
	       + " values "
	       + " ( "
	       + "   ?,'N',?,?,?,?, "
	       + "   ?,?,?,?,str_to_date(?, '%Y/%m/%d'), "
	       + "   ?,?,?,?, "
	       + "   ?,?,?,str_to_date(?, '%Y/%m/%d'),"
	       + "   ?,?,?,?,?,?, "
	       + "   sysdate(), ?,sysdate(),?,?,?, "
	       + "   ?,?,str_to_date(?, '%Y/%m/%d'),? ,?, ?  ) " ;
	
	  int idx2 = 0;
	  conn.setAutoCommit(false);
	
	  pstmt = conn.prepareStatement(sql);
	  pstmt.setString(++idx2, pono.toUpperCase());
	  //pstmt.setString(++idx2, "N");
	  pstmt.setString(++idx2, styno.toUpperCase());
	  pstmt.setString(++idx2, season.toUpperCase());
	  pstmt.setString(++idx2, sgr);
	  pstmt.setString(++idx2, pgr);
	  
	  pstmt.setString(++idx2, material);
	  pstmt.setString(++idx2, itemtext);
	  pstmt.setString(++idx2, supstyno);
	  pstmt.setString(++idx2, unitprice);
	  pstmt.setString(++idx2, deliverydate);
	  
	  pstmt.setString(++idx2, shiptype);
	  pstmt.setString(++idx2, "40"); //order status 40 : 오더작성
	  pstmt.setString(++idx2, currency);
	  pstmt.setString(++idx2,  brand);
	  
	  pstmt.setString(++idx2, buyer);
	  pstmt.setString(++idx2, supplier);
	  pstmt.setString(++idx2, subsupplier);
	  pstmt.setString(++idx2, deliverydate);

	  
	  pstmt.setString(++idx2, siz_1);
	  pstmt.setString(++idx2, siz_2);
	  pstmt.setString(++idx2, siz_3);
	  pstmt.setString(++idx2, siz_4);
	  pstmt.setString(++idx2, siz_5);
	  pstmt.setString(++idx2, siz_6);
	  
	  pstmt.setString(++idx2, _adminid);
	  pstmt.setString(++idx2, buyer_name);
	  pstmt.setString(++idx2, supplier_name);
	  pstmt.setString(++idx2, subsupplier_name);
	  
	  pstmt.setString(++idx2, contents);
	  pstmt.setString(++idx2, total_qty);
	  pstmt.setString(++idx2, orderdate);
	  pstmt.setString(++idx2, deltype);
	  pstmt.setString(++idx2, local_price);
	  pstmt.setString(++idx2, reorder_seq);
	
	  iCnt = pstmt.executeUpdate();

	  if (iCnt != 1) {
	    throw new UserDefinedException("Check your data.");
	  }

	  // delete po detail before update
	  sql = "delete from purchase_order_line where order_no = '"  + pono + "' ";
      pstmt = conn.prepareStatement(sql);
      iCnt = pstmt.executeUpdate();
      conn.commit();
      
	  //if (iCnt != 1) {
	  //  throw new UserDefinedException("Check your data.(PO detail)");
	  //}
	  
	  // insert data PO detail  
	  if ( col[0].length() > 2  || Integer.parseInt(aqtytot) > 0 ) {
	     insert_podetail(pono, col[0],aqty[0],aqty[1],aqty[2],aqty[3],aqty[4],aqty[5],aqtytot,conn);
	     insert_podetail_history(pono, col[0],aqty[0],aqty[1],aqty[2],aqty[3],aqty[4],aqty[5],aqtytot,conn);
	  }
	  if (col[1].length() > 2 || Integer.parseInt(bqtytot) > 0 ) {
	     insert_podetail(pono, col[1],bqty[0],bqty[1],bqty[2],bqty[3],bqty[4],bqty[5], bqtytot,conn);
	     insert_podetail_history(pono, col[1],bqty[0],bqty[1],bqty[2],bqty[3],bqty[4],bqty[5], bqtytot,conn);
	  } 
	  if (col[2].length() > 2 || Integer.parseInt(cqtytot) > 0 ) {
	     insert_podetail(pono, col[2],cqty[0],cqty[1],cqty[2],cqty[3],cqty[4],cqty[5],cqtytot,conn);
	     insert_podetail_history(pono, col[2],cqty[0],cqty[1],cqty[2],cqty[3],cqty[4],cqty[5],cqtytot,conn); 
	  } 
	  if ( col[3].length() > 2 || Integer.parseInt(dqtytot) > 0 ) {
	     insert_podetail(pono, col[3],dqty[0],dqty[1],dqty[2],dqty[3],dqty[4],dqty[5],dqtytot,conn);
	     insert_podetail_history(pono, col[3],dqty[0],dqty[1],dqty[2],dqty[3],dqty[4],dqty[5],dqtytot,conn);
	  }
	  if ( col[4].length() > 2 || Integer.parseInt(eqtytot) > 0 ) {   
	     insert_podetail(pono, col[4],eqty[0],eqty[1],eqty[2],eqty[3],eqty[4],eqty[5], eqtytot,conn);
	     insert_podetail_history(pono, col[3],dqty[0],dqty[1],dqty[2],dqty[3],dqty[4],dqty[5],dqtytot,conn); 
	  }  
    
   } // Data Update  end
   
  // commit;
  conn.commit();

  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  strMsg = ue.getMessage();
  System.out.println("Exception PO_input : " + ue.getMessage());
} catch (SQLException se) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  strMsg = "Check your data. " + se.getMessage();
  System.out.println("Exception PO_input : " + se.getMessage());
  throw se;
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  strMsg = "Error occurred. " + e.getMessage();
  System.out.println("Exception PO_input : " + e.getMessage());
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
        strMsg = "PO#번호 ( "+pono+") 가 성공적으로 생성이 되었습니다! 확인버튼을 누르시면 PO리스트 화면으로 이동됩니다. ";
   }
   if ( input_flag.equals("UPDATE") || input_flag.equals("COM") ) {
        strMsg = "PO#번호 ( "+pono+") 가 성공적으로 Update 되었습니다! 확인버튼을 누르시면 PO리스트 화면으로 이동됩니다. ";
   }    
      if ( input_flag.equals("DEL") ) {
        strMsg = "PO#번호 ( "+pono+") 가 성공적으로 삭제 되었습니다! 확인버튼을 누르시면 PO리스트 화면으로 이동됩니다. ";
        nextUrl = "admin_order_list.jsp";
   } 
} else {
  strMsg = "The operation failed.\\n" + StringUtil.replace(StringUtil.replace(strMsg, "\"", "\\\""), "\n", "\\n");
  //nextUrl = "PO_Details.jsp";
}
%>

<%!
private void insert_podetail(String pono,String color, String qty1,String qty2,String qty3,String qty4,String qty5,String qty6,String totqty,Connection conn){

	  String sql = " insert  into purchase_order_line "
      + " ( "
      + "   ORDER_NO ,  BACKORDER_FLAG ,  COLOUR ,  "
      + "   SQTY_1,SQTY_2,SQTY_3,SQTY_4,SQTY_5,SQTY_6, "
      + "   TOTAL_QTY ";
  
  sql += " ) "
       + " values "
       + " ( "
       + "   '" + pono + "','N','" + color + "',  "
       + "   '" + qty1 + "','" +qty2 + "','" + qty3 + "','" + qty4 + "', '" + qty5 + "','" + qty6 + "', "
       + "   '" + totqty + "' ) " ;
       
	try{	
		Statement stmt = conn.createStatement();
		int iRet = stmt.executeUpdate(sql);
		stmt.close();		
		}catch( SQLException e ) {
	}

}
%>

<%!
private void insert_podetail_history(String pono,String color, String qty1,String qty2,String qty3,String qty4,String qty5,String qty6,String totqty,Connection conn){

	  String sql = " insert  into purchase_order_line_history "
      + " ( "
      + "   ORDER_NO ,  BACKORDER_FLAG ,  COLOUR ,  "
      + "   SQTY_1,SQTY_2,SQTY_3,SQTY_4,SQTY_5,SQTY_6, "
      + "   TOTAL_QTY,UPDATED ";
  
  sql += " ) "
       + " values "
       + " ( "
       + "   '" + pono + "','N','" + color + "',  "
       + "   '" + qty1 + "','" +qty2 + "','" + qty3 + "','" + qty4 + "', '" + qty5 + "','" + qty6 + "', "
       + "   '" + totqty + "',now() ) " ;
       
	try{	
		Statement stmt = conn.createStatement();
		int iRet = stmt.executeUpdate(sql);
		stmt.close();		
		}catch( SQLException e ) {
	}

}
%>
<html>
<head>
<title></title>
</head>
<body>
<form name="form1" method="post" action="./<%= nextUrl %>">
<input type="hidden" name="pono" value="<%= pono %>">
<input type="hidden" name="po_no_selected" value="<%= pono %>">
<input type='hidden' name='ag_orderby' value='<%= ag_orderby %>'>
<input type='hidden' name='ag_status' value='<%= ag_status %>'>
<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
<input type='hidden' name='ag_style_no' value='<%= ag_style_no %>'>
<input type='hidden' name='ag_supplier' value='<%= ag_supplier %>'>
<input type='hidden' name='ag_from_date' value='<%= ag_from_date %>'>
<input type='hidden' name='ag_to_date' value='<%= ag_to_date %>'>
</form>
<script language="javascript">
  alert("<%= strMsg %>");
  document.form1.submit();
</script>
</body>
</html>
