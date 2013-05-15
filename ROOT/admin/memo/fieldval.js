function ValidateLength(ElementName,DisplayName, MinLength)
{
	sValue=frmMain.elements(ElementName).value;
	
	if (sValue.length < MinLength )
	{
		alert(DisplayName + ' must be longer than ' + MinLength + ' characters.');
		bRetVal=false;
	}
	else
	{
		bRetVal=true;
	}
	
	return bRetVal;
}

function ValidateNonZeroLengthString(ElementName,DisplayName)
{
	sValue=frmMain.elements(ElementName).value;
	
	if (sValue.length==0)
	{
		frmMain.elements(ElementName).focus();
		alert('Input ' + DisplayName + '!');
		bRetVal=false;
	}
	else
	{
		bRetVal=true;
	}
	
	return bRetVal;
}

function ValidateUserid()
{
	bRetVal=true;

	if (ValidateNonZeroLengthString('userid','User ID'))
	{
		if (ValidateLength('userid', 'User ID', 3))
		{
			if (ValidateCharacters(frmMain.elements('userid').value)==false)
			{
				frmMain.elements('userid').focus();
				alert('Only a-z, 0-9 or \'_\' allowed in userid field..');
				bRetVal=false;
			}
		}
	}
	else
	{
		bRetVal=false;
	}
	
	return bRetVal;
}

function ValidatePassword()
{
	bRetVal=true;

	if (ValidateNonZeroLengthString('password','Password'))
	{
		if (ValidateCharacters(frmMain.elements('password').value)==false)
		{	
			frmMain.elements('password').focus();
			alert('Only a-z, 0-9 or \'_\' allowed in password field..');		
			bRetVal=false;
		}
	}
	else
	{
		bRetVal=false;
	}

	return bRetVal;
}

function ValidateCharacters(Value)
{
	bRetVal=true;

	for (i=0;i<Value.length;i++) 
	{
		if ('abcdefghijklmnopqrstuvwxyz1234567890_'.lastIndexOf(Value.substr(i,1))==-1)
		{	
			bRetVal=false;
		}
	}
	
	return bRetVal;
}

function ValidateNumeric(ElementName,DisplayName,PositiveOnly,IntegerOnly)
{
	bRetVal=false;

	dValue=parseFloat(frmMain.elements(ElementName).value);
	iValue=parseInt(frmMain.elements(ElementName).value);

	if (isNaN(dValue))
	{
		frmMain.elements(ElementName).focus();
		alert(DisplayName + ' must be numeric!');
	}
	else
	{
		if (PositiveOnly && dValue<0)
		{
			frmMain.elements(ElementName).focus();
			alert(DisplayName + ' must be positive!');
		}
		else
		{
			if (IntegerOnly && (parseFloat(iValue)!=dValue))
			{
				frmMain.elements(ElementName).focus();
				alert(DisplayName + ' must be an integer!');
			}
			else
			{
				bRetVal=true;
			}
		}
	}

	return bRetVal;
}
