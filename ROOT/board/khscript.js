
function SelectAll()
{
   re = /.*SELECT_.*/;
   for( var i=0; i<document.list_form.elements.length; i++)
   {
      var ele = document.list_form.elements[i];
      if(ele.name.search(re)!=-1)
         ele.checked = !ele.checked;
   }
}

function onSearch()
{
  if(document.search_form.search_word.value=='')
  {
    alert('�˻�� �Է��� �ֽʽÿ�.');
    document.search_form.search_word.focus();
    return;
  }
  document.search_form.search_word.value = trim(document.search_form.search_word.value);
  document.search_form.submit();
}

function ltrim ( s )
{
	return s.replace( /^\s*/, "" )
}

function rtrim ( s )
{
	return s.replace( /\s*$/, "" );
}

function trim ( s )
{
	return rtrim(ltrim(s));
}

function on_enterkey()
{
   if(event.keyCode ==13) onSearch();
}

function on_statistics()
{
}

function OnClickSearchName()
{
   document.search_form.SearchNameImg.src='skin/images/fixname-1.gif';
   document.search_form.SearchSubjectImg.src='skin/images/fixsbject.gif';
   document.search_form.SearchContentImg.src='skin/images/fixcontents.gif';
   document.search_form.search_method.value='b_name';
}
function OnClickSearchSubject()
{
   document.search_form.SearchNameImg.src='skin/images/fixname.gif';
   document.search_form.SearchSubjectImg.src='skin/images/fixsbject-1.gif';
   document.search_form.SearchContentImg.src='skin/images/fixcontents.gif';
   document.search_form.search_method.value='b_title';
}
function OnClickSearchContent()
{
   document.search_form.SearchNameImg.src='skin/images/fixname.gif';
   document.search_form.SearchSubjectImg.src='skin/images/fixsbject.gif';
   document.search_form.SearchContentImg.src='skin/images/fixcontents-1.gif';
   document.search_form.search_method.value='b_content';
}

function on_writebtn_click()
{

   if(document.write_form.b_name.value==''){
    alert('�̸��� �Է��� �ֽʽÿ�. ');
    document.write_form.b_name.focus();
    return;
   }
	if(document.write_form.b_mail.value!='')
	{
	   if(document.write_form.b_mail.value.indexOf('@') == -1)
	   {
		  alert('E-Mail you entered is not a valid format.');
		  document.write_form.b_mail.focus();
		  return;
	   }
	}
   if(document.write_form.b_title.value==''){
    alert('Please, input your subject.');
    document.write_form.b_title.focus();
    return;
   }

   if(document.write_form.b_pwd.value==''){
    alert('�н����带 �Է��� �ֽʽÿ�.');
    document.write_form.b_pwd.focus();
    return;
   }

	if(document.write_form.b_url.value!='')
	{
	   if(document.write_form.b_url.value.indexOf('http://') == -1)
	   {
		  alert('Homepage �ּ� ������ �ùٸ��� �ʽ��ϴ�.\n(��) http://www.kimho.pe.kr');
		  document.write_form.b_url.focus();
		  return;
	   }
	}
   document.write_form.target="_self";
   if(document.write_form.uploadbox.value=='Y') {
	   if(document.write_form.file1.value=='') {
		   document.write_form.action='board.jsp?branch=W&WACT=INSERT'; 
		   document.write_form.submit();
	   } else {
		   x = (screen.width  - 350) / 2;  
		   y = (screen.height - 200) / 2;
		   window.open('filecheck.jsp','filecheckwin','scrollbars=no,toolbar=no,status=no,width=350,height=200,resizable,top='+y+',left='+x);
	   }
   } else {
	   document.write_form.action='board.jsp?branch=W&WACT=INSERT'; 
	   document.write_form.submit();
   }
}

function on_editbtn_click()
{

   if(document.write_form.b_name.value==''){
    alert('�̸��� �Է��� �ֽʽÿ�. ');
    document.write_form.b_name.focus();
    return;
   }
	if(document.write_form.b_mail.value!='')
	{
	   if(document.write_form.b_mail.value.indexOf('@') == -1)
	   {
		  alert('E-Mail �ּ� ������ �ùٸ��� �ʽ��ϴ�.');
		  document.write_form.b_mail.focus();
		  return;
	   }
	}
   if(document.write_form.b_title.value==''){
    alert('������ �Է��� �ֽʽÿ�.');
    document.write_form.b_title.focus();
    return;
   }
   if(document.write_form.b_pwd.value==''){
    alert('�н����带 �Է��� �ֽʽÿ�.');
    document.write_form.b_pwd.focus();
    return;
   }

	if(document.write_form.b_url.value!='')
	{
	   if(document.write_form.b_url.value.indexOf('http://') == -1)
	   {
		  alert('Homepage �ּ� ������ �ùٸ��� �ʽ��ϴ�.\n(��) http://www.kimho.pe.kr');
		  document.write_form.b_url.focus();
		  return;
	   }
	}
   document.write_form.target="_self";

   if(document.write_form.uploadbox.value=='Y') {
	   if(document.write_form.file1.value=='') {
		   document.write_form.action='board.jsp?branch=W&WACT=EEE'; 
		   document.write_form.submit();
	   } else {
		   x = (screen.width  - 350) / 2;  
		   y = (screen.height - 200) / 2;
		   window.open('filecheck.jsp','filecheckwin','scrollbars=no,toolbar=no,status=no,width=350,height=200,resizable,top='+y+',left='+x);
	   }
   } else {
	   document.write_form.action='board.jsp?branch=W&WACT=EEE'; 
	   document.write_form.submit();
   }
}

function ViewPic(link)
{
   window.open(link,'','width=550,height=500,top=screen.height/2,left=screen.width/2,scrollbars=1,resizable=1');
}

function on_listbtn_click(i,table)
{
  location.href='board.jsp?branch=L&mypage='+i+'&table='+table;
}

function on_rewritebtn_click()
{
  document.re.branch.value='W';
  document.re.WACT.value='R';
  document.re.submit();
}

function on_prevbtn_click(id)
{
}

function on_nextbtn_click(id)
{
}

function edit_click()
{
	if( document.re.b_name.value == document.re.readname.value ) {
		document.re.branch.value= 'W';
		document.re.WACT.value='E';
		re.submit();
	}else {
		alert('You are not a writer');
	}
}

function on_delbtn_click()
{
	if(confirm('�����Ͻðڽ��ϱ�?')) {
		document.re.branch.value='W';
		document.re.WACT.value='D';
		re.submit();
	}
}
