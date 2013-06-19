<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@ include file="/admin/login_check.jsp" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/common/calendar/calendar.htm" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String QTY_FORMAT = "###,##0";
String MONEY_FORMAT = "###,##0.00";
String imgUrl = "<font color=red>Image<br>Not Ready</font>";
String ag_supplier = request.getParameter("ag_supplier");
String ag_season = request.getParameter("ag_season");
String ag_date_type = request.getParameter("ag_date_type");
String ag_from_date = request.getParameter("ag_from_date");
String ag_to_date = request.getParameter("ag_to_date");
String ag_po_no = request.getParameter("ag_po_no");
String ag_style_no = request.getParameter("ag_style_no");
String ag_orderby = request.getParameter("ag_orderby");
String ag_buyer = request.getParameter("ag_buyer");
if (ag_supplier == null) ag_supplier = "";
if (ag_season == null) ag_season = "";
if (ag_date_type == null) ag_date_type = "CD";
if (ag_from_date == null || ag_to_date == null) {
  ag_from_date = DateUtil.getRelativeDateString(new java.util.Date(), 0, 0, -6, "yyyy/MM/dd");
  ag_to_date = DateUtil.getToday("yyyy/MM/dd");
}
if (ag_po_no == null) ag_po_no = "";
if (ag_style_no == null) ag_style_no = "";
if (ag_orderby == null) ag_orderby = "6";
if (ag_buyer == null) ag_buyer = "";

String getDomain=request.getServerName();
String getPort=Integer.toString(request.getServerPort());
String getPath = getDomain + ":"+ getPort;

Connection conn = null;

MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
MatrixDataSet matrix3 = null;
MatrixDataSet matrix4 = null;
MatrixDataSet matrix5 = null;
DataProcess dataProcess = null;
String sql = "";
String sql2 = "";
String sql3 = "";
String sql4 = "";
String sql5 = "";
int iRet = 0;
int iRet2 = 0;
int iRet3 = 0;
int iRet4 = 0;
int iRet5 = 0;
String outS = "";
String statusList="";

// query for po list
sql = " select  order_no, "
    + "             style, "
    + "             season, "
    + "          buyer_name, "
    + "         supplier_name, "
    + "         order_status, "
    + "         date_format(created, '%Y/%m/%d'),total_qty, "
    + "         date_format(order_date,'%Y/%m/%d'), "
    + "         date_format(delivery_date,'%Y/%m/%d'), "
    + "         date_format(arrival_date,'%Y/%m/%d'), "
    + "         date_format(received_date,'%Y/%m/%d'), "
    + "            date_format(CONTRACT_DATE,'%Y/%m/%d'), "  
		+ "		  date_format(FIT_CONFIRM_DATE,'%Y/%m/%d'), " 
		+ "		  date_format(PP_CONFIRM_DATE,'%Y/%m/%d'), " 
		+ "		  date_format(PP_REQUESTED,'%Y/%m/%d'), "     
		+ "		  date_format(MAT_ORDER_DATE,'%Y/%m/%d'), "  
		+ "		  date_format(MAT_IN_DATE,'%Y/%m/%d'), "     
		+ "		  date_format(ACC_ORDER_DATE,'%Y/%m/%d'), "   
		+ "		  date_format(ACC_IN_DATE,'%Y/%m/%d'), "     
		+ "		  date_format(CUTTING,'%Y/%m/%d'), "         
		+ "		  date_format(RUNNING,'%Y/%m/%d'), "          
		+ "		  date_format(TOP_SENT,'%Y/%m/%d'), "         
		+ "		  date_format(TOP_CONFIRM,'%Y/%m/%d'), "       
		+ "	     date_format(PACKING_DATE,'%Y/%m/%d'), " 
	    + "	     date_format(INHOUSE_DATE,'%Y/%m/%d'), " 
	    + "	     date_format(ex_factory_date,'%Y/%m/%d'), " 
	    + "	     date_format(col_order_date,'%Y/%m/%d'), " 
	    + "	     date_format(col_in_date,'%Y/%m/%d'), " 
	    + "	     date_format(pp_in_date,'%Y/%m/%d'), " 
	    + "        subsupplier_name, "
            + "        has_order_sheet "
    + " from   purchase_order "
    + " where   backorder_flag = 'N' " ;

