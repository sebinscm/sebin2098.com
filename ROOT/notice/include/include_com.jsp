<%!
//-------------------------------------------
// CheckNull
//       - If Input is Null, Write Space
//   obj : RecordSet
//-------------------------------------------

String CheckNull(String str)
{
  String strTmp;
	if (str == null)
		strTmp = "";
	else
		strTmp = str;
  return strTmp;
}

//----------------------------------------------------
// SelectBoxCheck
//   conn : Connection Object
//----------------------------------------------------
String[] SelectBoxCheck(String qry_cond, String[] qry_cond_value) throws SQLException
{
  String selectBox_check[];
  selectBox_check = new String[qry_cond_value.length];

  for(int i=0; i < selectBox_check.length; i++)
  {
	  if(qry_cond != null && qry_cond.equals(qry_cond_value[i]))
	  {
		selectBox_check[i] = "SELECTED";
	  }
	  else
	  {
	  	selectBox_check[i] = "";
	  }
  }
  return selectBox_check;
}

//-------------------------------------------
// CopyRightLogo
//
//-------------------------------------------
String CopyRightLogo()
{
  String str;
  str = "<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center' >";
  str += "<tr><td width='100%' height='2' align='center' colspan='2'>";
  str += "<HR color='#5BA3C1' width=100% size=1></td></tr>";
  str += "<tr><td width='40%'align='right'><img src='/img/sebin_small.jpg'></td>";
  str += " <td width='60%' align='left'><FONT size=2 color=778899>";
  str += "&copy;Copyright 2011 ";
  str += "Sebin Trading Enterprise Co,. Ltd. All Rights Reserved.<BR>";
  str += "Contact to <FONT color=blue><A href='mailto:scm@sebin2098.com'>scm@sebin2098.com</A>";
  str += " for more information.</FONT>";
  str += "</td></tr></table>";

  return (String)str;
}

//-------------------------------------------
// Redirect
//
//-------------------------------------------
String Redirect(String url)
{
	String str = "<META http-equiv='refresh' content='0;url="+url+"'>";
	return str;
}

//-------------------------------------------
// GetPageIndex
//       - Get File Path
//   file_path : Input File Path
//   file_name : Input File Name
//   out_str   : Output file path
//-------------------------------------------
String GetPageIndex(int curpage, int totpage, String url, String add_tag)
{

  int idx, i, idxpage, tmp, tmp2, tmp3;
  String outStr="";
  if (add_tag == null) add_tag = "";
  idx = curpage / 10 + 1;
	for(i=0; i<=9; i++)
	{
		idxpage = (idx-1)*10 +i;
		if(idxpage !=0 && idxpage <= totpage)
		{
			if(idxpage == curpage)
			{
				if (i==0)
				{
					tmp = idxpage-1;
          outStr = outStr + "<FONT size=2>";
          outStr = outStr + "<A HREF='"+url+"?page=1"+add_tag+"' ";
          outStr = outStr + ">#</A>&nbsp;";
          outStr = outStr + "<A HREF='"+url+"?page="+tmp+add_tag+"' ";
          outStr = outStr + "><-</A>";
          outStr = outStr + "<FONT size=2>[<B>"+idxpage+"</B>]";
        }
        else if (i==9)
				{
						tmp = idxpage+1;
						tmp2 = idxpage-1;
						tmp3 = totpage;
            outStr = outStr + "<FONT size=2>";
            outStr = outStr + "<FONT size=2>[<B>"+idxpage+"</B>]";
						if (totpage >= tmp )
						{
            	outStr = outStr + "<A HREF='"+url+"?page="+tmp+add_tag+"' ";
            	outStr = outStr + ">-></A>";
            	outStr = outStr + "&nbsp;<A HREF='"+url+"?page="+tmp3+add_tag+"' ";
            	outStr = outStr + ">#</A>";
						}
        }
        else
        {
          outStr = outStr + "<FONT size=2>[<B>"+idxpage+"</B>]";
        }

			}
			else
			{
				if (i==0)
				{
					  tmp = idxpage-1;
            outStr = outStr + "<FONT size=2>";
            outStr = outStr + "<A HREF='"+url+"?page=1"+add_tag+"' ";
            outStr = outStr + ">#</A>&nbsp;";
            outStr = outStr + "<A HREF='"+url+"?page="+tmp+add_tag+"' ";
            outStr = outStr + "><-</A>";
            outStr = outStr + "[<A HREF='"+url+"?page="+idxpage+add_tag+"' ";
            outStr = outStr + ">"+idxpage+"</A>]";
        }
        else if (i==9)
				{
						tmp = idxpage+1;
						tmp2 = totpage;
            outStr = outStr + "<FONT size=2>";
            outStr = outStr + "[<A HREF='"+url+"?page="+idxpage+add_tag+"' ";
            outStr = outStr + ">"+idxpage+"</A>]";
						if (totpage >= tmp )
						{
            	outStr = outStr + "<A HREF='"+url+"?page="+tmp+add_tag+"' ";
            	outStr = outStr + ">-></A>";
            	outStr = outStr + "&nbsp;<A HREF='"+url+"?page="+tmp2+add_tag+"' ";
            	outStr = outStr + ">#</A>";
						}
        }
        else
        {
            outStr = outStr + "<FONT size=2>";
            outStr = outStr + "[<A HREF='"+url+"?page="+idxpage+add_tag+"' ";
            outStr = outStr + ">"+idxpage+"</A>]";
        }
			}
		}
	}
	return outStr;
}

//-------------------------------------------
// ascToksc
//       - Get File Path
//   out_str   : Output file path
//-------------------------------------------
String ascToksc(String str) throws UnsupportedEncodingException
{
		if(str==null)
			return null;

		return new String(str.getBytes("8859_1"),"KSC5601");
}

//-------------------------------------------
// kscToasc
//       - Get File Path
//   out_str   : Output file path
//-------------------------------------------
String kscToasc(String str) throws UnsupportedEncodingException
{
		if(str==null)
			return null;

		return new String(str.getBytes("KSC5601"),"8859_1");
}

//-------------------------------------------
// convertHtmlBr
//       - Get File Path
//   out_str   : Output file path
//-------------------------------------------
String convertHtmlBr(String comment)
	{
		int length = comment.length();
		StringBuffer buffer = new StringBuffer();

		for (int i = 0; i < length; ++i)
		{
			String comp = comment.substring(i, i+1);
			if ("\r".compareTo(comp) == 0)
			{
				comp = comment.substring(++i, i+1);
				if ("\n".compareTo(comp) == 0)
					buffer.append("<BR>\r");
				else
					buffer.append("\r");
			}
                        buffer.append(comp);
		}
		return buffer.toString();
	}
%>
