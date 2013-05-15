<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="common.*" %>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.mail.HtmlEmail" %>
<!--%@page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

// variables
boolean isSucceeded = false;
String strMsg = "";
String invoice_no =  "";
String buyer_id =  "";
String supplier_id =  "";
int iCnt = 0;
int iRet = 0;
String sql = "";
String sql2 = "";
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
Connection conn = null;
PreparedStatement pstmt = null;
PreparedStatement pstmt2 = null;
HashMap params = new HashMap();               // for parameter
List poNoList = new ArrayList();
List styleNoList = new ArrayList();
List seasonList = new ArrayList();
List transTypeList = new ArrayList();
List orderQtyList = new ArrayList();
List totalamtList = new ArrayList();
List unitpriceList = new ArrayList();
String savePath = application.getRealPath(_shipmentFileUrl) + File.separator;   // file path

// Jakarta Commons Project FileUpload
// -> http://jakarta.apache.org/commons/fileupload/
DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setRepository(new File(_uploadPath));                 // Set factory constraints
ServletFileUpload upload = new ServletFileUpload(factory);    // Create a new file upload handler
upload.setSizeMax(_maxFileSize);                              // Set overall request size constraint
List items = upload.parseRequest(request);                    // Parse the request

try {

  // Read items
  Iterator iter = items.iterator();

  while (iter.hasNext()) {
    FileItem item = (FileItem) iter.next();

    if (item.isFormField()) {
      // Process a regular form field
      String name = item.getFieldName();

      if (name.equals("po_no")) {
        poNoList.add(item.getString());
      } else if (name.equals("style_no")) {
        styleNoList.add(item.getString());
      } else if (name.equals("season")) {
        seasonList.add(item.getString());
      } else if (name.equals("trans_type")) {
        transTypeList.add(item.getString());
      } else if (name.equals("order_qty")) {
        orderQtyList.add(item.getString());
      } else if (name.equals("total_amount")) {
        totalamtList.add(item.getString());
       } else if (name.equals("unit_price")) {
        unitpriceList.add(item.getString());  
      } else {
        params.put(name, item.getString());
      }
    }
  }

  // check duplication
  invoice_no = (String) params.get("invoice_no");
  buyer_id = (String) params.get("buyer_id");
  supplier_id = (String) params.get("supplier_id");
  //out.println(buyer_id);
  //if (true) return;
  if (invoice_no == null || invoice_no.trim().equals("")) {
    throw new UserDefinedException("Invoice No is missing. Check your data.");
  }

  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();
  
  sql = " select  invoice_no "
      + " from    shipment_01t "
      + " where   invoice_no = '" + invoice_no + "' "
      + " and     buyer_id = '" + buyer_id + "' ";
  
  iRet = dataProcess.RetrieveData(sql, matrix, conn);
  
  if (iRet > 0) {
    throw new UserDefinedException("This shipment exists. There is the same invoice no(" + invoice_no + "). Check your data.");
  }

  // process attached files
  iter = items.iterator();

  while (iter.hasNext()) {
    FileItem item = (FileItem) iter.next();

    if (!item.isFormField()) {
      // process attached files
      String fieldName = item.getFieldName();
      String fileType = fieldName.substring(0, 2).toUpperCase();
      String fileName = item.getName();

      int pos = fileName.lastIndexOf("\\");
      if (pos < 0) fileName.lastIndexOf("/");

      String attachFileName = fileName.substring(pos+1);

      // check File Size
      if (item.getSize() == 0) {
        throw new UserDefinedException("Cannot process your file(" + attachFileName + "). The file size is zero. Check your file.");
      }

      String ext = "";
      pos = attachFileName.lastIndexOf(".");

      if (pos >= 0) {
        ext = attachFileName.substring(pos);
      }

      String realFileName = buyer_id + "_" + fileType + "_" + invoice_no + ext;
      File writeFile = new File(savePath + realFileName);

      if (writeFile.exists()) {
        writeFile.delete();
      }

      item.write(writeFile);
      params.put(fieldName, realFileName);
    }
  }

  // store shipment info
  // insert shipment header info
  sql = " insert into shipment_01t "
      + " ( "
      + "   invoice_no, supplier_id, issue_date, shipping_port, handover_date, "
      + "   shipping_type, nominated_forwarder, bl_filename, iv_filename, pl_filename, "
      + "   confirm_status, update_date,buyer_id, created_id "
      + " ) "
      + " values "
      + " ( "
      + "   ?, ?, str_to_date(?, '%Y/%m/%d'), ?, str_to_date(?, '%Y/%m/%d'), "
      + "   ?, ?, ?, ?, ?, "
      + "   'N', sysdate(), ?, ? "
      + " ) ";

  int j = 0;
  conn.setAutoCommit(false);
  pstmt = conn.prepareStatement(sql);
  pstmt.setString(++j, invoice_no);
  pstmt.setString(++j, (String) params.get("supplier_id"));
  pstmt.setString(++j, (String) params.get("issue_date"));
  pstmt.setString(++j, (String) params.get("shipping_port"));
  pstmt.setString(++j, (String) params.get("handover_date"));
  pstmt.setString(++j, (String) params.get("shipping_type"));
  pstmt.setString(++j, (String) params.get("nominated_forwarder"));
  pstmt.setString(++j, (String) params.get("bl_filename"));
  pstmt.setString(++j, (String) params.get("iv_filename"));
  pstmt.setString(++j, (String) params.get("pl_filename"));
  pstmt.setString(++j, (String) params.get("buyer_id"));
  pstmt.setString(++j, _adminid);
  //out.println(supplier_id);
  pstmt.executeUpdate();
  pstmt.close();
  pstmt = null;
  
  // insert shipment details info
  String[] poNoArray = (String[]) poNoList.toArray(new String[0]);
  String[] styleNoArray = (String[]) styleNoList.toArray(new String[0]);
  String[] seasonArray = (String[]) seasonList.toArray(new String[0]);
  String[] transTypeArray = (String[]) transTypeList.toArray(new String[0]);
  String[] orderQtyArray = (String[]) orderQtyList.toArray(new String[0]);
  String[] totalAmtArray = (String[]) totalamtList.toArray(new String[0]);

  sql = " insert into shipment_02t "
      + " ( "
      + "   po_no, style_no, invoice_no, supplier_id, season, "
      + "   trans_type, order_qty, total_amount, input_date, input_id,buyer_id "
      + " ) "
      + " values "
      + " ( "
      + "   ?, ?, ?, ?, ?, ?, ?, ?, sysdate(), ?, ? "
      + " ) ";

  pstmt = conn.prepareStatement(sql);
  
  for (int i = 0; i < poNoArray.length; i++) {
    j = 0;
    
    pstmt.setString(++j, poNoArray[i]);
    pstmt.setString(++j, styleNoArray[i]);
    pstmt.setString(++j, invoice_no);
    pstmt.setString(++j, supplier_id);
    pstmt.setString(++j, seasonArray[i]);
    pstmt.setString(++j, transTypeArray[i]);
    pstmt.setString(++j, orderQtyArray[i]);
    pstmt.setString(++j, totalAmtArray[i]);
    pstmt.setString(++j, _adminid);
    pstmt.setString(++j, buyer_id);    
    //out.println(poNoArray[i]);
    //out.println(styleNoArray[i]);
    //out.println(invoice_no);
    //out.println(supplier_id);
    //out.println(seasonArray[i]);
    //out.println( transTypeArray[i]);
    //out.println(orderQtyArray[i]);
    //out.println( totalAmtArray[i]);
    //out.println(supplier_id);
    //if (true) return;    
    
    pstmt.executeUpdate();   
   
    // PO status Update 73->75=ShipmemntÀÛ¼º
    sql2 = " update purchase_order set order_status = '75', shipment_no= '"+ invoice_no+"' "
            +  " where order_no = '"+poNoArray[i]+"' " 
            +  "     and buyer = '" + buyer_id + "' "
            + "      and supplier = '" + supplier_id + "' " ;
    pstmt2 = conn.prepareStatement(sql2);            
    pstmt2.executeUpdate(); 
    pstmt2.close();    
  }
  
  pstmt.close();
  pstmt = null;
  //if (true) return;  
  conn.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  strMsg = ue.getMessage();
  System.out.println("Exception shipment_issue_save : " + ue.getMessage());
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  System.out.println("Exception maintenance save : " + e.getMessage());
  throw e;
} finally {
  if (pstmt != null) {
    try { pstmt.close(); } catch (Exception e) {}
  }

  if (conn != null) {
    try { conn.setAutoCommit(true); } catch (Exception e) {}
    conn.close();
  }
}

// result message
String nextUrl = "";

if (isSucceeded) {
  strMsg = "The data has been successfully processed.";
  nextUrl = "./shipment_view.jsp";
} else {
  strMsg = "The operation failed.\\n" + strMsg;
  nextUrl = "./shipment_issue_list.jsp";
}
%>
<html>
<head>
</head>
<body>
<form name='form1' method='post'>
<%
if (isSucceeded) {
%>
<input type='hidden' name='invoice_no' value='<%= invoice_no %>'>
<input type='hidden' name='supplier_id' value='<%= supplier_id %>'>
<input type='hidden' name='buyer_id' value='<%= buyer_id %>'>
<%
} else {
%>
<input type='hidden' name='ag_from_date' value='<%= (String) params.get("ag_from_date") %>'>
<input type='hidden' name='ag_to_date' value='<%= (String) params.get("ag_to_date") %>'>
<input type='hidden' name='ag_po_no' value='<%= (String) params.get("ag_po_no") %>'>
<%
}
%>
</form>
<script language='javascript'>
alert("<%= strMsg %>");
form1.action = '<%= nextUrl %>';
form1.submit();
</script>
</body>
</html>