if (ag_po_no.length() > 0 || ag_style_no.length() > 0) {
  if (ag_po_no.length() > 0) {
    String sql_po_no = "'" + ag_po_no.replaceAll(",", "','") + "'";
    sql += " and    order_no in (" + sql_po_no + ") " ;
  }

  if (ag_style_no.length() > 0) {
    sql += " and    style like '" + ag_style_no + "%' " ;
  }
  
} else {
  if (!ag_supplier.equals("")) {
    sql += " and    supplier = '" + ag_supplier + "' ";
  }

  if (!ag_season.equals("")) {
    sql += " and    season = '" + ag_season + "' ";
  }

  if (!ag_buyer.equals("")) {
    sql += " and    buyer = '" + ag_buyer + "' ";
  }
  
  String tmpDate = "";
  if (ag_date_type.equals("DD")) {
    tmpDate = "delivery_date";
  } else if (ag_date_type.equals("AD")) {
    tmpDate = "arrival_date";
  } else if (ag_date_type.equals("CD")) {
    tmpDate = "created";
  } else if (ag_date_type.equals("OD")) {
    tmpDate = "order_date";
  }

 sql += " and " + tmpDate + "  BETWEEN  str_to_date('" + ag_from_date + "', '%Y/%m/%d') "
       + " and  str_to_date('" + ag_to_date + "',  '%Y/%m/%d') ";
}

sql += " order by ";

if ( ag_orderby.equals("1"))  {
  sql += " order_no ";
}
else if ( ag_orderby.equals("2"))  {
  sql += " supplier, order_no ";
}
else if ( ag_orderby.equals("3"))  {
  sql += " buyer, order_no ";
}
else if ( ag_orderby.equals("4"))  {
  sql += " arrival_date, order_no " ;
}
else if ( ag_orderby.equals("5"))  {
  sql += " delivery_date, order_no " ;
}
else if ( ag_orderby.equals("6"))  {
  sql += " delivery_date,supplier, order_no " ;
}
//out.println(sql);

// query for supplier list
sql2 = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'S' "
      + " order by id asc";

// query for buyer list
sql3 = " select  id, name "
      + " from    login_01t "
      + " where   user_type = 'B' "
      + " order by id asc";

// read user brand code info
//sql5 =  " select code,code_name from vg_common_code " +
//          " where type = 'BRAND' " +
//          " and     use_yn = 'Y' " +
//          "  order by code ";
          
sql4 = " select code,code_name  from vg_common_code " +
          " where type='ORDER_STATUS' and use_yn='Y' and code >'30' order by sort_order ";          

try {

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  matrix2 = new MatrixDataSet();
  matrix3 = new MatrixDataSet();
  matrix4 = new MatrixDataSet();
  //matrix5 = new MatrixDataSet();
  dataProcess = new DataProcess();

  // po list
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  //conn.commit();

  // supplier list
  
  iRet2 = dataProcess.RetrieveData(sql2, matrix2, conn);

  // buyer list
  iRet3 = dataProcess.RetrieveData(sql3, matrix3, conn);

  // brand list
 // iRet5 = dataProcess.RetrieveData(sql5, matrix5, conn);

  iRet4 = dataProcess.RetrieveData(sql4, matrix4, conn); 
  
} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception in admin_delivery_status_list : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {
    conn.close();
  }
 
}

// print po list
int editableCnt = 0;

