function isEmpty(str,name)
{
	var retval=true;
	var count=0;
	if (str.value=="")
		{
			alert(name);
			str.focus();
			retval=false;
		}
	else
		{
			for(i=0;i<str.value.length;i++)
			{
				if(str.value.charAt(i)==" ")
				count++;
			}
			if (count==str.value.length)
			{
				alert(name);
				str.focus();
				retval=false;
			}
		}
	return retval;
}

function isValidChars(str,name)
{
	var invalidchars=",#$%^&*()!~`+\|=[{]};:'<>?/";
	var retval=true;
	var i;
	for (i=0;i<invalidchars.length;i++)
		if (str.value.indexOf(invalidchars.charAt(i)) > -1)
		{
			alert(name);
			str.value="";
			str.focus();
			retval=false;
		}
	return retval;
}	

function IsEmailValid(str,name)
{
	var retval=true;
	var AtSym=str.value.indexOf('@');				
	var Period=str.value.lastIndexOf('.');		
	var Space=str.value.indexOf(' ');				
	var Length=str.value.length-1;
	var index = str.value.indexOf('@');
    var substr = str.value.substring(index+1);
    var index2 = substr.indexOf('@');
	var count=0;
	if (str.value=="")
		{
			alert("Please enter Email");
			str.focus();
			retval=false;
		}
	else
		{
			for(i=0;i<str.value.length;i++)
			{
				if(str.value.charAt(i)==" ")
				count++;
			}
			if (count==str.value.length)
			{
				alert("Please enter Email");
				str.focus();
				retval=false;
			}
			else if((AtSym<1)||	       //'@' can't be in first position
		(Period<=AtSym+1)||					//Must be atleast one valid char between '@' and '.'
		(Period==Length)||					//Must be atleast one valid char after '.'
		((Space>0) && (Space!=Length))||
		(index2 != -1))                       //No empty spaces permitted
		{
			alert(name);
			str.focus();
			retval=false; 
		}
	}
return retval;
}

function matching(str1,str2,name)
{
	var retval=true;
	if (str1.value != str2.value)
	{
		alert(name);
		str2.focus();
		retval=false;
	}
	return retval;
}
function secmatching(str1,str2,name)
{
	var retval=true;
	
	if (str1.value != str2.value)
	{
		alert(name);
		str1.focus();
		retval=false;
	}
	return retval;
}


function isEmptyLbox(str,name)
{
	var retval=true;
	if (str.value=="0")
	{
		alert(name);
		str.focus();
		retval=false;
	}
	return retval;
}

function isDOBvalid(Day,Month,Year,name)
{
var ArrDays=new Array(31,28,31,30,31,30,31,31,30,31,30,31);
if (Year.value%4==0)													
{
	ArrDays[1]=29;			
}
if ( Day.value > ArrDays[Month.value-1])			
{
		ArrDays[1]=28;
		alert("Enter Valid Date " + name);
		Day.focus();
		return false;
}
}
function isValidPhone(str,name)
{
 var retval=true;
  var num="1234567890-";
 var i; 
 //alert(num.charAt(i));  
 for(i=0; i<str.value.length; i++)
	 { 
	  if(num.indexOf(str.value.charAt(i)) < 0 || num.indexOf(str.value.charAt(i)) >num.length )
		  {
		  //alert(name);
		  str.focus(); 
		  retval = false;
		  }
		}
	 if (retval == false)
		  {
			  alert(name);
		  }
	  
 return retval;
 } 

 function isValidZip(country,str,name)
	{
	 var retval=true;
	 var nm=0;
	 var alp=0;

	  var num="1234567890";
	  var alpha="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	  var i; 
 //alert(num.charAt(i));  
 for(i=0; i<str.value.length; i++)
	 { 
	      if(num.indexOf(str.value.charAt(i)) >= 0 && num.indexOf(str.value.charAt(i)) <num.length )
		  {
			  nm++;
			  str.focus(); 
		  }
		  else if(alpha.indexOf(str.value.charAt(i)) >= 0 && alpha.indexOf(str.value.charAt(i)) <alpha.length )
		  {
			  alp++;
			  str.focus(); 
		  }
	 }
	if(country.value !='US' && nm==0)
	 {
		retval=false;
		 alert(name);
	 }
	 else if(country.value =='US' && alp!=0)
	 {
		 retval=false;
		 alert(name);
	 }

 return retval;
 } 
 function isNumeric(str,name)
{
 var retval=true;
  var num="1234567890";
 var i; 
 //alert(num.charAt(i));  
 for(i=0; i<str.value.length; i++)
	 { 
	  if(num.indexOf(str.value.charAt(i)) < 0 || num.indexOf(str.value.charAt(i)) >num.length )
		  {
		  //alert(name);
		  str.focus(); 
		  retval = false;
		  }
		}
	 if (retval == false)
		  {
			  alert(name);
		  }
	  
 return retval;
 } 

  function isAlphaNumeric(alphane,name)
{
	var numaric = alphane;
	for(var j=0; j<numaric.value.length; j++)
		{
		  var alphaa = numaric.value.charAt(j);
		  var hh = alphaa.charCodeAt(0);
		  if((hh > 47 && hh<59) || (hh > 64 && hh<91) || (hh > 96 && hh<123))
		  {
		  }
		else	{
			alphane.value="";
			alphane.focus(); 
			alert(name);
			 return false;
		  }
		}
 return true;
}

