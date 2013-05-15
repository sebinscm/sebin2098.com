<%@ page import="java.sql.*" %>
<%@ page import="dbconn.*" %>
<%@page import="common.util.*" %>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

String outS = "";
int iRet = 0;
int iRet2 = 0;
int iRet3 = 0;
Connection connPronto = null;
dbconn.DBConnManager dbPool = null;
dbconn.MatrixDataSet matrix = null;
dbconn.MatrixDataSet matrix2 = null;
dbconn.MatrixDataSet matrix3 = null;
dbconn.DataProcess dataProcess = null;
String sql = "";

String searchBarcode = request.getParameter("searchBarcode");
if (searchBarcode == null) searchBarcode = "";
else searchBarcode = searchBarcode.trim();

String today = DateUtil.getToday("dd/MM/yyyy");
String itemGroup = "";
String itemClass = "";
String season = "";
String style_no = "";
String itemText = "";
String price = "";
String receiptText = "";
String classDesc = "";
String supplierId = "";
String supplierName = "";
String size = "";
String color = "";
String po_no = "";
String inspectorName = "";
String recDate = "";
String brandName = "";
String buyerComments = "";
String buyerInspectStatus = "";
boolean isEditable = false;
boolean isConfirmed = false;
String inspectorOptions = "";

// set query
sql = " select  a.stock_group, "
    + "         b.sht_class, "
    + "         substr(a.stock_code, 7, 4), "
    + "         substr(a.stock_code, 1, 6), "
    + "         a.stk_desc_line_2, "
    + "         round(c.wholesale_price*1.1, 2), "
    + "         a.stk_description, "
    + "         b.shm_description, "
    + "         d.cre_accountcode, "
    + "         e.cr_shortname, "
    + "         f.sys_description, "
    + "         g.sys_description, "
    + "         ( "
    + "           select  max(xspo_po_order_no) "
    + "           from    xstpu22 "
    + "           where   backorder_flag = ' ' "
    + "           and     xspo_style = substr(a.stock_code, 1, 6) "
    + "           and     season_and_seq = substr(a.stock_code, 7, 4) "
    + "         ), "
    + "         g.shm_description "
    + " from    stk5mf1 a "
    + "         left outer join "
    + "         ( "
    + "           select z.stock_group, z.sht_class, y.shm_description "
    + "           from   stkhierachymst0 y "
    + "                  inner join stkhiertree3 z "
    + "                    on y.shm_code = z.sht_class "
    + "                    and y.shm_type = 4 "
    + "         ) b "
    + "           on a.stock_group = b.stock_group "
    + "         left outer join stk5prc c "
    + "           on a.stock_code = c.stock_code "
    + "         left outer join stk5supt d "
    + "           on a.stock_code = d.stock_code "
    + "         left outer join cre5mfi e "
    + "           on d.cre_accountcode = e.cre_accountcode "
    + "         left outer join sys5tbl5 f "
    + "           on substr(a.stock_code, 14) = f.sys_tbl_code "
    + "           and f.sys_tbl_type = 'CF' "
    + "         left outer join sys5tbl5 g "
    + "           on substr(a.stock_code, 11, 3) = g.sys_tbl_code "
    + "           and g.sys_tbl_type = 'CO' "
    + "         left outer join "
    + "         ( "
    + "           select z.stock_group, y.shm_description "
    + "           from   stkhierachymst0 y "
    + "                  inner join stkhiertree3 z "
    + "                    on y.shm_code = z.sht_category "
    + "                    and y.shm_type = 3 "
    + "         ) g "
    + "           on a.stock_group = g.stock_group "
    + " where   a.stk_apn_number = '" + searchBarcode + "' ";
//out.println(sql);

