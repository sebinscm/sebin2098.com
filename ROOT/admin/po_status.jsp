<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@page import="dbconn.*" %>
<%@ page errorPage="../error.jsp" %>
<%@ include file="../login_check.jsp" %>
<%@ include file="../bottom_line.jsp" %>
<%@ include file="../admin_option.jsp" %>
<%


try {
     Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
} catch (Exception e) {
}

//String url  = "jdbc:microsoft:sqlserver://10.2.1.5:1433/database=VG_DB";
String url  = "jdbc:microsoft:sqlserver://10.2.1.5:1433"; //VG-MAIN
String user = "intranet";
String pw   = "tetris";

String sql  = "";

boolean vgmain_connState = false;
Connection vgmain_conn = DriverManager.getConnection(url, user, pw);
if( vgmain_conn == null) {
    vgmain_connState = false;
} else {
    vgmain_connState = true;
}

if ( ! vgmain_connState ) {
    out.println("DB connection error!");
    return ;
}
String supplier = request.getParameter("supplier");

String ag_status = request.getParameter("ag_status");
String pr_date="";
String pp_no="";
String style_no="";
String status="";
String order_date="";
String sc_date="";
String buyer="";
String delivery="";
String outS = "";
String orderby = request.getParameter("orderby");
String brand = request.getParameter("brand");
String ag_pono     = request.getParameter("ag_pono");
String ag_style_no = request.getParameter("ag_style_no");

int    iRet = 0;

String year = request.getParameter("year");
String month = "";
String day = "";
if( year != null && year.length() > 3 ) {
        month = request.getParameter("month");
      
} else {
        SimpleDateFormat dd = new SimpleDateFormat("d");
        day = dd.format(new java.util.Date());
        dd = new SimpleDateFormat("M");
        month = dd.format(new java.util.Date());
        dd = new SimpleDateFormat("yyyy");
        year = dd.format(new java.util.Date());
}

if ( month.length() == 1 ) month = "0" + month;
    
String today =  month + year.substring(2,4) ;

sql = " select isnull(substring(pr_date,1,2)+'-'+substring(pr_date,3,2)+'-'+substring(pr_date,5,2),space(6)),  " +
      "        pp_no,    " +
      "        style_no, " +
      "        case      " +
      "            when status = 7 then 'PO Request'"  +
      "            when status = 3 then 'Processing'"  +
      "            when status = 2 then 'S.Confirmed'"  +
      "            when status = 5 then 'Completed'"  +
      "            when status = 6 then 'Return'"  +
      "        end status,      " +
      "        isnull(substring(order_date,1,2)+'-'+substring(order_date,3,2)+'-'+substring(order_date,5,2),space(6)),  " +
      "        isnull(substring(del_date1,1,2)+'-'+substring(del_date1,3,2)+'-'+substring(del_date1,5,2),space(6)), " +
      "        buyer , " +
      "        isnull(substring(sc_date,1,2)+'-'+substring(sc_date,3,2)+'-'+substring(sc_date,5,2),space(6)) " +
      "   from VG_PO_MAST WITH (NOLOCK) " +
      "  where supplier = '" + supplier + "'" +
      "    and status in (7,3,2,5,6) ";

if ( !(ag_pono == null || ag_pono.length() < 1)) 
   sql += "    and pp_no    like '" + ag_pono + "%'     " ;

if ( !(ag_style_no == null || ag_style_no.length() < 1)) {
    sql += "    and style_no like '" + ag_style_no + "%' " ;
}else {
   if ( (ag_pono == null || ag_pono.length() < 1)) {
     sql +=       "    and substring(order_date,3,4) = '" + today + "'" ;
   }
}

if ( ag_status == null) ag_status = "0"; //new
if ( !ag_status.equals("0"))
    sql += " and status =  '" + ag_status + "'" ;

if ( brand == null ) brand = "2";
if ( brand.equals("2") ) {
     sql += " and origin = 2 " ;
} else {
     sql += " and origin = 1 " ;
}

