function jf_GetToken(str, delimiter, nth)
{
  var tokens = str.split(delimiter);

  if ((nth <= 0) || (nth > tokens.length))
    return "";
  else
    return jf_AllTrim(tokens[nth-1]);
}

function jf_SkipSpaces(str)
{
  var newStr = "";

  for (var i=0; i< str.length; i++)
  {
    if ( (str.charAt(i) != " ") && (str.charAt(i) != " ") )
    {
      newStr = newStr + str.charAt(i);
    }
  }

  return newStr;
}

function jf_AllTrim(str)
{
  if (!str)
    return str;
  else
    return str.replace(/^\s*/ ,"").replace(/\s*$/ ,"");
}


function jf_LTrim(str)
{
  if (!str)
    return str;
  else
    return str.replace(/^\s*/,"");
}

function jf_RTrim(str)
{
  if (!str)
    return str;
  else
     return str.replace(/\s*$/,"");
}

function jf_LPadding(psStr, piLen, psSeed)
{
  var sRtnStr = String(psStr);

  psSeed = String(psSeed);

  if (jf_GetByteLength(psSeed) != 1)
    return sRtnStr;

  for (var i = 0; i < (piLen - jf_GetByteLength(psStr)); i++)
  {
     sRtnStr = psSeed + sRtnStr;
  }

  return sRtnStr;
}

function jf_RPadding(psStr, piLen, psSeed)
{
  var sRtnStr = String(psStr);

  psSeed = String(psSeed);

  if (jf_GetByteLength(psSeed) != 1)
    return sRtnStr;

  for (var i = 0; i < (piLen - jf_GetByteLength(psStr)); i++)
  {
     sRtnStr = sRtnStr + psSeed;
  }

  return sRtnStr;
}

function jf_GetByteLength(str)
{
  var byteLength = 0;

  str = String(str);

  for (var i = 0; i < str.length; i++)
  {
    var oneChar = escape(str.charAt(i));

    if ( oneChar.length == 1 )
    {
      byteLength ++;
    }
    else if (oneChar.indexOf("%u") != -1)
    {
      byteLength += 2;
    }
    else if (oneChar.indexOf("%") != -1)
    {
      byteLength += oneChar.length/3;
    }
  }

  return byteLength;
}

function jf_IsValidStrLength(str, limit)
{
  if ( jf_GetByteLength(str) > limit )
    return false;
  else
    return true;
}

function jf_IsValidStrLength3(str, limit)
{
  if ( jf_GetByteLength(str) < limit )
    return false;
  else
    return true;
}

function jf_IsValidStrLength2(str, limit)
{
  if(!jf_ChkValue(str))
  {
      return;
  }

  if (jf_GetByteLength(str) > limit)
  {
    return false;
  }
  else
  {
    return true;
  }
}

function jf_IsValidInputLength(input,limit)
{
  if (jf_GetByteLength(input.value) > limit)
  {
    input.focus();

    return false;
  }
  else
  {
    return true;
  }
}

function jf_SkipZero(str)
{
  var pos = 0;

  str = String(str);

  for (var i = 0; i< str.length; i++)
  {
    if (str.charAt(i) != "0")
    {
      pos = i;

      break
    }
  }

  return str.substr(pos, str.length);
}

function jf_GetToUpperCase(str)
{
  return jf_AllTrim(str).toUpperCase();
}

function jf_GetToLowerCase(str)
{
  return jf_AllTrim(str).toLowerCase();
}

/*
function jf_GetCommaNumber(number)
{
  var strNumber = '' + number;
  var isMinus = false;

  if (strNumber.length > 0 && strNumber.substr(0, 1) == "-")
  {
    isMinus = true;
    strNumber = strNumber.substr(1);
  }

  if (strNumber.length > 3)
  {
    var mod = strNumber.length % 3;
    var output = (mod > 0 ? (strNumber.substring(0,mod)) : '');

    for (i=0 ; i < Math.floor(strNumber.length / 3); i++)
    {
      if ((mod == 0) && (i == 0))
        output += strNumber.substring(mod+ 3 * i, mod + 3 * i + 3);
      else
        output+= ',' + strNumber.substring(mod + 3 * i, mod + 3 * i + 3);
    }

    if (isMinus) output = "-" + output;
    return output;
  }
  else
  {
    if (isMinus) strNumber = "-" + strNumber;
    return strNumber;
  }
}
*/