// Data query ..
if (searchBarcode.length() > 0) {
  try {
  
    matrix = new dbconn.MatrixDataSet();
    dataProcess = new dbconn.DataProcess();
    dbPool = DBConnManager.getInstance();
    connPronto = dbPool.getConnection("pronto");
  
    iRet = dataProcess.RetrieveData(sql, matrix, connPronto);
    
    // read item info
    if (iRet > 0) {
      int j = 0;
      isEditable = true;
      itemGroup = matrix.getRowData(0).getData(j++);
      itemClass = matrix.getRowData(0).getData(j++);
      season = matrix.getRowData(0).getData(j++);
      style_no = matrix.getRowData(0).getData(j++);
      itemText = matrix.getRowData(0).getData(j++);
      price = matrix.getRowData(0).getData(j++);
      receiptText = matrix.getRowData(0).getData(j++);
      classDesc = matrix.getRowData(0).getData(j++);
      supplierId = matrix.getRowData(0).getData(j++);
      supplierName = matrix.getRowData(0).getData(j++);
      size = matrix.getRowData(0).getData(j++);
      color = matrix.getRowData(0).getData(j++);
      po_no = matrix.getRowData(0).getData(j++);
      brandName = matrix.getRowData(0).getData(j++);

      // read buyer comments
      sql = " select  decode(buyer_inspect_status, '0', 'A', '1', 'P', '2', 'R', '3', 'H', '4', 'N', buyer_inspect_status), "
          + "         buyer_comments "
          + " from    po_style_etc@scm "
          + " where   po_no = '" + po_no + "' ";

      iRet = dataProcess.RetrieveData(sql, matrix, connPronto);

      if (iRet > 0) {
        j = 0;
        buyerInspectStatus = matrix.getRowData(0).getData(j++);
        buyerComments = matrix.getRowData(0).getData(j++);
      }

      // read qc master info from aps
      sql = " select  a.rec_date, nvl(b.code_desc, a.ffb_inspector) "
          + " from    buying.vg_qc_master@aps a "
          + "         left outer join buying.vg_qc_code@aps b "
          + "           on a.ffb_inspector = b.code "
          + "           and b.div = 'IP' "
          + " where   a.po_no = '" + po_no + "' "
          + " and     a.final_decision is not null ";
  
      matrix2 = new dbconn.MatrixDataSet();
      iRet2 = dataProcess.RetrieveData(sql, matrix2, connPronto);

      // set qc info
      if (iRet2 > 0) {
        j = 0;
        isConfirmed = true;
        recDate = matrix2.getRowData(0).getData(j++);
        inspectorName = matrix2.getRowData(0).getData(j++);

        if (recDate.length() > 0) {
          recDate = recDate.substring(6) + "/" + recDate.substring(4, 6) + "/" + recDate.substring(0, 4);
        }
      }

      if (!isConfirmed) {
        // read inspector list from aps
        sql = " select  code, code_desc "
            + " from    buying.vg_qc_code@aps "
            + " where   div = 'IP' "
            + " and     on_duty = 'Y' "
            + " order by code_desc ";
    
        matrix3 = new dbconn.MatrixDataSet();
        iRet3 = dataProcess.RetrieveData(sql, matrix3, connPronto);

        // set inspector options
        inspectorOptions = "<select name='ffb_inspector'><option></option>";

        for (int i = 0; i < iRet3; i++) {
          j = 0;
          String code = matrix3.getRowData(i).getData(j++);
          String codeDesc = matrix3.getRowData(i).getData(j++);
        
          inspectorOptions += "<option value='" + code + "'>" + codeDesc + "</option>";
        }
        
        inspectorOptions += "</select>";
      }
    }

  } catch (Exception e) {
    System.out.println("Exception in pda : " + e.getMessage());
    throw e;
  } finally {
    if (connPronto != null) {
      try { connPronto.commit(); } catch (Exception ex) {}
      DataProcess tmpDataProcess = new dbconn.DataProcess();
      tmpDataProcess.ManipulateData("alter session close database link aps", connPronto);
      dbPool.freeConnection("pronto", connPronto);
    }
  }
}
%>
<html>
<head>
<style type='text/css'>
body, td, p, br
{font-family: "Verdana", "Arial", "Helvetica"; font-size: 10px; color: #000000; line-height:18px;}
input, select, textarea, form, option
{font-family: "Verdana", "Arial", "Helvetica"; font-size: 10px; color: #000000;}
body {
  background-color : #F5F5F5;
	scrollbar-face-color: #F8F8F8;
	scrollbar-shadow-color:#B3B3B3;
	scrollbar-highlight-color:#B3B3B3;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #DDDDDD;
	scrollbar-arrow-color: #8B9EA6;
}

img {border:none;}

a:link {text-decoration: underline ; color: #363891;}
a:visited {text-decoration: underline ; color: #7E49AF;}
a:active {text-decoration: underline ; color: #5A92E4;}
a:hover {text-decoration: underline ; color: #5A92E4;}

.table_bg {	background-color: #C0C0C0;}
.table_bg_bright { background-color: #F4F5F0;}
.table_bg_bright_center { background-color: #F4F5F0;text-align: center;}
.table_header { height: 20px; background-color: #E6E6FA;}
.table_header_right { height: 20px; background-color: #E6E6FA; text-align: right;}
.table_header_center { height: 20px; background-color: #E6E6FA;	text-align: center;}
</style>
<script language='javascript'>
function fnSearch(frm) {
  if (!frm.searchBarcode.value) {
    alert('Input Barcode.');
    frm.searchBarcode.focus();
    return;
  }

  frm.action = './pda2.jsp';
  frm.submit();
}

<%
if (isEditable && !isConfirmed) {
%>
function fnConfirm(frm) {
  if (!frm.po_no.value) {
    alert('There is no correct item information. Search item using barcode.');
    frm.searchBarcode.focus();
    return;
  }

  if (!frm.ffb_inspector.value) {
    alert('Choose inspector.');
    frm.ffb_inspector.focus();
    return;
  }
  
  if (confirm('Do you want to confirm this information?')) {
    frm.action = './pda2_save.jsp';
    frm.submit();
  }
}
<%
}
%>
</script>
</head>
<body leftmargin='2' topmargin='2' marginwidth='0' marginheight='0' onload='document.form1.searchBarcode.focus();'>
<table width='100%' border='0' cellspacing='1' cellpadding='0' align='center' class='table_bg'>
<form name='form1' method='post'>
<tr>
  <td width='20%' class='table_header_center'>Barcode</td>
  <td width='80%' colspan='2' class='table_bg_bright'><%= searchBarcode %>
    <input type='text' name='searchBarcode' size='8' maxlength='8'>
    <input type='button' value='Search' onclick='fnSearch(this.form);'></td>
</tr>
</form>
<form name='form2' method='post'>
<input type='hidden' name='barcode' value='<%= searchBarcode %>'>
<input type='hidden' name='po_no' value='<%= po_no %>'>
<tr>
  <td class='table_header_center'>Inspector</td>
  <td class='table_bg_bright' colspan='2'><%= isEditable ? (isConfirmed ? inspectorName : inspectorOptions) : "" %>
    <%= isEditable ? "<br>" + (isConfirmed ? "<b>Already confirmed</b>" : "<input type='button' value='Confirm' onclick='fnConfirm(this.form);'>") : "" %></td>
</tr>
<tr>
  <td class='table_header_center'>Brand</td>
  <td class='table_bg_bright' colspan='2'><%= brandName %></td>
</tr>
<tr>
  <td class='table_header_center'>Status</td>
  <td class='table_bg_bright' colspan='2'><%= buyerInspectStatus %></td>
</tr>
<tr>
  <td class='table_header_center'>Buyer Comments</td>
  <td class='table_bg_bright' colspan='2'><%= buyerComments %></td>
</tr>
<tr>
  <td class='table_header_center'>Supplier</td>
  <td class='table_bg_bright' colspan='2'><%= supplierId %>&nbsp;<%= supplierName %></td>
</tr>
<tr>
  <td width='20%' class='table_header_center'>Season</td>
  <td width='40%' class='table_bg_bright'><%= season %></td>
  <td width='40%' class='table_bg_bright' rowspan='4'><img src='/image/<%= style_no %>.jpg' width='82' height='102' border=0></td>
</tr>
<tr>
  <td width='20%' class='table_header_center'>PO/Style</td>
  <td width='40%' class='table_bg_bright' colspan=''><%= po_no %> / <%= style_no %></td>
</tr>
<tr>
  <td class='table_header_center'>Color/Size</td>
  <td class='table_bg_bright'><%= color %> / <%= size %></td>
</tr>
<tr>
  <td class='table_header_center'>RRP</td>
  <td class='table_bg_bright'><%= price %></td>
</tr>
</form>
</table>

</body>
</html>