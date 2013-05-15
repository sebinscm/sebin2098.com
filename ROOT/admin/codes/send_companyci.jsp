<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@page import="java.util.*" %>
<%@page import="common.*" %>
<%@page import="common.util.*" %>
<%@page import="dbconn.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@ include file="/admin/login_check.jsp" %>
<%@ include file="/common/CommonVars.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

boolean isSucceeded = false;
String strMsg = "";

HashMap params = new HashMap();               // parameter 저장 임시 변수
String savePath = "C:/SCM_MYSQL/ROOT/img/";
String image_file ="";
// Jakarta Commons 프로젝트의 FileUpload 모듈을 사용함.
// -> http://jakarta.apache.org/commons/fileupload/
DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setRepository(new File(_uploadPath2));                 // Set factory constraints
ServletFileUpload upload = new ServletFileUpload(factory);    // Create a new file upload handler
upload.setSizeMax(_maxFileSize);                              // Set overall request size constraint
List items = upload.parseRequest(request);                    // Parse the request

try {

  // Process the uploaded items
  Iterator iter = items.iterator();
  
  while (iter.hasNext()) {

    FileItem item = (FileItem) iter.next();

    if (item.isFormField()) {

      // Process a regular form field
      String name = item.getFieldName();
      params.put(name, item.getString());

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
      File writeFile = new File(savePath + attachFileName);
      image_file = "/images/"+attachFileName;
      //out.println( image_file);
      if (writeFile.exists()) {
        writeFile.delete();
      }

      // File 정보 저장
      item.write(writeFile);
      params.put(fieldName, attachFileName);

    }

  } // end of while

  isSucceeded = true;

} catch (Exception e) {
  isSucceeded = false;
   image_file = "/images/noimage.jpg";
  strMsg = e.getMessage();
}

// messages
if (isSucceeded) {
  strMsg = "Company logo has been uploaded successfully.";
}
else {
  strMsg = "Fail to upload Company logo.";
}
%>
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
</head>
<body><center>
<br>
<%= strMsg %>
<br>
<table width="800" border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<tr>
  <td class="table_header_center">Uploaded Image</td>
  <td class="table_header_center" colspan="2">Large Size<img src="/img/sebin_large.jpg" border="0">
  Midum Size<img src="/img/sebin_mid.jpg" border="0">
  Small Size<img src="/img/sebin_small.jpg" border="0"></td>
</tr>	
</table>
<center><a href="./companyci_upload.jsp">Go Back</a>
</center></body>
</html>
