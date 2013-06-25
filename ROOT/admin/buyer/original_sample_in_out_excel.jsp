<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Content-Disposition", "attachment; filename=Original_Sample_In_Out.xls;");
response.setHeader("Content-Description", "JSP Generated Data");

String searchItemClass = request.getParameter("searchItemClass");
String searchFromDate = request.getParameter("searchFromDate");
String searchToDate = request.getParameter("searchToDate");
String searchSupplier = request.getParameter("searchSupplier");
String searchItemGroup = request.getParameter("searchItemGroup");
String searchBuyer = request.getParameter("searchBuyer");
String searchSampleNo = request.getParameter("searchSampleNo");
String searchStatus = request.getParameter("statusOptions");
String searchStyleNo = request.getParameter("searchStyleNo");
String withImage = request.getParameter("withImage");

int iRet = 0;
String outS = "";
String sql = "";
if (searchStatus == null) searchStatus = "";
if (searchSampleNo == null) { 
    searchSampleNo = "";
} else {
	searchSampleNo = searchSampleNo.trim();
}	    
if (searchStyleNo == null) { 
    searchStyleNo = "";
} else {
	searchStyleNo = searchStyleNo.trim();
}	   
Connection conn = null;
MatrixDataSet matrix = null;
DataProcess dataProcess = null;

// set query
sql =  " select  a.sequence_no, a.sample_no, a.item_class,date_format(a.input_date, '%Y/%m/%d'), "
        + "         a.item_group, a.qty, a.season, upper(a.buyer), a.supplier,  "
        + "         date_format(a.sending_date, '%Y/%m/%d'), date_format(a.return_date, '%Y/%m/%d'), "
        + "         ifnull(a.remarks,' '), a.style_no, a.status, b.code_name "
        + " from    VG_SAMPLE_IN_OUT a, VG_COMMON_CODE b " 
        + "         where a.status=b.code and b.type='ORDER_STATUS' ";    

if (searchStyleNo.equals("")) {
	if (searchSampleNo.equals("")) {
			  sql += " and a.input_date between str_to_date('" + searchFromDate + "', '%Y/%m/%d') "
			               + "         and  str_to_date('" + searchToDate + "', '%Y/%m/%d') ";
			
			  if (!searchSupplier.equals("")) {
			    sql += " and    a.supplier = '" + searchSupplier + "' ";
			  }
			  
			  if (!searchItemGroup.equals("")) {
			    sql += " and    a.item_group = '" + searchItemGroup + "' ";
			  }
			
			  if (!searchBuyer.equals("")) {
			    sql += " and    upper(a.buyer) = '" + searchBuyer + "' ";
			  }
	} else {  
	  sql += " and a.sample_no like upper('%" + searchSampleNo+ "%')";
	}
} else {
	 sql += "  and a.style_no like upper('%" + searchStyleNo+ "%')";
}	
if (!searchItemClass.equals("")) {
  sql += " and    a.item_class = " + searchItemClass;
}
 if (!searchStatus.equals("")) {
      sql  += " and   status = '" + searchStatus + "' ";
  
  } 

sql += " order by str_to_date(a.input_date, '%Y/%m/%d') desc, a.sample_no desc ";
out.println(sql);

try {

  dataProcess = new DataProcess();
  matrix = new MatrixDataSet();
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();

  //out.println(sql);
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  //conn.commit();

} catch (Exception e) {
  if (conn != null) {
    try { conn.rollback(); } catch (Exception ex) {}
  }

  System.out.println("Exception /admin/buyer/original_sample_in_out_excel.jsp : " + e.getMessage());
  throw e;
} finally {
  if (conn != null) { 
    conn.close();
  }
}

// print out history list
for (int i = 0; i < iRet; i++) {
  int j = 0;
  String sequenceNo     = matrix.getRowData(i).getData(j++);
  String sampleNo       = matrix.getRowData(i).getData(j++);    
  String item_class     = matrix.getRowData(i).getData(j++);
  //String itemClassNm    = matrix.getRowData(i).getData(j++);
  String inputDate      = matrix.getRowData(i).getData(j++);
  String item_group     = matrix.getRowData(i).getData(j++);
  //String itemGroupNm    = matrix.getRowData(i).getData(j++);
  String qty            = matrix.getRowData(i).getData(j++);
  String season          = matrix.getRowData(i).getData(j++);
  //String placeNm        = matrix.getRowData(i).getData(j++);
  String buyer          = matrix.getRowData(i).getData(j++);
  String supplier       = matrix.getRowData(i).getData(j++);
  //String supplierNm     = matrix.getRowData(i).getData(j++);
  String sendingDate    = matrix.getRowData(i).getData(j++);
  String returnDate     = matrix.getRowData(i).getData(j++);
  String remarks        = matrix.getRowData(i).getData(j++);
  String styleNo        = matrix.getRowData(i).getData(j++);
  String order_status        = matrix.getRowData(i).getData(j++);
  String status_name        = matrix.getRowData(i).getData(j++);
  // set image
  String imgUrl = "";
  if (returnDate.equals("0000/00/00") ) returnDate ="";
  if (withImage.equals("Y")) {
    File imgFile = new File(application.getRealPath(_sampleIamgeUrl) + File.separator + sampleNo + ".jpg");
    
    if (imgFile.exists()) {        
      String tmp_imgUrl = "<img src='http://" + request.getServerName() + _sampleIamgeUrl + "/" + sampleNo.toLowerCase() + ".jpg' width='33' height='51'>";
      imgUrl = tmp_imgUrl;
    }
  }

   outS += "<tr align='center'  height='53' >"
        + " <td align='left'>" + sampleNo + "</td>"
        + " <td>" + inputDate + "</td>"
        + " <td>" + item_class + "</td>"
//      + " <td align='left'>" + item_group + "</td>"
        + " <td>" + item_group + "</td>"
        + " <td>" + qty + "</td>"
        + " <td>" + season + "</td>"
        + " <td align='left'>" + buyer + "</td>"
        + " <td align='left'>" + supplier + "</td>"
        + " <td align='left'>" + status_name + "</td>"
        + " <td>" + sendingDate + "</td>"
        + " <td>" + returnDate + "</td>"
//        + " <td align='left'>" + remarks + "</td>"
        + " <td>" + styleNo + "</td>"
        + (withImage.equals("Y") ? "<td>" + imgUrl + "</td>" : "")    
        + "</tr>";   
}
%>
<html>
<head>
</head>
<body>
<table width="1500" border="1" cellspacing="0" cellpadding="0">
<tr align='center'>
  <td>Sample No</td>
  <td>Date</td>
  <td>PGR</td>
  <!--td>Group Name</td-->
  <td>SGR</td>
  <td>Qty</td>
  <td>Season</td>
  <td>Buyer ID</td>
  <td>Supplier ID</td>
  <td>Status</td>
  <td>Sending Date</td>
  <td>Receiving Date</td>
  <!--td width='14%'>Remarks</td-->
  <td>Style No</td>
  <%
if (withImage.equals("Y")) {
%>
  <td>Image</td>
<%
}
%>
</tr>
<%= outS %>
</table>
</body>
</html>