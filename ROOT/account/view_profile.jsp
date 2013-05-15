<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="dbconn.*" %>
<%@page import="java.text.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@ page errorPage="../error.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/login_check.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
SimpleDateFormat dd = new SimpleDateFormat("yyyyMMdd");
String sdate = dd.format(new java.util.Date());
String id      = "";
String pw      = "";
String name    = "";
String email   = "";
String phone1  = "";
String phone2  = "";
String fax     = "";
String contact = "";
String addr1   = "";
String addr2   = "";
String postcode= "";
String surburb = "";
String state   = "";
String country   = "";

int iRet = 0;
int iRet2 = 0;
String outS = "";
String outS02 = "";
String sql = "";
String sql2 = "";

Connection conn = null;
MatrixDataSet matrix = null;
MatrixDataSet matrix2 = null;
DataProcess dataProcess = null;

try {

  matrix = new dbconn.MatrixDataSet();
  matrix2 = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
 
  // Read profile info
  sql = "select id," +
        "       passwd," +
        "       trim(name),"+
        "       email,"+
        "       phone1,"+
        "       phone2,"+
        "       fax,"+
        "       contact,"+
        "       addr1,"+
        "       addr2,"+
        "       postcode,"+
        "       surburb,"+
        "       state, country "+
        "  from login_01t " +
        " where id = '" + scmid + "'" ;
  // get country base code
  sql2 = " select  code, code_name "
      + " from    vg_common_code "
      + " where   type = 'COUNTRY_CODE' "
      + " order by sort_order asc";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  iRet2 = dataProcess.RetrieveData(sql2, matrix2, conn);

} catch (Exception e) {
  System.out.println("Exception /account/index : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}	
}

if (iRet > 0) {
  int j = 0;
  id      = matrix.getRowData(0).getData(j++);
  pw      = matrix.getRowData(0).getData(j++);
  name    = matrix.getRowData(0).getData(j++);
  email   = matrix.getRowData(0).getData(j++);
  phone1  = matrix.getRowData(0).getData(j++);
  phone2  = matrix.getRowData(0).getData(j++);
  fax     = matrix.getRowData(0).getData(j++);
  contact = matrix.getRowData(0).getData(j++);
  addr1   = matrix.getRowData(0).getData(j++);
  addr2   = matrix.getRowData(0).getData(j++);
  postcode= matrix.getRowData(0).getData(j++);
  surburb = matrix.getRowData(0).getData(j++);
  state   = matrix.getRowData(0).getData(j++);
  country   = matrix.getRowData(0).getData(j++);
}

 for (int i = 0; i < iRet2; i++) {
    String countryCode  = matrix2.getRowData(i).getData(0);
    String countryName  = matrix2.getRowData(i).getData(1);
     outS02  += "<option value=\"" + countryCode + "\"";    
    if ( country.equals(countryCode) ) {
       outS02  += " SELECTED ";  
    }
    outS02  += ">" + countryName+ "</option>";
  }
%>
<HTML>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language=JavaScript>
function Submit()
{
  var yn
  yn = confirm(" Are you sure to update your profile ?  ");
  
  if ( yn == true ) {
    frmMain.method = "POST";
    frmMain.action = "buyer_profile_update.jsp";
    frmMain.submit();
  }
}

function pwchange()
{
  frmMain.action = "../initpass.jsp";
  frmMain.submit();
}

function Back()
{
  history.back();
}
</script>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="840" border="0" cellspacing="0" cellpadding="0">
<tr><td>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/title_icon.gif"></td>
  <td width="*" class="left_title">Buyer Profile</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<table width="90%" border="0" cellspacing="0" cellpadding="0" align='center'>
<TR>
  <td width=100%><font color=red>Note) *Buyer ID cannot be changed.</font></td>
</TR>
</table>

