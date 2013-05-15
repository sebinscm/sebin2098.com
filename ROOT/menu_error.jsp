<%@ include file="/login_check.jsp" %>
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
a:link {text-decoration: none ; color: #020468;}
a:visited {text-decoration: none ; color: #666666;}
a:active {text-decoration: underline ; color: #0770FF;}
a:hover {text-decoration: underline ; color: #0770FF;}
</style>
<script language=javascript src="/common/js/tree_win.js"></script>
<script language="javascript">
function LoadLeave()
{
    clearTimeout(Time_ID);
    location.href = "./menu_error.jsp";
}
function delay()
{
    Time_ID = setTimeout("LoadLeave()",( 10 * 60 * 1000 ));
}
</script>
</head>

<body leftmargin="2" topmargin="10" marginwidth="0" marginheight="0" bgcolor="#F7F7F7" onload="delay()">
<script language=javascript>
//페이지아이콘을 사용하지 않을 경우 genItemIcon() 대신 genItem()을 사용한다.
//각 항목의 아이콘은 tree_page.gif 대신에 images 폴더에 함께 제공되는 아이콘을 사용할 수 있다.
//이미지 경로와 타겟 프레임은 tree.js 파일 안에서 수정한다.

rootTree = genFolderRoot("<img src='/img/tree_base.gif' border='0'> <b>HOME</b>", "memo/");
insItem(rootTree, genItemIcon("tree_page.gif", "How to use?", "umanual/Manual.htm"));
initializeDocument(rootTree);
</script>
<table width="100%" border="0" cellspacing="1" cellpadding="2" align="center">
<tr>
  <td width="100%" align="center" class="location"><b><hr>You have an unread memorandum.
    <br><br>Please click the Read Confirm after you read the memorandum and
    log-in again to use the SCM properly.<hr></b></td>
</tr>
<tr>
  <td align="center" height="10"></td>
</tr>
<tr>
  <td align="center"><a href="http://www.adobe.com/products/acrobat/readstep2.html" target="_blank"><img src="/img/getacro.gif"></a></td>
</tr>
<tr>
  <td align="center" class="font_small">PDF Viewer Download</td>
</tr>
</table>
</body>
</html>