if ( orderby == null ) orderby = "0";
if ( orderby.equals("0"))  {
   sql += " order by pr_date ";
}
if ( orderby.equals("1"))  {
   sql += " order by buyer ";
}
if ( orderby.equals("2"))  {
   sql += " order by pp_no ";
}
if ( orderby.equals("3"))  {
   sql += " order by del_date1";
}

String po_link = "";
Statement stmt = vgmain_conn.createStatement();
ResultSet rs   = stmt.executeQuery(sql);
String color_code ="";
int color_count = 0;
while( rs.next()) {
      iRet ++;
      pr_date   = rs.getString(1);
      pp_no     = rs.getString(2);
      style_no  = rs.getString(3);
      status    = rs.getString(4);
      order_date= rs.getString(5);
      buyer     = rs.getString(7);
      delivery  = rs.getString(6); 
      sc_date   = rs.getString(8);
      if( color_count > 0 ) {
                        color_code = "#EEEEE0";
                        color_count = 0;
                }else {
                        color_code = "#FFFFF0";
                        color_count = 1;
                }

      if ( pp_no.equals("0")) {
           pp_no = "N/A";
           po_link =  "<td align=center> " + pp_no + " </td>" ;
      }else{
            po_link =  "<td align=center><a href=\"../order/po_detail.jsp?scmid="+scmid + "&pp_no= " + pp_no + "\">" + pp_no + "</td>" ;
      }       
      outS += "<tr bgcolor=" + color_code + ">" +
              "<td align=center> " + iRet + " </td>" +
              "<td align=center> " + pr_date + " </td>" +
              "<td align=center> " + sc_date + " </td>" +
              po_link +
              "<td align=center> " + style_no + " </td>" +
              "<td align=center> " + status + " </td>" +
              "<td align=center> " + order_date + " </td>" +
              "<td align=center> " + delivery + " </td>" +
              "<td align=center> " + buyer + " </td>" +
              "</tr>" ;
}
//out.println(orderby);
//out.println(sql);
rs.close();
stmt.close();
vgmain_conn.close();
  
%>

