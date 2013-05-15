<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="dbconn.*" %>

<%
String update_flag = request.getParameter("update_flag");
String atp_date    = request.getParameter("atp_date");
String po_no       = request.getParameter("po_no");
String atp_dlydate = request.getParameter("atp_dlydate");
String ship_type   = request.getParameter("ship_type");

String sql  = "";
String outS = "";
int    iRet =  0;

DBConnManager dbPool = null;
boolean connState = false;

dbPool = DBConnManager.getInstance();
Connection conn = dbPool.getConnection("intranet");

if ( conn == null) {
   connState = false;
} else {
   connState = true;
}

if ( ! connState ) {
    out.println("DB connection error!");
    return ;
}

if ( update_flag.equals("u"))
    sql = "update atp_01t " +
          "   set delivery_date = '" + atp_dlydate  + "', " +
          "       ship_type     = '" + ship_type + "', " +
          "       updated       = sysdate " +
          " where atp_date = '" + atp_date + "'" +
          "   and po_no  = '" + po_no + "'" ;
else if ( update_flag.equals("i"))
    sql = "insert into atp_01t(atp_date, po_no, delivery_date, ship_type, updated) values ( " +
          " to_char(sysdate, 'ddmmyy'), '" + po_no + "', '" + atp_dlydate + "', '" + ship_type + "', sysdate )";

//out.println(sql);
Statement stmt = conn.createStatement();
iRet = stmt.executeUpdate(sql);
if ( iRet > 0 ) {
   outS = "Updating successful." ; 
} else {
   outS = "Updating failed. Ask to I.T staff in ValleyGirl." ; 
}

outS += "<BR>\n<left><a href=\"atp_search.jsp\">View List</a>";

stmt.close();
dbPool.freeConnection("intranet", conn);
connState = false;
%>
<HTML>
<BODY>
<B>ATP Update</B>
<P>
<%=outS%>
</BODY>
</HTML>
