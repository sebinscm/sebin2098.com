<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@page import="dbconn.*" %>
<%@ include file="../login_check.jsp" %>
<%

DBConnManager dbPool = null;
boolean connState = false;

dbPool = DBConnManager.getInstance();
Connection conn = dbPool.getConnection("intranet");
if ( conn == null) 
   connState = false ;
else
   connState = true ;

if ( ! connState ) {
    out.println("DB connection error!");
    return;
}

MatrixDataSet matrix = new dbconn.MatrixDataSet();
DataProcess dataProcess = new DataProcess();

try {
     Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
} catch (Exception e) {
}

//String url  = "jdbc:microsoft:sqlserver://10.2.1.5:1433/database=VG_DB";
String url  = "jdbc:microsoft:sqlserver://10.2.1.5:1433"; //VG-MAIN
String user = "intranet";
String pw   = "tetris";

String sql  = "";

boolean connState_vgmain = false;
Connection conn_vgmain = DriverManager.getConnection(url, user, pw);
if( conn_vgmain == null) {
    connState_vgmain = false;
} else {
    connState_vgmain = true;
}

if ( ! connState_vgmain ) {
    out.println("DB vgmain connection error!");
    return ;
}
String ag_pp_no   = request.getParameter("pp_no");

String ag_pono = request.getParameter("ag_pono");
String pp_no="&nbsp;";
String order_date="&nbsp;";
String buyer="&nbsp;";
String pgr="&nbsp;";
String sgr="&nbsp;";
String style_no="&nbsp;";
String spltm_text="&nbsp;";
String vg_qty="&nbsp;";
String del_date = "&nbsp;";
String trans_type = "&nbsp;";

String outS = "";
int    iRet1 = 0;
int    iRet2 = 0;

if ( ag_pp_no == null ) ag_pp_no = ag_pono;

if (! (ag_pp_no == null || ag_pp_no.length() < 1))  {
    
sql = " select top 1  " +
      "        pp_no,    " +
      "        isnull(order_date,space(8)), " +
      "        buyer,    " +
      "        pgr,    " +
      "        sgr,    " +
      "        style_no, " +
      "        spltm_text, " +
      "        sum(vg_qty), " +
      "        del_date1, " +
      "        trans_type01 " +
      "   from VG_PO_MAST    a WITH (NOLOCK) ," +
      "        VG_PO_DETAILS b WITH (NOLOCK)  " +
      "  where a.po_no = b.po_no " +
      "    and a.pp_no = '" + ag_pp_no + "'" +
      "    and a.status not in (0,6,10) " + // N,R,D 
      "  group by pp_no, " +
      "           order_date, " +
      "           buyer, " +
      "           pgr, " +
      "           sgr, " +
      "           style_no, " +
      "           spltm_text, " + 
      "           del_date1, " +
      "           trans_type01 " ;

//out.println(sql);
Statement stmt = conn_vgmain.createStatement();
ResultSet rs   = stmt.executeQuery(sql);

while( rs.next()) {
      iRet1 ++;
      pp_no     = rs.getString(1);
      order_date= rs.getString(2);
      buyer     = rs.getString(3);
      pgr       = rs.getString(4);
      sgr       = rs.getString(5);
      style_no  = rs.getString(6);
      spltm_text= rs.getString(7);
      vg_qty    = rs.getString(8);
      del_date  = rs.getString(9);
      trans_type= rs.getString(10);
      if ( trans_type.equals("1"))
         trans_type = "Sea";
      else if ( trans_type.equals("2"))
         trans_type = "Air";
      else if ( trans_type.equals("3"))
         trans_type = "Local";

}

rs.close();
stmt.close();

}

conn_vgmain.close();

String atp_dlydate  = "&nbsp;";
String ship_type    = "&nbsp;";
String var_today    = null;
String var_chk1     = "unchecked";
String var_chk2     = "unchecked";
String var_chk3     = "unchecked";
String atp_date     = null;
String update_flag  = "i";

String ag_chk1 = "";


sql = "select  " +
      "       delivery_date, " +
      "       ship_type, " +
      "       to_char(sysdate, 'ddmmyy') var_today, " +
      "       atp_date " +
      "  from ( select * " +
      "           from atp_01t  " +
      "          where po_no = '" + pp_no + "'" +
      "          order by substr(atp_date,5,2) || substr(atp_date,3,2) || substr(atp_date, 1,2) desc ) " +
      "  where rownum = 1 " ;

iRet2 = dataProcess.RetrieveData(sql, matrix, conn);

outS = "<tr><td align=left width=25" + "%" + " bgcolor=#6495ed>Req.Delivery Date(ddmmyy)</td><td colspan = 3 align=center>" + del_date + "</td></tr> " + 
       "<tr><td align=left width=25" + "%" + " bgcolor=#6495ed>Req.Trans        </td><td colspan = 3 align=center>" + trans_type + "</td></tr> " ; 