function jf_GetCommaNumber(number)
{
  var strNumber = '' + number;
  var strHeadNumber = '';
  var strTailNumber = '';
  var output = '';

  var idx = strNumber.indexOf(".");

  if (idx >= 0) {
    strHeadNumber = strNumber.substr(0, idx);
    strTailNumber = strNumber.substr(idx);
  } else {
    strHeadNumber = strNumber;
  }

  var isMinus = false;

  if (strHeadNumber.length > 0 && strHeadNumber.substr(0, 1) == "-")
  {
    isMinus = true;
    strHeadNumber = strHeadNumber.substr(1);
  }

  if (strHeadNumber.length > 3)
  {
    var mod = strHeadNumber.length % 3;
    output = (mod > 0 ? (strHeadNumber.substring(0,mod)) : '');

    for (i=0 ; i < Math.floor(strHeadNumber.length / 3); i++)
    {
      if ((mod == 0) && (i == 0))
        output += strHeadNumber.substring(mod+ 3 * i, mod + 3 * i + 3);
      else
        output+= ',' + strHeadNumber.substring(mod + 3 * i, mod + 3 * i + 3);
    }

    if (isMinus) output = "-" + output;
  }
  else
  {
    output = strHeadNumber;
    if (isMinus) output = "-" + output;
  }

  return output + strTailNumber;
}

function jf_RemoveComma(str)
{
  return str.replace(/,/g, "");
}

function jf_EventNumberCheck() {
    if (/[\d]/.test(String.fromCharCode(event.keyCode))) {
        return true;
    } else return false;
}

function jf_ConvHtmlStr(psStr)
{
  return psStr.replace(/ /g, "&nbsp");
}

function jf_GetFileExtention(fileName)
{
    var fileExt =  "";

    if (jf_AllTrim(fileName) != "" && fileName.lastIndexOf(".") > 0)
    {
        var idx = fileName.lastIndexOf(".");

        fileExt = fileName.substring(idx + 1, fileName.length);
    }

    return fileExt;
}

function jf_getToDay()
{
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();

    if(month<9)
    	month = '0'+month;

    if(day<9)
    	day = '0'+day;

    var date = year+"-"+month+"-"+day;

    return date;
}

function jf_getDate(strDate) {
  return new Date(parseInt(strDate.substr(6), 10), parseInt(strDate.substr(3, 2), 10)-1, parseInt(strDate.substr(0, 2), 10));
}

function jf_getToDayTime()
{
    var date = new Date();
    var hh = date.getHours();
    var mi = date.getMinutes();
    var ss = date.getSeconds();

    if(hh<9)
    	hh = '0'+hh;

    if(mi<9)
    	mi = '0'+mi;

    if(day<9)
    	ss = '0'+ss;

    var time = hh+":"+mi+":"+ss;

    return time;
}

/**
 *
 */
function jf_GetSearchDate(day)
{
    return _ShiftDate(_ToTimeObject(jf_getToDay()), 0, 0,day);
}

/**
 *
 */
function jf_GetSearchDateByDate(date, day)
{
    return _ShiftDate(_ToTimeObject(date), 0, 0,day);
}

/**
 */
function _ShiftDate(date,y,m,d)
{
    date.setFullYear(date.getFullYear() + y);
    date.setMonth(date.getMonth() + m);
    date.setDate(date.getDate() + d);

    return _ToTimeString(date);
}

/**
 */
function _ToTimeString(date)
{
    var year  = date.getFullYear();
    var month = date.getMonth() + 1;
    var day   = date.getDate();

    if (("" + month).length == 1) { month = "0" + month; }
    if (("" + day).length   == 1) { day   = "0" + day;   }

    return (year + "-" + month + "-" +day);
}

/**
 */
function _ToTimeObject(time)
{
    var year  = time.substr(0,4);
    var month = time.substr(5,2) - 1;
    var day   = time.substr(8,2);

    return new Date(year,month,day);
}


