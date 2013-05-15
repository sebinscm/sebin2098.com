

var ieVer = navigator.appVersion.match(/MSIE \d+.\d+/)[0].split(" ")[1];
var bLoad = false;
var gSel = null;
var bHeader = "<style>P {margin-top:2px;margin-bottom:2px;}</style>\n";
var cPicker = null;
var editmode = "Html";
var public_description = new Editor();


function Editor() {
   this.put_html = put_html;
   this.get_html = get_html;
   this.get_text = get_text;

   this.setColor = setColor;
   this.setBgColor = setBgColor;
   this.setFocus = setFocus;
}

function init() {
   idBox.style.visibility = '';
   document.onmousedown = mouseDown;
//   document.onkeydown = keyDown;

   if (ieVer < 5.5) {
      idEdit = EditCtrl;
      idEdit.document.designMode = "On";
      initEditor();
      bLoad = true;
      if (document.all.DocContent != null)
         put_html(document.all.DocContent.innerHTML);
		 putSource();
   }
   else
   {
     idEdit = Edit;
     if (document.all.DocContent != null)
	   {
			ChangeHTMLtoTEXT();
			ChangeTEXTtoHTML();
			put_html(document.all.DocContent.innerHTML); 
			//setFocus();
	   }
   }
   //document.frmRegist.txtSubject.focus();
}

function initEditor(width,height) {
   idEdit.document.open();
   idEdit.document.write(bHeader);
   idEdit.document.close();

   idEdit.document.body.style.fontSize = "10pt";
   idEdit.document.body.style.fontFamily = "±¼¸²";
}

function mouseDown(e) {

   if (event.srcElement.id=='toolbar' || event.srcElement.parentElement.id=='htmlOnly') {
      if (idEdit.document.selection.type == 'none') {
         gSel = null;
      }
      else {
         gSel = idEdit.document.selection.createRange();
      }
      return false;
   }
   return true;
}

function put_html(str) {
   if ( ieVer < 5.5 )
   {
      idEdit.document.body.innerHTML = str;
   }
   else
   {
      idEdit.innerHTML = str;
   }
}

function put_text(str) {
   if ( ieVer < 5.5 )
   {
      idEdit.document.body.innerText = str;
   }
   else
   {
      idEdit.innerText = str;
   }
}

function get_html() {
   removeMisc();

   if ( ieVer < 5.5 )
   {
      return idEdit.document.body.innerHTML;
   }
   else
   {
      return idEdit.innerHTML;
   }
}

function get_text() {
   removeMisc();
   if ( ieVer < 5.5)
      return idEdit.document.body.innerText;
   else
      return idEdit.innerText;
}

function setBgColor() {
   if (idEdit.document.all.content != null) {
      idEdit.document.body.style.backgroundColor = idEdit.document.all.content.bgcolor;
      idEdit.document.body.innerHTML = idEdit.document.all.content.innerHTML;
   }
}

//function setFocus() {
//   idEdit.focus();
//}

function format(what, opt) {
   idEdit.focus();
   if (opt == "removeFormat") {
      what = opt;
      opt = null;
   }

   if (gSel != null) {
      gSel.select();
   }
   if (opt == null) {
      idEdit.document.execCommand(what);
   }
   else {
      idEdit.document.execCommand(what, "", opt);
   }

}

function getEl(sTag, start) {
   while ((start!=null) && (start.tagName!=sTag)) {
      start = start.parentElement;
   }
   return start;
}

function backColor(sColor) {
   if (idEdit.document.selection.type == "None") {
      format("backcolor", sColor)
   }
   else {
      var sel = idEdit.document.selection.createRange();
      sel.pasteHTML("<font style=\"background-color:" + sColor + "\">" + sel.text + "</font>");
      sel.select();
   }

   idEdit.focus();
}

function createLink() {
   if (gSel != null) {
      gSel.select();
   }

   var isA = getEl("A", idEdit.document.selection.createRange().parentElement());
   var str = prompt("¸µũ¸¦ À·ÂϿ© Á½ʽÿÀ", isA ? isA.href : "http:\/\/");
   if ((str != null) && (str != "http://")) {

      var sel = idEdit.document.selection.createRange();

      if ((idEdit.document.selection.type == "None") && (!isA)) {
         sel.pasteHTML("<a href=\"" + str + "\">" + str + "</a> ");
         sel.select();
      }
      else {
         sel.pasteHTML("<a href=\"" + str + "\" target=\"_blank\">" + sel.text + "</a> ");
         sel.select();
      }
   }
   else {
      idEdit.focus();
   }
}

