/**
* Stringo???? ????? ?????????? ??????static utility class <br>
* ???method?? static <br>
* History <br>
* Create  2006/10/03
* @author 
* @version  1.00, 2006/10/03
**/
package common.util;

import java.io.UnsupportedEncodingException;
import java.util.*;
import java.text.*;

public class StringUtil
{
    /**
    * 2-bytes ???????? ??????? ??? ?????????.
    * 
    * @param           str       ???? String.
    * @param           size     ??????? ??? ????
    * @return            ????? ????? ??? String.
    */

    public static String cutString(String str, int size)
    {
        if (size < 0)
        {
            return "...";
        }

        byte[] bytes = str.getBytes();

        if (bytes.length <= size)
        {
            return str;
        }

        int cut_size = size;
        int first_ascii_idx = size;

        if (bytes[size - 1] < 0)
        { // non ascii
            first_ascii_idx = 0;

            for (int i = size - 2; i >= 0; i--)
            {
                if (bytes[i] > 0)
                {
                    first_ascii_idx = i + 1;

                    break;
                }
            }

            int j = first_ascii_idx;

            while (j <= size)
            {
                cut_size = j;
                
                j += 2;
            }
        }
        
        try
        {
            String tempStr = new String(bytes, 0, cut_size, "KSC5601");

            return tempStr + "..";
        }
        catch (java.io.UnsupportedEncodingException uee)
        {
            return str + "...";
        }
    }

    /*
     * \r\n ?? html?? <br>?? conver???
     */
    public static String convertHtmlBr(String comment)
    {
        //**********************************************************************
        if (comment == null)
        {
            return "";
        }

        int length = comment.length();

        StringBuffer buffer = new StringBuffer();

        for (int i = 0; i < length; i++)
        {
            String tmp = comment.substring(i, i + 1);

            if ("\r".compareTo(tmp) == 0)
            {
                tmp = comment.substring(++i, i + 1);

                if ("\n".compareTo(tmp) == 0)
                {
                    buffer.append("<br>\r");
                }
                else
                {
                    buffer.append("\r");
                }
            }

            buffer.append(tmp);
        }

        return buffer.toString();
    }

    public static String convertTextToHtml(String text)
    {
        if (text == null)
        {
            return "";
        }

        //return (text.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
        //            .replaceAll("\"", "&quot;").replaceAll("\n", "<br>"));
        return (text.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
                    .replaceAll("\"", "&quot;").replaceAll("\r\n", "<br>").replaceAll("\n\r", "<br>").replaceAll("\r", "<br>").replaceAll("\n", "<br>"));
    }
    
    public static String convertTextToXML(String text)
    {
      if (text == null) {
        return null;
      }
      
      return (text.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
                .replaceAll("\"", "&quot;").replaceAll("'", "&apos;"));
    }

    /**
    * delimeter?? ??,??,?? ?? ??????? ??????.
    * @param  value HHMMSS?? ??????? ??? String
    * @return ??????? ?????? ?? ?????
    **/
    public static String formatTime(String value, String delimeter)
    {
        if (value.length() != 6)
        {
            return "";
        }

        StringBuffer sb = new StringBuffer(value.substring(0, 2));

        sb.append(delimeter).append(value.substring(2, 4)).append(delimeter).append(value.substring(4, 6));

        return sb.toString();
    }

    // Empty checks
    //-----------------------------------------------------------------------
    /**
     * <p>Checks if a String is empty ("") or null.</p>
     * 
     * <pre>
     * StringUtils.isEmpty(null)      = true
     * StringUtils.isEmpty("")        = true
     * StringUtils.isEmpty(" ")       = false
     * StringUtils.isEmpty("bob")     = false
     * StringUtils.isEmpty("  bob  ") = false
     * </pre>
     *
     * <p>NOTE: This method changed in Lang version 2.0.
     * It no longer trims the String.
     * That functionality is available in isBlank().</p>
     * 
     * @param str  the String to check, may be null
     * @return <code>true</code> if the String is empty or null
     */
    public static boolean isEmpty(String str)
    {
        return (str == null || str.length() == 0);
    }

    /**
    * String????????????????? null( ""?? ???)?? ??????? ??²O
    * ??u?? ????? ???.
    * @param  value null???? ????? ??? ??? ???    * @param  replacer  value?? null?? ??²O??u?? ??
    * @return value value?? null?? ????Äî??value, null???Äî??replacer?? ?????.
    **/
    public static String nvl(String value, String replacer)
    {
        if (value == null)
        {
            return replacer;
        }
        else
        {
            return value;
        }
    }

