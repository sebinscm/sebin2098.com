function Setprogress(Percent) 
{ 
 var obj1 = document.all.progress1; 
    var obj2 = document.all.progress2; 
 var obj3 = document.all.progress_rate; 

    if(Percent != 0) 
     obj1.width = Percent + "%"; 
    if(Percent != 100) 
        obj2.width = (100 - Percent) + "%"; 
        obj3.innerHTML = Percent + "%"; 
} 

//HTML
<form name="form1"> 
<table align="center" border="1" cellspacing="0" width="400" bordercolordark="white" bordercolorlight="black"> 
 <tr> 
     <td width="100%" height="20"> 
         <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="blue"> 
             <tr> 
                 <td width="100%" colspan="2" align="left" bgcolor="white"> Progress status</td> 
                </tr> 
                <tr> 
                    <td id="progress1" height="20" width="0%"    bgcolor="blue"  align="center"> 
                    <font color="white"><b><label id="progress_rate"></label></b></font></td> 
                    <td id="progress2" height="20" width="100%"  bgcolor="white" align="center"></td> 
                </tr> 
             </table> 
       </td> 
    </tr> 
</table> 
<% 
int i=0;
String nPercent = "%";
for (i=0; i<1000; i++) {
    
     out.println("<script language=\"javascript\">"); 
        out.println("Setprogress(" + nPercent + ");"); 
     out.println("</script>"); 
        out.flush(); 
 } 
%> 
<br> 
<p align="center"><span style="font-size:20pt;"><b><font color="blue">Process completed!!</font></b></span></p><br> 
<a href="javascript:window.close()"><img src="../Images/btn_close.gif" border="0"></a> 
</form> 