function jf_IsValidJuminNo(resno)
{
  var birthYear = "";
  var birthMonth = "";
  var birthDate = "";
  var birth = null;

  resno = jf_SkipSpaces(resno);

  fmt = /^\d{6}-[1234]\d{6}$/;

  if (!fmt.test(resno))
  {
    return false;
  }

  birthYear = (resno.charAt(7) <= "2") ? "19" : "20";
  birthYear += resno.substr(0, 2);
  birthMonth = resno.substr(2, 2) - 1;
  birthDate = resno.substr(4, 2);
  birth = new Date(birthYear, birthMonth, birthDate);

  if ( birth.getYear()%100 != resno.substr(0, 2) ||
       birth.getMonth() != birthMonth ||
       birth.getDate() != birthDate)
  {
    return false;
  }


  var buf = new Array(13);

  for (i = 0; i < 6; i++)
  {
    buf[i] = parseInt(resno.charAt(i), 10);
  }

  for (i = 6; i < 13; i++)
  {
    buf[i] = parseInt(resno.charAt(i + 1), 10);
  }

  var multipliers = [2,3,4,5,6,7,8,9,2,3,4,5];
  var sum = 0;
  var i = 0;

  for (i = 0, sum = 0; i < 12; i++)
  {
    sum += (buf[i] *= multipliers[i]);
  }

  if ((11 - (sum % 11)) % 10 != buf[12])
  {
    return false;
  }

  return true;
}

function jf_IsValidPost(post)
{
  fmt = /^\d{3}-\d{3}$/;

  if (!fmt.test(post))
    return false;

  return true;
}

function jf_IsValidEMail(email)
{
  fmt = /^([A-Za-z0-9!~.-])+@([A-Za-z0-9.!~-])+.([A-Za-z0-9.!~-])+$/;

  if (fmt.test(email) && (email.indexOf(".@") == -1) && (email.indexOf("@.") == -1))
  {
    return true;
  }

  return false;
}

function jf_IsValidTimeStr(timeStr)
{
  //fmt = /^\d{2}:\d{2}$/;

  var sHour = timeStr.substr(0,2);
  var sMin  = timeStr.substr(2,2);

  return ((parseInt(sHour, 10) > -1) && (parseInt(sHour, 10) < 24) && (parseInt(sMin, 10) > -1) && (parseInt(sMin, 10) < 60));
}

function _IsValidDateStr(dateStr)
{
  fmt = /^\d{4}\d{2}\d{2}$/;

  if (!fmt.test(dateStr))
  {
    return false;
  }

  var iYear = parseInt(dateStr.substr(0, 4), 10);
  var iMonth = parseInt(dateStr.substr(4, 2), 10);
  var iDay = parseInt(dateStr.substr(6, 2), 10);

  var aMonDays = new Array("31","28","31","30","31","30","31","31","30","31","30","31");

  if ((((iYear % 4) == 0) && ((iYear % 100) != 0)) || ((iYear % 400) == 0))
  {
    aMonDays[1] = "29";
  }

  if ((iYear < 1) || (iMonth < 1) || (iMonth > 12) || (iDay < 1) ||(iDay > parseInt(aMonDays[iMonth-1], 10)))
  {
    return false;
  }

  return true;
}

function _IsValidDateStrAU(dateStr)
{
  fmt = /^\d{2}\/\d{2}\/\d{4}$/;

  if (!fmt.test(dateStr))
  {
    return false;
  }

  var staYYYYMMDD = dateStr.substr(6) + dateStr.substr(3, 2) + dateStr.substr(0, 2);

  return (_IsValidDateStr(staYYYYMMDD));
}

function _IsValidTimeStr(timeStr)
{
  fmt = /^\d{2}\d{2}$/;

  if (!fmt.test(timeStr))
  {
    return false;
  }

  var iHH = parseInt(timeStr.substr(0, 2), 10);
  var iMI = parseInt(timeStr.substr(2, 2), 10);

  if ((iHH < 0) || (iHH > 24) || (iMI < 0) || (iMI > 60))
  {
    return false;
  }

  return true;
}

function jf_IsAlphabetic(psStr)
{
  fmt = /^[A-Za-z]+[A-Za-z]*$/;

  return fmt.test(psStr);
}

function jf_IsNumeric(psNum)
{
  fmt = /^\d+\d*$/;

  return fmt.test(psNum);
}

function jf_IsDecimal(psDec)
{
  fmt = /^\d+(\.|\d)\d*$/;

  return fmt.test(psDec);
}