    /**
    * ???????? ????????? ','?? ?????? ???. ?????????? u????? ????.
    * @param  value comma?? ????? ??? String
    * @return ????? ???? ,?? ??? ??? String
    **/
    public static String formatNumber(String value)
    {
        if (value == null || value.equals(""))
        {
            value = "0";

            return value;
        }
        if (value.length() <= 3)
        {
            return value;
        }
        else
        {
            String remainder = value.substring(value.length() - 3, value.length());

            return formatNumber(value.substring(0, value.length() - 3)) + "," + remainder;
        }
    }

    /**
    * ???????? ????????? ','?? ?????? ???.
    * @param  value comma?? ????? ??? ????
    * @return ????? ???? ,?? ??? ??? String
    **/
    public static String formatNumber(int value)
    {
        return formatNumber(String.valueOf(value));
    }

    public static String formatNumber(long value, String pattern)
    {
        DecimalFormat df = new DecimalFormat(pattern);
        return df.format(value);
    }

    public static String formatNumber(double value, String pattern)
    {
      DecimalFormat df = new DecimalFormat(pattern);
        return df.format(value);
    }

    /**
    * 999,999,999 ??? 999,999,999.99 format???? ?????? ???
    * ','?? ?????????????
    * @param value String type?? ??????
    * @return String ???? format???? ????? ??????
    */
    public static String numberFormat(String value)
    {
        if (value == null)
        {
            return "err-numberFormat(null)";
        }

        StringBuffer res = new StringBuffer();

        StringTokenizer st = new StringTokenizer(value, ",");

        try
        {
            while (st.hasMoreTokens())
            {
                res.append(st.nextToken());
            }
        }
        catch (NoSuchElementException nse)
        {}

        return res.toString();
    }

    /**
    * ???????? ???(0????)??? ???????.
    * @param  value ????? ??? String
    * @return ???? ?????
    **/
    public static String formatTel2(String value)
    {
        return formatTel2(value, null);
    }

    /**
    * ???????? ???(0????)??? ???????.
    * @param  value ????? ??? String
    * @param  delimeter ?????????? ??????? ????( eg. '-'...)
    * @return value ???? ?????
    **/
    public static String formatTel2(String value, String delimeter)
    {
        if (value == null || value.equals("") || value.length() != 8)
            return "";
        else if (value.startsWith("0"))
        {
            if (delimeter != null)
                value = value.substring(1, 4) + delimeter + value.substring(4);
            else
                value = value.substring(1);
            return value;
        }
        else
        {
            if (delimeter != null)
                value = value.substring(0, 4) + delimeter + value.substring(4);
            return value;
        }
    }

    /**
    * ????????? ??????? ?????????????(0????)??? ???????.
    * @param  value ????? ??? String
    * @param  gubun ??????????? ????????????????????? ??????( R or H )
    * @return ???? ?????
    **/
    public static String formatTel1(String value, String gubun)
    {
        if (value == null || value.equals("") || value.length() != 4)
            return "";
        else if (gubun.equalsIgnoreCase("R") && value.equals("0002"))
            return "02";
        else
            return value.substring(1);
    }

    /**
    * ??????? ??? ??? 0?? ??????? ???????.
    * @param  value ????? ??? String
    * @return value ???? ?????
    **/
    public static String firstZeroDel(String value)
    {
        if (value == null || value.equals(""))
            return "";
        while (value.startsWith("0"))
        {
            value = value.substring(1);
        }
        return value;
    }

    /**
    * 8859-1?? euc-kr?? ????.
    * @param  str ??????? ????? String
    * @return ???????????
    **/
    public static String toKorean(String str)
    {
        try
        {
            if (str != null)
                str = new String(str.getBytes("8859_1"), "euc-kr");
        }
        catch (UnsupportedEncodingException e)
        {
            return "ENCORDING ERROR";
        }

        return str;
    }

    /**
    * euc-kr?? 8859-1?? ????.
    * @param  str ??????? ????? String
    * @return ???????????
    **/
    public static String toEnglish(String str)
    {
        try
        {
            if (str != null)
                str = new String(str.getBytes("euc-kr"), "8859_1");
        }
        catch (UnsupportedEncodingException e)
        {
            return "ENCORDING ERROR";
        }

        return str;
    }

    /**
    * ???????? ????????? '-'?? ?????? ???.
    * @param  value ????? ??? String
    * @return ???? ?????
    **/
    public static String formatCard(String value)
    {
        if (value == null || value.equals("") || value.length() != 16)
            return value;
        else
            return value.substring(0, 4) + "-" + value.substring(4, 8) + "-" + value.substring(8, 12) + "-" + value.substring(12, 16);
    }

