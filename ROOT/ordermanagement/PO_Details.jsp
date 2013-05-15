<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/calendar/calendar.htm" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
String po_no = request.getParameter("po_no_selected");
request.setCharacterEncoding("euc-kr"); 

String ag_supplier = request.getParameter("ag_supplier");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_status = request.getParameter("ag_status");
String ag_orderby = request.getParameter("ag_orderby");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");

String fromUrl = "PO_Details.jsp";
//String fromUrl = request.getParameter("fromUrl");
//if (fromUrl == null) fromUrl = request.getHeader("Referer");
String imgUrl = "<font color=red>Image<br>Not Ready</font>";
int iRet = 0;
int iRet2 = 0;
String strSep = "|!^";
String outS = "";
String outS01 = "";
String outS02 = "";
String outS03 = "";
String outS04 = "";
String outS05 = "";
String outS06 = "";
String outS07 = "";
String outS08 = "";
String outS09 = "";
String sql = "";
String today = DateUtil.getToday("yyyy/MM/dd");

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
String deltype ="";
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
   sql = " Select order_no ,style ,season , sgr ,pgr  , "
	      + " fabric, item_text, sup_stock_code,format(vendor_price,2), date_format(initial_del_date, '%Y/%m/%d'), "
	      + " TRANS_TYPE , ORDER_STATUS ,CURRENCY_CODE, BRAND , "
	      + " BUYER,SUPPLIER  , SUBSUPPLIER, date_format(delivery_date, '%Y/%m/%d'), "
	      + " SIZC_1,SIZC_2,SIZC_3,SIZC_4,SIZC_5,SIZC_6, "
	      + " COMMENTS,TOTAL_QTY,date_format(order_date, '%Y/%m/%d'),date_format(arrival_date, '%Y/%m/%d'), "
	      + " PO_TYPE,format(LOCAL_PRICE,2), REORDER_SEQ "
	      + " from purchase_order "
	      + " where order_no = '"+po_no+"' ";
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
		  deltype = matrix.getRowData(i).getData(j++);
		  local_price = matrix.getRowData(i).getData(j++);
		  reorder_seq = matrix.getRowData(i).getData(j++);					
	 }	        
 }
  if ( init_delivery_date.equals("0000/00/00") )  init_delivery_date ="";
 if (delivery_date.equals("0000/00/00") ) delivery_date ="";
 if (order_date.equals("0000/00/00") ) order_date ="";
 if (ship_date.equals("0000/00/00") ) ship_date ="";
 
 // set item imagae
    File imgFile = new File(application.getRealPath(_styleImgURL) + File.separator + style_no.toLowerCase() + ".jpg");
	if (imgFile.exists()) {
	  imgUrl = "<img src='" + _styleImgURL + "/" + style_no.toLowerCase() + ".jpg' width='110' height='169'>";
	}
 // get buyer code
  sql = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'B' and delete_yn='N' "
      + " order by id asc";

  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String bid  = matrix.getRowData(i).getData(0);
    String bname  = matrix.getRowData(i).getData(1);
    outS01  += "<option value=\"" + bid + "\"";  
    if ( buyer.equals(bid) ) {
       outS01  += " SELECTED ";  
    }
    outS01  += ">" + bname + "</option>";
  }
  // get supplier code
  sql = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'S' and delete_yn='N' "
      + " order by id asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String sid  = matrix.getRowData(i).getData(0);
    String sname  = matrix.getRowData(i).getData(1);
    outS02  += "<option value=\"" + sid + "\"";    
    if ( supplier.equals(sid) ) {
       outS02  += " SELECTED ";  
    }
    outS02  += ">" + sname + "</option>";
  } 
     // get PGR code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'PGR' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String pgrcode  = matrix.getRowData(i).getData(0);
    String pgrname  = matrix.getRowData(i).getData(1);
    outS03  += "<option value=\"" + pgrcode + "\"";    
    if ( pgr.equals(pgrcode) ) {
       outS03  += " SELECTED ";  
    }
    outS03  += ">" + pgrname + "</option>";
  }
  // get SGR code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'SGR' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String sgrcode  = matrix.getRowData(i).getData(0);
    String sgrname  = matrix.getRowData(i).getData(1);
    outS04  += "<option value=\"" + sgrcode + "\"";    
    if ( sgr.equals(sgrcode) ) {
       outS04  += " SELECTED ";  
    }
    outS04  += ">" + sgrname + "</option>";
  }
  // get MATERIAL code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'MATERIAL' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String mcode  = matrix.getRowData(i).getData(0);
    String mname  = matrix.getRowData(i).getData(1);
    outS05  += "<option value=\"" + mcode + "\"";    
   if ( fabric.equals(mcode) ) {
       outS05  += " SELECTED ";  
    }
    outS05  += ">" + mname + "</option>";
  }
  
   // get Currency code
  sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'CURRENCY' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String curcode  = matrix.getRowData(i).getData(0);
    String curname  = matrix.getRowData(i).getData(1);
    outS06  += "<option value=\"" + curcode + "\""; 
    if ( currency.equals(curcode) ) {
       outS06  += " SELECTED ";  
    }   
    outS06  += ">" + curname + "</option>";
  }
  // get SUBsupplier code
  sql = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'P' and delete_yn='N' "
      + " order by id asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String subid  = matrix.getRowData(i).getData(0);
    String subname  = matrix.getRowData(i).getData(1);
    outS07  += "<option value=\"" + subid + "\"";
    if ( subsupplier.equals(subid) ) {
       outS07  += " SELECTED ";  
    }    
    outS07  += ">" + subname + "</option>";
  } 
 // get season code
   sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'SEASON' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String season_code  = matrix.getRowData(i).getData(0);
    String season_name  = matrix.getRowData(i).getData(1);
    outS08  += "<option value=\"" + season_code + "\"";
    if ( season.equals(season_code) ) {
       outS08  += " SELECTED ";  
    }    
    outS08  += ">" + season_name + "</option>";
  } 
  // get TRANS TYPE code
   sql = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'TRANS_TYPE' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  for (int i = 0; i < iRet; i++) {
    String trans_code  = matrix.getRowData(i).getData(0);
    String trans_name  = matrix.getRowData(i).getData(1);
    outS09  += "<option value=\"" + trans_code + "\"";
    if ( deltype.equals(trans_code) ) {
       outS09  += " SELECTED ";  
    }    
    outS09  += ">" + trans_name + "</option>";
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
	    outS += "<tr class='table_header_center'>"
	          + "  <td width='20%' height='16' class='table_bg_bright'><input type='text' name= 'col_1'    value='"+col[i]+"' size='20' maxlength='15' class='input_text'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='aqty_1' value='"+qty1[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='aqty_2' value='"+qty2[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='aqty_3' value='"+qty3[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='aqty_4' value='"+qty4[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='aqty_5' value='"+qty5[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='aqty_6'  value='"+qty6[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change()'></td>"
	          + "  <td width='13%' height='16' class='table_bg_bright'><input type='text' name='aqtytot' value='"+siztotal_qty[i]+"' size='5' maxlength='5' class='input_text' readonly ></td>"
	          + "</tr>";
	    }
	    if ( i == 1 ) {
	     last_cnt = 2; 
	    outS += "<tr class='table_header_center'>"
	          + "  <td width='20%' height='16' class='table_bg_bright'><input type='text' name='col_2'  value='"+col[i]+"' size='20' maxlength='15' class='input_text'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='bqty_1' value='"+qty1[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change2()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='bqty_2' value='"+qty2[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change2()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='bqty_3' value='"+qty3[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change2()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='bqty_4' value='"+qty4[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change2()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='bqty_5' value='"+qty5[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change2()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='bqty_6'  value='"+qty6[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change2()'></td>"
	          + "  <td width='13%' height='16' class='table_bg_bright'><input type='text' name='bqtytot' value='"+siztotal_qty[i]+"' size='5' maxlength='5' class='input_text' readonly ></td>"
	          + "</tr>";
	    }
	    if ( i == 2 ) {
	     last_cnt = 3; 
	    outS += "<tr class='table_header_center'>"
	          + "  <td width='20%' height='16' class='table_bg_bright'><input type='text' name='col_3'  value='"+col[i]+"' size='20' maxlength='15' class='input_text'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='cqty_1' value='"+qty1[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change3()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='cqty_2' value='"+qty2[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change3()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='cqty_3' value='"+qty3[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change3()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='cqty_4' value='"+qty4[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change3()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='cqty_5' value='"+qty5[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change3()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='cqty_6'  value='"+qty6[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change3()'></td>"
	          + "  <td width='13%' height='16' class='table_bg_bright'><input type='text' name='cqtytot' value='"+siztotal_qty[i]+"' size='5' maxlength='5' class='input_text' readonly ></td>"
	          + "</tr>";
	    }
	    if ( i == 3 ) {
	      last_cnt = 4;  
	    outS += "<tr class='table_header_center'>"
	          + "  <td width='20%' height='16' class='table_bg_bright'><input type='text' name='col_4'     value='"+col[i]+"' size='20' maxlength='15' class='input_text'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='dqty_1' value='"+qty1[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change4()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='dqty_2' value='"+qty2[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change4()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='dqty_3' value='"+qty3[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change4()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='dqty_4' value='"+qty4[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change4()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='dqty_5' value='"+qty5[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change4()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='dqty_6'  value='"+qty6[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change4()'></td>"
	          + "  <td width='13%' height='16' class='table_bg_bright'><input type='text' name='dqtytot' value='"+siztotal_qty[i]+"' size='5' maxlength='5' class='input_text' readonly ></td>"
	          + "</tr>";
	    }
	    if ( i == 4 ) {
	      last_cnt = 5;   
	    outS += "<tr class='table_header_center'>"
	          + "  <td width='20%' height='16' class='table_bg_bright'><input type='text' name='col_5'     value='"+col[i]+"' size='20' maxlength='15' class='input_text'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='eqty_1' value='"+qty1[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change5()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='eqty_2' value='"+qty2[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change5()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='eqty_3' value='"+qty3[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change5()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='eqty_4' value='"+qty4[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change5()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='eqty_5' value='"+qty5[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change5()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='eqty_6'  value='"+qty6[i]+"' onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change5()'></td>"
	          + "  <td width='13%' height='16' class='table_bg_bright'><input type='text' name='eqtytot' value='"+siztotal_qty[i]+"' size='5' maxlength='5' class='input_text' readonly ></td>"
	          + "</tr>";
	    }
	          
	  } 
	  // 추가 Color 입력을 위한 처리
	  int last_row=0;
	  String add_col="";
	  String add_qty1="";
	  String add_qty2="";
	  String add_qty3="";
	  String add_qty4="";
	  String add_qty5="";
	  String add_qty6="";
	  String add_tot="";
	  last_row = 5-iRet2;
	  	  
	  for ( int i = last_cnt+1; i < 6; i++) {
	        if ( i == 1 ) {
	             add_col="col_1";
				  add_qty1="aqty_1";
				  add_qty2="aqty_2";
				  add_qty3="aqty_3";
				  add_qty4="aqty_4";
				  add_qty5="aqty_5";
				  add_qty6="aqty_6";
				  add_tot="aqtytot";
	        } 
	        if ( i == 2 ) {
	             add_col="col_2";
				  add_qty1="bqty_1";
				  add_qty2="bqty_2";
				  add_qty3="bqty_3";
				  add_qty4="bqty_4";
				  add_qty5="bqty_5";
				  add_qty6="bqty_6";
				  add_tot="bqtytot";
	        } 
	        if ( i == 3 ) {
	             add_col="col_3";
				  add_qty1="cqty_1";
				  add_qty2="cqty_2";
				  add_qty3="cqty_3";
				  add_qty4="cqty_4";
				  add_qty5="cqty_5";
				  add_qty6="cqty_6";
				  add_tot="cqtytot";
	        } 
	        if ( i == 4 ) {
	             add_col="col_4";
				  add_qty1="dqty_1";
				  add_qty2="dqty_2";
				  add_qty3="dqty_3";
				  add_qty4="dqty_4";
				  add_qty5="dqty_5";
				  add_qty6="dqty_6";
				  add_tot="dqtytot";
	        } 
	        if ( i == 5 ) {
	             add_col="col_5";
				  add_qty1="eqty_1";
				  add_qty2="eqty_2";
				  add_qty3="eqty_3";
				  add_qty4="eqty_4";
				  add_qty5="eqty_5";
				  add_qty6="eqty_6";
				  add_tot="eqtytot";
	        } 
	        outS += "<tr class='table_header_center'>"
	          + "  <td width='20%' height='16' class='table_bg_bright'><input type='text' name='"+add_col+"'      size='20' maxlength='15' class='input_text'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+add_qty1+"'  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+add_qty2+"'  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+add_qty3+"'  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+add_qty4+"'  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+add_qty5+"'  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+add_qty6+"'   onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='13%' height='16' class='table_bg_bright'><input type='text' name='"+add_tot+"'  size='5' maxlength='5' class='input_text' readonly ></td>"
	          + "</tr>";
	  }
	  // 
  } else {
  	  // color qty data가 없을때 처리      
	  String Nadd_col="";
	  String Nadd_qty1="";
	  String Nadd_qty2="";
	  String Nadd_qty3="";
	  String Nadd_qty4="";
	  String Nadd_qty5="";
	  String Nadd_qty6="";
	  String Nadd_tot="";	  	  	  
	  for ( int i = 1; i < 6; i++) {
	        if ( i == 1 ) {
	            Nadd_col="col_1";
				 Nadd_qty1="aqty_1";
				 Nadd_qty2="aqty_2";
				 Nadd_qty3="aqty_3";
				 Nadd_qty4="aqty_4";
				 Nadd_qty5="aqty_5";
				 Nadd_qty6="aqty_6";
				 Nadd_tot="aqtytot";
	        } 
	        if ( i == 2 ) {
	            Nadd_col="col_2";
				 Nadd_qty1="bqty_1";
				 Nadd_qty2="bqty_2";
				 Nadd_qty3="bqty_3";
				 Nadd_qty4="bqty_4";
				 Nadd_qty5="bqty_5";
				 Nadd_qty6="bqty_6";
				 Nadd_tot="bqtytot";
	        } 
	        if ( i == 3 ) {
	            Nadd_col="col_3";
				 Nadd_qty1="cqty_1";
				 Nadd_qty2="cqty_2";
				 Nadd_qty3="cqty_3";
				 Nadd_qty4="cqty_4";
				 Nadd_qty5="cqty_5";
				 Nadd_qty6="cqty_6";
				 Nadd_tot="cqtytot";
	        } 
	        if ( i == 4 ) {
	            Nadd_col="col_4";
				 Nadd_qty1="dqty_1";
				 Nadd_qty2="dqty_2";
				 Nadd_qty3="dqty_3";
				 Nadd_qty4="dqty_4";
				 Nadd_qty5="dqty_5";
				 Nadd_qty6="dqty_6";
				 Nadd_tot="dqtytot";
	        } 
	        if ( i == 5 ) {
	            Nadd_col="col_5";
				 Nadd_qty1="eqty_1";
				 Nadd_qty2="eqty_2";
				 Nadd_qty3="eqty_3";
				 Nadd_qty4="eqty_4";
				 Nadd_qty5="eqty_5";
				 Nadd_qty6="eqty_6";
				 Nadd_tot="eqtytot";
	        } 
	        outS += "<tr class='table_header_center'>"
	          + "  <td width='20%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_col+"'      size='20' maxlength='15' class='input_text'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_qty1+"'  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_qty2+"'  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_qty3+"'  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_qty4+"'  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_qty5+"'  onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='11%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_qty6+"'   onkeypress='return jf_EventNumberCheck();' size='5' maxlength='5' class='input_text' onBlur='Change"+i+"()'></td>"
	          + "  <td width='13%' height='16' class='table_bg_bright'><input type='text' name='"+Nadd_tot+"'  size='5' maxlength='5' class='input_text' readonly ></td>"
	          + "</tr>";
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
<title>Purchase Order Details</title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<script language="javaScript" src="/common/js/validate2.js"></script>
<script language="javascript">

function fnSave(frm) { 
  if (!frm.styno.value) {
    alert('Input style no!');
    frm.styno.focus();
    return;
  }
  if (!frm.buyer.value) {
    alert('Input Buyer!');
    frm.buyer.focus();
    return;
  }
   if (!frm.pgr.value) {
    alert('Input PGR!');
    frm.pgr.focus();
    return;
  }
   if (!frm.sgr.value) {
    alert('Input SGR!');
    frm.sgr.focus();
    return;
  }
  if (!frm.unitprice.value) {
    alert('Input Unit Price!');
    frm.unitprice.focus();
    return;
  }
  if (!frm.itemtext.value) {
    alert('Input Item text!');
    frm.itemtext.focus();
    return;
  }
  if (!frm.size1.value) {
    alert('Input at least one Size type!');
    frm.size1.focus();
    return;
  }
  if (!frm.col_1.value) {
    alert('Input at least one color and qty!');
    frm.col_1.focus();
    return;
  }
  if (confirm('Do you really want to save these data?')) { 
    frm.action = './order_input.jsp';
    frm.submit();
  }
}

function Change1() {
  num1 = form1.aqty_1.value;
  if( num1.length == 0 ) {
    num1 = "0";
    form1.aqty_1.value = "0";
  }
  num2 = form1.aqty_2.value;
  if( num2.length == 0 ) {
    num2 = "0";
    form1.aqty_2.value = "0";
  }
  num3 = form1.aqty_3.value;
  if( num3.length == 0 ) {
    num3 = "0";
    form1.aqty_3.value = "0";
  }
 num4 = form1.aqty_4.value;
  if( num4.length == 0 ) {
    num4 = "0";
    form1.aqty_4.value = "0";
  }
   num5 = form1.aqty_5.value;
  if( num5.length == 0 ) {
    num5 = "0";
    form1.aqty_5.value = "0";
  }
 num6 = form1.aqty_6.value;
  if( num6.length == 0 ) {
    num6 = "0";
    form1.aqty_6.value = "0";
  }
  

  var tmpTotal = eval(num1) + eval(num2) + eval(num3) + eval(num4) + eval(num5)
                  + eval(num6) 
  form1.aqtytot.value = tmpTotal;
}
function Change2() {
  num1 = form1.bqty_1.value;
  if( num1.length == 0 ) {
    num1 = "0";
    form1.bqty_1.value = "0";
  }
  num2 = form1.bqty_2.value;
  if( num2.length == 0 ) {
    num2 = "0";
    form1.bqty_2.value = "0";
  }
  num3 = form1.bqty_3.value;
  if( num3.length == 0 ) {
    num3 = "0";
    form1.bqty_3.value = "0";
  }
 num4 = form1.bqty_4.value;
  if( num4.length == 0 ) {
    num4 = "0";
    form1.bqty_4.value = "0";
  }
   num5 = form1.bqty_5.value;
  if( num5.length == 0 ) {
    num5 = "0";
    form1.bqty_5.value = "0";
  }
 num6 = form1.bqty_6.value;
  if( num6.length == 0 ) {
    num6 = "0";
    form1.bqty_6.value = "0";
  }
  

  var tmpTotal = eval(num1) + eval(num2) + eval(num3) + eval(num4) + eval(num5)
                  + eval(num6) 
  form1.bqtytot.value = tmpTotal;
}
function Change3() {
  num1 = form1.cqty_1.value;
  if( num1.length == 0 ) {
    num1 = "0";
    form1.cqty_1.value = "0";
  }
  num2 = form1.cqty_2.value;
  if( num2.length == 0 ) {
    num2 = "0";
    form1.cqty_2.value = "0";
  }
  num3 = form1.cqty_3.value;
  if( num3.length == 0 ) {
    num3 = "0";
    form1.cqty_3.value = "0";
  }
 num4 = form1.cqty_4.value;
  if( num4.length == 0 ) {
    num4 = "0";
    form1.cqty_4.value = "0";
  }
   num5 = form1.cqty_5.value;
  if( num5.length == 0 ) {
    num5 = "0";
    form1.cqty_5.value = "0";
  }
 num6 = form1.cqty_6.value;
  if( num6.length == 0 ) {
    num6 = "0";
    form1.cqty_6.value = "0";
  }
  

  var tmpTotal = eval(num1) + eval(num2) + eval(num3) + eval(num4) + eval(num5)
                  + eval(num6) 
  form1.cqtytot.value = tmpTotal;
}
function Change4() {
  num1 = form1.dqty_1.value;
  if( num1.length == 0 ) {
    num1 = "0";
    form1.dqty_1.value = "0";
  }
  num2 = form1.dqty_2.value;
  if( num2.length == 0 ) {
    num2 = "0";
    form1.dqty_2.value = "0";
  }
  num3 = form1.dqty_3.value;
  if( num3.length == 0 ) {
    num3 = "0";
    form1.dqty_3.value = "0";
  }
 num4 = form1.dqty_4.value;
  if( num4.length == 0 ) {
    num4 = "0";
    form1.dqty_4.value = "0";
  }
   num5 = form1.dqty_5.value;
  if( num5.length == 0 ) {
    num5 = "0";
    form1.dqty_5.value = "0";
  }
 num6 = form1.dqty_6.value;
  if( num6.length == 0 ) {
    num6 = "0";
    form1.dqty_6.value = "0";
  }
  

  var tmpTotal = eval(num1) + eval(num2) + eval(num3) + eval(num4) + eval(num5)
                  + eval(num6) 
  form1.dqtytot.value = tmpTotal;
}
function Change5() {
  num1 = form1.eqty_1.value;
  if( num1.length == 0 ) {
    num1 = "0";
    form1.eqty_1.value = "0";
  }
  num2 = form1.eqty_2.value;
  if( num2.length == 0 ) {
    num2 = "0";
    form1.eqty_2.value = "0";
  }
  num3 = form1.eqty_3.value;
  if( num3.length == 0 ) {
    num3 = "0";
    form1.eqty_3.value = "0";
  }
 num4 = form1.eqty_4.value;
  if( num4.length == 0 ) {
    num4 = "0";
    form1.eqty_4.value = "0";
  }
   num5 = form1.eqty_5.value;
  if( num5.length == 0 ) {
    num5 = "0";
    form1.eqty_5.value = "0";
  }
 num6 = form1.eqty_6.value;
  if( num6.length == 0 ) {
    num6 = "0";
    form1.eqty_6.value = "0";
  }
  

  var tmpTotal = eval(num1) + eval(num2) + eval(num3) + eval(num4) + eval(num5)
                  + eval(num6) 
  form1.eqtytot.value = tmpTotal;
}
function fnBack(frm) {
  frm.action = "<%= fromUrl %>";
  frm.target = this.name;
  frm.submit();
}
function fnList(frm)
{ 
  frm.action = "./admin_order_list.jsp";  
  frm.submit(); 
}

function fnPrint(frm) {
  //var win = window.open('', "winPrint", "toolbar=no, menubar=no, resizable=no, scrollbars=yes, width=1000, height=900");

  //if (win) {
    frm.action = './po_print.jsp';  
 //   frm.target = win.name;
    frm.submit();
 // }

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
  <td width='*' class='left_title'>Edit Purchase Order</td>
</tr>
<tr>
  <td width='100%' height='2' colspan='2'><hr width='100%'></td>
</tr>
<tr>
  <td height='10' colspan='2'></td>
</tr>
</table>
<table width='840' border='0' cellspacing='0' cellpadding='0'>
<tr><td>
(*)marked item must be filled in.	
<table width='100%' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>
<form name="form1" method="post">
	<INPUT TYPE=HIDDEN NAME=input_flag VALUE='UPDATE' >
	<INPUT TYPE=HIDDEN NAME=pono VALUE='<%=po_no%>' >	
	<input type='hidden' name='ag_orderby' value='<%= ag_orderby %>'>
    <input type='hidden' name='ag_status' value='<%= ag_status %>'>
   <input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
   <input type='hidden' name='ag_style_no' value='<%= ag_style_no %>'>
   <input type='hidden' name='ag_supplier' value='<%= ag_supplier %>'>
   <input type='hidden' name='ag_from_date' value='<%= ag_from_date %>'>
   <input type='hidden' name='ag_to_date' value='<%= ag_to_date %>'>	
	<input type='hidden' name='fromUrl' value='<%= fromUrl %>'>
  <tr class="table_header_center">
    <td width="21%" height="16" class='table_header_center'>*PO#</td>
    <td width="21%" height="16" class='table_header_center'>*Style#</td>
    <td width="23%" height="16" class='table_header_center'>*Buyer</td>
    <td width="35%" colspan="2" height="16" class='table_header_center'>Supplier</td>
  </tr>
  <tr class="table_header_center">
    <td width="21%" height="23" class='table_bg_bright'><input type='text' name='pono' value='<%=po_no%>' size='15' maxlength='15' class='input_text' readonly='true' ></td>
    <td width="21%" height="23" class='table_bg_bright'><input type='text' name='styno' value='<%=style_no%>' size='15' maxlength='15' class='input_text'></td>
    <td width="23%" height="23" class='table_bg_bright'><select name="buyer" ><%= outS01 %></select></td>
    <td width="35%" colspan="2" height="23" class='table_bg_bright'><select name="supplier"><%=outS02 %></select></td>
  </tr>
  <tr class="table_header_center">
    <td width="21%" height="16" class='table_header_center'>*Product Group</td>
    <td width="21%" height="16" class='table_header_center'>*Sub group</td>
    <td width="23%" height="16" class='table_header_center'>*Unit Price</td>
    <td width="19%" height="16" class='table_header_center'>Order date</td>
    <td width="16%" height="16" class='table_header_center'>Delivery date</td>
  </tr>
  <tr class="table_header_center">
    <td width="21%" height="23" class='table_bg_bright'><select name="pgr"><%=outS03 %></select></td>
    <td width="21%" height="23" class='table_bg_bright'><select name="sgr"><%=outS04 %></select></td>
    <td width="23%" height="23" class='table_bg_bright'><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='unitprice' value='<%=unitprice%>' size='10' maxlength='10' class='input_text' >
    	      &nbsp;&nbsp;<select name="currency"><%=outS06 %></select></td>
    <td width='19%' class="table_bg_bright"><input type='text' name='orderdate' value='<%= order_date %>' size='12' readonly class='input_text'>
    <img src="/img/calendar.gif" style="cursor:hand" align="absmiddle" onclick="javascript:popFrame.fPopCalendar(this, document.form1.orderdate, document.all['popCal'], 'RIGHT', event);"></td>
    <td width='16%' class="table_bg_bright"><input type='text' name='deliverydate' value='<%= delivery_date %>' size='12' readonly class='input_text'>
    <img src="/img/calendar.gif" style="cursor:hand" align="absmiddle" onclick="javascript:popFrame.fPopCalendar(this, document.form1.deliverydate, document.all['popCal'], 'RIGHT', event);"></td>
  </tr>
  <tr class="table_header_center">
    <td width="21%" height="22" class='table_header_center'>Ship type</td>
    <td width="21%" height="22" class='table_header_center'>Material</td>
    <td width="23%" height="22" class='table_header_center'>*Season</td>
    <td width="19%" height="22" class='table_header_center'>Manufacturer</td>
    <td width="16%" height="22" class='table_header_center'>Task Number</td>
  </tr>
  <tr class="table_header_center">
    <td width="21%" height="27" class='table_bg_bright'><SELECT NAME='shiptype'>
      <OPTION VALUE="FOB">FOB</OPTION>
      <OPTION VALUE="CIF">CIF</OPTION>
      </SELECT></td>
    <td width='21%' class="table_bg_bright"><select name="material"><%=outS05 %></select></td>
    <td width="23%" height="27" class='table_bg_bright'><SELECT NAME=season><%=outS08 %> </SELECT></td>
    <td width="19%" height="27" class='table_bg_bright'><select name="subsupplier"><%=outS07 %></select></td>
    <td width="16%" height="27" class='table_bg_bright'><input type='text' name='supstyno' value='<%= sup_style_no %>' size='20' maxlength='20' class='input_text'></td>
  </tr>
  <tr class="table_header_center">
    <td width="21%" height="22" class='table_header_center'>BRAND</td>
    <td width="21%" height="22" class='table_header_center'>Shipping Type</td>
    <td width="23%" height="22" class='table_header_center'>Local Price(RMB)</td>
    <td width="19%" height="22" class='table_header_center'>Re-Order SEQ/td>
    <td width="16%" height="22" class='table_header_center'>Amend Date</td>
  </tr>
  <tr class="table_header_center">
    <td width="21%" height="27" class='table_bg_bright'><input type='text' value='<%= brand %>' name='brand' size='20' maxlength='20' class='input_text'></td>
    <td width="21%" height="22" class='table_bg_bright'><SELECT NAME=deltype><%=outS09 %> </SELECT></td>
    <td width="23%" height="22" class='table_bg_bright'><input type='text' onblur="extractNumber(this,2,false);" onkeyup="extractNumber(this,2,false);" onkeypress="return blockNonNumbers(this, event, true, false);"  name='local_price' value='<%=local_price%>' size='10' maxlength='10' class='input_text' ></td>
    <td width="19%" height="22" class='table_bg_bright'><input type='text' name='reorder' value='<%= reorder_seq %>' size='10' maxlength='10' class='input_text'></td>
    <td width="16%" height="22" class='table_bg_bright'>N/A</td>
  </tr>
  
  <tr class="table_header_center">
    <td width="21%" height="28" class='table_header_center'>*Item text</td>
    <td width="79%" colspan="4" height="28" class='table_bg_bright'><input type='text' value='<%= itemtext %>' name='itemtext' size='100' maxlength='100' class='input_text'></td>
  </tr>  
  <tr class="table_header_center">  	 
  	<td class='table_bg_bright' class='table_list_no_height' align='center'><%= imgUrl %></td>    
    <td width="79%" colspan="4" height="202" class='table_bg_bright'><TEXTAREA name="contents" cols="100" rows="14"  ><%= comments %></TEXTAREA></td>
  </tr>  
</table>
<table width='840' border='0' cellspacing='1' cellpadding='2' align='center' class='table_bg'>
  <tr class="table_header_center">
    <td width="20%" rowspan="2" class='table_header_center' height="38">*Color</td>
    <td width="67%" colspan="6" class='table_header_center' height="16">*Size</td>
    <td width="13%" rowspan="2" class='table_header_center' height="38">TOTAL</td>
  </tr>
  <tr class="table_header_center">
    <td width="11%" class='table_header_center' height="21"><font size="2"><input type='text' value='<%= size_1 %>' name='size1' size='10' maxlength='10' class='input_text'></font></td>
    <td width="11%" class='table_header_center' height="21"><font size="2"><input type='text' value='<%= size_2 %>' name='size2' size='10' maxlength='10' class='input_text'></font></td>
    <td width="11%" class='table_header_center'  height="21"><font size="2"><input type='text' value='<%= size_3 %>' name='size3' size='10' maxlength='10' class='input_text'></font></td>
    <td width="11%" class='table_header_center' height="21"><font size="2"><input type='text' value='<%= size_4 %>' name='size4' size='10' maxlength='10' class='input_text'></font></td>
    <td width="11%" class='table_header_center' height="21"><font size="2"><input type='text' value='<%= size_5 %>' name='size5' size='10' maxlength='10' class='input_text'></font></td>
    <td width="12%" class='table_header_center' height="21"><font size="2"><input type='text' value='<%= size_6 %>' name='size6' size='10' maxlength='10' class='input_text'></font></td>
  </tr>
<%=outS%>                                               
</table>
<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'>
<tr>
  <td height='15'></td>
</tr>
<tr>
  <td align='center'>
    <input type='button' value='Save' onclick='fnSave(this.form);'> &nbsp;&nbsp;&nbsp;&nbsp;
    <input type='button' value='PO Print' onclick='fnPrint(this.form)'> &nbsp;&nbsp;&nbsp;&nbsp;
    <input type='button' value='PO List' onclick='fnList(this.form);'>
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