<HTML>
<META content="text/html; charset=UTF-8" http-equiv=Content-Type>
<link rel="stylesheet" type = "text/css" href="style.css">
<HEAD>
<SCRIPT LANGUAGE=JavaScript>
function submit()
{
   frmMain.submit();
}
</SCRIPT>
</HEAD>
<BODY bgcolor="f5f5f5">
<left>
<FORM ACTION="po_status.jsp" METHOD=POST>
<TABLE cellSpacing=0 cellPadding=0 width="433"  background="../img/Inner_bg.gif" border=0>
<TBODY> <TR>
<TD vAlign=bottom align=right>
<TABLE cellSpacing=0 cellPadding=5 width="433" border=0>
<TBODY>
<TR>
<TD class=smalltextyel>&nbsp;</TD></TR>
<TR> <TD class=headingtext><font color=white size=4><b>[ADMIN]Purchase Order History</b></font></TD></TR></TBODY></TABLE></TD>
<TD><IMG height=77 alt=Consulting src="../img/header.jpg" ></TD></TR></TBODY>
</TABLE>
<TABLE WIDTH=640>
<TR>
<TD>&nbsp;</TD>
</TR>
<TR>
<TD align=left width=85 > Supplier </TD>
<TD ALIGN=CENTER width=200>
<SELECT NAME=supplier>
<%= opt %>
</SELECT>
</TR>
<TR>
<TD align=right width=85 >PO Date</TD>
<TD ALIGN=CENTER width=125>
<SELECT NAME=month>
<OPTION <% if(month.equals("01")) out.print("SELECTED"); %>>01</OPTION>
<OPTION <% if(month.equals("02")) out.print("SELECTED"); %>>02</OPTION>
<OPTION <% if(month.equals("03")) out.print("SELECTED"); %>>03</OPTION>
<OPTION <% if(month.equals("04")) out.print("SELECTED"); %>>04</OPTION>
<OPTION <% if(month.equals("05")) out.print("SELECTED"); %>>05</OPTION>
<OPTION <% if(month.equals("06")) out.print("SELECTED"); %>>06</OPTION>
<OPTION <% if(month.equals("07")) out.print("SELECTED"); %>>07</OPTION>
<OPTION <% if(month.equals("08")) out.print("SELECTED"); %>>08</OPTION>
<OPTION <% if(month.equals("09")) out.print("SELECTED"); %>>09</OPTION>
<OPTION <% if(month.equals("10")) out.print("SELECTED"); %>>10</OPTION>
<OPTION <% if(month.equals("11")) out.print("SELECTED"); %>>11</OPTION>
<OPTION <% if(month.equals("12")) out.print("SELECTED"); %>>12</OPTION>
</SELECT>
<SELECT NAME=year>
<OPTION>2004</OPTION>
<OPTION>2005</OPTION>
<OPTION SELECTED>2006</OPTION>
<OPTION>2007</OPTION>
</SELECT>
<TD align=right width=85 >PO Status</TD>
<TD ALIGN=CENTER width=130>
<SELECT NAME=ag_status >
<OPTION value="0"   <% if(ag_status == null || ag_status.equals("0"))  out.print("SELECTED");  %>> All </OPTION> 
<OPTION value="7"  <% if(ag_status != null && ag_status.equals("7")) out.print("SELECTED");  %>> PO Request </OPTION>
<OPTION value="2"  <% if(ag_status != null && ag_status.equals("2")) out.print("SELECTED");  %>> S.Confirmed </OPTION>    
<OPTION value="3"  <% if(ag_status != null && ag_status.equals("3")) out.print("SELECTED");  %>> Processing </OPTION> 
<OPTION value="5"  <% if(ag_status != null && ag_status.equals("5")) out.print("SELECTED");  %>> Completed </OPTION> 
<OPTION value="6"  <% if(ag_status != null && ag_status.equals("6")) out.print("SELECTED");  %>> Return </OPTION> 
</SELECT>
<TD align=right width=85 >Order by </TD>
<TD ALIGN=CENTER width=125>
<SELECT NAME=orderby >
<OPTION value="0"   <% if(orderby == null || orderby.equals("0"))  out.print("SELECTED");  %>> PR Date </OPTION>
<OPTION value="1"  <% if(orderby != null && orderby.equals("1")) out.print("SELECTED");  %>> Buyer </OPTION>
<OPTION value="2"  <% if(orderby != null && orderby.equals("2")) out.print("SELECTED");  %>> PO No. </OPTION>
<OPTION value="3"  <% if(orderby != null && orderby.equals("3")) out.print("SELECTED");  %>> Delivery Date </OPTION>
</SELECT></TD>
</TABLE>
<TABLE>
<TR>
<TD align=right width=50 >Brand</TD>
<TD ALIGN=CENTER width=80>
<SELECT NAME=brand>
<OPTION value="2"   <% if(brand == null || orderby.equals("2"))  out.print("SELECTED");  %>> Valleygirl </OPTION>
<OPTION value="1"  <% if(brand != null && brand.equals("1")) out.print("SELECTED");  %>> TEMT </OPTION>
</SELECT></TD>
<TD align=right width=50>PO#</TD>
<TD ALIGN=center  width=50><input type=text name=ag_pono></TD>
<TD align=right width=50>Style#.</TD>
<TD ALIGN=center width=50><input type=text name=ag_style_no></TD>
<TD><INPUT TYPE=BUTTON VALUE="Search" ONCLICK=submit()>
</TD></TR>
<TR>&nbsp;</TR>
</TABLE>
</FORM>
<TABLE border=1 width=640 CELLPADDING=0 CELLSPACING=0>
<TR>
<TD align=center bgcolor="e6e6fa" >No</TD>
<TD align=center bgcolor="e6e6fa" >PR Date</TD>
<TD align=center bgcolor="e6e6fa" >Confirmed</TD>
<TD align=center bgcolor="e6e6fa">PO No.</TD>
<TD align=center bgcolor="e6e6fa">Item No.</TD>
<TD align=center bgcolor="e6e6fa">PO Status</TD>
<TD align=center bgcolor="e6e6fa">PO Date</TD>
<TD align=center bgcolor="e6e6fa">Delivery</TD>
<TD align=center bgcolor="e6e6fa">Buyer</TD>
</TR>
<%= outS %>
</TABLE>
<%
out.println(CopyRightLogo());
%>

</BODY>
</HTML>