<TABLE cellSpacing=1 cellPadding=2 width="90%" border=0 align='center' class="table_bg">
<FORM NAME="frmMain" METHOD="POST" ACTION="profile_update.jsp">
<TBODY>
  <TR>
    <TD ALIGN=CENTER bgcolor=#ccccff>*Buyer ID</TD>
    <TD ALIGN=left class="table_bg_bright"><input readonly type=text name=id value=<%=id%> > </TD>
  </TR>
  <TR>
    <TD ALIGN=CENTER bgcolor=#ccccff>Buyer Name</TD>
    <TD ALIGN=left class="table_bg_bright"><textarea readonly style="overflow:hidden" NAME=name rows=1 cols=40><%=name%></textarea></TD>
  </TR>
  <TR>
    <TD ALIGN=CENTER bgcolor="#F4F2AE">Email</TD>
    <TD ALIGN=LEFT class="table_bg_bright"><textarea  style="overflow:hidden"  NAME=email rows=1 cols=30><%=email%></textarea></TD>
  </TR>
  <TR>
    <TD ALIGN=CENTER bgcolor="#F4F2AE">Phone</TD>
    <TD ALIGN=LEFT class="table_bg_bright"><textarea  style="overflow:hidden" NAME=phone1 rows=1 cols=30 ><%=phone1%></textarea></TD>
  </TR>
  <TR>
    <TD ALIGN=CENTER bgcolor="#F4F2AE">Mobile Phone</TD>
    <TD ALIGN=LEFT class="table_bg_bright"><textarea  style="overflow:hidden" NAME=phone2 rows=1 cols=30><%=phone2%></textarea> </TD>
  </TR>
  <TR>
    <TD ALIGN=CENTER bgcolor="#F4F2AE">Fax</TD>
    <TD ALIGN=LEFT class="table_bg_bright"><textarea  style="overflow:hidden" NAME=fax rows=1 cols=30 ><%=fax%></textarea></TD>
  </TR>
  <TR>
    <TD ALIGN=CENTER bgcolor="#F4F2AE">Contact Name</TD>
    <TD ALIGN=LEFT class="table_bg_bright"><textarea  style="overflow:hidden" NAME=contact  rows=1 cols=30><%=contact%></textarea></TD>
  </TR>
  <TR>
    <TD ALIGN=CENTER bgcolor="#F4F2AE">Address1</TD>
    <TD ALIGN=LEFT class="table_bg_bright"><textarea  style="overflow:hidden" NAME=addr1   rows=1 cols=30><%=addr1%></textarea></TD>
  </TR>
  <TR>
    <TD ALIGN=CENTER bgcolor="#F4F2AE">Address2</TD>
    <TD ALIGN=LEFT class="table_bg_bright"><textarea  style="overflow:hidden" NAME=addr2   rows=1 cols=30 ><%=addr2%></textarea></TD>
  </TR>
  <TR>
    <TD ALIGN=CENTER bgcolor="#F4F2AE">Post Code</TD>
    <TD ALIGN=LEFT class="table_bg_bright"><textarea  style="overflow:hidden" NAME=postcode  rows=1 cols=30><%=postcode%></textarea></TD>
  </TR>
  <TR>
    <TD ALIGN=CENTER bgcolor="#F4F2AE">Surburb</TD>
    <TD ALIGN=LEFT class="table_bg_bright"><textarea  style="overflow:hidden" NAME=surburb  rows=1 cols=30 ><%=surburb%></textarea></TD>
  </TR>
  <TR>
    <TD ALIGN=CENTER bgcolor="#F4F2AE">State</TD>
    <TD ALIGN=LEFT class="table_bg_bright"><input type=text NAME=state value=<%=state%>></TD>
  </TR>
  <TR>
    <TD ALIGN=CENTER bgcolor="#F4F2AE">Country</TD>
    <TD ALIGN=LEFT class="table_bg_bright"><SELECT NAME=country><%=outS02%></SELECT></TD>
  </TR>
</TABLE>

<table border="0" cellspacing="0" cellpadding="0" align='center'>
<tr>
  <td width="100%" height="15"></td>
</tr>
<tr>
  <td width="100%" height="15">
    <INPUT TYPE=BUTTON VALUE=" Update " ONCLICK="Submit()">
    <INPUT TYPE=BUTTON VALUE="Password change" ONCLICK="pwchange()">
  </td>
</tr>
</FORM>
</table>

<%
out.println(CopyRightLogo());
%>

</td></tr></table>
</BODY>
</HTML>