for (int i = 0; i < iRet; i++) {
  int j = 0;  
  String po_no = matrix.getRowData(i).getData(j++);
  String style_no  = matrix.getRowData(i).getData(j++);
  String season   = matrix.getRowData(i).getData(j++);
  String buyer = matrix.getRowData(i).getData(j++);
  String supplier = matrix.getRowData(i).getData(j++);
  String po_status = matrix.getRowData(i).getData(j++);
  String created_date = matrix.getRowData(i).getData(j++); 
  String total_qty = matrix.getRowData(i).getData(j++); 
  String order_date = matrix.getRowData(i).getData(j++);
  String delivery_date = matrix.getRowData(i).getData(j++);
  String arrival_date = matrix.getRowData(i).getData(j++);
  String received_date = matrix.getRowData(i).getData(j++);
  String contract_date = matrix.getRowData(i).getData(j++);               
  String fit_confirm_date  = matrix.getRowData(i).getData(j++);           
  String pp_confirm_date  = matrix.getRowData(i).getData(j++);            
  String pp_requested = matrix.getRowData(i).getData(j++);                 
  String mat_order_date = matrix.getRowData(i).getData(j++);              
  String mat_in_date = matrix.getRowData(i).getData(j++);                 
  String acc_order_date = matrix.getRowData(i).getData(j++);              
  String acc_in_date = matrix.getRowData(i).getData(j++);                 
  String cutting = matrix.getRowData(i).getData(j++);                     
  String running = matrix.getRowData(i).getData(j++);                     
  String top_sent = matrix.getRowData(i).getData(j++);                     
  String top_confirm = matrix.getRowData(i).getData(j++);                  
  String packing_date = matrix.getRowData(i).getData(j++); 
  String inhouse_date = matrix.getRowData(i).getData(j++); 
  String go_date = matrix.getRowData(i).getData(j++); 
  String col_date = matrix.getRowData(i).getData(j++); 
  String col_in_date = matrix.getRowData(i).getData(j++);
  String pp_in_date = matrix.getRowData(i).getData(j++);  
  String subsupplier_name = matrix.getRowData(i).getData(j++);
  String has_order_sheet = matrix.getRowData(i).getData(j++);
  
   if ( order_date.equals("0000/00/00") )  order_date ="";
   if (delivery_date.equals("0000/00/00") ) delivery_date ="";
   if ( arrival_date.equals("0000/00/00") )  arrival_date ="";
   if (received_date.equals("0000/00/00") ) received_date ="";
   
    if ( contract_date.equals("0000/00/00") )  contract_date ="";
   if (fit_confirm_date.equals("0000/00/00") ) fit_confirm_date ="";
   if ( pp_confirm_date.equals("0000/00/00") ) pp_confirm_date ="";
   if (pp_requested.equals("0000/00/00") ) pp_requested ="";
   
   if (  mat_order_date.equals("0000/00/00") )  mat_order_date ="";
   if (mat_in_date.equals("0000/00/00") ) mat_in_date ="";
   if (  acc_order_date.equals("0000/00/00") )   acc_order_date ="";
   if (acc_in_date.equals("0000/00/00") ) acc_in_date ="";
   
   if ( cutting.equals("0000/00/00") )  cutting ="";
   if ( running.equals("0000/00/00") )  running ="";
   if ( top_sent.equals("0000/00/00") )  top_sent ="";
   if ( top_confirm.equals("0000/00/00") )  top_confirm ="";
   
   if ( packing_date.equals("0000/00/00") )  packing_date ="";
   if (inhouse_date.equals("0000/00/00") ) inhouse_date ="";
   if ( go_date.equals("0000/00/00") )  go_date ="";
   if (col_date.equals("0000/00/00") ) col_date ="";
   
   if (col_in_date.equals("0000/00/00") )  col_in_date ="";
   if ( pp_in_date.equals("0000/00/00") )  pp_in_date ="";
 
  
  String colour_code = "#FFFFF0";
  // set item imagae
    File imgFile = new File(application.getRealPath(_styleImgURL) + File.separator + style_no.toLowerCase() + ".jpg");
	if (imgFile.exists()) {
	  imgUrl = "<img src='" + _styleImgURL + "/" + style_no.toLowerCase() + ".jpg' width='50' height='70'>";
	} else {
		  imgUrl = "<img src='" + _styleImgURL + "/noimage.jpg' width='50' height='70'>";
	}	
   // PO Status list
  
  for (int k = 0; k < iRet4; k++) {
	  int l = 0;
	  String code = matrix4.getRowData(k).getData(l++);
	  String code_name = matrix4.getRowData(k).getData(l++);
	  statusList  += "<option value=\"" + code + "\"";    
	    if ( po_status.equals(code) ) {
	       statusList  += " SELECTED ";  
	    }
	    statusList += ">" + code_name + "</option>";
	} 
  //if (po_status.compareTo("70") < 0) {
 //     if (cus_delivery_yn.equals("Y")) {
 //     colour_code = "#FF0000";
 //   } else if (cus_delivery_yn.equals("N")) {
 //     colour_code = "#ADD8E6";
 //   } else if (cus_arrival_yn.equals("Y")) {
 //     colour_code = "#FF0000";
 //   } else if (cus_arrival_yn.equals("N")) {
 //     colour_code = "#ADD8E6";
 //   } else if (cus_departure_yn.equals("Y")) {
 //     colour_code = "#FF0000";
 //   } else if (cus_departure_yn.equals("N")) {
 //     colour_code = "#ADD8E6";
 //   } else if (cus_cutoff_yn.equals("Y")) {
 //     colour_code = "#FF0000";
 //   } else if (cus_cutoff_yn.equals("N")) {
 //     colour_code = "#ADD8E6";
 //   } else if (cus_handover_yn.equals("Y")) {
 //     colour_code = "#FF0000";
 //   } else if (cus_handover_yn.equals("N")) {
 //     colour_code = "#ADD8E6";
 //   }
    
  //}
  String tmp_add_or_edit = "";
  if(has_order_sheet.equals("1")){
      tmp_add_or_edit = "<a href='http://" + getPath + "/admin/product/order_sheet_create.jsp?po_num="+po_no+"&sheetUpdate=true' >view</a>";
  }
  else{
      tmp_add_or_edit = "<a href='http://" + getPath + "/admin/product/order_sheet_create.jsp?po_num="+po_no+"' >add</a>";
  }

  outS += "<tr align='center' bgcolor='" + colour_code + "'>"
        + " <td>" + (i+1) + "</td>"
        + " <td><a href=\"javascript:fnView('" + po_no + "')\">" + po_no + "</td>" 
        + "<td>"+tmp_add_or_edit+"</td>"
        + " <td>" + style_no + "</td>"
        + " <td>" + season + "</td>"
        + "  <td><input type='hidden' name='po_no' value='" + po_no + "'>" + order_date + "</td>"
        + " <td>" + buyer + "</td>"
        + " <td>" + total_qty + "</td>"
        + " <td>" + imgUrl + "</td>"
        + " <td><select name=ag_po_status>" + statusList + "</select></td>" ;
    

    String   cus_order_date_input = "";
    String   cus_delivery_date_input = "";
    String   cus_arrival_date_input = "";
    String   cus_received_date_input = "";
    String   contract_date_input = "";               
    String   fit_confirm_date_input = "";            
    String   pp_confirm_date_input = "";              
    String   pp_requested_date_input = "";                
    String   mat_order_date_input = "";              
    String   mat_in_date_input = "";                  
    String   acc_order_date_input = "";               
    String   acc_in_date_input = "";                  
    String   cutting_date_input = "";                      
    String   running_date_input = "";                      
    String   top_sent_date_input = "";                    
    String   top_confirm_date_input = "";                 
    String   packing_date_input = "";   
    String   inhouse_date_input = "";  
    String   go_date_input = "";  
    String   col_date_input = "";  
    String   col_in_date_input = "";  
    String   pp_in_date_input = ""; 
    

    //cus_order_date_input = "<input type='text' name='order_date' size='10' value='" + order_date + "' style='cursor:hand' readonly"
    //                        + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'ORDER');\">X</a>";
    
    cus_delivery_date_input  = "<input type='text' name='delivery_date' size='10' value='" + delivery_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'DELIVERY');\">X</a>";
    

    cus_arrival_date_input = "<input type='text' name='arrival_date' size='10' value='" + arrival_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'ARRIVAL');\">X</a>";
    
    cus_received_date_input = "<input type='text' name='received_date' size='10' value='" + received_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'RECEIVED');\">X</a>";
    
    contract_date_input = "<input type='text' name='contract_date' size='10' value='" + contract_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'CONTACTED');\">X</a>";     
                            
    fit_confirm_date_input = "<input type='text' name='fit_confirm_date' size='10' value='" + fit_confirm_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'FITCONFIRM');\">X</a>";   
                            
    pp_confirm_date_input = "<input type='text' name='pp_confirm_date' size='10' value='" + pp_confirm_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'PPCONFIRM');\">X</a>";    
                            
    pp_requested_date_input = "<input type='text' name='pp_requested' size='10' value='" + pp_requested + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'PPREQUEST');\">X</a>";
                            
    mat_order_date_input = "<input type='text' name='mat_order_date' size='10' value='" + mat_order_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'MAT');\">X</a>";     
                            
    mat_in_date_input = "<input type='text' name='mat_in_date' size='10' value='" + mat_in_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'MATIN');\">X</a>";       
                            
    acc_order_date_input = "<input type='text' name='acc_order_date' size='10' value='" + acc_order_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'ACC');\">X</a>";    
    acc_in_date_input = "<input type='text' name='acc_in_date' size='10' value='" + acc_in_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'ACCIN');\">X</a>";        
    cutting_date_input = "<input type='text' name='cutting' size='10' value='" + cutting + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'CUTTING');\">X</a>";      
    running_date_input = "<input type='text' name='running' size='10' value='" + running + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'RUNNING');\">X</a>";      
    top_sent_date_input = "<input type='text' name='top_sent' size='10' value='" + top_sent + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'TOPSENT');\">X</a>";       
    top_confirm_date_input = "<input type='text' name='top_confirm' size='10' value='" + top_confirm + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'TOPCONFIRM');\">X</a>";    
    packing_date_input = "<input type='text' name='packing_date' size='10' value='" + packing_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'PACKING');\">X</a>";    
    inhouse_date_input = "<input type='text' name='inhouse_date' size='10' value='" + inhouse_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'INHOUSE');\">X</a>"; 
    go_date_input = "<input type='text' name='go_date' size='10' value='" + go_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'GO');\">X</a>";                                                          
    col_date_input = "<input type='text' name='col_date' size='10' value='" + col_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'COL');\">X</a>";  
    col_in_date_input = "<input type='text' name='col_in_date' size='10' value='" + col_in_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'COLIN');\">X</a>"; 
    pp_in_date_input = "<input type='text' name='pp_in_date' size='10' value='" + pp_in_date + "' style='cursor:hand' readonly"
                            + " onclick=\"javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'LEFT', event);\"><a href=\"javascript:fnClearDate(" + editableCnt + ", 'PPIN');\">X</a>";                             
    
    outS += " <td nowrap>" + inhouse_date_input     + "</td>"
          + " <td nowrap>" + cus_delivery_date_input     + "</td>"
          + " <td nowrap>" + contract_date_input     + "</td>"
          + " <td nowrap>" + go_date_input     + "</td>"
          + " <td nowrap>" + subsupplier_name     + "</td>"
          + " <td nowrap>" + fit_confirm_date_input     + "</td>"
          + " <td nowrap>" + pp_in_date_input    + "</td>" 
          + " <td nowrap>" + pp_confirm_date_input     + "</td>"
          + " <td nowrap>" + pp_requested_date_input + "</td>"
          + " <td nowrap>" + mat_order_date_input   + "</td>"
          + " <td nowrap>" + mat_in_date_input   + "</td>"           
          + " <td nowrap>" + col_date_input    + "</td>" 
          + " <td nowrap>" + col_in_date_input    + "</td>" 
          + " <td nowrap>" + acc_order_date_input    + "</td>" 
          + " <td nowrap>" + acc_in_date_input    + "</td>" 
          + " <td nowrap>" + cutting_date_input    + "</td>" 
          + " <td nowrap>" + running_date_input    + "</td>" 
          + " <td nowrap>" + top_sent_date_input    + "</td>" 
          + " <td nowrap>" + top_confirm_date_input   + "</td>" 
          + " <td nowrap>" + packing_date_input   + "</td>" 
          + " <td nowrap>" + cus_arrival_date_input    + "</td>"
          + " <td nowrap>" + cus_received_date_input     + "</td>" ;

    editableCnt++;


  outS += "</tr>";
}