function setColor(col) {

   switch (whichCol) {
      case 0:
            if (col=='transparent')   {
               format('forecolor', '#c0c0c0');
            }
            else {
               format('forecolor', col);
            }
            break;
      case 1:
            backColor(col);
            break;
      case 2:
            idEdit.document.body.style.backgroundColor = col;
            removeMisc();
            break;

      // ȫº¸ °ԽÃÇf¸ñ¹̱â
      case 5:
            if (col=='transparent') {
               setTitleDeco('forecolor','#c0c0c0');
            }
            else {
               setTitleDeco('forecolor',col);
            }
            break;
      case 6:
            if (col=='transparent') {
               setTitleDeco('backcolor','#c0c0c0');
            }
            else {
               setTitleDeco('backcolor',col);
            }
            break;

      // ¿ì°Խù° ²ٹ̱â
      case 5:
            if (col=='transparent') {
               setBestItem('forecolor','#c0c0c0');
            }
            else {
               setBestItem('forecolor',col);
            }
            break;
      case 6:
            if (col=='transparent') {
               setBestItem('backcolor','#c0c0c0');
            }
            else {
               setBestItem('backcolor',col);
            }
            break;
   }
}

function setTitleDeco(func, color) {
}

function setBestItem(func, color) {
    if(func=='forecolor') {
        document.frmRegist.p_best_fore_color.value = color;
        fore_color.style.backgroundColor = color;
    }
    else if(func=='backcolor') {
        document.frmRegist.p_best_back_color.value = color;
        back_color.style.backgroundColor = color;
    }
    else {

    }
}

function removeMisc() {
   var bodyTags = idEdit.document.body.all;
   for (i = bodyTags.tags("FONT").length - 1; i >= 0; i--) {
      if (bodyTags.tags("FONT")[i].style.backgroundColor == "#ffffff") {
         bodyTags.tags("FONT")[i].style.backgroundColor = ""
         if (bodyTags.tags("FONT")[i].outerHTML.substring(0, 6) == "<FONT>") {
            bodyTags.tags("FONT")[i].outerHTML = bodyTags.tags("FONT")[i].innerHTML;
         }
      }
   } 
}

function setOverflow() {
	idEdit.focus();
	idEdit.document.execCommand('insertunorderedlist');
	idEdit.document.execCommand('insertunorderedlist');
}

