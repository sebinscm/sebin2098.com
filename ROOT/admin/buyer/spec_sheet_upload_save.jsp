<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%
boolean isSucceeded = false;
String strMsg = "";
String savePath = application.getRealPath(_specSheetUploadUrl) + File.separator;   // file path

// Jakarta Commons Fileupload module
// -> http://jakarta.apache.org/commons/fileupload/
DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setRepository(new File(_uploadPath));                 // Set factory constraints
ServletFileUpload upload = new ServletFileUpload(factory);    // Create a new file upload handler
upload.setSizeMax(_maxFileSize);                              // Set overall request size constraint
List items = upload.parseRequest(request);                    // Parse the request

String brand = "";

try {

  // Process the uploaded items
  Iterator iter = items.iterator();
  
  while (iter.hasNext()) {
    FileItem item = (FileItem) iter.next();

    if (item.isFormField()) {
      String name = item.getFieldName();

      if (name.equals("brand")) {
        brand = item.getString();
        break;
      }
    }
  }

  // read again
  iter = items.iterator();

  while (iter.hasNext()) {

    FileItem item = (FileItem) iter.next();

    if (!item.isFormField()) {
      // Process a file upload
      String fileName = item.getName();
      long sizeInBytes = item.getSize();

      // ignore file if size is zero
      if (sizeInBytes == 0) {
        continue;
      }

      int pos = fileName.lastIndexOf("\\");
      if (pos < 0) fileName.lastIndexOf("/");

      String attachFileName = fileName.substring(pos+1);
      File writeFile = new File(savePath + brand + File.separator + attachFileName);

      if (writeFile.exists()) {
        writeFile.delete();
      }

      item.write(writeFile);
    }

  } // end of while

  isSucceeded = true;

} catch (Exception e) {
  isSucceeded = false;
  //strMsg = e.getMessage();
}

// final messages..
if (isSucceeded) {
  strMsg = "The files were successfully uploaded.\\nThe uploaded files will be processed in several minutes.";
}
else {
  strMsg = "The operation failed. Error occured while uploading files.";
}
%>
<html>
<head>
<title></title>
</head>
<body>
<form name="form1" method="post" action="./spec_sheet_upload_form.jsp">
</form>
<script language="javascript">
  alert("<%= strMsg %>");
  document.form1.submit();
</script>
</body>
</html>
