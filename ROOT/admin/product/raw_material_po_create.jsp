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
MatrixDataSet matrix2 = null;
DataProcess dataProcess = null;
int iRet = 0;
int iRet2 = 0;
String sql = "";
String sql2 = "";
String outPut_colour = "";
String outPut_qty = "";
String outPut_default_line = "";
String outPut_default_blank = "";
String default_outPut = "";
String tmp_default_outPut = "";
String outPut_edit = "";
String output_stores = "";
String options_cons = "<select name='cons[]'>"
                    + "<option value=''>Select One</option>"
                    + "<option value='out_shell'>Out Shell</option>"
                    + "<option value='combination'>Combination</option>"
                    + "<option value='lining'>Lining</option>"
                    + "<option value='inter_lining'>Inter Lining</option>"
                    + "<option value='button'>Button</option>"
                    + "<option value='hanger_tape'>Hanger Tape</option>"
                    + "<option value='sewing_yarn'>Sewing Yarn</option>"                    
                    + "</select>";
int count_colour = 0;
int count_lines = 5;

String tmp_po_num = "";
String tmp_style = "";
String po_num = request.getParameter("po_num");
String rm_poUpdate = request.getParameter("rm_poUpdate");
String date_ordered ="";
String writer = "";
String factory= "";

String file_to_choose = "";
int count_colour_plus_one = 0;
int whichLine = 1;
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
    
    sql = " select  colour, total_qty "
            + " from    purchase_order_line "
            + " where order_no = '"+po_num+"'; "; 
    iRet = dataProcess.RetrieveData(sql, matrix, conn);
    count_colour = iRet;
    if(rm_poUpdate == null){
        rm_poUpdate = "false";
    }
    if(rm_poUpdate.equals("false")){
        file_to_choose = "raw_material_po_save.jsp";
        default_outPut = "<tr><td width='80px' height='100px'>"+options_cons+"</td>";
        for(int i=0; i<count_colour; i++){
            default_outPut += "<td></td>";
        }
        default_outPut += "</tr>";
        default_outPut += "<tr><td width='80px'>Length: <input size='2' type='text' name='length[]' /></td>";
        for(int i=0; i<count_colour; i++){
            default_outPut += "<td>O/qty : <input size='7' type='text' name='order_qty[]' /><br/>"
                           +  "Stocked: <input size='7' type='text' name='stocked[]' /></td>";
        }
        default_outPut += "</tr>";

        for(int i =0; i<count_lines; i++){
            tmp_default_outPut += default_outPut;
        }
        outPut_default_blank += "<tr><td width='80px' height='100px'><input type='hidden' name='cons[]' value='out_shell' />Out Shell</td>";
        outPut_default_line += "<tr><td width='80px'>Length: <input size='2' type='text' name='length[]' /></td>";
        for(int i=0; i<iRet; i++){
            k = 0;
            String tmp_colour = matrix.getRowData(i).getData(k++);
            String total_qty = matrix.getRowData(i).getData(k++);
            outPut_colour +=  "<td><input type='hidden' name='colour[]' value='"+tmp_colour+"' />"+tmp_colour+"</td>";
            outPut_qty += "<td>"+total_qty+" PCS</td>";
            outPut_default_line += "<td>O/qty : <input size='7' type='text' name='order_qty[]' /><br/>"
                                +  "Stocked: <input size='7' type='text' name='stocked[]' /></td>";
            outPut_default_blank += "<td></td>";
        }   
        outPut_default_line += "</tr>";
        outPut_default_blank += "</tr>";
    }
    else{
        file_to_choose = "raw_material_po_update.jsp";
        for(int i=0; i<iRet; i++){
            k = 0;
            String tmp_colour = matrix.getRowData(i).getData(k++);
            String total_qty = matrix.getRowData(i).getData(k++);
            outPut_colour +=  "<td><input type='hidden' name='colour[]' value='"+tmp_colour+"' />"+tmp_colour+"</td>";
            outPut_qty += "<td>"+total_qty+" PCS</td>";
        }
        sql = " select po_num, colour, cons, length, order_qty, stocked"
            + " from raw_material_purchase_order"
            + " where po_num = '"+po_num+"';";
        iRet = dataProcess.RetrieveData(sql, matrix, conn);
        int count_colour_plus = count_colour + 1;
        int count_colour_multi = count_colour * 2;
        int tmp_i = 1;
        for(int i = 0; i< iRet; i++){
            k = 1;
            String tmp_colour = matrix.getRowData(i).getData(k++);
            String tmp_cons = matrix.getRowData(i).getData(k++);
            String tmp_length = matrix.getRowData(i).getData(k++);
            String order_qty = matrix.getRowData(i).getData(k++);
            String stocked = matrix.getRowData(i).getData(k++);
                        
            if(tmp_i == 1 || tmp_i == count_colour_plus){
                outPut_edit += "<tr><td height='100px'><input name='cons[]' type='text' value='"+tmp_cons+"' /></td>";
                for(int a = 0; a<count_colour; a++){
                    outPut_edit += "<td></td>";
                }
                outPut_edit += "</tr>";
                outPut_edit += "<tr>";
                outPut_edit += "<td>Length : <input name='length[]' type='text' value='"+tmp_length+"' /></td>";
                outPut_edit += "<td>QTY : <input name='order_qty[]' type='text' value='"+order_qty+"' /><br/>Stocked : <input name='stocked[]' type='text' value='"+stocked+"' /></td>";
            }
            else{
                outPut_edit += "<td>QTY : <input name='order_qty[]' type='text' value='"+order_qty+"' /><br/>Stocked : <input name='stocked[]' type='text' value='"+stocked+"' /></td>";
            }
            
            if(tmp_i % count_colour == 0){
                if(whichLine==1){
                    whichLine = 2;
                    outPut_edit += "</tr>";
                }
                else{
                    whichLine = 1;
                    outPut_edit += "</tr>";
                }
            }
            if(tmp_i % count_colour_multi == 0){
                tmp_i = 0;
            }
            tmp_i++;
        }
        sql = " select po_num, store_name, composition, cons_name, cons_cost, cons_add, cons_tel, consumption"
            + " from raw_material_purchase_order_store_info"
            + " where po_num = '"+po_num+"';";
        iRet = dataProcess.RetrieveData(sql, matrix, conn);
        
        for(int i=0; i<iRet; i++){
            k = 1;
            String store_name = matrix.getRowData(i).getData(k++);
            String composition = matrix.getRowData(i).getData(k++);
            String cons_name = matrix.getRowData(i).getData(k++);
            String cons_cost = matrix.getRowData(i).getData(k++);
            String cons_add = matrix.getRowData(i).getData(k++);
            String cons_tel = matrix.getRowData(i).getData(k++);
            String consumption = matrix.getRowData(i).getData(k++);
            output_stores   += "<tr>"
                            + "<td width='70px' rowspan='2'><input type='text' name='store_cons[]' value='"+consumption+"' /></td>"
                            + "<td width='280px' height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Store.</td><td style='border:0;'><input type='text' name='store_name[]' size='20'  value='"+store_name+"'/></td><tr></table></td>"
                            + "<td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>品名: </td><td style='border:0;'><input type='text' name='cons_name[]' size='20'  value='" + cons_name + "' /></td><tr></table></td>"
                            + "<td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Add : </td><td style='border:0;'><input type='text' name='cons_add[]' size='20' value='" + cons_add + "' /></td><tr></table></td>"
                            + "</tr>"
                            +"<tr>"                            
                            + "<td width='280px' height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Comp.</td><td style='border:0;'><input type='text' name='composition[]' size='20'  value='"+composition+"'/></td><tr></table></td>"
                            + "<td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>单价 : </td><td style='border:0;'><input type='text' name='cons_cost[]' size='20'  value='" + cons_cost + "' /></td><tr></table></td>"
                            + "<td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Tel : </td><td style='border:0;'><input type='text' name='cons_tel[]' size='20' value='" + cons_tel + "' /></td><tr></table></td>"
                            + "</tr>";
        }
        sql = " select po_num, date_ordered, writer, factory"
            + " from    r_m_p_order_basic "
            + " where po_num = '"+po_num+"'; "; 
        k = 1;
        iRet = dataProcess.RetrieveData(sql, matrix, conn);
        date_ordered = matrix.getRowData(0).getData(k++);
        writer = matrix.getRowData(0).getData(k++);
        factory= matrix.getRowData(0).getData(k++);
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
    #box input[type="text"]{
        width:100px;
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
            <table width="900px" id="box">
                <tr>
                    <td width="80px" height="30px">Colour</td>
                    <%= outPut_colour %>
                </tr>
                <tr>
                    <td width="80px" height="30px">CONS.</td>
                    <%= outPut_qty %>
                </tr>
                    <%= outPut_default_blank %>
                    <%= outPut_default_line %>
                    <%= tmp_default_outPut %>
                    <%= outPut_edit %>
            </table>        
            <table width="900px">
                <tr height="10px" style="border:0px;">
                    <td style="border:0px;"></td>
                </tr>
                <tr height="15px" style="border:0px; color:blue; font-size: 12px;">
                    <td style="border:0px;"></td>
                </tr>
            </table>
            <table width="900px">
                <%= output_stores %>
            </table>
        </table>
            <input type="submit" value="Submit">
    </form>
</body>