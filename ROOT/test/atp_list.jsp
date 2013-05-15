<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@page import="dbconn.*" %>
<%@ include file="../login_check.jsp" %>

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

boolean connState = false;
Connection conn = DriverManager.getConnection(url, user, pw);
if( conn == null) {
    connState = false;
} else {
    connState = true;
}

if ( ! connState ) {
    out.println("DB connection error!");
    return ;
}

String ag_status = request.getParameter("ag_status");
String pr_date="";
String pp_no="";
String style_no="";
String status="";
String order_date="";
String buyer="";
String outS = "";
String orderby = request.getParameter("orderby");
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
      "            when status = 7 then 'pr'"  +
      "            when status = 3 then 'printed'"  +
      "            when status = 4 then 'completed'"  +
      "            when status = 5 then 'op'"  +
      "            when status = 6 then 'return'"  +
      "        end status,      " +
      "        isnull(substring(order_date,1,2)+'-'+substring(order_date,3,2)+'-'+substring(order_date,5,2),space(6)),  " +
      "        buyer " +
      "   from VG_PO_MAST WITH (NOLOCK) " +
      "  where supplier = '" + scmnm + "'" +
      "    and substring(order_date,3,4) = '" + today + "' " + 
      "    and status in (7,3,4,5,6) ";

if ( ag_status == null) ag_status = "0"; //new
if ( !ag_status.equals("0"))
    sql += " and status =  '" + ag_status + "'" ;
if ( orderby == null ) orderby = "0";
if ( !orderby.equals("0"))  {
   sql += " order by buyer ";
} else {
  sql += " order by order_date ";
}


Statement stmt = conn.createStatement();
ResultSet rs   = stmt.executeQuery(sql);

while( rs.next()) {
      iRet ++;
      pr_date   = rs.getString(1);
      pp_no     = rs.getString(2);
      style_no  = rs.getString(3);
      status    = rs.getString(4);
      order_date= rs.getString(5);
      buyer     = rs.getString(6);

      outS += "<tr> " +
              "<td align=center> " + iRet + " </td>" +
              "<td align=center> " + pr_date + " </td>" +
              "<td align=center><a href=\"atp_search.jsp?scmid="+
              scmid + "&pp_no= " + pp_no + "\">" + pp_no + "</td>" +
              "<td align=center> " + style_no + " </td>" +
              "<td align=center> " + status + " </td>" +
              "<td align=center> " + order_date + " </td>" +
              "<td align=center> " + buyer + " </td>" +
              "</tr>" ;
}
//out.println(orderby);
//out.println(sql);
rs.close();
stmt.close();
conn.close();
  
%>

<HTML>
<HEAD>
<SCRIPT LANGUAGE=JavaScript>
function submit()
{
   frmMain.submit();
}
</SCRIPT>
</HEAD>
<BODY bgcolor="f5f5f5">
<FORM ACTION="po_status.jsp" METHOD=POST>
<TABLE WIDTH=640>
<TR>
<TD>&nbsp;</TD>
<TD align=left ><B>[ Available To promise Check List ] </B></TD>
</TR>
<TABLE WIDTH=640>
<TR>
<TD>&nbsp;</TD>
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
<OPTION SELECTED>2005</OPTION>
<OPTION>2006</OPTION>
<OPTION>2007</OPTION>
</SELECT>
<TD align=right width=85 >PO Status</TD>
<TD ALIGN=CENTER width=130>
<SELECT NAME=ag_status >
<OPTION value="0"   <% if(ag_status == null || ag_status.equals("0"))  out.print("SELECTED");  %>> All </OPTION> 
<OPTION value="7"  <% if(ag_status != null && ag_status.equals("7")) out.print("SELECTED");  %>> pr </OPTION> 
<OPTION value="3"  <% if(ag_status != null && ag_status.equals("3")) out.print("SELECTED");  %>> printed </OPTION> 
<OPTION value="4"  <% if(ag_status != null && ag_status.equals("4")) out.print("SELECTED");  %>> completed </OPTION> 
<OPTION value="5"  <% if(ag_status != null && ag_status.equals("5")) out.print("SELECTED");  %>> op </OPTION> 
<OPTION value="6"  <% if(ag_status != null && ag_status.equals("6")) out.print("SELECTED");  %>> return </OPTION> 
</SELECT>
<TD align=right width=85 >Order by </TD>
<TD ALIGN=CENTER width=125>
<SELECT NAME=orderby >
<OPTION value="0"   <% if(orderby == null || orderby.equals("0"))  out.print("SELECTED");  %>> Order Date </OPTION>
<OPTION value="1"  <% if(orderby != null && orderby.equals("1")) out.print("SELECTED");  %>> Buyer </OPTION>
</SELECT></TD><TD>
<INPUT TYPE=BUTTON VALUE="Search" ONCLICK=submit()>
</TD></TR>
<TR>&nbsp;</TR>
</TABLE>
</FORM>
<TABLE border=1 width=640 CELLPADDING=0 CELLSPACING=0>
<TR>
<TD align=center bgcolor="6495ed" >No</TD>
<TD align=center bgcolor="6495ed" >PR Date</TD>
<TD align=center bgcolor="6495ed">PO No.</TD>
<TD align=center bgcolor="6495ed">Item No.</TD>
<TD align=center bgcolor="6495ed">PO Status</TD>
<TD align=center bgcolor="6495ed">PO Date</TD>
<TD align=center bgcolor="6495ed">Buyer</TD>
</TR>
<%= outS %>
</TABLE>
</BODY>
</HTML>
