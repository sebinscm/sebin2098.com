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
String sheetUpdate = request.getParameter("sheetUpdate");
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
String po_num1 = "";
String brand = "";
String delivery_date = "";
String confirm_date = "";
String inhouse_date = "";
String style = "";
int iRet = 0;
String Output = "";   
String Output2 = "";
String Output3 = "";
String size[] = null;
boolean once = true;
// for po details
String[] col = new String[5];
String[] qty1 = new String[6];
String[] qty2 = new String[6];
String[] qty3 = new String[6];
String[] qty4 = new String[6];
String[] qty5 = new String[6];
String[] qty6 = new String[6];
String[]  siztotal_qty = new String[6];
String[] size_default_options = {"前衣长/총기장","前中长/앞중심기장",
    "后中长/뒷중심기장","肩宽/어깨너비","领宽/목너비","前领深/앞목깊이","后领深/뒷목깊이",
    "1/2胸围/가슴","1/2腰围","1/2下摆/밑단  弯量", "夹圈", "", "", "", "", "", ""
};
String sql = "";
String[] value_first = {"","","","","","","","","","","","","","","","",""};
String[] value_second = {"","","","","","","","","","","","","","","","",""};
String[] value_third = {"","","","","","","","","","","","","","","","",""};
String[] value_fourth = {"","","","","","","","","","","","","","","","",""};
String[] value_fifth ={"","","","","","","","","","","","","","","","",""};
String[] value_sixth = {"","","","","","","","","","","","","","","","",""};
String[] value_size_name = {"","","","","","","","","","","","","","","","",""};
String value_comment = "";
String value_main_label = "";
String value_size_label = "";
String value_care_label = "";
String value_hanger_tape = "";
String value_hanger_tape_simple = "";
String value_price_tag = "";
String value_packing = "";
String file_to_choose = "";
try {
    Context ic = new InitialContext(); 
    matrix = new MatrixDataSet();
    dataProcess = new DataProcess();
    DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
    conn = ds.getConnection();
    if(sheetUpdate == null){
        sheetUpdate = "false";
        file_to_choose = "order_sheet_save.jsp";
    }
    if(sheetUpdate.equals("true")){
        file_to_choose = "order_sheet_update.jsp";
        sql = "select po_num, size_name, first, second, third, fourth, fifth, sixth from order_sheet_size where po_num='"+po_num+"';";
        iRet = dataProcess.RetrieveData(sql, matrix, conn);
        for(int i=0; i<iRet; i++){
            int k = 0;
            String tmp_po_num = matrix.getRowData(i).getData(k++);
            value_size_name[i] = matrix.getRowData(i).getData(k++);
            value_first[i] = matrix.getRowData(i).getData(k++);
            value_second[i] = matrix.getRowData(i).getData(k++);
            value_third[i] = matrix.getRowData(i).getData(k++);
            value_fourth[i] = matrix.getRowData(i).getData(k++);
            value_fifth[i] = matrix.getRowData(i).getData(k++);
            value_sixth[i] = matrix.getRowData(i).getData(k++);
        }
        sql = "select po_num, comment, main_label, size_label, care_label, "
                + "hanger_tape, price_tag, hanger_tape_simple, packing from order_sheet"
                + " where po_num = '"+po_num+"';";
        iRet = dataProcess.RetrieveData(sql, matrix, conn);
        int n = 0;
        String tmp_po_num = matrix.getRowData(0).getData(n++);
        value_comment = matrix.getRowData(0).getData(n++);
        value_main_label = matrix.getRowData(0).getData(n++);
        value_size_label = matrix.getRowData(0).getData(n++);
        value_care_label = matrix.getRowData(0).getData(n++);
        value_hanger_tape = matrix.getRowData(0).getData(n++);
        value_price_tag = matrix.getRowData(0).getData(n++);
        value_hanger_tape_simple = matrix.getRowData(0).getData(n++);
        value_packing = matrix.getRowData(0).getData(n++);        
    }
    
    sql = "select ORDER_NO, order_no, brand, delivery_date, confirm_date, style, sizc_1, sizc_2, sizc_3, sizc_4, sizc_5, sizc_6, total_qty, inhouse_date  from purchase_order where order_no='"+ po_num +"';";
    iRet = dataProcess.RetrieveData(sql, matrix, conn);

    int j = 1;
    po_num1 = matrix.getRowData(0).getData(j++);
    brand = matrix.getRowData(0).getData(j++);
    delivery_date = matrix.getRowData(0).getData(j++);
    confirm_date = matrix.getRowData(0).getData(j++);
    style = matrix.getRowData(0).getData(j++);
    String sizc_1 = matrix.getRowData(0).getData(j++);
    String sizc_2 = matrix.getRowData(0).getData(j++);
    String sizc_3 = matrix.getRowData(0).getData(j++);
    String sizc_4 = matrix.getRowData(0).getData(j++);
    String sizc_5 = matrix.getRowData(0).getData(j++);
    String sizc_6 = matrix.getRowData(0).getData(j++);
    String total_qty = matrix.getRowData(0).getData(j++);
    inhouse_date = matrix.getRowData(0).getData(j++);
    sql = " select  colour,total_qty,sqty_1,sqty_2,sqty_3,sqty_4,sqty_5,sqty_6 "
        + " from    purchase_order_line "
        + " where order_no = '"+po_num1+"'; "; 
    int tmp_iRet = dataProcess.RetrieveData(sql, matrix, conn);
    if ( tmp_iRet > 0 ) {            
        Output += "<table width='477px' ><tr>";
        Output +=  "<td class='blue_cell'>Colour</td>";
        Output2 += "<tr>";
        Output2 += "<td class='blue_cell' width='150px'>Size (Inch)</td>";
        if(!sizc_1.equals("")){
            Output +=  "<td class='blue_cell'>"+sizc_1+"</td>";
            Output2 += "<td class='blue_cell' width='60px'>"+sizc_1+"<input type='hidden' name='size_name_value[]' value='"+sizc_1+"'></td>";
        }
        if(!sizc_2.equals("")){
            Output +=  "<td class='blue_cell'>"+sizc_2+"</td>";
            Output2 +=  "<td class='blue_cell' width='60px'>"+sizc_2+"<input type='hidden' name='size_name_value[]' value='"+sizc_2+"'></td>";
        }
        if(!sizc_3.equals("")){
            Output +=  "<td class='blue_cell'>"+sizc_3+"</td>";
            Output2 +=  "<td class='blue_cell' width='60px'>"+sizc_3+"<input type='hidden' name='size_name_value[]' value='"+sizc_3+"'></td>";
        }
        if(!sizc_4.equals("")){
            Output +=  "<td class='blue_cell'>"+sizc_4+"</td>";
            Output2 +=  "<td class='blue_cell' width='60px'>"+sizc_4+"<input type='hidden' name='size_name_value[]' value='"+sizc_4+"'></td>";
        }
        if(!sizc_5.equals("")){
            Output +=  "<td class='blue_cell'>"+sizc_5+"</td>";
            Output2 +=  "<td class='blue_cell' width='60px'>"+sizc_5+"<input type='hidden' name='size_name_value[]' value='"+sizc_5+"'></td>";
        }
        if(!sizc_6.equals("")){
            Output +=  "<td class='blue_cell'>"+sizc_6+"</td>";
            Output2 +=  "<td class='blue_cell' width='60px'>"+sizc_6+"<input type='hidden' name='size_name_value[]' value='"+sizc_6+"'></td>";
        }
        Output2 += "<td class='blue_cell' width='60px'>P.P SPL</td><td class='blue_cell'>Production Comment</td>";
        Output2 += "</tr>";
        Output += "<td class='blue_cell'>Sub Total</td>";
        Output +=  "</tr>";
        String[] tmp_size_name = {};
        if(sheetUpdate.equals("true")){
            tmp_size_name = value_size_name;
        }
        else{
            tmp_size_name = size_default_options;
        }
        for(int i=0; i<tmp_size_name.length; i++){
            Output2 +=  "<tr>";
            Output2 += "<td><input style='width:140px' type='text' name='size_name[]' value='"+tmp_size_name[i]+"'></td>";
            if(!sizc_1.equals("")){
                Output2 += "<td><input size='4' type='text' name='first[]' value='"+value_first[i]+"' /></td>";
            }
            if(!sizc_2.equals("")){
                Output2 += "<td><input size='4' type='text' name='second[]' value='"+value_second[i]+"' /></td>";
            }
            if(!sizc_3.equals("")){
                Output2 += "<td><input size='4' type='text' name='third[]' value='"+value_third[i]+"' /></td>";
            }
            if(!sizc_4.equals("")){
                Output2 += "<td><input size='4' type='text'  name='fourth[]' value='"+value_fourth[i]+"' /></td>";
            }
            if(!sizc_5.equals("")){
                Output2 += "<td><input size='4' type='text' name='fifth[]' value='"+value_fifth[i]+"' /></td>";
            }
            if(!sizc_6.equals("")){
                Output2 += "<td><input type='text' name='sixth[]' value='"+value_sixth[i]+"' /></td>";
            }
            Output2 += "<td class='blue_cell'></td>";

            if(once){
                Output2 += "<td rowspan='14'><textarea id='order_comment' style='padding:0;' name='comment'>"+value_comment+"</textarea></td>";
                once = false;
            }
            Output2 +=  "</tr>";
        }

        for (int k = 0; k < tmp_iRet; k++) {
            int l = 0;
            col[k] = matrix.getRowData(k).getData(l++);
            siztotal_qty[k] = matrix.getRowData(k).getData(l++);
            qty1[k] = matrix.getRowData(k).getData(l++);
            qty2[k] = matrix.getRowData(k).getData(l++);
            qty3[k] = matrix.getRowData(k).getData(l++);
            qty4[k] = matrix.getRowData(k).getData(l++);
            qty5[k] = matrix.getRowData(k).getData(l++);
            qty6[k] = matrix.getRowData(k).getData(l++);

            Output += "<tr>";
            if(!col[k].equals("0"))
                Output += "  <td width='20%' height='16' >"+col[k]+"</td>";
            if(!sizc_1.equals(""))
                Output += "  <td width='11%' height='16' >"+qty1[k]+"</td>";
            if(!sizc_2.equals(""))
                Output += "  <td width='11%' height='16' >"+qty2[k]+"</td>";
            if(!sizc_3.equals(""))
                Output += "  <td width='11%' height='16' >"+qty3[k]+"</td>";
            if(!sizc_4.equals(""))
                Output += "  <td width='11%' height='16' >"+qty4[k]+"</td>";
            if(!sizc_5.equals(""))
                Output += "  <td width='11%' height='16' >"+qty5[k]+"</td>";
            if(!sizc_6.equals(""))
                Output += "  <td width='11%' height='16' >"+qty6[k]+"</td>";
            if(!siztotal_qty[k].equals("0"))
            Output += "  <td width='13%' height='16' >"+siztotal_qty[k]+"</td>";
            Output += "</tr>";
        }
        Output += "<tr><td>Total</td><td colspan ='4'>"+total_qty+"</td></tr>";            
        Output += "</table>";
      }        

    Output3 += "<tr>";
    Output3 += "<td>Main Label</td>";
    Output3 += "<td>Size Label</td>";
    Output3 += "<td>Care Label</td>";
    Output3 += "<td>Hanger Tape</td>";
    Output3 += "<td>Price Tag</td>";
    Output3 +=  "</tr>";
    Output3 += "<tr>";
    Output3 += "<td><textarea rows='4' cols='16' name='main_label'>"+value_main_label+"</textarea></td>";
    Output3 += "<td><textarea rows='4' cols='16' name='size_label'>"+value_size_label+"</textarea></td>";
    Output3 += "<td><textarea rows='4' cols='16' name='care_label'>"+value_care_label+"</textarea></td>";
    Output3 += "<td><textarea rows='4' cols='16' name='hanger_tape'>"+value_hanger_tape+"</textarea></td>";
    Output3 += "<td><textarea rows='4' cols='16' name='price_tag'>"+value_price_tag+"</textarea></td>";
    Output3 +=  "</tr>";
    //conn.commit();
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
%>
<HTML>
    <HEAD>
        <style>
            table{
                border-collapse:collapse;
            }
            tr, td{
                text-align: center;
                border:1px solid black;
                padding: 0;
            }
            input[type="text"]{
                padding: 0;               
                width:50px;
            }
            textarea#order_comment{
                width: 100%;
                height:100%;
                -webkit-box-sizing: border-box; /* <=iOS4, <= Android  2.3 */
                   -moz-box-sizing: border-box; /* FF1+ */
                        box-sizing: border-box; /* Chrome, IE8, Opera, Safari 5.1*/
            }
            .blue_cell{
                background-color: #63B8FF;
                font-weight: bold;
                padding: 3px;
            }
        </style>
    </HEAD>
    <BODY>
        <form name="form1" method="POST" action="<%= file_to_choose %>" accept-charset="UTF-8">
        <table width="800px">
            <tr>
                <td rowspan="2" width="450px" height="80px"><b style="font-size: 27px;">Order Sheet</b></td>
                <td width="60px" >担当</td>
                <td width="60px">组长</td>
                <td width="60px">室长</td>
                <td width="60px">管理部</td>
                <td width="60px">社长</td>
            </tr>
            <tr>
                <td height="60px"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
        <table width="800px">
            <tr style="border:0px;">
                <td style="border:0px;">
                    <table align="left">
                        <tr style="border:0px;">
                            <td style="border:0px;">
                                <table width="477px">
                                    <tr>
                                        <td width="130px" class="blue_cell">PO Number</td>
                                        <td><%= po_num1 %><input type="hidden" name="po_num" value="<%= po_num1 %>"/></td>
                                    </tr>
                                    <tr>
                                        <td class="blue_cell">Label</td>
                                        <td><%= brand %></td>
                                    </tr>
                                    <tr>
                                        <td class="blue_cell">Delivery</td>
                                        <td><%= delivery_date %></td>
                                    </tr>
                                    <tr>
                                        <td class="blue_cell">PO Date</td>
                                        <td><%= confirm_date %></td>
                                    </tr>
                                    <tr>
                                        <td class="blue_cell">In House Date</td>
                                        <td><%= inhouse_date %></td>
                                    </tr>
                                    <tr>
                                        <td class="blue_cell">PO Number</td>
                                        <td><%= po_num1 %></td>
                                    </tr>
                                    <tr>
                                        <td class="blue_cell">Hanger Tape</td>
                                        <td><input type="text" name="hanger_tape_simple" value="<%= value_hanger_tape_simple %>" /></td>
                                    </tr>
                                </table>
                                <table width="477px" border="1" cellspacing="0" cellpadding="0">
                                    <tr><td height="4px"></td></tr>
                                </table>    
                                <%= Output %>
                            </td>
                        </tr>
                    </table>
                    <table align="right" style="width: 323px;">
                        <tr>
                            <td colspan="2" class='blue_cell'>Picture</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <img height='231px' src='/images/<%=style.toLowerCase()%>.jpg'/>
                            </td>
                        </tr>
                        <tr>
                            <td class="blue_cell" width="100px">
                                Packing
                            </td>
                            <td>
                                <input style="width:150px" name="packing" type='text' value="<%= value_packing %>" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table border="1" cellspacing="0" cellpadding="0" width="800px">
            <%= Output2 %>
        </table>
        <table border="1" cellspacing="0" cellpadding="0" width="800px">
            <%= Output3 %>
        </table>
        <input type="submit" value="Submit">
        </form>
    </BODY>
</HTML>