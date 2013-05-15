<%@ include file="/login_check.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="/img/bgimage1.gif">
<table width="100%" height="25" border="0" cellpadding="0" cellspacing="0" bgcolor="white" >	

<TR bgcolor=#F0F388>
	<td width=77% align='left'><font size=2 face="Century Gothic" >&nbsp;&nbsp; Welcome to Buyer Site</font></td> 	
	<td width=13% height="17" align="right" class="help_top_menu"><a href="/terms.html" target="_bottom" ><font size=2 face="Century Gothic" >Terms & Condition | </font></a></font></td>
  <td width=5% height="17" align="right" class="help_top_menu"><a href="/disclaimer.html" target="_bottom" ><font size=2 face="Century Gothic" >Disclamier</font></a></font>&nbsp;&nbsp;</td>
  <td width=5% height="17" align="right" class="help_top_menu"><a href="./logout.jsp" target="_top"><img src="/img/logout.gif"><font size=2 face="Century Gothic">Logout &nbsp;&nbsp;&nbsp;</a></font></td>  	
</TR> 
</table>	
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <!--td valign="top" width="100%" background="/img/bgimage.gif"-->
	  <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <!--td width="206"  height="70" rowspan="2"><a href="/memo/" target="main"><img src="/img/bgimg4.gif"></a></td-->
          <td width="452" ><font size=4 face="Century Gothic" color="Yellow"> &nbsp;&nbsp;&nbsp;&nbsp;
            <a href='/index2.jsp' style="text-decoration:none;color=yellow" target="_top">Supply Chain Management</a> </font><br>
          	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color="white" face="Century Gothic" size=2> &copy;Copyright 2011 Sebin Trading Enterprise Co,.Ltd</font></td>
          <td valign="top">
		    <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--tr>
                <td height="17" align="right" class="help_top_menu">
                 <a href="./logout.jsp" target="_top"><img src="/img/logout.gif"><font size=2 face="Century Gothic" color="White">Logout</font></a></td>
                <td width="10"></td>
              </tr-->
              <tr>
                <td height="30" align="right"></td>
                <td width="10"></td>
              </tr>
              <tr>
                <td height="17" align="right" valign="bottom" class="help_top_menu"><font size=2 face="Century Gothic" color="White">BUYER:&nbsp;&nbsp;<%= scmnm %> [<%= scmid %>]</font></td>
                <td width="10"></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="13" background="/img/line.gif"></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
