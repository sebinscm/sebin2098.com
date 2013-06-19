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

String po_num = request.getParameter("po_num");
String outPut =   "<tr height='110px'>"
                +   "<td><textarea name='colour[]' style='width:80px; height:100%;'></textarea></td>"
                +   "<td></td>"
                +   "<td></td>"
                +   "<td></td>"
                +   "<td></td>"
                +   "<td></td>"
                +   "<td></td>"
                +   "<td></td>"
                + "</tr>"
                + "<tr height='30px'>"
                +   "<td rowspan='2'><textarea name='qty[]' style='width:80px; height:100%;'></textarea></td>"
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
</style>
<body>
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
                        <td><input type="text" name='style_num' /></td>
                    </tr>
                    <tr>
                        <td>Date Ordered</td>
                        <td><input type="text" name='date_ordered' /></td>
                    </tr>
                    <tr>
                        <td>Writer</td>
                        <td><input type="text" name='writer' /></td>
                    </tr>
                    <tr>
                        <td>Factory</td>
                        <td><input type="text" name='factory' /></td>
                    </tr>
                </table>
                <table align="right" >
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
                <td>用量 : <input type="text" name='out_shell_length' size="6"/></td>
                <td>用量 : <input type="text" name='combination_length' size="6"/></td>
                <td>用量 : <input type="text" name='lining_length' size="6"/></td>
                <td>用量 : <input type="text" name='inter_lining_length' size="6"/></td>
                <td>用量 : <input type="text" name='button_length' size="6"/></td>
                <td>用量 : <input type="text" name='hanger_tape_length' size="6"/></td>
                <td>用量 : <input type="text" name='sewing_yarn_length' size="6"/></td>
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
                <td width='280px' height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Store.</td><td style='border:0;'><input type='text' name='out_shell_store' size='30' /></td><tr></table></td>
                <td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>品名: </td><td style='border:0;'><input type='text' name='out_shell_name' size='30' /></td><tr></table></td>
                <td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Add : </td><td style='border:0;'><input type='text' name='out_shell_add' size='30' /></td><tr></table></td>
            </tr>
            <tr>
                <td height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Comp. </td><td style='border:0;'><input type='text' name='out_shell_comp' size='30' /></td><tr></table></td>
                <td class='gray_background'><table><tr style='border:0;'><td width='40px' style='border:0;'>单价 : </td><td style='border:0;'><input class='gray_background' type='text' name='out_shell_cost' size='30' /></td><tr></table></td>
                <td><table><tr style='border:0;'><td width='40px' style='border:0;'>Tel. </td><td style='border:0;'><input type='text' name='out_shell_tel' size='30' /></td><tr></table></td>
            </tr>
            <tr>
                <td rowspan='2'>COMBINATION_1 / 配布</td>
                <td width='280px' height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Store.</td><td style='border:0;'><input type='text' name='combination_1_store' size='30' /></td><tr></table></td>
                <td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>品名: </td><td style='border:0;'><input type='text' name='combination_1_name' size='30' /></td><tr></table></td>
                <td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Add : </td><td style='border:0;'><input type='text' name='combination_1_add' size='30' /></td><tr></table></td>
            </tr>
            <tr>
                <td height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Comp. </td><td style='border:0;'><input type='text' name='combination_1_comp' size='30' /></td><tr></table></td>
                <td class='gray_background'><table><tr style='border:0;'><td width='40px' style='border:0;'>单价 : </td><td style='border:0;'><input class='gray_background' type='text' name='combination_1_cost' size='30' /></td><tr></table></td>
                <td><table><tr style='border:0;'><td width='40px' style='border:0;'>Tel. </td><td style='border:0;'><input type='text' name='combination_1_tel' size='30' /></td><tr></table></td>
            </tr>
            <tr>
                <td rowspan='2'>COMBINATION_2 / 配布</td>
                <td width='280px' height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Store.</td><td style='border:0;'><input type='text' name='combination_2_store' size='30' /></td><tr></table></td>
                <td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>品名: </td><td style='border:0;'><input type='text' name='combination_2_name' size='30' /></td><tr></table></td>
                <td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Add : </td><td style='border:0;'><input type='text' name='combination_2_add' size='30' /></td><tr></table></td>
            </tr>
            <tr>
                <td height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Comp. </td><td style='border:0;'><input type='text' name='combination_2_comp' size='30' /></td><tr></table></td>
                <td class='gray_background'><table><tr style='border:0;'><td width='40px' style='border:0;'>单价 : </td><td style='border:0;'><input class='gray_background' type='text' name='combination_2_cost' size='30' /></td><tr></table></td>
                <td><table><tr style='border:0;'><td width='40px' style='border:0;'>Tel. </td><td style='border:0;'><input type='text' name='combination_2_tel' size='30' /></td><tr></table></td>
            </tr>
            <tr>
                <td rowspan='2'>LINING / 里布</td>
                <td width='280px' height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Store.</td><td style='border:0;'><input type='text' name='lining_store' size='30' /></td><tr></table></td>
                <td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>品名: </td><td style='border:0;'><input type='text' name='lining_name' size='30' /></td><tr></table></td>
                <td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Add : </td><td style='border:0;'><input type='text' name='lining_add' size='30' /></td><tr></table></td>
            </tr>
            <tr>
                <td height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Comp. </td><td style='border:0;'><input type='text' name='lining_comp' size='30' /></td><tr></table></td>
                <td class='gray_background'><table><tr style='border:0;'><td width='40px' style='border:0;'>单价 : </td><td style='border:0;'><input class='gray_background' type='text' name='lining_cost' size='30' /></td><tr></table></td>
                <td><table><tr style='border:0;'><td width='40px' style='border:0;'>Tel. </td><td style='border:0;'><input type='text' name='lining_tel' size='30' /></td><tr></table></td>
            </tr>
            <tr>
                <td rowspan='2'>BUTTON / 扣子</td>
                <td width='280px' height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Store.</td><td style='border:0;'><input type='text' name='button_store' size='30' /></td><tr></table></td>
                <td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>品名: </td><td style='border:0;'><input type='text' name='button_name' size='30' /></td><tr></table></td>
                <td width='280px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Add : </td><td style='border:0;'><input type='text' name='button_add' size='30' /></td><tr></table></td>
            </tr>
            <tr>
                <td height='25px'><table><tr style='border:0;'><td width='40px' style='border:0;'>Comp. </td><td style='border:0;'><input type='text' name='button_comp' size='30' /></td><tr></table></td>
                <td class='gray_background'><table><tr style='border:0;'><td width='40px' style='border:0;'>单价 : </td><td style='border:0;'><input class='gray_background' type='text' name='button_cost' size='30' /></td><tr></table></td>
                <td><table><tr style='border:0;'><td width='40px' style='border:0;'>Tel. </td><td style='border:0;'><input type='text' name='button_tel' size='30' /></td><tr></table></td>
            </tr>
        </table>
    </table>
</body>