    public static String replace(String str, String sourceStr, String targetStr)
    {
        if (str == null || sourceStr == null || targetStr == null || str.length() == 0 || sourceStr.length() == 0)
        {
            return str;
        }

        int position = 0;
        int sourceStrLength = sourceStr.length();
        int targetStrLength = targetStr.length();

        while (true)
        {
            if ((position = str.indexOf(sourceStr, position)) != -1)
            {
                if ((position + sourceStrLength) < str.length())
                {
                    str = str.substring(0, position) + targetStr + str.substring(position + sourceStrLength);
                }
                else
                {
                    str = str.substring(0, position) + targetStr;
                }

                position = position + targetStrLength;

                if (position > str.length())
                {
                    position = str.length();
                }
            }
            else
            {
                break;
            }
        }

        return str;
    }

    public static String replaceNull(String str)
    {
        if (str != null)
        {
            return str;
        }
        else
        {
            return "";
        }
    }

    public static String replaceContentString(String str)
    {
        if (str != null && str.length() > 0)
        {        
            str = replace(str, "&qquot;", "'");
            str = replace(str, "&amp;", "&");
            str = replace(str, "<!--<p>-->", "");
        }

        return str;
    }

    public static String replaceScriptString(String str)
    {
        if (str != null && str.length() > 0)
        {
            str = replace(str, "\\", "\\\\");
            str = replace(str, "'", "\\'");
            str = replace(str, "\"", "\\\"");
        }

        return str;
    }

    public static String replaceSQLString(String str)
    {
        if (str != null && str.length() > 0)
        {
            //str = replace(str, "'", "''");
        }

        return str;
    }

    //?????? - ??????
    public static java.util.Vector getTokens(String str, String delim)
    {
        if (str == null || delim == null || str.equals("") || delim.equals(""))
            return null;

        java.util.Vector v = new java.util.Vector();

        java.util.StringTokenizer st = new java.util.StringTokenizer(str, delim);
        while (st.hasMoreTokens())
        {
            v.addElement(st.nextToken());
        }
        return v;
    }

    //?????? - ??????
    //String[] ?? ???? Vector ???¡¤? ??????.
    public static java.util.Vector getVector(String[] str)
    {

        java.util.Vector v = new java.util.Vector();

        for (int i = 0; i < str.length; i++)
        {

            v.addElement(str[i]);
        }

        return v;
    }

    // ??? - ????    // ????? ??????? ??????string ???? ??? HaspMap ???¡¤? ??????.
    // ex) a=b&c=d&e=f ?? ??????? &?? =?? ??? name value ?????? HashMap???? ??????.
    public static HashMap getTokens(String str, String delim1, String delim2)
    {
        if (str == null || delim1 == null || delim2 == null || str.equals("") || delim1.equals("") || delim2.equals(""))
        {
            return null;
        }
        
        HashMap map = new HashMap();
        String[] tokens = str.split(delim1);
        for (int i = 0; i < tokens.length; i++)
        {
            if (tokens[i].length() > 0)
            {
                String[] token = tokens[i].split(delim2);
                
                // key?? ???? ??Äî????????.
                if (token[0].length() > 0)
                {
                    // key?? ??? ??? value?? "" 
                    map.put(token[0], token.length < 2 ? "" : token[1]);
                }
            }
        }
        
        return map;
    }

    /**
     * String?? Delim?? ???????? Token???? ?¬Ú??? ?? Vector?? ???Return??? Method.
     * StringTokenizer?? ??????? ?????? ????
     * String test = "a,b,c,,d"
     * ?? ???????StringTokenizer?? c??d?????? ???? ??????.
     * ??? ???? ????? ???¢¯¨ö????o??????????????
     * 
     * @param strString
     * @param strDelimeter
     * @return
     */
    public static Vector getSplit(String strString, String strDelimeter)
    {
      Vector vResult = new Vector();
      int nCount = 0, nLastIndex = 0;

      try
      {

        if(strString == null) return vResult;          
          
        nLastIndex = strString.indexOf(strDelimeter);

        if (nLastIndex == -1)
        {
          if(strString.length() > 0) vResult.add(0,strString);
        }
        else
        {
          while ((strString.indexOf(strDelimeter) > -1))
          {
            nLastIndex = strString.indexOf(strDelimeter);
            vResult.add(nCount, strString.substring(0,nLastIndex));
            strString = strString.substring(nLastIndex + strDelimeter.length(), strString.length());
            nCount ++;
          }
          vResult.add(nCount, strString);
        }
      }
      catch (Exception e)
      {
        System.out.println(e.toString());
        return null;
      }

      return vResult;
    }

}
