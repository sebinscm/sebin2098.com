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
String sql = "";
String tmp_po_num = "";
String tmp_style = "";
String po_num = request.getParameter("po_num");
String rm_poUpdate = request.getParameter("rm_poUpdate");
String date_ordered ="";
String writer = "";
String factory= "";
String out_shell_length = "";
String combination_length = "";
String lining_length = "";
String inter_lining_length = "";
String button_length = "";
String hanger_tape_length ="";
String sewing_yarn_length ="";
String out_shell_store = "";
String out_shell_name = "";
String out_shell_add = "";
String out_shell_comp = "";
String out_shell_cost = "";
String out_shell_tel = "";
String combination_1_store = "";
String combination_1_name = "";
String combination_1_add = "";
String combination_1_comp = "";
String combination_1_cost = "";
String combination_1_tel = "";
String combination_2_store = "";
String combination_2_name = "";
String combination_2_add = "";
String combination_2_comp = "";
String combination_2_cost = "";
String combination_2_tel = "";
String lining_store = "";
String lining_name = "";
String lining_add = "";
String lining_comp = "";
String lining_cost = "";
String lining_tel = "";
String button_store = "";
String button_name = "";
String button_add = "";
String button_comp = "";
String button_cost = "";
String button_tel = "";
String file_to_choose = "";
String outPut = "";
String[] colour = new String[6];
String[] qty = new String[6];
try {
    Context ic = new InitialContext(); 
    matrix = new MatrixDataSet();
    dataProcess = new DataProcess();
    DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
    conn = ds.getConnection();
    // get order_no and style from purchase order
    sql = "select order_no, style from purchase_order where order_no ='"+po_num+"';";
    iRet = dataProcess.RetrieveData(sql, matrix, conn);
    int k = 0;
    tmp_po_num = matrix.getRowData(0).getData(k++);
    tmp_style = matrix.getRowData(0).getData(k++);    
    
    if(rm_poUpdate == null){
        rm_poUpdate = "false";
        file_to_choose = "raw_material_po_save.jsp";
    }
    if(rm_poUpdate.equals("true")){
        file_to_choose = "raw_material_po_update.jsp";
        sql = "select "
                + " po_num, date_ordered, writer, factory, out_shell_length, combination_length, lining_length, inter_lining_length, "
                + " button_length, hanger_tape_length, sewing_yarn_length, "
                + " out_shell_store, out_shell_name, out_shell_add, out_shell_comp, out_shell_cost, out_shell_tel, "
                + " combination_1_store, combination_1_name, combination_1_add, combination_1_comp, combination_1_cost, combination_1_tel, "
                + " combination_2_store, combination_2_name, combination_2_add, combination_2_comp, combination_2_cost, combination_2_tel, "
                + " lining_store, lining_name, lining_add, lining_comp, lining_cost, lining_tel, "
                + " button_store, button_name, button_add, button_comp, button_cost, button_tel "
                + " from "
                + " raw_material_purchase_order where po_num = '"+po_num+"';";
        iRet = dataProcess.RetrieveData(sql, matrix, conn);
        k = 0;
        String po_num1 =  matrix.getRowData(0).getData(k++);
        date_ordered =  matrix.getRowData(0).getData(k++);
        writer =  matrix.getRowData(0).getData(k++);
        factory =  matrix.getRowData(0).getData(k++);
        out_shell_length =  matrix.getRowData(0).getData(k++);
        combination_length =  matrix.getRowData(0).getData(k++);
        lining_length =  matrix.getRowData(0).getData(k++);
        inter_lining_length = matrix.getRowData(0).getData(k++);
        button_length =  matrix.getRowData(0).getData(k++);
        hanger_tape_length =  matrix.getRowData(0).getData(k++);
        sewing_yarn_length = matrix.getRowData(0).getData(k++);
        out_shell_store =  matrix.getRowData(0).getData(k++);
        out_shell_name =  matrix.getRowData(0).getData(k++);
        out_shell_add = matrix.getRowData(0).getData(k++);
        out_shell_comp = matrix.getRowData(0).getData(k++);
        out_shell_cost =  matrix.getRowData(0).getData(k++);
        out_shell_tel = matrix.getRowData(0).getData(k++);
        combination_1_store =  matrix.getRowData(0).getData(k++);
        combination_1_name =  matrix.getRowData(0).getData(k++);
        combination_1_add =  matrix.getRowData(0).getData(k++);
        combination_1_comp = matrix.getRowData(0).getData(k++);
        combination_1_cost =  matrix.getRowData(0).getData(k++);
        combination_1_tel = matrix.getRowData(0).getData(k++);
        combination_2_store = matrix.getRowData(0).getData(k++);
        combination_2_name = matrix.getRowData(0).getData(k++);
        combination_2_add =  matrix.getRowData(0).getData(k++);
        combination_2_comp =  matrix.getRowData(0).getData(k++);
        combination_2_cost =  matrix.getRowData(0).getData(k++);
        combination_2_tel = matrix.getRowData(0).getData(k++);
        lining_store = matrix.getRowData(0).getData(k++);
        lining_name =  matrix.getRowData(0).getData(k++);
        lining_add = matrix.getRowData(0).getData(k++);
        lining_comp =  matrix.getRowData(0).getData(k++);
        lining_cost = matrix.getRowData(0).getData(k++);
        lining_tel = matrix.getRowData(0).getData(k++);
        button_store = matrix.getRowData(0).getData(k++);
        button_name =  matrix.getRowData(0).getData(k++);
        button_add =  matrix.getRowData(0).getData(k++);
        button_comp = matrix.getRowData(0).getData(k++);
        button_cost = matrix.getRowData(0).getData(k++);
        button_tel = matrix.getRowData(0).getData(k++);
        
        sql = " select  colour, qty, out_shell_qty, combination_qty, lining_qty, inter_lining_qty, button_qty, hanger_tape_qty, sewing_yarn_qty,"
                + " out_shell_stocked, combination_stocked, lining_stocked, inter_lining_stocked, button_stocked, hanger_tape_stocked, sewing_yarn_stocked "
                + " from raw_material_fabric "
                + " where po_num = '"+po_num+"'; ";         
        iRet = dataProcess.RetrieveData(sql, matrix, conn);
        for(int i=0; i<iRet; i++){
            k = 0;
            String tmp_colour = matrix.getRowData(i).getData(k++);
            String total_qty = matrix.getRowData(i).getData(k++);
            String out_shell_qty = matrix.getRowData(i).getData(k++);
            String combination_qty = matrix.getRowData(i).getData(k++);
            String lining_qty = matrix.getRowData(i).getData(k++);
            String inter_lining_qty = matrix.getRowData(i).getData(k++);
            String button_qty = matrix.getRowData(i).getData(k++);
            String hanger_tape_qty = matrix.getRowData(i).getData(k++);
            String sewing_yarn_qty = matrix.getRowData(i).getData(k++);
            String out_shell_stocked = matrix.getRowData(i).getData(k++);
            String combination_stocked = matrix.getRowData(i).getData(k++);
            String lining_stocked = matrix.getRowData(i).getData(k++);
            String inter_lining_stocked = matrix.getRowData(i).getData(k++);
            String button_stocked = matrix.getRowData(i).getData(k++);
            String hanger_tape_stocked = matrix.getRowData(i).getData(k++);
            String sewing_yarn_stocked = matrix.getRowData(i).getData(k++);
            
            outPut +=   "<tr height='110px'>"
                    +   "<td><input size='6' type='text' name='colour[]' value='"+tmp_colour+"' /></td>"
                    +   "<td></td>"
                    +   "<td></td>"
                    +   "<td></td>"
                    +   "<td></td>"
                    +   "<td></td>"
                    +   "<td></td>"
                    +   "<td></td>"
                    + "</tr>"
                    + "<tr height='30px'>"
                    +   "<td rowspan='2'><input size='1' type='text' name='qty[]' value='"+total_qty+"' />PCS</td>"
                    +   "<td class='gray_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>O/QTY :</td><td style='border:0;'><input value='"+out_shell_qty+"' type='text' name='out_shell_qty[]' size='3' /></td><tr></table></td>"
                    +   "<td class='gray_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>O/QTY :</td><td style='border:0;'><input value='"+combination_qty+"' type='text' name='combination_qty[]' size='3' /></td><tr></table></td>"
                    +   "<td class='gray_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>O/QTY :</td><td style='border:0;'><input value='"+lining_qty+"' type='text' name='lining_qty[]' size='3' /></td><tr></table></td>"
                    +   "<td class='gray_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>O/QTY :</td><td style='border:0;'><input value='"+inter_lining_qty+"' type='text' name='inter_lining_qty[]' size='3' /></td><tr></table></td>"
                    +   "<td class='gray_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>O/QTY :</td><td style='border:0;'><input value='"+button_qty+"' type='text' name='button_qty[]' size='3' /></td><tr></table></td>"
                    +   "<td class='gray_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>O/QTY :</td><td style='border:0;'><input value='"+hanger_tape_qty+"' type='text' name='hanger_tape_qty[]' size='3' /></td><tr></table></td>"
                    +   "<td class='gray_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>O/QTY :</td><td style='border:0;'><input value='"+sewing_yarn_qty+"' type='text' name='sewing_yarn_qty[]' size='3' /></td><tr></table></td>"
                    + "</tr>"
                    + "<tr height='30px'>"
                    +   "<td class='blue_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>Stocked :</td><td style='border:0;'><input value='"+out_shell_stocked+"' type='text' name='out_shell_stocked[]' size='3' /></td><tr></table></td>"
                    +   "<td class='blue_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>Stocked :</td><td style='border:0;'><input value='"+combination_stocked+"' type='text' name='combination_stocked[]' size='3' /></td><tr></table></td>"
                    +   "<td class='blue_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>Stocked :</td><td style='border:0;'><input value='"+lining_stocked+"' type='text' name='lining_stocked[]' size='3' /></td><tr></table></td>"
                    +   "<td class='blue_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>Stocked :</td><td style='border:0;'><input value='"+inter_lining_stocked+"' type='text' name='inter_lining_stocked[]' size='3' /></td><tr></table></td>"
                    +   "<td class='blue_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>Stocked :</td><td style='border:0;'><input value='"+button_stocked+"' type='text' name='button_stocked[]' size='3' /></td><tr></table></td>"
                    +   "<td class='blue_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>Stocked :</td><td style='border:0;'><input value='"+hanger_tape_stocked+"' type='text' name='hanger_tape_stocked[]' size='3' /></td><tr></table></td>"
                    +   "<td class='blue_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>Stocked :</td><td style='border:0;'><input value='"+sewing_yarn_stocked+"' type='text' name='sewing_yarn_stocked[]' size='3' /></td><tr></table></td>"
                    + "</tr>";
            }
    }
    else{
        sql = " select  colour, total_qty "
                + " from    purchase_order_line "
                + " where order_no = '"+po_num+"'; "; 
        iRet = dataProcess.RetrieveData(sql, matrix, conn);
        for(int i=0; i<iRet; i++){
            k = 0;
            int a = 0;
            String tmp_colour = matrix.getRowData(i).getData(k++);
            String total_qty = matrix.getRowData(i).getData(k++);
            outPut +=   "<tr height='110px'>"
                    +   "<td><input size='6' type='text' name='colour[]' value='"+tmp_colour+"' /></td>"
                    +   "<td></td>"
                    +   "<td></td>"
                    +   "<td></td>"
                    +   "<td></td>"
                    +   "<td></td>"
                    +   "<td></td>"
                    +   "<td></td>"
                    + "</tr>"
                    + "<tr height='30px'>"
                    +   "<td rowspan='2'><input size='1' type='text' name='qty[]' value='"+total_qty+"' />PCS</td>"
                    +   "<td class='gray_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>O/QTY :</td><td style='border:0;'><input type='text' name='out_shell_qty[]' size='3' /></td><tr></table></td>"
                    +   "<td class='gray_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>O/QTY :</td><td style='border:0;'><input type='text' name='combination_qty[]' size='3' /></td><tr></table></td>"
                    +   "<td class='gray_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>O/QTY :</td><td style='border:0;'><input type='text' name='lining_qty[]' size='3' /></td><tr></table></td>"
                    +   "<td class='gray_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>O/QTY :</td><td style='border:0;'><input type='text' name='inter_lining_qty[]' size='3' /></td><tr></table></td>"
                    +   "<td class='gray_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>O/QTY :</td><td style='border:0;'><input type='text' name='button_qty[]' size='3' /></td><tr></table></td>"
                    +   "<td class='gray_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>O/QTY :</td><td style='border:0;'><input type='text' name='hanger_tape_qty[]' size='3' /></td><tr></table></td>"
                    +   "<td class='gray_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>O/QTY :</td><td style='border:0;'><input type='text' name='sewing_yarn_qty[]' size='3' /></td><tr></table></td>"
                    + "</tr>"
                    + "<tr height='30px'>"
                    +   "<td class='blue_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>Stocked :</td><td style='border:0;'><input type='text' name='out_shell_stocked[]' size='3' /></td><tr></table></td>"
                    +   "<td class='blue_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>Stocked :</td><td style='border:0;'><input type='text' name='combination_stocked[]' size='3' /></td><tr></table></td>"
                    +   "<td class='blue_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>Stocked :</td><td style='border:0;'><input type='text' name='lining_stocked[]' size='3' /></td><tr></table></td>"
                    +   "<td class='blue_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>Stocked :</td><td style='border:0;'><input type='text' name='inter_lining_stocked[]' size='3' /></td><tr></table></td>"
                    +   "<td class='blue_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>Stocked :</td><td style='border:0;'><input type='text' name='button_stocked[]' size='3' /></td><tr></table></td>"
                    +   "<td class='blue_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>Stocked :</td><td style='border:0;'><input type='text' name='hanger_tape_stocked[]' size='3' /></td><tr></table></td>"
                    +   "<td class='blue_background'><table><tr style='border:0;'><td width='57px' style='border:0;'>Stocked :</td><td style='border:0;'><input type='text' name='sewing_yarn_stocked[]' size='3' /></td><tr></table></td>"
                    + "</tr>";
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
%>
<style>
    table{
        border-collapse:collapse;
        font-size: 12px;
    }
    tr, td{
        border:1px solid black;
        padding: 0;
    }   
    .blue_background{
        background-color: #00BFFF;
    }
    .gray_background{
        background-color: #D6D6D6;
    }
    table#alignMiddle tr, table#alignMiddle td{
        text-align: center;
    }
</style>
<body>
    <form name="form1" method="POST" action="<%= file_to_choose %>" accept-charset="UTF-8">
        <input type="hidden" name="po_num" value="<%= po_num %>" />
        <table width="900px">
            <tr style="height:30px; background-color: #000099; color:white; text-align: center; font-weight: bold; border:0;">
                <td>Raw Material Purchase Order</td>
            </tr>
            <tr height="5px" style="border:0px;">
                <td style="border:0px;"></td>
            </tr>
            <tr style="border:0px;">
                <td style="border:0px;">
                    <table align="left" width="300px" height="111px">
                        <tr>
                            <td width="110px">Style No</td>
                            <td><input type="text" name='style_num' value="<%= tmp_style %>" disabled/></td>
                        </tr>
                        <tr>
                            <td>Date Ordered</td>
                            <td><input type="text" name='date_ordered' value="<%= date_ordered %>" /></td>
                        </tr>
                        <tr>
                            <td>Writer</td>
                            <td><input type="text" name='writer' value="<%= writer %>" /></td>
                        </tr>
                        <tr>
                            <td>Factory</td>
                            <td><input type="text" name='factory' value="<%= factory %>" /></td>
                        </tr>
                    </table>
                    <table align="right" id="alignMiddle">
                        <tr height="30px">
                            <td width="50px">负责人</td>
                            <td width="50px">组长</td>
                            <td width="50px">室长</td>
                            <td width="50px">管理部</td>
                            <td width="50px">采购</td>
                        </tr>
                        <tr height="80px">
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr height="10px" style="border:0px;">
                <td style="border:0px;"></td>
            </tr>
            <tr height="15px" style="border:0px; color:blue; font-size: 12px;">
                <td style="border:0px;">Fabric Info.</td>
            </tr>
            <table width="900px">
                <tr>
                    <td width="80px" height="40px">CONS.</td>
                    <td width="110px">Out Shell / 主布</td>
                    <td width="110px">Combination / 配布</td>
                    <td width="110px">Lining / 里布</td>
                    <td width="110px">Inter Lining / 朴</td>
                    <td width="110px">Button / 扣子</td>
                    <td width="110px">Hanger Tape /<br/> 挂衣带</td>
                    <td width="110px">Sewing Yarn / 线</td>
                </tr>
                <tr>
                    <td height="30px">Colour</td>
                    <td>用量 : <input type="text" name='out_shell_length' size="6" value="<%= out_shell_length %>"/></td>
                    <td>用量 : <input type="text" name='combination_length' size="6" value="<%= combination_length %>"/></td>
                    <td>用量 : <input type="text" name='lining_length' size="6" value="<%= lining_length %>"/></td>
                    <td>用量 : <input type="text" name='inter_lining_length' size="6" value="<%= inter_lining_length %>"/></td>
                    <td>用量 : <input type="text" name='button_length' size="6" value="<%= button_length %>"/></td>
                    <td>用量 : <input type="text" name='hanger_tape_length' size="6" value="<%= hanger_tape_length %>"/></td>
                    <td>用量 : <input type="text" name='sewing_yarn_length' size="6" value="<%= sewing_yarn_length %>"/></td>
                </tr>
                <%= outPut %>
            </table>        
            <table width="900px">
                <tr height="10px" style="border:0px;">
                    <td style="border:0px;"></td>
                </tr>
                <tr height="15px" style="border:0px; color:blue; font-size: 12px;">
                    <td style="border:0px;">Store Info.</td>
                </tr>
            </table>
            <table width="900px">
                <tr>
                    <td width='70px' rowspan='2'>OUT SHELL /<br/> 主布</td>
                    <td width='280px' height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Store.</td><td style='border:0;'><input type='text' name='out_shell_store' size='30'  value="<%= out_shell_store %>"/></td><tr></table></td>
                    <td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>品名: </td><td style='border:0;'><input type='text' name='out_shell_name' size='30'  value="<%= out_shell_name %>"/></td><tr></table></td>
                    <td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Add : </td><td style='border:0;'><input type='text' name='out_shell_add' size='30' value="<%= out_shell_add %>" /></td><tr></table></td>
                </tr>
                <tr>
                    <td height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Comp. </td><td style='border:0;'><input type='text' name='out_shell_comp' size='30'  value="<%= out_shell_comp %>"/></td><tr></table></td>
                    <td class='gray_background'><table><tr style='border:0;'><td width='40px' style='border:0;'>单价 : </td><td style='border:0;'><input class='gray_background' type='text' name='out_shell_cost' size='30' value="<%= out_shell_cost %>" /></td><tr></table></td>
                    <td><table><tr style='border:0;'><td width='40px' style='border:0;'>Tel. </td><td style='border:0;'><input type='text' name='out_shell_tel' size='30' value="<%= out_shell_tel %>" /></td><tr></table></td>
                </tr>
                <tr>
                    <td rowspan='2'>COMBINATION_1 / 配布</td>
                    <td width='280px' height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Store.</td><td style='border:0;'><input type='text' name='combination_1_store' size='30' value="<%= combination_1_store %>" /></td><tr></table></td>
                    <td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>品名: </td><td style='border:0;'><input type='text' name='combination_1_name' size='30' value="<%= combination_1_name %>" /></td><tr></table></td>
                    <td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Add : </td><td style='border:0;'><input type='text' name='combination_1_add' size='30' value="<%= combination_1_add %>" /></td><tr></table></td>
                </tr>
                <tr>
                    <td height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Comp. </td><td style='border:0;'><input type='text' name='combination_1_comp' size='30' value="<%= combination_1_comp %>" /></td><tr></table></td>
                    <td class='gray_background'><table><tr style='border:0;'><td width='40px' style='border:0;'>单价 : </td><td style='border:0;'><input class='gray_background' type='text' name='combination_1_cost' size='30' value="<%= combination_1_cost %>" /></td><tr></table></td>
                    <td><table><tr style='border:0;'><td width='40px' style='border:0;'>Tel. </td><td style='border:0;'><input type='text' name='combination_1_tel' size='30' value="<%= combination_1_tel %>" /></td><tr></table></td>
                </tr>
                <tr>
                    <td rowspan='2'>COMBINATION_2 / 配布</td>
                    <td width='280px' height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Store.</td><td style='border:0;'><input type='text' name='combination_2_store' size='30' value="<%= combination_2_store %>" /></td><tr></table></td>
                    <td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>品名: </td><td style='border:0;'><input type='text' name='combination_2_name' size='30' value="<%= combination_2_name %>" /></td><tr></table></td>
                    <td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Add : </td><td style='border:0;'><input type='text' name='combination_2_add' size='30' value="<%= combination_2_add %>" /></td><tr></table></td>
                </tr>
                <tr>
                    <td height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Comp. </td><td style='border:0;'><input type='text' name='combination_2_comp' size='30'  value="<%= combination_2_comp %>"/></td><tr></table></td>
                    <td class='gray_background'><table><tr style='border:0;'><td width='40px' style='border:0;'>单价 : </td><td style='border:0;'><input class='gray_background' type='text' name='combination_2_cost' size='30' value="<%= combination_2_cost %>" /></td><tr></table></td>
                    <td><table><tr style='border:0;'><td width='40px' style='border:0;'>Tel. </td><td style='border:0;'><input type='text' name='combination_2_tel' size='30' value="<%= combination_2_tel %>" /></td><tr></table></td>
                </tr>
                <tr>
                    <td rowspan='2'>LINING / 里布</td>
                    <td width='280px' height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Store.</td><td style='border:0;'><input type='text' name='lining_store' size='30'  value="<%= lining_store %>"/></td><tr></table></td>
                    <td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>品名: </td><td style='border:0;'><input type='text' name='lining_name' size='30'  value="<%= lining_name %>"/></td><tr></table></td>
                    <td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Add : </td><td style='border:0;'><input type='text' name='lining_add' size='30' value="<%= lining_add %>" /></td><tr></table></td>
                </tr>
                <tr>
                    <td height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Comp. </td><td style='border:0;'><input type='text' name='lining_comp' size='30' value="<%= lining_comp %>" /></td><tr></table></td>
                    <td class='gray_background'><table><tr style='border:0;'><td width='40px' style='border:0;'>单价 : </td><td style='border:0;'><input class='gray_background' type='text' name='lining_cost' size='30' value="<%= lining_cost %>" /></td><tr></table></td>
                    <td><table><tr style='border:0;'><td width='40px' style='border:0;'>Tel. </td><td style='border:0;'><input type='text' name='lining_tel' size='30'  value="<%= lining_tel %>"/></td><tr></table></td>
                </tr>
                <tr>
                    <td rowspan='2'>BUTTON / 扣子</td>
                    <td width='280px' height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Store.</td><td style='border:0;'><input type='text' name='button_store' size='30' value="<%= button_store %>" /></td><tr></table></td>
                    <td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>品名: </td><td style='border:0;'><input type='text' name='button_name' size='30' value="<%= button_name %>" /></td><tr></table></td>
                    <td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Add : </td><td style='border:0;'><input type='text' name='button_add' size='30' value="<%= button_add %>" /></td><tr></table></td>
                </tr>
                <tr>
                    <td height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Comp. </td><td style='border:0;'><input type='text' name='button_comp' size='30'  value="<%= button_comp %>"/></td><tr></table></td>
                    <td class='gray_background'><table><tr style='border:0;'><td width='40px' style='border:0;'>单价 : </td><td style='border:0;'><input class='gray_background' type='text' name='button_cost' size='30' value="<%= button_cost %>" /></td><tr></table></td>
                    <td><table><tr style='border:0;'><td width='40px' style='border:0;'>Tel. </td><td style='border:0;'><input type='text' name='button_tel' size='30' value="<%= button_tel %>" /></td><tr></table></td>
                </tr>
            </table>
        </table>
            <input type="submit" value="Submit">
    </form>
</body>