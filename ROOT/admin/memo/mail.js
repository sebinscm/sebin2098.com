function select_vg(form)
{
    for( var i=0; i < form.elements.length ; i++ )
    {
        var e = form.elements[i];
        if( (e.name != 'switch') && (e.type == 'checkbox') && e.name.substring(0,1) == 'V' )
            e.checked = true;
    }
}

function select_combine(form)
{
    for( var i=0; i < form.elements.length ; i++ )
    {
        var e = form.elements[i];
        if( (e.name != 'switch') && (e.type == 'checkbox') && e.name.substring(0,1) == 'C' )
            e.checked = true;
    }
}

function select_temt(form)
{
    for( var i=0; i < form.elements.length ; i++ )
    {
        var e = form.elements[i];
        if( (e.name != 'switch') && (e.type == 'checkbox') && e.name.substring(0,1) == 'T' )
            e.checked = true;
    }
}

function select_buss(form)
{
    for( var i=0; i < form.elements.length ; i++ )
    {
        var e = form.elements[i];
        if( (e.name != 'switch') && (e.type == 'checkbox') && e.name.substring(0,1) == 'B' )
            e.checked = true;
    }
}

function select_all(form)
{
    for( var i=0; i < form.elements.length ; i++ )
    {
        var e = form.elements[i];
        if( (e.name != 'switch') && (e.type == 'checkbox') )
            e.checked = true;
    }
}

function cancel_all(form)
{
    for( var i=0; i < form.elements.length ; i++ )
    {
        var e = form.elements[i];
        if( (e.name != 'switch') && (e.type == 'checkbox') )
            e.checked = false;
    }
}

function recv_window()
{
    url = "mail_address.jsp"
    window.open(url,"receiver","toolbar=no,menubar=no,resizable=yes, scrollbars=yes, width=800,height=600")
}

function add_receiver()
{
    var num = frmMain.receiver_select.selectedIndex;
    frmMain.receiver.value += frmMain.receiver_select.options[num].value + " ";
    frmMain.receiver_name.value += frmMain.receiver_select.options[num].text + ",";
}

function send()
{
    if( ValidateFields())
    {
        frmMain.submit();
    }
}

function ValidateFields()
{
    bRetVal=false;

    if (ValidateReceiver("receiver"))
    {
        if (ValidateLength("title","Subject",1))
        {
            bRetVal=true;
        }
    }
    return bRetVal;
}

function reset()
{
	frmMain.reset();
}

function Cancel()
{
    parent.window.close();
}

function ValidateReceiver(ElementName)
{
    sValue=frmMain.elements(ElementName).value;

    if (sValue.length < 1 )
    {
        alert("More than 1 receiver is required.");
        bRetVal=false;
    }
    else
    {
        bRetVal=true;
    }

    return bRetVal;
}
