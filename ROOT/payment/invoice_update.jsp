<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="dbconn.*" %>
<%@page import="common.*" %>
<%@page import="common.util.*" %>
<jsp:useBean id="smart" scope="page" class="com.jspsmart.upload.SmartUpload" />
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
String path = application.getRealPath(_invoiceFileUrl) + java.io.File.separator;

// Initialization
smart.initialize(pageContext);
smart.upload();

//myUpload.init(config);
smart.service(request,response);

// Upload
//Enumeration e = smart.getRequest().getParameterNames();
String ag_buyer = smart.getRequest().getParameter("ag_buyer");
String ag_supplier = smart.getRequest().getParameter("ag_supplier");
String ag_po_no = request.getParameter("ag_po_no");

String filename = "";
com.jspsmart.upload.File upfile = smart.getFiles().getFile(0);

if(!upfile.isMissing()) {
   filename = upfile.getFileName();
   filename = ag_buyer + "_" + filename ;
   upfile.saveAs(path + filename);
}

if ( filename.length() > 50 ) {
   out.println( " Max invoice file Characters are 50. Try again After Confirming  number of invoice file Characters!");
   return;
}

String invoiceno = smart.getRequest().getParameter("invoice_no").trim();
String invoice_date = smart.getRequest().getParameter("invoice_date");
//String rcnt = smart.getRequest().getParameter("pcnt");
String status = "P"; // Invoice 생성
//int row = Integer.parseInt(rcnt);
String[] seq          =  smart.getRequest().getParameterValues("seq");
String[] check_pono   =  smart.getRequest().getParameterValues("check_pono");
String[] a_style_no   =  smart.getRequest().getParameterValues("a_style_no");
String[] a_qty        =  smart.getRequest().getParameterValues("a_qty");
String[] a_price      =  smart.getRequest().getParameterValues("a_price");
//String[] a_air_price  =  smart.getRequest().getParameterValues("a_air_price");
//String[] disc_price   =  smart.getRequest().getParameterValues("disc_price");

Statement stmt = null;
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
String sql  = "";
int iRet = 0;
String outS = "";

//SimpleDateFormat dd = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");   //import java.text.*
String update = DateUtil.getToday("yyyy.MM.dd HH:mm:ss");

try {

  matrix = new dbconn.MatrixDataSet();
  dataProcess = new DataProcess();
   Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  sql = " select count(*) from invoice_01t " +
        " where invoice_no =  '" + invoiceno + "'  " +
        "  and  sup_id     =  '" + ag_supplier + "' " +        
        "  and  buyer_id     =  '" + ag_buyer + "' " ;

  //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  int check_cnt= 0;

  if ( iRet > 0 ) {
    check_cnt   =  Integer.parseInt(matrix.getRowData(0).getData(0));
  }

  if (check_cnt > 0) {
    outS += "<tr><td><font color= red >Invoice생성이 실패 되었습니다! 이미 등록된 Invoice번호가 존재합니다. Invoice번호를 체크하시고 다시 생성해 주세요!</font><td><tr>"
              +  "<tr><td align=center><A HREF='./invoice_confirm_search.jsp'><b> 돌아가기 </b> </A></td><tr> "  ;
    throw new UserDefinedException("Invoice number duplication");
  }

  sql = "INSERT INTO invoice_01t( invoice_date, invoice_no, buyer_id,sup_id , file_name, status, updated ) " +
        " VALUES( " +
        " str_to_date( '"+invoice_date+"' , '%Y/%m/%d') ,"  +
        "upper('" + invoiceno   + "'),"  +
        "'" + ag_buyer        + "',"  +
        "'" + ag_supplier     + "',"  + 
        "upper('" + filename + "'), "  +
        "'" +  status   + "',"  + 
        "  sysdate() ) ";
  conn.setAutoCommit(false);
  stmt = conn.createStatement();
  iRet = stmt.executeUpdate(sql);
  stmt.close();
  
  if (iRet > 0) {
    System.out.println("Invoice_01t insert Sucess : Qeyry = " + update + " ==> " +sql ) ;
  } else {
    throw new UserDefinedException("Invoice_01t insert ERROR : Qeyry = " + update + " ==> " +sql ) ;
  }
  for (int i = 0; i < check_pono.length; i++) {
    sql =  " INSERT INTO invoice_02t ( invoice_no, seq, po_no , style_no , qty, price , sup_id, buyer_id, updated ) " +
           " VALUES( " +
           "upper('" + invoiceno + "') ,"  +
           "'"+ (i+1) + "',"  +
           "'" + check_pono[i]   + "',"  +
           "'" + a_style_no[i]   + "',"  +
           "'" + a_qty[i]   + "',"  +
           "'" + a_price[i]   + "',"  +
           "'" + ag_supplier        + "',"  +
           "'" + ag_buyer        + "',"  +  
           " sysdate() ) ";

    stmt = conn.createStatement();
    iRet = stmt.executeUpdate(sql);
    if (iRet > 0 ) {
      System.out.println("Invoice_02t insert Sucess : Qeyry = " + update + " ==> " +sql ) ;
    } else {
      throw new UserDefinedException("Invoice_02t insert ERROR : Qeyry = " + update + " ==> " +sql) ;
    }
    
    // update div_status
    sql = " update  purchase_order "
        + " set     order_status = '90' , "  // Invoice작성완료
        + "           payment_no = upper('" + invoiceno + "') ,"
        + "           updated = sysdate() " 
        + " where   order_no = '" + check_pono[i] + "' ";

    iRet = stmt.executeUpdate(sql);
    stmt.close();

    if (iRet != 1) {
      outS = "<td><font color= red >Sending invoice failed. Couldn't update the PO status.</font><td>";
      throw new UserDefinedException("po update ERROR : Qeyry = " + update + " ==> " +sql) ;
    }
  }

  outS += "<tr><td><font color=blue> Invoice번호 : " + invoiceno + " 으로 정상적으로 생성이 되었습니다. '완료' 버튼을 틀릭하세요! </font></td></tr> " +
               "<tr><td align=center ><A HREF='./invoice_search.jsp'><b> 완료 </b> </A></td></tr> " + 
              "<tr><td> <font color=red> Buyer에게 대금청구를 하려면 반드시 생성된 Invoice를 조회후 대금청구 처리를 해야 합니다.</font></td></tr>"  ;

   conn.commit();

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  System.out.println("Exception invoice_update : " + ue.getMessage());
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  System.out.println("Exception invoice_update, Date : " + update + ", Query ==> " + sql);
  throw e;
} finally {
  if (stmt != null) {
    try { stmt.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
  }
}
%>
<HTML>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language=JavaScript>
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
  <td width="*" class="left_title">Invoices생성 처리결과 메세지</td>
</tr>
<tr>
  <td width="100%" height="2" colspan="2"><hr width="100%"></td>
</tr>
<tr>
  <td width="100%" height="10" colspan="2"></td>
</tr>
</table>

<TABLE WIDTH=640 BORDER=0 CELLSPACING=0 CELLPADDING=0 align='center'>
	<FORM NAME=frmMain METHOD=POST enctype="multipart/form-data">
<input type='hidden' name='ag_buyer' value='<%= ag_buyer %>'>	
<input type='hidden' name='ag_supplier' value='<%= ag_supplier %>'>	
<FORM>
<TR>
<%=outS%>
</TR>
</TABLE>
<%
out.println(CopyRightLogo());
%>
</td></tr></table>
</BODY>
</HTML>