// print supplier list
String supplierList = "<option value=''>All</option>";
for (int i = 0; i < iRet2; i++) {
  int j = 0;
  String supplier_id = matrix2.getRowData(i).getData(j++);
  String supplier_name = matrix2.getRowData(i).getData(j++);

  supplierList += "<option value='"+ supplier_id + "'" 
                + (ag_supplier.equals(supplier_id) ? " selected" : "") + ">" 
                + supplier_id + "-" + supplier_name + "</option>";
}

// print buyer list
String buyerList = "<option value=''>All</option>";
for (int i = 0; i < iRet3; i++) {
  int j = 0;
  String buyer_id = matrix3.getRowData(i).getData(j++);
  String buyer_name = matrix3.getRowData(i).getData(j++);

  buyerList += "<option value='"+ buyer_id + "'" 
             + (ag_buyer.equals(buyer_id) ? " selected" : "") + ">" 
             + buyer_name +"-"+buyer_id+ "</option>";
}

// print user brand options
//String brandList = "<option value=''>All</option>";

//for (int i = 0; i < matrix5.getRowCount(); i++) {
//  int j = 0;
//  String code = matrix5.getRowData(i).getData(j++);
//  String codeName = matrix5.getRowData(i).getData(j++);
//  brandList += "<option value='"+ code + "'" 
//             + (ag_brand.equals(code) ? " selected" : "") + ">" 
//             + codeName + "</option>";
// 
//}

