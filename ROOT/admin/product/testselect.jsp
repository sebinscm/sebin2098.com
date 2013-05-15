<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Select Tag Sample Page - by Park Se IL</title>
<script type="text/javascript">
var selectTagList; //선택한 select Tag의 option의 value를 담기 위한 변수

//selectTag Option의 value를 저장한다.
function saveSelectList(selectObj){
 selectTagList = new Array();
 for(var i=0;i<selectObj.length;i++) {
  selectTagList[i] = selectObj.options[i].value;
 }
}
//select Tag가 변화할때마다 실행
function changeSelectTag(selectObj) {
 saveSelectList(selectObj);
 var selectedTagValue = selectObj.value; 
 var selectedTagName  = selectObj.attributes.name.value;
 if(selectedTagName == "myuniv1") {
  resetSelectTag(document.form1.myuniv2);
  deleteOption(document.form1.myuniv2,selectedTagValue);
  resetSelectTag(document.form1.myuniv3);
  deleteOption(document.form1.myuniv3,selectedTagValue);
 }
 if(selectedTagName == "myuniv2") {
  resetSelectTag(document.form1.myuniv3);
  deleteOption(document.form1.myuniv3,selectedTagValue);
 }
}
//select Tag내의 option을 재구성한다.
function resetSelectTag(obj) {
 deleteAllOption(obj);
 
 if(selectTagList != null && selectTagList.length !=0) {
  
  for(var i=0;i<selectTagList.length;i++) {
   var opt = document.createElement("option");
   opt.value = selectTagList[i];
   opt.text  = selectTagList[i];
   obj.options.add(opt);
  }
 }
 
}
//지정된 selectTag내의 옵션 삭제
function deleteOption(obj,selectedTagValue){
 var optionsLength = obj.options.length;
 var deleteIndex;  
 for(var i=0;i<optionsLength;i++) {
  if(selectedTagValue == obj.options[i].value) {
   deleteIndex = i;
  }else {
   var deleteIndex;
  }
 }  
 if(deleteIndex != null) {
  obj.remove(deleteIndex);
 }
}
//select Tag내의 모든 option을 삭제한다.
function deleteAllOption(obj) {
 while(obj.length>0) {
  obj.remove(0);
 }
}
</script>
</head>
<body>
<form name="form1">
 <table width="100%">
  <tr>
   <td>
    <select name="myuniv1" id="myuniv1" onchange="changeSelectTag(this);">
         <option value=""></option>
         <option value=인문계>인문계</option>
         <option value=실업계>실업계</option>
         <option value=검정고시>검정고시</option>
         <option value=기타>기타</option>
       </select>
   </td>
   <td>
    <select name="myuniv2" id="myuniv2" onchange="changeSelectTag(this);">
         <option value=""></option>
         <option value=인문계>인문계</option>
         <option value=실업계>실업계</option>
         <option value=검정고시>검정고시</option>
         <option value=기타>기타</option>
       </select>
   </td>
   <td>
    <select name="myuniv3" id="myuniv3">
      <option value=""></option>
         <option value=인문계>인문계</option>
         <option value=실업계>실업계</option>
         <option value=검정고시>검정고시</option>
         <option value=기타>기타</option>
       </select>
   </td>
  </tr>
 </table>
</form>
</body>
</html>
