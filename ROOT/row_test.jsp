<html>
<head>
<script type="text/javascript">
var idx;
function myfunc() {
  var str=event.keyCode;
  if (/[\d]/.test(String.fromCharCode(str))||str==8||str==46) {
    if (str>48&&(document.all.myval.value.length==5||document.all.myval.value.length==10)) {
        document.all.myval.value+="-";
    }
    return true;
  } else return false;
}
function myinsert() {
  var str=document.all.myval.value;
  if (str.length==13) {
    var mytab=document.all.mytable;
    var arr=str.split("-");
    var r,c;
    if (!isContains(arr[0],arr[1])) {
      r=mytab.insertRow();
      r.bgColor="ffffff";
      c=r.insertCell();
      c.innerHTML="<input type=text name=prodno value="+arr[0]+" style='border:solid 0;' size=5>";
      c=r.insertCell();
      c.innerHTML="<input type=text name=item value="+arr[1]+" style='border:solid 0;' size=4>";
      c=r.insertCell();
      c.innerHTML="<input type=text name=prodcnt value="+arr[2]+" style='text-align:right;' size=4>";
    } else {
      mytab.rows[idx].cells[2].children[0].value=Number(arr[2])+Number(mytab.rows[idx].cells[2].children[0].value);
    }
  }
}
function isContains(str1,str2) {
  var mytab=document.all.mytable;
  for (var i=1; i<mytab.rows.length; i++) {
    if (mytab.rows[i].cells[0].children[0].value==str1 &&
        mytab.rows[i].cells[1].children[0].value==str2) {
      idx=i;
      return true;
    }
  }
  return false;
}
</script>
</head>
<body>
<form name=myform>
<input type=text name=myval size=13 maxlength=13 onkeydown="return myfunc()">
<input type=button value=insert onclick="myinsert()">
<input type=submit value=gogogo>
<table id=mytable border=0 cellspacing=1 cellpadding=0 bgcolor=000000 width=300>
  <tr bgcolor=ffffff>
    <th>No<></th><th>ITEM</th><th>Qty</th>
  </tr>
</table>
</form>
</body>
</html>

