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
String whereAreWe = request.getLocalName();
String tmp_uploadPath = "";
if(whereAreWe.equals("127.0.0.1")){
    tmp_uploadPath = _uploadPathForLocal;
}
else{
    tmp_uploadPath = _uploadPath2;
}

HashMap params = new HashMap();               // parameter 저장 임시 변수
String savePath = application.getRealPath(_styleImgURL) + File.separator;   // file path
//String savePath = "C:/SCM/ROOT/images/";
String image_file ="";
// Jakarta Commons 프로젝트의 FileUpload 모듈을 사용함.
// -> http://jakarta.apache.org/commons/fileupload/
DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setRepository(new File(tmp_uploadPath));                 // Set factory constraints
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
      //Get the extension if the file has one
      String fileExt = "";
        int i = -1;
        if(( i = fileName.lastIndexOf(".")) != -1){
      
            fileExt = fileName.substring(i); // only file extension
            fileName = fileName.substring(0,i); // except file extension
        }
      fileName = fileName.toLowerCase()+fileExt.toLowerCase();
      //out.println(fileExt);
      //out.println(fileName);
            
      //if (true) return; 
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
  strMsg = "상품의 이미지가 성공적으로 Upload 되었습니다!";
}
else {
  strMsg = "상품의 이미지 upolad가 실패 되었습니다.";
}
%>
<html>
<head>
<title></title>
<link href="common/css/style.css" rel="stylesheet" type="text/css">
</head>
<body><center>
<br>
<%= strMsg %>
<br>
<img src="<%= image_file %>" border="0">
<center><a href="./image_upload.jsp">Go Back</a>
</center></body>

</html>