document.write(
 "      <script language=\"javascript\" src=\"/lib/scripts/event.js\"></script>  \n" 
+"<DIV class=toolbar id=idBox style=\"TEXT-ALIGN: left; VISIBILITY: hidden; WIDTH: 100%; HEIGHT: 24\">"
+"		<table border=\"1\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" bordercolor=\"#808CA0\" bordercolordark=\"white\" bordercolorlight=\"#888888\" cellpadding=\"0\"> \n"
+"          <tr >  \n"
+"            <td bgcolor=C0C0C0>  \n"
+"              <table border=1 bordercolor=C0C0C0 cellspacing=0 cellpadding=0> \n"
+"                <tr>  \n"
+"                  <td width=\"55\">  \n"
+"                    <select name=\"select3\" style=\"width:55px;\" onchange=\"format('fontname',this[this.selectedIndex].value);this.selectedIndex=0\" tabIndex=-1> \n"
+"                      <OPTION class=heading selected>ÆƮ</OPTION>"
+"                      <OPTION value=¹ÙÁ¼>¹ÙÁ¼</OPTION>"
+"                      <OPTION value=±¼¸²ü>±¼¸²ü</OPTION>"
+"                      <OPTION value=µ¸¿òµ¸¿ò/OPTION>"
+"                      <OPTION value=±ü­ü>±ü­ü</OPTION>"
+"                      <OPTION value=geneva,arial,sans-serif>Arial &nbsp;&nbsp; &nbsp;&nbsp;</OPTION>"
+"                      <OPTION value=times,serif>Times </OPTION>"
+"                      <OPTION value=\"courier,monospace\">Courier</OPTION>"
+"                    </select> \n"
+"                  </td> \n"
+"                  <td width=\"55\">  \n"
+"                    <select name=\"select4\" style=\"width:55px;\" onchange=\"format('fontSize',this[this.selectedIndex].text);this.selectedIndex=0\" tabIndex=-1> \n"
+"                      <OPTION class=heading seleted>ũ±â"
+"                      <OPTION>1<OPTION>2<OPTION>3<OPTION>4<OPTION>5<OPTION>6<OPTION>7      </OPTION> \n"
+"                    </select> \n"
+"                  </td> \n"
//bold", "italic", "underline", "", "forecolor", "backcolor", "backgndcolor", "", "justifyleft", "justifycenter", "justifyright", "", "insertorderedlist", "insertunorderedlist", "outdent", "indent", "", "createLink"
+"                  <td width=\"3\" align=\"center\"><img src=\"/images/b_bar.gif\" width=\"2\" height=\"18\"></td> \n"
+"                  <td>&nbsp;</td> \n"
+"                  <td width=\"22\"><a href=\"javascript:format('cut')\" TABINDEX=\"1\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image49','','/images/b_cut_on.gif',1)\"><img name=\"Image49\" border=\"0\" src=\"/images/b_cut.gif\" width=\"22\" height=\"22\" alt=\"À¶󳻱â></a></td> \n"
+"                  <td width=\"22\"><a href=\"javascript:format('copy')\" TABINDEX=\"1\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image48','','/images/b_copy_on.gif',1)\"><img name=\"Image48\" border=\"0\" src=\"/images/b_copy.gif\" width=\"22\" height=\"22\" alt=\"º¹»ç></a></td> \n"
+"                  <td width=\"22\"><a href=\"javascript:format('paste')\" TABINDEX=\"1\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image47','','/images/b_paste_on.gif',1)\"><img name=\"Image47\" border=\"0\" src=\"/images/b_paste.gif\" width=\"22\" height=\"22\" alt=\"ºٿ©³ֱâ></a></td> \n"
+"                  <td width=\"22\"><a href=\"javascript:format('delete')\" TABINDEX=\"1\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image46','','/images/b_del_on.gif',1)\"><img name=\"Image46\" border=\"0\" src=\"/images/b_del.gif\" width=\"22\" height=\"22\" alt=\"Á¿ì\"></a></td> \n"
+"                  <td width=\"3\" align=\"center\"><img src=\"/images/b_bar.gif\" width=\"2\" height=\"18\"></td> \n"
+"                  <td width=\"22\"><a href=\"javascript:format('bold')\" TABINDEX=\"1\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image45','','/images/b_b_on.gif',1)\"><img name=\"Image45\" border=\"0\" src=\"/images/b_b.gif\" width=\"22\" height=\"22\" alt=\"±½°Ô"></a></td> \n"
+"                  <td width=\"22\"><a href=\"javascript:format('italic')\" TABINDEX=\"1\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image44','','/images/b_i_on.gif',1)\"><img name=\"Image44\" border=\"0\" src=\"/images/b_i.gif\" width=\"22\" height=\"22\" alt=\"±âÀ²Ã"></a></td> \n"
+"                  <td width=\"22\"><a href=\"javascript:format('underline')\" TABINDEX=\"1\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image43','','/images/b_u_on.gif',1)\"><img name=\"Image43\" border=\"0\" src=\"/images/b_u.gif\" width=\"22\" height=\"22\" alt=\"¹ØÙ"></a></td> \n"
+"                  <td width=\"3\" align=\"center\"><img src=\"/images/b_bar.gif\" width=\"2\" height=\"18\"></td> \n"
+"                  <td width=\"22\"><a href=\"javascript:colorPicker(0)\" TABINDEX=\"1\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image42','','/images/b_fc_on.gif',1)\"><img name=\"Image42\" border=\"0\" src=\"/images/b_fc.gif\" width=\"22\" height=\"22\" alt=\"±Ûڻö</a></td> \n"
+"                  <td width=\"22\"><a href=\"javascript:colorPicker(1)\" TABINDEX=\"1\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image38','','/images/b_fbc_on.gif',1)\"><img name=\"Image38\" border=\"0\" src=\"/images/b_fbc.gif\" width=\"22\" height=\"22\" alt=\"±۹Ù{ö</a></td> \n"
+"                  <td width=\"3\" align=\"center\"><img src=\"/images/b_bar.gif\" width=\"2\" height=\"18\"></td> \n"
+"                  <td width=\"22\"><a href=\"javascript:format('justifyleft')\" TABINDEX=\"1\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image36','','/images/b_pl_on.gif',1)\"><img name=\"Image36\" border=\"0\" src=\"/images/b_pl.gif\" width=\"22\" height=\"22\" alt=\"¿ÞʸÂã></a></td> \n"
+"                  <td width=\"22\"><a href=\"javascript:format('justifycenter')\" TABINDEX=\"1\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image35','','/images/b_pc_on.gif',1)\"><img name=\"Image35\" border=\"0\" src=\"/images/b_pc.gif\" width=\"22\" height=\"22\" alt=\"°¡¿¸Âã></a></td> \n"
+"                  <td width=\"22\"><a href=\"javascript:format('justifyright')\" TABINDEX=\"1\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image34','','/images/b_pr_on.gif',1)\"><img name=\"Image34\" border=\"0\" src=\"/images/b_pr.gif\" width=\"22\" height=\"22\" alt=\"¿8¥Â¸Âã></a></td> \n"
+"                  <td width=\"3\" align=\"center\"><img src=\"/images/b_bar.gif\" width=\"2\" height=\"18\"></td> \n"
+"                  <td width=\"22\"><a href=\"javascript:format('insertorderedlist')\" TABINDEX=\"1\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image33','','/images/b_n_on.gif',1)\"><img name=\"Image33\" border=\"0\" src=\"/images/b_n.gif\" width=\"22\" height=\"22\" alt=\"¹ø±â\"></a></td> \n"
+"                  <td width=\"22\"><a href=\"javascript:format('insertunorderedlist')\" TABINDEX=\"1\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image32','','/images/b_h_on.gif',1)\"><img name=\"Image32\" border=\"0\" src=\"/images/b_h.gif\" width=\"22\" height=\"22\" alt=\"±۸Ӹ®±â\"></a></td> \n"
+"                  <td width=\"3\" align=\"center\"><img src=\"/images/b_bar.gif\" width=\"2\" height=\"18\"></td> \n"
+"                  <td width=\"22\"><a href=\"javascript:createLink()\" TABINDEX=\"1\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image31','','/images/b_l_on.gif',1)\"><img name=\"Image31\" border=\"0\" src=\"/images/b_l.gif\" width=\"22\" height=\"22\" alt=\"Link\"></a></td> \n"
//+"                  <td width=\"5\" align=\"center\">&nbsp;</td> \n"
//+"                  <td width=\"22\">&nbsp;</td> \n"
+"                </tr> \n"
+"              </table> \n"
+"            </td> \n"
+"          </tr> \n"
+"        </table> \n"
+"</DIV>");

