<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="common.*" %>
<%@page import="dbconn.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<!--%@ page errorPage="/error.jsp" %-->
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%
HashMap params = new HashMap();               // parameter 저장 임시 변수
String savePath = application.getRealPath(_invoiceFileUrl) + File.separator;   // file path
String buyer_no="";
// Jakarta Commons 프로젝트의 FileUpload 모듈을 사용함.
// -> http://jakarta.apache.org/commons/fileupload/
DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setRepository(new File(_uploadPath));                 // Set factory constraints
ServletFileUpload upload = new ServletFileUpload(factory);    // Create a new file upload handler
upload.setSizeMax(_maxFileSize);                              // Set overall request size constraint
List items = upload.parseRequest(request);                    // Parse the request

// Process the uploaded items
Iterator iter = items.iterator();

while (iter.hasNext()) {

  FileItem item = (FileItem) iter.next();

  if (item.isFormField()) {
    // Process a regular form field    
    params.put(item.getFieldName(), item.getString());    
    if (item.getFieldName().equals("ag_buyer") )  buyer_no =item.getString() ; 
    
  } else {

    // Process a file upload
    String fieldName = item.getFieldName();
    String fileName = item.getName();
    long sizeInBytes = item.getSize();

    // File Size가 0인 경우 무시함.
    if (sizeInBytes == 0) {
      continue;
    }

    int pos = fileName.lastIndexOf("\\");
    if (pos < 0) fileName.lastIndexOf("/");

    String attachFileName = fileName.substring(pos+1);
    String attachRealFileName =  buyer_no + "_" + attachFileName;
    String name = "";
    String ext = "";
    int i = 0;

    // save as a temp file for transaction reason
    File writeFile = new File(savePath + attachRealFileName + ".tmp");
    if (writeFile.exists()) writeFile.delete();

/*
    pos = attachRealFileName.lastIndexOf(".");
    if (pos < 0) {
      name = attachRealFileName;
    } else {
      name = attachRealFileName.substring(0, pos);
      ext = attachRealFileName.substring(pos);
    }

    while(writeFile.exists())
    {
      attachRealFileName = name + "[" + (i++) + "]" + ext;
      writeFile = new File(savePath + attachRealFileName);
    }
*/
    // File 정보 저장
    item.write(writeFile);
    params.put(fieldName, attachRealFileName);

  }

} // end of while

// Database 처리
// Parameter Setting
String ag_supplier = (String) params.get("ag_supplier");
String chk_status = (String) params.get("chk_status");
String ag_buyer = (String) params.get("ag_buyer");
String ag_supplier_type = (String) params.get("ag_supplier_type");
String ag_month = (String) params.get("ag_month");
String ag_year = (String) params.get("ag_year");
String ag_search_inv_no = (String) params.get("ag_search_inv_no");
String inv_no = (String) params.get("inv_no");
String sup_id = (String) params.get("sup_id");
String buyer_id = (String) params.get("buyer_id");
String new_invoice_file = (String) params.get("new_invoice_file");
//out.println(chk_status);
//if (true) return;
String sql = "";
boolean isSucceeded = false;
String strMsg = "";
Connection conn = null;
PreparedStatement pstmt = null;

int iCnt = 0;
String nextUrl = "";

try {

  // check invoice file
  if (new_invoice_file == null) {
    throw new UserDefinedException("The new invoice file is invalid.");
  }
  
  // update invoice info
  Context ic = new InitialContext(); 
  DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/scm"); 		
  conn = ds.getConnection();
  conn.setAutoCommit(false);

  sql = " update  invoice_01t "
      + " set     file_name = ?, "
      + "         updated = sysdate() "
      + " where   invoice_no = ? "
     + "  and      buyer_id = ? "
      + " and     sup_id = ? ";
  
  int j = 0;
  pstmt = conn.prepareStatement(sql);
  pstmt.setString(++j, new_invoice_file);
  pstmt.setString(++j, inv_no);
  pstmt.setString(++j, buyer_id);
  pstmt.setString(++j, sup_id);
  //out.println(ag_buyer);
  //out.println(ag_supplier);
  // out.println(buyer_id);
  //  out.println(sup_id);
  // out.println(sql);
  // if (true) return;
  pstmt.executeUpdate();

  // new invoice file save
  File newInvoiceFile = new File(savePath + new_invoice_file);
  File tmpInvoiceFile = new File(savePath + new_invoice_file + ".tmp");
  if (newInvoiceFile.exists()) newInvoiceFile.delete();
  tmpInvoiceFile.renameTo(newInvoiceFile);

  conn.commit();
  isSucceeded = true;

} catch (UserDefinedException ue) {
  try { conn.rollback(); } catch (Exception ex) {}

  strMsg = ue.getMessage();
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  System.out.println("Exception invoice_edit_update : " + e.getMessage());
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
if (isSucceeded) {
  strMsg = "The data are successfully processed.";
} else {
  strMsg = "The operation failed.\\n" + strMsg;
}

// set Next Url
//nextUrl = "./invoice_edit_form.jsp";
nextUrl = request.getHeader("Referer");
%>
<HTML>
<head>
</head>
<body>
<form name='form1' method='post'>
<input type='hidden' name='ag_supplier' value='<%= sup_id %>'>
<input type='hidden' name='ag_buyer' value='<%= buyer_id %>'>
<input type='hidden' name='ag_supplier_type' value='<%= ag_supplier_type %>'>
<input type='hidden' name='ag_month' value='<%= ag_month %>'>
<input type='hidden' name='ag_year' value='<%= ag_year %>'>
<input type='hidden' name='ag_search_inv_no' value='<%= ag_search_inv_no %>'>
<input type='hidden' name='inv_no' value='<%= inv_no %>'>
<input type='hidden' name='sup_id' value='<%= sup_id %>'>
<input type='hidden' name='buyer_id' value='<%= buyer_id %>'>
<input type='hidden' name='chk_status' value='<%= chk_status %>'>
</form>
<script language='javascript'>
alert("<%= strMsg %>");
form1.action = '<%= nextUrl %>';
form1.submit();
</script>
</BODY>
</HTML>
