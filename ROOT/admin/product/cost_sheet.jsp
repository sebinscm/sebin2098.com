<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="java.text.*" %>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@ include file="/admin/login_check.jsp" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/common/calendar/calendar.htm" %>
<%@ page contentType = "text/html; charset=UTF-8" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
int iRet = 0;
int k = 0;
String sql = "";
String total_qty = "";
String colour = "";
String outPut = "";
String outPut2 = "";
String unit_price = "";
String buyer_name = "";
String imgUrl = "";
Double total_qty_cost = 0.0;
Double r_m_order_total = 0.0;
Double purchase_total = 0.0;
String forwarding_company_1 = "";
String forwarding_vehicle_no_1 = "";
String forwarding_cost_1 = "0";
String forwarding_company_2 = "";
String forwarding_vehicle_no_2 = "";
String forwarding_cost_2 = "0";
String rely_on_factory = "0";
String r_m_total = "0";
String factory_fee = "0";
String domestic = "0";
String international = "0";
String etc = "0";
Double benefit = 0.0;
String purchase_date = "";
String purchase_qty = "0";
String purchase_cost = "0";
String purchase_etc = "";
String in_stock_date_received = "";
String in_stock_qty = "0";
String in_stock_date_received_f = "";
String in_stock_date_checked_f = "";
String in_stock_qty_f = "0";
String in_stock_diff = "";
String path_to_save_or_update = "";
String r_m_order_sheet_cons = "";
String r_m_order_sheet_qty = "0";
String r_m_order_sheet_cost = "0";
String currency = "0.0";
String dollor = "0.0";
Double r_m_order_sheet_total = 0.0;
Double rely_on_factory_total = 0.0;
Double factory_fee_total = 0.0;
Double unit_cost = 0.0;
int rowspan_img = 2;
String[] tmp_default = {"","","","","","","",""};
String isUpdate = request.getParameter("isUpdate");
String po_num = request.getParameter("po_no_selected");
String style_no = request.getParameter("style_selected");
String buyer_id = request.getParameter("buyer_selected");
String subsupplier_name = request.getParameter("subsupplier_name");
String delivery_date = request.getParameter("delivery_date");
int all_qty = 0;
try {
    if(isUpdate==null || isUpdate.equals("false")){
        isUpdate = "false";
        path_to_save_or_update = "cost_sheet_save.jsp";
    }
    Context ic = new InitialContext(); 
    matrix = new MatrixDataSet();
    dataProcess = new DataProcess();
    DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
    conn = ds.getConnection();
    
    sql = "select style, buyer, subsupplier_name, delivery_date from purchase_order where order_no = '"+po_num+"'";    
    iRet = dataProcess.RetrieveData(sql, matrix, conn);
    k = 0;
    style_no = matrix.getRowData(0).getData(k++);
    buyer_id = matrix.getRowData(0).getData(k++);
    subsupplier_name = matrix.getRowData(0).getData(k++);
    delivery_date = matrix.getRowData(0).getData(k++);
    
    sql = "select id, name from login_01t where id = '"+buyer_id+"'";
    iRet = dataProcess.RetrieveData(sql, matrix, conn);
    buyer_name = matrix.getRowData(0).getData(1);
    
    sql = " select vendor_price "
                + "from purchase_order"
                + " where order_no = '"+po_num+"'; "; 
    iRet = dataProcess.RetrieveData(sql, matrix, conn);
    unit_price = matrix.getRowData(0).getData(0);
    
    // get order_no and style from purchase order
    sql = " select  colour, total_qty "
                + " from    purchase_order_line "
                + " where order_no = '"+po_num+"'; ";
    iRet = dataProcess.RetrieveData(sql, matrix, conn);
    rowspan_img = iRet;
    for(int i = 0; i<iRet; i++){
        k = 0;
        colour = matrix.getRowData(i).getData(k++);
        total_qty = matrix.getRowData(i).getData(k++);
        all_qty += Integer.parseInt(total_qty);
        Double tmp_total_cost = Double.parseDouble(total_qty) * Double.parseDouble(unit_price);
        total_qty_cost += tmp_total_cost;
        outPut += "<tr>"
                + "<td>"+delivery_date+"</td>"
                + "<td>"+colour+"</td>"
                + "<td>"+total_qty+"</td>"
                + "<td>"+String.format("%.2f",Double.parseDouble(unit_price))+"</td>"
                + "<td>"+String.format("%.2f",tmp_total_cost)+"</td>"
                + "</tr>";
    }
    if(isUpdate.equals("true")){
        sql = " select po_num, purchase_date,  purchase_qty, purchase_cost, purchase_etc, in_stock_date_received"
                    + ", in_stock_qty, in_stock_date_received_f, in_stock_date_checked_f, in_stock_qty_f, in_stock_diff"
                    + ", consumption, qty, cost"
                    + " from cost_sheet_purchase_in_stock"
                    + " where po_num = '"+po_num+"'; ";
        iRet = dataProcess.RetrieveData(sql, matrix, conn);
    }
    else{
        sql = " select distinct cons, po_num"
                    + " from raw_material_purchase_order"
                    + " where po_num = '"+po_num+"'; ";
        iRet = dataProcess.RetrieveData(sql, matrix, conn);
    }
    for(int i =0; i < iRet; i++){
        if(isUpdate.equals("true")){
            k = 1;
            purchase_date = matrix.getRowData(i).getData(k++);
            purchase_qty = matrix.getRowData(i).getData(k++);
            purchase_cost = matrix.getRowData(i).getData(k++);
            purchase_etc = matrix.getRowData(i).getData(k++);
            in_stock_date_received = matrix.getRowData(i).getData(k++);
            in_stock_qty = matrix.getRowData(i).getData(k++);
            in_stock_date_received_f = matrix.getRowData(i).getData(k++);
            in_stock_date_checked_f = matrix.getRowData(i).getData(k++);
            in_stock_qty_f = matrix.getRowData(i).getData(k++);
            in_stock_diff = matrix.getRowData(i).getData(k++);
            r_m_order_sheet_cons = matrix.getRowData(i).getData(k++);
            r_m_order_sheet_qty = matrix.getRowData(i).getData(k++);
            r_m_order_sheet_cost = matrix.getRowData(i).getData(k++);
            if(r_m_order_sheet_qty==null ||r_m_order_sheet_qty=="") r_m_order_sheet_qty="0";
            if(r_m_order_sheet_cost==null ||r_m_order_sheet_cost=="") r_m_order_sheet_cost="0";
            if(purchase_qty==null || purchase_qty=="") purchase_qty="0";
            if(purchase_cost==null ||purchase_cost=="") purchase_cost="0";
            if(in_stock_qty==null ||in_stock_qty=="") in_stock_qty="0";
            if(in_stock_qty_f==null ||in_stock_qty_f=="") in_stock_qty_f="0";            
            r_m_order_sheet_total = Double.parseDouble(r_m_order_sheet_qty) * Double.parseDouble(r_m_order_sheet_cost);
            r_m_order_total += r_m_order_sheet_total;
            purchase_total+= Double.parseDouble(purchase_cost);
        }
        else{
             k = 0;
            r_m_order_sheet_cons = matrix.getRowData(i).getData(k++);
        }
        outPut2 += "<tr><td><input type='text' name='r_m_order_sheet_cons[]' size='7' value='"+r_m_order_sheet_cons+"' /></td>"
                + "<td><input type='n' name='r_m_order_sheet_qty[]' size='2' value='"+r_m_order_sheet_qty+"' /></td>"
                + "<td><input type='text' name='r_m_order_sheet_cost[]'  size='2' value='"+r_m_order_sheet_cost+"'/></td>"
                + "<td>"+r_m_order_sheet_total+"</td>"
                + "<td><input type='text' name='purchase_date[]'  size='9'  value='"+purchase_date+"'/></td>"
                + "<td><input type='text' name='purchase_qty[]'  size='2' value='"+purchase_qty+"'/></td>"
                + "<td><input type='text' name='purchase_cost[]'  size='2' value='"+purchase_cost+"'/></td>"
                + "<td><input type='text' name='purchase_etc[]'  size='2' value='"+purchase_etc+"'/></td>"
                + "<td><input type='text' name='in_stock_date_received[]' size='9' value='"+in_stock_date_received+"' /></td>"
                + "<td><input type='text' name='in_stock_qty[]'  size='2' value='"+in_stock_qty+"'/></td>"
                + "<td><input type='text' name='in_stock_date_received_f[]' size='9'  value='"+in_stock_date_received_f+"'/></td>"
                + "<td><input type='text' name='in_stock_date_checked_f[]' size='9' value='"+in_stock_date_checked_f+"' /></td>"
                + "<td><input type='text' name='in_stock_qty_f[]' size='2' value='"+in_stock_qty_f+"' /></td>"
                + "<td><input type='text' name='in_stock_diff[]' size='2'  value='"+in_stock_diff+"'/></td></tr>";
    }
    
    if(isUpdate.equals("true")){
        path_to_save_or_update = "cost_sheet_update.jsp";
        sql = " select po_num, forwarding_company_1, forwarding_vehicle_no_1, forwarding_cost_1, "
              + "forwarding_company_2, forwarding_vehicle_no_2, forwarding_cost_2, rely_on_factory, r_m_total, factory_fee, "
              + "domestic, international, etc, dollor, currency"
              + " from    cost_sheet "
              + " where po_num = '"+po_num+"';";
        iRet = dataProcess.RetrieveData(sql, matrix, conn);   
        k = 0;
        po_num = matrix.getRowData(0).getData(k++);
        forwarding_company_1 = matrix.getRowData(0).getData(k++);
        forwarding_vehicle_no_1 = matrix.getRowData(0).getData(k++);
        forwarding_cost_1 = matrix.getRowData(0).getData(k++);
        forwarding_company_2 = matrix.getRowData(0).getData(k++);
        forwarding_vehicle_no_2 = matrix.getRowData(0).getData(k++);
        forwarding_cost_2 = matrix.getRowData(0).getData(k++);
        rely_on_factory = matrix.getRowData(0).getData(k++);
        r_m_total = matrix.getRowData(0).getData(k++);
        factory_fee = matrix.getRowData(0).getData(k++);
        domestic = matrix.getRowData(0).getData(k++);
        international = matrix.getRowData(0).getData(k++);
        etc = matrix.getRowData(0).getData(k++);
        dollor = matrix.getRowData(0).getData(k++);
        currency =  matrix.getRowData(0).getData(k++);
        
        rely_on_factory_total = (Double.parseDouble(rely_on_factory) * all_qty);
        factory_fee_total = (Double.parseDouble(factory_fee) * all_qty);
        if(rely_on_factory_total == 0.0){
            unit_cost = (Double.parseDouble(r_m_total)+ factory_fee_total ) / all_qty;  
            benefit = (total_qty_cost) - (Double.parseDouble(etc)+Double.parseDouble(international)+Double.parseDouble(domestic)+factory_fee_total+purchase_total);
        }
        else{
            unit_cost = Double.parseDouble(rely_on_factory); 
            benefit = (total_qty_cost) - (Double.parseDouble(etc)+Double.parseDouble(international)+Double.parseDouble(domestic)+rely_on_factory_total);
        }
    }
}catch (Exception e) {
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
// set item imagae
    File imgFile = new File(application.getRealPath(_styleImgURL) + File.separator + style_no.toLowerCase() + ".jpg");
    File imgFile2 = new File(application.getRealPath(_styleImgURL) + File.separator + style_no.toLowerCase() + "_back.jpg");
	if (imgFile.exists()) {
            imgUrl = "<img src='" + _styleImgURL + "/" + style_no.toLowerCase() + ".jpg' width='150' height='200'/>";
	} else {
            imgUrl = "<img src='" + _styleImgURL + "/noimage.jpg' width='150' height='200'/>";
	}
        if (imgFile2.exists()) {
            imgUrl += "<img src='" + _styleImgURL + "/" + style_no.toLowerCase() + "_back.jpg' width='150' height='200'/>";
	} else {
            imgUrl += "<img src='" + _styleImgURL + "/noimage.jpg' width='150' height='200'/>";
	}
%>
<style>
    
    table, td, tr{
        padding: 0px;
        text-align: center;
        font-size: 12px;
    } 
    table td.gray_background, table.gray_background tr.gray_background{
        background-color: gray;
    }
</style>
<form name="form1" method="POST" action="<%= path_to_save_or_update %>" accept-charset="UTF-8">
    <input type="hidden" name="po_num" value="<%= po_num %>" />
    <table width="100%">
        <tr height="40px">
            <td align="center"><span style="font-size: 22px; font-weight: bold">Cost Sheet</span></td>
        </tr>
    </table>
    <table width="100%" border="1" style="text-align:left;">
        <tr style="text-align:left;">
            <td width="55px" style="background-color:gray; color:white;">Buyer : </td>
            <td><%= buyer_name %></td>
            <td width="75px" style="background-color:gray; color:white;">Style No : </td>
            <td><%= style_no %></td>
            <td width="65px" style="background-color:gray; color:white;">factory : </td>
            <td><%= subsupplier_name %></td>
        </tr>
    </table>
    <table width="100%" border="1">
        <tr>
            <td width="13%" style="background-color:gray; color:white;">Delivery Date</td>
            <td width="13%" style="background-color:gray; color:white;">Colour</td>
            <td width="13%" style="background-color:gray; color:white;">QTY</td>
            <td width="13%" style="background-color:gray; color:white;">Cost</td>
            <td width="13%" style="background-color:gray; color:white;">QTY * Cost</td>
            <td rowspan="<%= (rowspan_img+2) %>" width="400px"><%= imgUrl %></td>
        </tr>
        <%= outPut %>
        <tr>
            <td style="background-color:gray; color:white;">Total</td>
            <td style="background-color:#CFCFCF;"></td>
            <td><b><%= all_qty %></b></td>
            <td> Dollor : <input type="text" size="5" name="dollor" value="<%= dollor %>" /><br/>
                Currency: <input type="text" size="5" name="currency" value="<%= currency %>" />
            </td>
            <td><b><%= total_qty_cost %></b></td>
        </tr>
    </table> 
        <table height="20px"><tr><td></td></tr></table>
    <table id="box" width="100%" border="1">
        <tr>
            <td colspan='4'>Raw Material Order</td>
            <td colspan='4'>Purchase</td>
            <td colspan='6'>In Stock</td>
        </tr>
        <tr>
            <td width="110px">CONS.</td>
            <td width="70px">QTY</td>
            <td width="70px">Cost</td>
            <td width="70px">Total</td>
            <td width="70px">Date</td>
            <td width="70px">QTY</td>
            <td width="70px">Cost</td>
            <td width="70px">ETC</td>
            <td width="70px">Date received</td>
            <td width="70px">QTY</td>
            <td width="70px">Date received at F</td>
            <td width="70px">Date checked at F</td>
            <td width="70px">QTY</td>
            <td width="60px">Diff</td>
        </tr>
        <%= outPut2 %>
        <tr>
            <td width="110px" class="gray_background"></td>
            <td width="70px" class="gray_background"></td>
            <td width="70px">Total : </td>
            <td width="70px"><%= r_m_order_total %></td>
            <td width="70px" class="gray_background"></td>
            <td width="110px">Total : </td>
            <td width="110px"><%= purchase_total %></td>
            
            <td width="70px" class="gray_background">&nbsp;</td>
            <td width="60px" colspan='2'>Forwarding:<input type="text" size="10" name="forwarding_company_1" value="<%= forwarding_company_1 %>" /></td>
            <td width="60px" colspan='2'>Vehicle No:<input type="text" size="10" name="forwarding_vehicle_no_1"  value="<%= forwarding_vehicle_no_1 %>"/></td>
            <td width="70px" colspan='2'>Cost:<input type="text" size="10" name="forwarding_cost_1"  value="<%= forwarding_cost_1 %>"/></td>
        </tr>
        <tr>
            <td width="70px" class="gray_background">&nbsp;</td>
            <td width="110px" class="gray_background">&nbsp;</td>
            <td width="70px" class="gray_background">&nbsp;</td>
            <td width="70px" class="gray_background">&nbsp;</td>
            <td width="70px" class="gray_background">&nbsp;</td>
            <td width="70px" class="gray_background">&nbsp;</td>
            <td width="110px" class="gray_background">&nbsp;</td>
            <td width="110px" class="gray_background">&nbsp;</td>
            <td width="60px" colspan='2'>Forwarding:<input type="text" size="10" name="forwarding_company_2" value="<%= forwarding_company_2 %>" /></td>
            <td width="60px" colspan='2'>Vehicle No:<input type="text" size="10" name="forwarding_vehicle_no_2" value="<%= forwarding_vehicle_no_2 %>" /></td>
            <td width="70px" colspan='2'>Cost:<input type="text" size="10" name="forwarding_cost_2" value="<%= forwarding_cost_2 %>" /></td>
        </tr>
    </table>
        <table height="20px"><tr><td></td></tr></table>
    <table id="box" width="100%" border="1">
        <tr>
            <td rowspan="2" style="background:gray; color:white;">R.O.F/Piece</td>
            <td rowspan="2">Rely on Factory</td>
            <td rowspan="2">R/M Total</td>
            <td rowspan="2" style="background:#C0C0C0;">F/Piece</td>
            <td rowspan="2">Factory fee</td>
            <td rowspan="2" style="background:blue; color:white;">Unit Cost</td>
            <td colspan='2'>Forwarding</td>
            <td rowspan="2">ETC</td>
            <td rowspan="2">Benefit</td>

        </tr>
        <tr>
            <td>Domestic</td>
            <td>International</td>
        </tr>
        <tr>
            <td><input size="2" type="text" name="rely_on_factory" value="<%= rely_on_factory %>"/></td>
            <td><%= rely_on_factory_total %></td>
            <td><input type="hidden" name="r_m_total" value="<%= purchase_total %>"/><%= purchase_total %></td>
            <td><input size="2" type="text" name="factory_fee" value="<%= factory_fee %>"/></td>
            <td><%= factory_fee_total %></td>
            <td><%= String.format("%.2f",unit_cost) %></td>
            <td><input type="text" name="domestic" value="<%= domestic %>"/></td>
            <td><input type="text" name="international" value="<%= international %>"/></td>
            <td><input type="text" name="etc" value="<%= etc %>"/></td>
            <td><input type="hidden" name="benefit" value="<%= benefit %>"/><%= benefit %></td>
        </tr>
    </table>
        <input type="submit" value="Submit">
</form>