if (ieVer >= 5.5) 
{
   document.write("<div NAME=content id='Edit' contentEditable='true' style='overflow: auto; width: 519; height: 250; border:solid; border-width:1; PADDING-BOTTOM: 10px; PADDING-LEFT: 10px; PADDING-RIGHT: 10px; PADDING-TOP: 10px;'></div>");
}
else
{
   document.write("<iframe name=\"EditCtrl\" width=\"100%\" height=\"250\"></iframe>");
}

function keyDown( ) { 
   var keycode = window.event.keyCode;
   var realkey = String.fromCharCode(window.event.keyCode);

   alert("keycode: " + keycode  + "\nrealkey: " + realkey); 
} 

function ChangeHTMLtoTEXT()
{
   if ( editmode == "Html")
   {
      put_text(get_html());
      hideToolBar();
      editmode = "Text";
   }
   
}

function ChangeTEXTtoHTML()
{
   if ( editmode == "Text")
   {
      put_html(get_text());
      showToolBar();
      editmode = "Html";
   }
}

function hideToolBar ()
{
   idBox.style.height = 0;
   idBox.style.display = "none";
   idEdit.style.height = 280;
}

function showToolBar ()
{
   idBox.style.height = 26;
   idBox.style.display = "block";
   idEdit.style.height = 250;

}

function viewSource()
{
   alert(get_html());
   alert(get_text());
}

//À¹Ìö·Ï
function setImageSrc ( imgsrc, desc )
{
    if ( imgsrc == null || imgsrc == "")
       return;

    if (ieVer < 5.5)
    {
		if ( imgsrc != "")
		{
			var sel = idEdit.document.selection.createRange();
			sel.pasteHTML("<img src="+ imgsrc+" border=0 alt="+desc+">" + sel.text );
			sel.select();

		}
		else
		{
		   alert("À¹Ìö+i+"] ; ¼±ÅÇ¼¼¿ä;
		}
    }
    else
    {
       idEdit.focus();
       idEdit.document.execCommand("InsertImage", false, imgsrc);
    }
}

//À¹ÌöÏâ.
function imageSelector()
{
	if (ImagePicker!=null && !ImagePicker.closed) 
	{
   	ImagePicker.focus();
   	return;
	}
	
	var club_id  = document.frmRegist.p_club_id.value;
	var bbs_id = document.frmRegist.p_bbs_id.value;
	var imgfile_seq = document.frmRegist.p_imgfile_seq.value;

   ImagePicker = window.open("/jsps/bbs/image_insert.jsp?p_club_id="+club_id+"&p_bbs_id="+bbs_id+"&p_imgfile_seq="+imgfile_seq, "ImageInsert", 
		"fullscreen=no,titlebar=no,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=220");

}

var ImagePicker = null;

