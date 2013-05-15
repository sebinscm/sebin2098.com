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

int iCnt = 0;
int iRet = 0;
String sql = "";
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
Connection conn = null;
PreparedStatement pstmt = null;

HashMap params = new HashMap();               // for parameter
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
      params.put(name, item.getString());
    }
  }

  // database process
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  matrix = new MatrixDataSet();
  dataProcess = new DataProcess();
  
  // check shipment  
  invoice_no = (String) params.get("invoice_no");
  buyer_id = (String) params.get("buyer_id");

  sql = " select  confirm_status "
      + " from    shipment_01t "
      + " where   invoice_no = '" + invoice_no + "' "
      + " and     buyer_id = '" + buyer_id + "' ";

  iRet = dataProcess.RetrieveData(sql, matrix, conn);

  if (iRet < 1) {
    throw new UserDefinedException("Cannot find this shipment. Check your data.");
  }
  
  String confirmStatus = matrix.getRowData(0).getData(0);

  if (confirmStatus.equals("Y")) {
    throw new UserDefinedException("Cannot update this shipment. This shipment has been already confirmed. Check your data.");
  }

  // process attached files
  iter = items.iterator();

  while (iter.hasNext()) {
    FileItem item = (FileItem) iter.next();

    if (!item.isFormField()) {
      // process attached files
      String fieldName = item.getFieldName();
      String fileName = item.getName();

      // if filename is empty then skip
      if (fileName == null || fileName.equals("")) {
        continue;
      }

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

      String fileType = fieldName.substring(0, 2).toUpperCase();
      String realFileName = buyer_id + "_" + fileType + "_" + invoice_no + ext;
      File writeFile = new File(savePath + realFileName);

      if (writeFile.exists()) {
        writeFile.delete();
      }

      item.write(writeFile);
      params.put(fieldName, realFileName);
    }
  }

  // update shipment header info
  sql = " update  shipment_01t "
      + " set     shipping_port = ?, "
      + "         handover_date = str_to_date(?, '%Y/%m/%d'), "
      + "         shipping_type = ?, "
      + "         nominated_forwarder = ?, "
      + (params.get("bl_filename") != null ? " bl_filename = ?, " : "")
      + (params.get("iv_filename") != null ? " iv_filename = ?, " : "")
      + (params.get("pl_filename") != null ? " pl_filename = ?, " : "")
      + "         update_date = sysdate() "
      + " where   invoice_no = ? "
      + " and     buyer_id = ? ";
  //out.println((String) params.get("handover_date"));
  //if (true) return;
  int j = 0;
  conn.setAutoCommit(false);
  pstmt = conn.prepareStatement(sql);
  pstmt.setString(++j, (String) params.get("shipping_port"));
  pstmt.setString(++j, (String) params.get("handover_date"));
  pstmt.setString(++j, (String) params.get("shipping_type"));
  pstmt.setString(++j, (String) params.get("nominated_forwarder"));

  if(params.get("bl_filename") != null) {
    pstmt.setString(++j, (String) params.get("bl_filename"));
  }
  if(params.get("iv_filename") != null) {
    pstmt.setString(++j, (String) params.get("iv_filename"));
  }
  if(params.get("pl_filename") != null) {
    pstmt.setString(++j, (String) params.get("pl_filename"));
  }

  pstmt.setString(++j, invoice_no);
  pstmt.setString(++j, buyer_id);

  iCnt = pstmt.executeUpdate();
  pstmt.close();
  pstmt = null;

  if (iCnt != 1) {
    throw new UserDefinedException("Cannot update this shipment. Check your data.");
  }

  conn.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  strMsg = ue.getMessage();
  System.out.println("Exception shipment_header_update : " + ue.getMessage());
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  System.out.println("Exception shipment_header_update : " + e.getMessage());
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
String nextUrl = "./shipment_edit_form.jsp";

if (isSucceeded) {
  strMsg = "The data has been successfully processed.";
} else {
  strMsg = "The operation failed.\\n" + strMsg;
}
%>
<html>
<head>
</head>
<body>
<form name='form1' method='post'>
<input type='hidden' name='ag_month' value='<%= (String) params.get("ag_month") %>'>
<input type='hidden' name='ag_year' value='<%= (String) params.get("ag_year") %>'>
<input type='hidden' name='ag_invoice_no' value='<%= (String) params.get("ag_invoice_no") %>'>
<input type='hidden' name='ag_po_no' value='<%= (String) params.get("ag_po_no") %>'>
<input type='hidden' name='invoice_no' value='<%= invoice_no %>'>
<input type='hidden' name='buyer_id' value='<%= buyer_id %>'>
</form>
<script language='javascript'>
alert("<%= strMsg %>");
form1.action = '<%= nextUrl %>';
form1.submit();
</script>
</body>
</html>