if (iRet2 > 0 ) {
      atp_dlydate  = matrix.getRowData(0).getData(0);
      ship_type = matrix.getRowData(0).getData(1);
      var_today = matrix.getRowData(0).getData(2);
      atp_date  = matrix.getRowData(0).getData(3);

      if (ship_type.equals("1"))
          var_chk1 = "checked";
      else if (ship_type.equals("2"))
          var_chk2 = "checked";
      else if (ship_type.equals("3"))
          var_chk3 = "checked";

}

outS += "<tr><td align=left width=25" + "%" + " bgcolor=#eee8aa>ATP.Delivery Date(ddmmyy)</td>" +
        "    <td align=center colspan = 3 ><input type=text name=atp_dlydate value=" + atp_dlydate + " size=6 maxlength=6></td></tr>" + 
        "<tr><td align=left width=25" + "%" + " bgcolor=#eee8aa>ATP.Trans        </td>" +
        "    <td align=center ><input type=radio name=ag_chk1 value=1 " + var_chk1 + ">Sea</td>" + 
        "    <td align=center ><input type=radio name=ag_chk1 value=2 " + var_chk2 + ">Air</td>" + 
        "    <td align=center ><input type=radio name=ag_chk1 value=3 " + var_chk3 + ">Local</td></tr>" ;

if (iRet1 > 0 ){
     outS +=  "<tr> <td colspan=4 align=center>" +
              "<input type=button value=Submit onclick=update(document.frmMain2)>" +
              //"<input type=button value=Cancel onclick=reset(document.frmMain2)>" +
              "</td></tr> "; 
}

if (atp_date != null && var_today != null && atp_date.equals(var_today))
    update_flag = "u";

//out.println(update_flag);
dbPool.freeConnection("intranet", conn);
connState = false;

%>

<HTML>
<HEAD>
<SCRIPT LANGUAGE=JavaScript>
function submit()
{
   frmMain.submit();
}

function update(form)
{
   check_select(form);
   form.action = "atp_update.jsp";
   form.submit();
}

function reset(form)
{
   frmMain2.reset();
}

function check_select(form)
{
    var check = false;
    for( var i=0; i < form.elements.length; i++ )
    {
        var e = form.elements[i];
        if( (e.type == 'radio') && e.checked )
        {
            check = true;
	    frmMain2.ship_type.value = e.value;
        }
    }
    return check;
}

function Back()
{
  history.back();
}


</SCRIPT>
</HEAD>
<BODY  bgcolor="f5f5f5">
<FORM NAME="frmMain" ACTION="atp_search.jsp" METHOD=POST>
<TABLE WIDTH=640>
<TR>
<TD align=center >&nbsp;</TD>
<TD align=center ><B>[  ATP(Available To Promise) Check ]</B></TD>
</TR>
</TABLE>
<TABLE WIDTH=640>
<TR>
<TD align=center >&nbsp;</TD>
</TR>
<TR>
<TD align=right >PO No.</TD>
<TD ALIGN=CENTER width=100>
<input type=text name=ag_pono>
</TD>
<TD>
<INPUT TYPE=BUTTON VALUE="Search" ONCLICK=submit()>
</TD></TR>
<TR>&nbsp;</TR>
</TABLE>
</FORM>

<B> Purchase Order Information. </B>
<TABLE border=1 width=640 CELLPADDING=0 CELLSPACING=0>
<TR><TD align=left width=25% bgcolor=6495ed>PO No.</TD><TD align=center ><%=pp_no%></TD></TR>
<TR><TD align=left width=25% bgcolor=6495ed>Order Date</TD><TD align=center ><%=order_date%></TD></TR>
<TR><TD align=left width=25% bgcolor=6495ed>Buyer</TD><TD align=center ><%=buyer%></TD></TR>
<TR><TD align=left width=25% bgcolor=6495ed>PGR</TD><TD align=center ><%=pgr%></TD></TR>
<TR><TD align=left width=25% bgcolor=#6495ed>SGR</TD><TD align=center ><%=sgr%></TD></TR>
<TR><TD align=left width=25% bgcolor=#6495ed>Group No.</TD><TD align=center ><%=style_no%></TD></TR>
<TR><TD align=left width=25% bgcolor=#6495ed>Item Text</TD><TD align=center ><%=spltm_text%></TD></TR>
<TR><TD align=left width=25% bgcolor=#6495ed>Total Qty</TD><TD align=center ><%=vg_qty%></TD></TR>
</TABLE>

<P>
<B> ATP Check</B>
<FORM NAME="frmMain2" METHOD=POST>
<input type=hidden name=atp_date value="<%=atp_date%>">
<input type=hidden name=po_no value="<%=pp_no%>">
<input type=hidden name=update_flag value="<%=update_flag%>">
<input type=hidden name=ship_type value="">
<TABLE border=1 width=640 CELLPADDING=0 CELLSPACING=0>
<%=outS%>
</TABLE>
<input type=button value="Back"  onclick="Back()">
</FORM>
</BODY>
</HTML>