%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<SCRIPT LANGUAGE=JavaScript>
function fnSubmit(frm)
{
  frm.ag_po_no.value = jf_AllTrim(frm.ag_po_no.value);
  frm.ag_style_no.value = jf_AllTrim(frm.ag_style_no.value);
  // frm.target = hidenFrame.name;
  frm.submit();
}

function fnExcel(frm) {
  if (confirm("Do you want to download these data as an excel file?"))
  {
    frm.action="./product_list_excel.jsp";
    frm.target = hidenFrame.name;
    frm.submit();
  }
}
function fnView(po_no_selected) {
	var win = window.open('', "winPrint", "toolbar=no, menubar=no, resizable=no, scrollbars=yes, width=1000, height=900");
    frmMain.po_no_selected.value = po_no_selected;
    if (win) {
	    frmMain.action = "/ordermanagement/po_detail_popup.jsp";
	    frmMain.target = win.name;
	    frmMain.submit();
   }
}


function fnSave(frm) {
  
      if (confirm("Are you sure to save these data?")) {
        frm.action = './product_update.jsp';
        frm.target = this.name;
        frm.submit();
      }

}

function fnClearDate(idx, dateType) {
  with (document.form2) {
    if (po_no.length) {
	      if (dateType == 'CONTACTED') {
	        contract_date[idx].value = '';      
	      } else if (dateType == 'DELIVERY') {
	        delivery_date[idx].value = '';
	      } else if (dateType == 'FITCONFIRM') {
	        fit_confirm_date[idx].value = '';
	      } else if (dateType == 'PPCONFIRM') {
	        pp_confirm_date[idx].value = '';
	      } else if (dateType == 'PPREQUEST') {
	        pp_requested[idx].value = '';
	      } else if (dateType == 'MAT') {
	        mat_order_date[idx].value = ''; 
	      } else if (dateType == 'ARRIVAL') {
	        arrival_date[idx].value = '';
	      } else if (dateType == 'MATIN') {
	        mat_in_date[idx].value = '';
	      } else if (dateType == 'ACC') {
	        acc_order_date[idx].value = '';
	      } else if (dateType == 'ACCIN') {
	        acc_in_date[idx].value = '';
	      } else if (dateType == 'CUTTING') {
	        cutting[idx].value = '';
	      } else if (dateType == 'RUNNING') {
	        running[idx].value = '';
	      } else if (dateType == 'MAT') {
	        mat_order_date[idx].value = ''; 
	      } else if (dateType == 'TOPSENT') {	      	
	        top_sent[idx].value = '';  
	      } else if (dateType == 'TOPCONFIRM') {
	          top_confirm[idx].value = '';
	      } else if (dateType == 'PACKING') {
	        packing_date[idx].value = '';
	      } else if (dateType == 'INHOUSE') {
	        inhouse_date[idx].value = '';
	      } else if (dateType == 'GO') {
	        go_date[idx].value = '';
	      } else if (dateType == 'COL') {
	        col_date[idx].value = '';
	      } else if (dateType == 'COLIN') {
	        col_in_date[idx].value = '';
	      } else if (dateType == 'PPIN') {
	        pp_in_date[idx].value = '';  
	      } else if (dateType == 'RECEIVED') {
	        received_date[idx].value = '';
	      }
    } else {
	      if (dateType == 'CONTACTED') {
	        contract_date.value = '';      
	      } else if (dateType == 'DELIVERY') {
	        delivery_date.value = '';
	      } else if (dateType == 'FITCONFIRM') {
	        fit_confirm_date.value = '';
	      } else if (dateType == 'PPCONFIRM') {
	        pp_confirm_date.value = '';
	      } else if (dateType == 'PPREQUEST') {
	        pp_requested.value = '';
	      } else if (dateType == 'MAT') {
	        mat_order_date.value = ''; 
	      } else if (dateType == 'ARRIVAL') {
	        arrival_date.value = '';
	      } else if (dateType == 'MATIN') {
	        mat_in_date.value = '';
	      } else if (dateType == 'ACC') {
	        acc_order_date.value = '';
	      } else if (dateType == 'ACCIN') {
	        acc_in_date.value = '';
	      } else if (dateType == 'CUTTING') {
	        cutting.value = '';
	      } else if (dateType == 'RUNNING') {
	        running.value = '';
	      } else if (dateType == 'MAT') {
	        mat_order_date.value = ''; 
	      } else if (dateType == 'TOPSENT') {	      	
	        top_sent[idx].value = '';  
	      } else if (dateType == 'TOPCONFIRM') {
	          top_confirm.value = '';
	      } else if (dateType == 'PACKING') {
	        packing_date.value = '';
	      } else if (dateType == 'INHOUSE') {
	        inhouse_date.value = '';
	      } else if (dateType == 'GO') {
	        go_date.value = '';
	      } else if (dateType == 'COL') {
	        col_date.value = '';
	      } else if (dateType == 'COLIN') {
	        col_in_date.value = '';
	      } else if (dateType == 'PPIN') {
	        pp_in_date.value = '';  
	      } else if (dateType == 'RECEIVED') {
	        received_date.value = '';
	      }
    }
  }
}

