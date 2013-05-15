/*
 *
 */

function jf_OpenViewer(url, target, varWidth, varHeight)
{
    var xPos=(window.screen.width) ? (window.screen.width-varWidth)/2 : 0;
    var yPos=(window.screen.height) ? (window.screen.height-varHeight)/2 : 0;

    var win = window.open(url, target, "top="+yPos+",left="+xPos+",width="+varWidth+",height="+varHeight+",status=no,toolbar=no,menubar=no,location=no,scrollbars=no,resizable=yes");
    return win;
}

function jf_OpenWindow(url, target, varWidth, varHeight)
{
    var xPos=(window.screen.width) ? (window.screen.width-varWidth)/2 : 0;
    var yPos=(window.screen.height) ? (window.screen.height-varHeight)/2 : 0;

    var win = window.open(url, target, "top="+yPos+",left="+xPos+",width="+varWidth+",height="+varHeight+",status=no,toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=no");
    return win;
}

function jf_OpenDialog(url, target, varWidth, varHeight)
{
  	var xPos=(window.screen.width) ? (window.screen.width-varWidth)/2 : 0;
  	var yPos=(window.screen.height) ? (window.screen.height-varHeight)/2 : 0;

	window.open(url, target, "top="+yPos+",left="+xPos+",width="+varWidth+",height="+varHeight+",status=no,toolbar=no,menubar=no,location=no,scrollbars=no,resizable=no");
}

/*
 *
 */
function jf_OpenModalDialog(url, xSize, ySize)
{
	//xSize, ySize : pixel
	var param = jf_GetModalFeatures(xSize, ySize);

	window.showModalDialog(url , window, param);

	return;
}

 /*
 *
 */
function jf_closeWindow()
{
	top.window.close();
}

/*
 *
 */
function jf_GetModalFeatures(xSize, ySize)
{
  var xPos=(window.screen.width) ? (window.screen.width-xSize)/2 : 0;
  var yPos=(window.screen.height) ? (window.screen.height-ySize)/2 : 0;

  var screenX = window.screen.width;
  var screenY = window.screen.height;

  return "help:no;status:no;dialogWidth:"+xSize+";dialogHeight:"+ySize+";scroll:no;dialogLeft:"+xPos+";dialogTop:"+yPos;
}
