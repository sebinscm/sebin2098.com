<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ page errorPage="../error.jsp" %>
<%@page import="dbconn.*" %>
<%@ include file="../bottom_line.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
 String file_name ="";
%>
<HTML>
<HEAD>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="vbscript" src="/common/board/board.vb"></script>
<SCRIPT LANGUAGE=JavaScript>
function ValidateLength(ElementName,DisplayName, MinLength)
{
  sValue=frmMain.elements(ElementName).value;

  if (sValue.length < MinLength )
  {
    alert(DisplayName + ' must be longer than ' + MinLength + ' characters.');
    bRetVal=false;
  }
  else
  {
    bRetVal=true;
  }

  return bRetVal;
}

function recv_window()
{
    url = "mail_address.jsp"
    window.open(url,"receiver","toolbar=no,menubar=no,resizable=yes, scrollbars=yes, width=500,height=600")
}

function send(form)
{
    if( ValidateFields())
    {
        if(frmMain.siba != null) {
            frmMain.contents.value = frmMain.siba.MIMEValue;
        }

        frmMain.action = "send_memo.jsp";
        frmMain.submit();
    }
}

function ValidateFields()
{
    bRetVal=false;

    if (ValidateReceiver("receiver"))
    {
        if (ValidateLength("title","Subject",1))
        {
            bRetVal=true;
        }
    }
    return bRetVal;
}

function ValidateReceiver(ElementName)
{
    sValue=frmMain.elements(ElementName).value;

    if (sValue == 'Click Add to select receiver' || sValue.length < 1)
    {
        alert("More than 1 receiver is required.");
        bRetVal=false;
    }
    else
    {
        bRetVal=true;
    }

    return bRetVal;
}
</SCRIPT>
</HEAD>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="840" border="0" cellspacing="0" cellpadding="0">
<tr><td>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15" colspan="2"></td>
</tr>
<tr>
  <td width="3%"><img src="/img/icon_ann.jpg"></td>
  <td width="*" class="left_title"> Create New Buyer Notice</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<TABLE width="700" border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<FORM NAME=frmMain METHOD=POST enctype="multipart/form-data">
<input type="hidden" name="contents" value="">
  <tr>
    <td width=100 class="table_header_center">To:</td>
    <td width=600 valign="BOTTOM" class="table_bg_bright">
      <input type="text" name="receiver" size="90" value="Click Add to select receiver" readonly onfocus="blur(this)">
      <INPUT TYPE=BUTTON VALUE=" Add " ONCLICK="javascript:recv_window()">
    </td>
  </tr>
  <tr>
    <td class="table_header_center">Title</td>
    <td class="table_bg_bright"><input type="text" name="title" size="90" maxlength=100></td>
  </tr>
  <tr>
    <td colspan=2 class="table_bg_bright">
      <object width=0 height=0 classid="clsid:5220cb21-c88d-11cf-b347-00aa00a28331">
      <param name="LPKPath" value="/common/board/NamoWe_valleygirl.lpk">
      </object>
      <object id="siba" width=700 height=500 classid="CLSID:898FD2A4-B75E-11d4-BFF3-0050FC1AFCDD" codebase="/common/board/NamoWe.cab#version=2,1,0,3">
      </object>
    </td>
  </tr>
  <tr><td width=100 class="table_header_center">Attachment </td>
    <td colspan=2 class="table_bg_bright"><input type="file" name= "file_name" size="100"></td>
  </tr>
</table>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15"></td>
</tr>
<tr>
  <td width="100%" align='center'>
    <INPUT TYPE=BUTTON VALUE='Submit' ONCLICK=JavaScript:send(document.frmMain)>
    <INPUT TYPE=BUTTON VALUE='Cancel' ONCLICK=JavaScript:this.form.reset();>
  </td>
</tr>
</FORM>
</table>
<%
out.println(CopyRightLogo());
%>
</BODY>
</HTML>