function jf_IsValidDecimal(maxInt, maxDecimal, psDec)
{
  if(!jf_IsDecimal(psDec))
  {
    return false;
  }

  var decimalFields = psDec.split(".");

  var intValue = decimalFields[0];
  var decimalValue = decimalFields[1];

  if( String(intValue) != 'undefined')
  {
    fmt = eval("/^\\d{0,"+ maxInt +"}$/");

    if(!fmt.test(intValue))
    {
      return false;
    }
  }

  if( String(decimalValue) != 'undefined')
  {
    fmt = eval("/^\\d{0,"+ maxDecimal +"}$/");

    if(!fmt.test(decimalValue))
    {
      return false;
    }
  }

  return true;
}

function jf_ChkValue(value)
{
    var tmp = jf_SkipSpaces(value);

    if (tmp == "")
    {
      return false;
    }

    return true;
}

function jf_ChkForm(form, fieldlist)
{
  for (i = 0; i < fieldlist.length; i++)
  {
    if (eval("form." + fieldlist[i] + ".value") == "")
    {
        eval("form." + fieldlist[i]).focus();

        return false;
    }
  }

    return true;
}

function jf_ChkRadioOrCheckBox(input)
{
    if(input != null)
    {
        if (input.length > 1)
        {
            for (var inx = 0; inx < input.length; inx++)
            {
                if (input[inx].checked)
                {
                    return true;
                }
            }
        }
        else
        {
            if (input.checked)
            {
                return true;
            }
        }
    }

    return false;
}

function jf_CheckRadioOrCheckBox(input) {
  if (input.length) {
    for (var i = 0; i < input.length; i++) {
      input[i].checked = true;
    }
  } else {
    input.checked = true;
  }
}

function jf_UnCheckRadioOrCheckBox(input) {
  if (input.length) {
    for (var i = 0; i < input.length; i++) {
      input[i].checked = false;
    }
  } else {
    input.checked = false;
  }
}

function jf_fnSetSelectOption(input, val) {
  for (var i = 0; i < input.length; i++) {
    if (input.options[i].value == val) {
      input.selectedIndex = i;
      return;
    }
  }
}

function jf_fnSetSelectOption2(input, val) {
  for (var i = 0; i < input.length; i++) {
    if (input.options[i].text == val) {
      input.selectedIndex = i;
      return;
    }
  }
}

/**
 */
function jf_GetCheckedValue(input)
{
  if (input.length > 1)
  {
    for (var i = 0; i < input.length; i++)
    {
       if (input[i].checked)
       {
          return input[i].value;
       }
    }
  }
  else
  {
    if (input.checked)
    {
      return input.value;
    }
  }
}

function jf_GetSelectedValue(input)
{
	return input.options[input.selectedIndex].value;
}

function jf_EnableControl(target, frm, isEnabled)
{
  var fields = target.split(",");
  var node = null;

  for (var i in fields )
  {
    fields[i] = jf_SkipSpaces(fields[i]);

    if ( fields[i] == "" || !frm.elements[fields[i]])
      continue;

    node = frm.elements[fields[i]];

    if( node.type == 'text' )
      node.readOnly = !isEnabled;
    else
      node.disabled = !isEnabled;
  }
}

function jf_ShowDiv(target, isShow)
{
  if(isShow)
  {
  	eval(target + ".style.display = 'block'");
  }
  else
  {
  eval(target + ".style.display = 'none'");
  }
}

/**
 */
function jf_getCookie(cookieName)
{
    var i = 0;
    var arg  = cookieName + "=";
    var alen = arg.length;
    var clen = document.cookie.length;

    while(i < clen)
    {
        var j = i + alen;
        if(document.cookie.substring(i, j) == arg)
        {
            var end = document.cookie.indexOf(";", j);

            if(end == -1)
                end = document.cookie.length;

            return unescape(document.cookie.substring(j, end));
        }

        i = document.cookie.indexOf(" ", i) + 1;

        if (i==0)
            break;
    }

    return null;
}

/**
 */
function jf_setCookie(cookieName, cookieValue, expireDays)
{
    var today   = new Date();
    var expires = new Date();

    expires.setTime(today.getTime() + 1000*60*60*24*expireDays);

    document.cookie = cookieName + "=" + escape(cookievalue) + ((expires == null) ?  "" : (" ; expires=" + expires.toGMTString()));
}

function jf_Make2Array(length1, length2)
{
	var array = new Array(length1);

	for(var i=0; i<array.length; i++)
	{
		array[i] = new Array(length2);
	}

	return array;
}
