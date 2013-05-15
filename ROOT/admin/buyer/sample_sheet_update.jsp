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


String searchItemClass = "";
String searchFromDate = "";
String searchToDate = "";
String searchSupplier = "";
String searchItemGroup = "";
String searchBuyer = "";
String searchSampleNo = "";
String searchStyleNo = "";
String searchStatus = "";


// variables
boolean isSucceeded = false;
String strMsg = "";
String sequence_no =  "";
String buyer_id =  "";
String sample_no =  "";

int iCnt = 0;
int iRet = 0;
String sql = "";
MatrixDataSet matrix = null;
DataProcess dataProcess = null;
Connection conn = null;
PreparedStatement pstmt = null;

HashMap params = new HashMap();               // for parameter
String savePath = application.getRealPath(_specSheetUrl ) + File.separator;   // file path

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
  sequence_no= (String) params.get("sequence_no");
  sample_no= (String) params.get("sample_no");
  buyer_id = (String) params.get("buyer_id");
  
  searchItemClass =(String) params.get("searchItemClass");
  searchFromDate = (String) params.get("searchFromDate");
  searchToDate =  (String) params.get("searchToDate");
  searchSupplier = (String)  params.get("searchSupplier");
  searchItemGroup= (String)  params.get("searchItemGroup");
  searchBuyer =  (String) params.get("searchBuyer");
  searchSampleNo = (String) params.get("searchSampleNo");
  searchStyleNo = (String) params.get("searchStyleNo");
  searchStatus =  (String) params.get("statusOptions");
  
  
  

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
      String realFileName =  sample_no+"_"+fileName;
      File writeFile = new File(savePath + realFileName);

      if (writeFile.exists()) {
        writeFile.delete();
      }

      item.write(writeFile);
      params.put(fieldName, realFileName);
    }
  }

  // update shipment header info
  sql = " update  VG_SAMPLE_IN_OUT "
      + " set     modifier =  ? , "
      + (params.get("attached_file1") != null ? " afile1_name = ?, " : "")
      + (params.get("attached_file2") != null ? " afile2_name = ?, " : "")
      + (params.get("attached_file3") != null ? " afile3_name = ?, " : "")
       + "        modified_date = sysdate()  "
       + " where  sequence_no = ? ";

  //out.println((String) params.get("handover_date"));
  //if (true) return;
  int j = 0;
  conn.setAutoCommit(false);
  pstmt = conn.prepareStatement(sql);
  pstmt.setString(++j, _adminid);


  if(params.get("attached_file1") != null) {
    pstmt.setString(++j, (String) params.get("attached_file1"));
  }
  if(params.get("attached_file2") != null) {
    pstmt.setString(++j, (String) params.get("attached_file2"));
  }
  if(params.get("attached_file3") != null) {
    pstmt.setString(++j, (String) params.get("attached_file3"));
  }
  pstmt.setString(++j, sequence_no);
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
  System.out.println("Exception sample sheet_pdate : " + ue.getMessage());
} catch (Exception e) {
  try { conn.rollback(); } catch (Exception ex) {}

  isSucceeded = false;
  System.out.println("Exception ample sheet_update : " + e.getMessage());
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
String nextUrl = "./sample_sheet_edit_form.jsp";

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
    <input type='hidden' name='sequence_no' value='<%= sequence_no %>'  >
   <input type='hidden' name='buyer_id' value='<%= buyer_id  %>'>
   <input type='hidden' name='sample_no' value='<%= sample_no  %>' >
    <input type='hidden' name='searchFromDate' value='<%= searchFromDate %>'>
  <input type='hidden' name='searchToDate' value='<%= searchToDate %>'>
  <input type='hidden' name='searchBuyer' value='<%= searchBuyer %>'>
  <input type='hidden' name='searchItemClass' value='<%= searchItemClass %>'>
  <input type='hidden' name='searchSupplier' value='<%= searchSupplier %>'>
  <input type='hidden' name='searchItemGroup' value='<%= searchItemGroup %>'>
  <input type='hidden' name='searchSampleNo' value='<%= searchSampleNo %>'>
  <input type='hidden' name='statusOptions' value='<%= searchStatus %>'>
  <input type='hidden' name='searchStyleNo' value='<%= searchStyleNo %>'>
</form>
<script language='javascript'>
alert("<%= strMsg %>");
form1.action = '<%= nextUrl %>';
form1.submit();
</script>
</body>
</html>