</SCRIPT>
</HEAD>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="840" border="0" cellspacing="0" cellpadding="0">
<tr><td>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/icon_tasks.jpg"></td>
  <td width="*" class="left_title">Production Status</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<table width="99%" border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<FORM name='frmMain' ACTION="product_management.jsp" METHOD=POST>
	<input type='hidden' name='po_no_selected'>
<tr>
  <td width="10%" class="table_header_center">Supplier</td>
  <td width="32%" class="table_bg_bright"><SELECT NAME='ag_supplier'><%= supplierList %></SELECT></td>
  <td width="10%" class="table_header_center">SEASON</td>
  <td width="20%" class="table_bg_bright"><input type='text' name='ag_season' size='20' maxlength='20' class='input_text'></td>
  <td width="28%" class="table_bg_bright_center" colspan='2' rowspan='2'><INPUT TYPE='BUTTON' VALUE="Search" ONCLICK='fnSubmit(this.form)'>
    <input type='button' value='Save as Excel' onclick='fnExcel(document.form2);'></td>
</tr>
<tr>
  <td class="table_header_center">Date</td>
  <td class="table_bg_bright"><select name='ag_date_type'>
  	 <option value='CD' <%= ag_date_type.equals("CD") ? "selected" : "" %>>Created Date</option>
    <option value='OD' <%= ag_date_type.equals("OD") ? "selected" : "" %>>Order Date</option>
    <option value='DD' <%= ag_date_type.equals("DD") ? "selected" : "" %>>Delivery Date</option>
    <option value='AD' <%= ag_date_type.equals("AD") ? "selected" : "" %>>Arrival Date</option>    
    </select><br>From
    <input type='text' name='ag_from_date' size='10' value='<%= ag_from_date %>' style='cursor:hand' readonly  onclick="javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);">
     To
    <input type='text' name='ag_to_date' size='10' value='<%= ag_to_date %>' style='cursor:hand' readonly    onclick="javascript:popFrame.fPopCalendar(this, this, document.all['popCal'], 'RIGHT', event);">
    </td>
  <td class="table_header_center">Buyer</td>
  <td class="table_bg_bright"><SELECT NAME='ag_buyer'><%= buyerList %></SELECT></td>
