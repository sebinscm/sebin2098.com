<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Select Tag Sample Page - by Park Se IL</title>
<script type="text/javascript">
var selectTagList; //������ select Tag�� option�� value�� ��� ���� ����

//selectTag Option�� value�� �����Ѵ�.
function saveSelectList(selectObj){
 selectTagList = new Array();
 for(var i=0;i<selectObj.length;i++) {
  selectTagList[i] = selectObj.options[i].value;
 }
}
//select Tag�� ��ȭ�Ҷ����� ����
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
//select Tag���� option�� �籸���Ѵ�.
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
//������ selectTag���� �ɼ� ����
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
//select Tag���� ��� option�� �����Ѵ�.
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
         <option value=�ι���>�ι���</option>
         <option value=�Ǿ���>�Ǿ���</option>
         <option value=�������>�������</option>
         <option value=��Ÿ>��Ÿ</option>
       </select>
   </td>
   <td>
    <select name="myuniv2" id="myuniv2" onchange="changeSelectTag(this);">
         <option value=""></option>
         <option value=�ι���>�ι���</option>
         <option value=�Ǿ���>�Ǿ���</option>
         <option value=�������>�������</option>
         <option value=��Ÿ>��Ÿ</option>
       </select>
   </td>
   <td>
    <select name="myuniv3" id="myuniv3">
      <option value=""></option>
         <option value=�ι���>�ι���</option>
         <option value=�Ǿ���>�Ǿ���</option>
         <option value=�������>�������</option>
         <option value=��Ÿ>��Ÿ</option>
       </select>
   </td>
  </tr>
 </table>
</form>
</body>
</html>
