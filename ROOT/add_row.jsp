
<html>
<head>
<script language=JavaScript>
function add(){

 var newrow = document.all.test.insertRow();
 var newCol1 = newrow.insertCell();
 
 newCol1.innerHTML = "<tr>" +
   "<td><input type='text' name='name'></td>" +
   "<td><input type='text' name='addr' size='10'></td>" +
   "</tr>";
}

function del(){
 var newrow = document.all.test.deleterow();
}

</script>

</head>

<body>

<form name=form1 method=post action=add_row.jsp>
<table id="test" border=0>
<tr>
 <td><input type="text" name="name" size='10'></td>
 <td><input type="text" name="addr" size='10'></td>
</tr>
</table>
<input type=button onclick=add(); value="Add">

</body>
</html>
</form>