</tr>
<tr>
  <td class="table_header_center">PO#</td>
  <td class="table_bg_bright"><input type=text name='ag_po_no' value='<%= ag_po_no %>' size='40' maxlength='200'></td>
  <td class="table_header_center">Style#</td>
  <td class="table_bg_bright"><input type=text name='ag_style_no' value='<%= ag_style_no %>' size='10' maxlength='6'></td>
  <td width="10%" class="table_header_center">Order by</td>
  <td width="18%" class="table_bg_bright"><SELECT NAME='ag_orderby'>
    <OPTION value="1" <% if(ag_orderby.equals("1")) out.print("SELECTED"); %>>PO No.</OPTION>
    <OPTION value="2" <% if(ag_orderby.equals("2")) out.print("SELECTED"); %>>Supplier</OPTION>
    <OPTION value="3" <% if(ag_orderby.equals("3")) out.print("SELECTED"); %>>Buyer</OPTION>
    <OPTION value="4" <% if(ag_orderby.equals("4")) out.print("SELECTED"); %>>Ship Date</OPTION>
    <OPTION value="5" <% if(ag_orderby.equals("5")) out.print("SELECTED"); %>>Delivery Date</OPTION>
    <OPTION value="6" <% if(ag_orderby.equals("6")) out.print("SELECTED"); %>>Delivery Date+Supplier</OPTION>
    </SELECT></td>
