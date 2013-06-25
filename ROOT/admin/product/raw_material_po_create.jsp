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
String outPut_colour = "";
String outPut_qty = "";
String outPut_default_line = "";
String outPut_default_blank = "";
int count_colour = 0;

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
    
    sql = " select  colour, total_qty "
            + " from    purchase_order_line "
            + " where order_no = '"+po_num+"'; "; 
    iRet = dataProcess.RetrieveData(sql, matrix, conn);
    count_colour = iRet;
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
                    <td width="80px" height="30px">Colour</td>
                    <%= outPut_colour %>
                </tr>
                <tr>
                    <td width="80px" height="30px">CONS.</td>
                    <%= outPut_qty %>
                </tr>
                <tr>
                    <td width="80px" height="100px"><input type="hidden" name="cons[]" value="out_shell" />Out Shell</td>
                    <%= outPut_default_blank %>
                </tr>
                <tr>
                    <td width="80px">Length: <input size="2" type="text" name="length[]" /></td>
                    <%= outPut_default_line %>
                </tr>
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