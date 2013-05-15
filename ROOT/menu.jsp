<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %> 
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String menus = "";

int iRet = 0;
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
String sql = "";

// for New Icon..
String OrderManagementMenu = "Order Management";
String POConformationMenu = "PO Confirmation";
String OrderAmendmentMenu = "Order Amendment";
String ServicesAndSupportMenu = "Services & Support";
String DocumentsMenu = "Documents";

int POConfirmationCnt = 0;
int OrderAmendmentCnt = 0;
int DocumentsCnt = 0;

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new dbconn.DataProcess();
  Context ic = new InitialContext(); 
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
	conn = ds.getConnection();
 /////////////////////////////////////////////////////////////////////////
  // For New Icon
  // count po conformation
  sql =  " select count(*) from purchase_order where backorder_flag = 'N' " 
           + " and order_status='43' and buyer = '"+scmid+"' " ;
  
  
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  if (iRet > 0) POConfirmationCnt = Integer.parseInt(matrix.getRowData(0).getData(0));
  
  // count po amendment
  
  sql = " select count(*) from purchase_order  "
         +  "  where backorder_flag = 'N'  "
         +  " and amend_date > sysdate()-7  "
         +  " and buyer = '"+scmid+"'  and order_status <>'999' " ;
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  if (iRet > 0) OrderAmendmentCnt = Integer.parseInt(matrix.getRowData(0).getData(0));

 
  // Count Documents
  sql = " select  count(*) "
      + " from    notice "
      + " where   create_date > sysdate()-7 ";
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  if (iRet > 0) DocumentsCnt = Integer.parseInt(matrix.getRowData(0).getData(0));
  /////////////////////////////////////////////////////////////////////////

  /////////////////////////////////////////////////////////////////////////
  // Read Menu List
  sql = " SELECT  M.PARENT_NO, M.MENUNAME, M.MENUURL, IFNULL(MC.CHILD_CNT, 0) "
      + " FROM    ( "
      + "           SELECT SEQNO, PARENT_NO, MENUNAME, MENUURL, SORT_NO "
      + "           FROM   MENU_T "
      + "           WHERE  MENU_TYPE =  'S' "
      + "           AND    USER_GROUP = '" + usergroup + "' "
      + "           ORDER BY SORT_NO "
      + "         ) M  LEFT OUTER JOIN "
      + "         ( "
      + "           SELECT M1.SEQNO, COUNT(M2.SEQNO) CHILD_CNT "
      + "           FROM   MENU_T M1 LEFT OUTER JOIN MENU_T M2 ON (M1.MENU_TYPE = 'S' AND   M1.SEQNO = M2.PARENT_NO ) "
      + "           WHERE  M1.USER_GROUP = '" + usergroup + "' "
      + "           AND      M1.PARENT_NO = 1 "
      + "           GROUP BY M1.SEQNO "
      + "          ) MC ON (M.SEQNO = MC.SEQNO )   " 
      + " ORDER BY M.SORT_NO ";
  //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  for (int i = 0; i < iRet; i++) {
    int j = 0;
    String newIcon = "";

    String parentNo   = matrix.getRowData(i).getData(j++);
    String menuName   = matrix.getRowData(i).getData(j++);
    String menuUrl    = matrix.getRowData(i).getData(j++);
    int childCnt      = Integer.parseInt(matrix.getRowData(i).getData(j++));

    if (parentNo.equals("1")) {

      if ( (OrderManagementMenu.equals(menuName) && POConfirmationCnt + OrderAmendmentCnt > 0)
          || (ServicesAndSupportMenu.equals(menuName) && DocumentsCnt > 0) ) {
        newIcon = "<img src='/img/ico_new.gif' border='0'>";
      }

      // Parent Menu??경우
      if (childCnt > 0) {
        menus += "aux1 = insFolder(rootTree, genFolder(\"" + newIcon + menuName + "\", \"" + menuUrl + "\"));\n";
      } else {
        menus += "insItem(rootTree, genItemIcon(\"tree_page.gif\", \"" + newIcon + menuName + "\", \"" + menuUrl + "\"));\n";
      }

    } else {
      if ( (POConformationMenu.equals(menuName) && POConfirmationCnt > 0)
          || (OrderAmendmentMenu.equals(menuName) && OrderAmendmentCnt > 0)
          || (DocumentsMenu.equals(menuName) && DocumentsCnt > 0) ) {
        newIcon = "<img src='/img/ico_new.gif' border='0'>";
      }
      
      menus += "insItem(aux1, genItemIcon(\"tree_page.gif\", \"" + newIcon + menuName + "\", \"" + menuUrl + "\"));\n";

    }

  }
  /////////////////////////////////////////////////////////////////////////

} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception in menu : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) {conn.close();}}
%>
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
    location.href = "./menu.jsp";
}
function delay()
{
    Time_ID = setTimeout("LoadLeave()",( 10 * 60 * 1000 ));
}
</script>
</head>

<body leftmargin="2" topmargin="10" marginwidth="0" marginheight="0" bgcolor="#F7F7F7" onload="delay()"> 
<!--body leftmargin="2" topmargin="10" marginwidth="0" marginheight="0" background="/img/bgimage2.gif" onload="delay()"-->
<script language=javascript>
rootTree = genFolderRoot("<img src='/img/tree_base.gif' border='0'> <b>HOME</b>", "memo/");
<%= menus %>
initializeDocument(rootTree);
</script>
<table width="100%" border="0" cellspacing="1" cellpadding="2" align="center" >
<tr>
  <td align="center" height="10"></td>
</tr>

<tr>
  <td align="center"><a href="http://www.sebin2098.com" target="_blank"><img src="/img/sebin_mid.jpg"></a></td>
  </tr>
<!--tr>
   <td align="center"><a href="http://get.adobe.com/reader/" target="_blank"><img src="/img/adobe_reader.png"></a></td>
</tr>
<tr>
  <td align="center" class="font_small"><font color="#0770FF" siz=2>Get Adobe Reader</font></td>

</tr>
<tr>
  <td align="center" class="font_small"><font color="#0770FF" siz=2>Get Adobe Reader</font></td>

</tr-->
 

</table>
</body>
</html>