</tr>
</form>
</table>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>
</td></tr></table>
* Click 'X' to reset the date. After you input the data, Click 'Save' button to complete updating.
<table width="100%" border="0" cellspacing="0" cellpadding="3"><tr><td>
<TABLE border=0 width=99% CELLPADDING=0 CELLSPACING=1 class="table_bg">
<form name='form2' method='post'>
<input type='hidden' name='ag_supplier' value='<%= ag_supplier %>'>
<input type='hidden' name='ag_season' value='<%= ag_season %>'>
<input type='hidden' name='ag_date_type' value='<%= ag_date_type %>'>
<input type='hidden' name='ag_from_date' value='<%= ag_from_date %>'>
<input type='hidden' name='ag_to_date' value='<%= ag_to_date %>'>
<input type='hidden' name='ag_po_no' value='<%= ag_po_no %>'>
<input type='hidden' name='ag_style_no' value='<%= ag_style_no %>'>
<input type='hidden' name='ag_orderby' value='<%= ag_orderby %>'>
<input type='hidden' name='ag_buyer' value='<%= ag_buyer %>'>
<tr class='table_header_center'>
  <td colspan='9'>PO Detail. </td>
  <td> Order Status</td>
  <td colspan='2'>DELIVERY</td>
  <td colspan='3'>CONTRACT</td>
  <td>FIT Sample</td>
  <td colspan='3'>PP Sample</td>
  <td colspan='2'>Primary Fabric</td>
  <td colspan='2'>Coloring</td>
  <td colspan='2'>Decoration</td>
  <td colspan='2'>Sewing</td>
  <td colspan='2'>TOP</td>
  <td colspan='4'>Complete/Shipping</td>
</tr>
<TR class="table_header_center">
  <TD>No</TD>
  <TD>PO No.</TD>
  <TD>Order Sheet</TD>
  <TD>Style No.</TD>
  <TD>Season</TD>
  <TD>Order Date</TD>
  <TD>Buyer</TD>
  <TD>Total QTY</TD>
  <TD>Image</TD>
  <TD>PO Status</TD>
  <td>Inhouse </td>
  <td>Delivery</td>
  <td>Contract Date </td>
  <td>Release Date </td>
  <td>Contractor </td>
  <td>FIT Confirm</td>
  <td>PP Stocked</td>
  <td>PP Confirm</td>
  <td>PP  </td>
  <td>Order Fabric </td>
  <td>Stock Fabric </td>          
  <td>Order Coloring </td>
  <td>Stock Coloring </td>
  <td>Order Decoration </td>
  <td>Stock Decoration </td>
  <td>Cutting  </td>
  <td>Putting </td>
  <td>Dispatch TOP </td>
  <td>Confirm TOP </td>
  <td>Packing </td>
  <td>Shipping Date </td>
  <td>Arrival Date </td>
  </TR>
<%= outS %>
<%
if (_admingroup.equals("A")) {
%>
<tr>
  <td align='center' class='table_bg_bright' colspan='16'><input type='button' value='Save' onclick='fnSave(this.form);'>
    <input type='reset' value='Reset'>
    </td><td align='center' class='table_bg_bright' colspan='15'><input type='button' value='Save' onclick='fnSave(this.form);'>
    <input type='reset' value='Reset'></td>
</tr>
<%
}
%>
</form>
</TABLE>
</td></tr></table>

<table width="840" border="0" cellspacing="0" cellpadding="0"><tr><td>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
<iframe width="0" height="0" name="hidenFrame"></iframe>
</BODY>
</HTML>
