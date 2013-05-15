<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@page import="dbconn.*" %>
<%@ page errorPage="/error.jsp" %>
<%@ include file="/login_check.jsp" %>
<%@ include file="/bottom_line.jsp" %>
<%@ page contentType = "text/html; charset=euc-kr" %>
<HTML>
<HEAD>
<title>Sample Image Registration</title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE=JavaScript>	
function formCheck() {

        
  fnImg_Check(filename); //첨부 파일 크기, 확장자 확인.....
 }
 
   
 function getFileExtension(filePath){  // 파일의 확장자를 가져옮
     var lastIndex = -1;
     lastIndex  = filePath.lastIndexOf('.');
     var extension = "";

   if(lastIndex != -1)
   {
     extension = filePath.substring( lastIndex+1, filePath.len );
   }
   else
   {
     extension = "";
   }
     return extension;
 }

 function fnImg_Check(value){   // 파일 확장자 체크하기.
     var src = getFileExtension(value);

   if(!((src.toLowerCase() == "jpg")))
   {
         alert('Please attach JPG image only.');
         return;
     }     
     LoadImg(value);
     img_Load();
 }

 function LoadImg(value){
     var imgInfo = new Image();
     imgInfo.onload = img_Load;
     imgInfo.src = value;
 }

 function img_Load(){
  var frm = document.frm;
     var imgWidth, imgHeight, imgFileSize;
     var maxFileSize = 50000;  // 이미지사이즈 제한(500kb)

     imgWidth  = this.width;
     imgHeight  = this.height;
     imgFileSize  = Math.round(this.fileSize/1024);

  if(imgFileSize > maxFileSize)
  {
        alert('Please select the image less than 500KB.');
        return;
    } 
   if (confirm('Do you want to upload this image?')) {
   	   frm.action = 'buyer_send_photo.jsp';
      frm.submit();
	}

 }


	
function fnSubmit()
{
	if (!document.frm.file_name1.value ) {
	  alert('Enter image file name!');
	  document.frm.file_name1.focus();
	  return;
	}

	if (confirm('Do you want to upload this image?')) {
	  document.frm.submit();
	}
}
</SCRIPT>
</HEAD>
<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>	
<table width='99%' border='0' cellspacing='0' cellpadding='0' align="center">
<tr>
  <td height='15' colspan='2'></td>
</tr>
<tr>
  <td width='3%'><img src='/img/image_upload.jpg'></td>
  <td width='*' class='left_title'>Buyer Sample Image Registration</td>
</tr>
<tr>
  <td width='100%' height='2' colspan='2'><hr width='100%'></td>
</tr>
<tr>
  <td height='10' colspan='2'></td>
</tr>
</table>
<font color=red> * Sample image file name must be match with Style number on PO.<br>
* File format must be "style number.jpg"<br>
* Do not put space within image file name.</font> <p>
*	Recommended image size shall be 208(width)x 320(height). It may display incorrectly or currupted if the image size is too large. 
   
<FORM NAME="frm" ACTION="buyer_send_photo.jsp" METHOD=POST enctype="multipart/form-data">
<table width="600" border="0" cellspacing="1" cellpadding="2" align="center" class="table_bg">
<tr>
  <td class="table_header_center">Image File</td>
  <td class="table_header"><input type="file" name= "file_name1"  size="60"></td>
</tr>
<tr>
  <td class="table_header_center">Sample Image<br><img src="/images/image_sample.jpg" border="0"></td>
  <td class="table_header_center"><INPUT TYPE=BUTTON VALUE=Submit onClick="fnImg_Check(frm.file_name1.value);">&nbsp;&nbsp;&nbsp;<INPUT TYPE=reset VALUE=Cancel></td>
</tr>    
</FORM>
</table>
<%
out.println(CopyRightLogo());
%>
</BODY>
</HTML>