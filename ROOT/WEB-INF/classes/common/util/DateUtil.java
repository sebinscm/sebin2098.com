/*
 * Created on 2006. 10. 3.
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package common.util;

import java.util.*;
import java.text.SimpleDateFormat;
import org.joda.time.DateTime;

/**
 * @author
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class DateUtil
{
    public  static String getToday(String _format)
    {
        Date date = new Date();
        SimpleDateFormat sdate  = new SimpleDateFormat(_format);

        return  sdate.format(date);
    }

    public static String getFmtDateString(Date _date, String _format)
    {
        SimpleDateFormat sdate  = new SimpleDateFormat(_format);

        return sdate.format(_date);
    }

    public static String getFmtDateString(String _date, String _format)
    {
        Date date =  getDateValue(_date);

        return getFmtDateString(date, _format);
    }

    public static String getDelimDateString(String _date, String _delim)
    {
        String unFmtDate = getUnFmtDateString(_date);

        StringBuffer buf = new StringBuffer();

        buf.append(unFmtDate.substring(0,4));
        buf.append(_delim);
        buf.append(unFmtDate.substring(4,6));
        buf.append(_delim);
        buf.append(unFmtDate.substring(6,8));

        return buf.toString();
    }

    public static Date getParsedDate(String _date, String _format)
      throws Exception
    {
        SimpleDateFormat sdate  = new SimpleDateFormat(_format);

        return sdate.parse(_date);
    }

    public static Date getDateValue(String _date)
    {
        Calendar cal = Calendar.getInstance();

        String unFmtDate = getUnFmtDateString(_date);

        cal.set(Integer.parseInt(unFmtDate.substring(0,4)),Integer.parseInt(unFmtDate.substring(4,6))-1, Integer.parseInt(unFmtDate.substring(6,8)));

        return new Date(cal.get(Calendar.YEAR)-1900, cal.get(Calendar.MONTH), cal.get(Calendar.DAY_OF_MONTH));

    }

    public static String getUnFmtDateString(String fmtDate)
    {
        StringBuffer buf = new StringBuffer();

        for(int i=0; i<fmtDate.length(); i++)
        {
            if(fmtDate.charAt(i)!='-')
            {
                buf.append(fmtDate.charAt(i));
            }
        }

        return buf.toString();
    }

    /**
     * 주어진 date/time과 year년 month월 day일 차이나는 시각을 리턴한다.
     *
     * <pre>
     * 사용예)
     * //현재로부터 10일 전의 date/time
     * Date newDate = DateUtil.shift(new Date(), 0,0,-10);
     * </pre>
     *
     * @param date date/time
     * @param year
     * @param month
     * @param day
     * @return relative date/time
     */
    public static Date getRelativeDate(Date _date, int _year, int _month, int _day)
    {
        Calendar cal = Calendar.getInstance();

        cal.setTime(_date);

        cal.add(Calendar.YEAR, _year);
        cal.add(Calendar.MONTH, _month);
        cal.add(Calendar.DAY_OF_MONTH, _day);

        return cal.getTime();
    }

    /**
     * 현재 시각과 year년 month월 day일 차이나는 시각을 리턴한다.
     * <p>
     * 리턴되는 포맷은 'yyyyMMdd' 이다.
     * <pre>
     * 사용예)
     * //현재 시각이 '20031001'이면 10일 전 시각인 '20030921'을 리턴
     * String date = DateUtil.getRelativeDate(0,0,-10);
     *
     * @param year
     * @param month
     * @param day
     * @return relative date string("yyyyMMdd")
     */
    public static String getRelativeDateString(Date _date, int _year, int _month, int _day, String _format)
    {
        Date relativeDate = getRelativeDate(_date, _year, _month, _day);

        return getFmtDateString(relativeDate, _format);
    }

	  /////////////////////////////////////////////////////////////////////
  	public static int getThisYear() {
  		return Calendar.getInstance().get(Calendar.YEAR);
  	}

  	public static int getThisMonth() {
  		return (Calendar.getInstance().get(Calendar.MONTH)+1);
  	}

  	public static int getThisDate() {
  		return (Calendar.getInstance().get(Calendar.DAY_OF_MONTH));
  	}

  	public static int getThisDay() {
  		return (Calendar.getInstance().get(Calendar.DAY_OF_WEEK));
  	}

  	public static String getThisMonthName() {
  		return getMonthName(getThisYear(), getThisMonth());
  	}

  	public static int getDay(int year, int month) {
  		Calendar rightNow = Calendar.getInstance();
  		rightNow.set(year, month-1, 1);
  		return (rightNow.get(Calendar.DAY_OF_WEEK));
  	}

  	public static int getLastDate(int year, int month) {
  		Calendar rightNow = Calendar.getInstance();
  		rightNow.set(year, month-1, 1);
  		rightNow.add(Calendar.MONTH, 1);
  		rightNow.add(Calendar.DAY_OF_MONTH, -1);

  		return rightNow.get(Calendar.DAY_OF_MONTH);
  	}

  	public static String getMonthName(int year, int month) {
  		String monthName = "";
  		Calendar rightNow = Calendar.getInstance();
  		rightNow.set(year, month-1, 1);

  		int tmpMonth = rightNow.get(Calendar.MONTH);
  		if (tmpMonth == Calendar.JANUARY) monthName = "January";
  		else if (tmpMonth == Calendar.FEBRUARY) monthName = "February";
  		else if (tmpMonth == Calendar.MARCH) monthName = "March";
  		else if (tmpMonth == Calendar.APRIL) monthName = "April";
  		else if (tmpMonth == Calendar.MAY) monthName = "May";
  		else if (tmpMonth == Calendar.JUNE) monthName = "June";
  		else if (tmpMonth == Calendar.JULY) monthName = "July";
  		else if (tmpMonth == Calendar.AUGUST) monthName = "August";
  		else if (tmpMonth == Calendar.SEPTEMBER) monthName = "September";
  		else if (tmpMonth == Calendar.OCTOBER) monthName = "October";
  		else if (tmpMonth == Calendar.NOVEMBER) monthName = "November";
  		else if (tmpMonth == Calendar.DECEMBER) monthName = "December";

  		return monthName;
  	}

  	public static String getDayName(Date _date) {
  		String dayName = "";
  		Calendar rightNow = Calendar.getInstance();
  		rightNow.setTime(_date);

  		int tmpDay = rightNow.get(Calendar.DAY_OF_WEEK);

  		if (tmpDay == Calendar.MONDAY) dayName = "Monday";
  		else if (tmpDay == Calendar.TUESDAY) dayName = "Tuesday";
  		else if (tmpDay == Calendar.WEDNESDAY) dayName = "Wednesday";
  		else if (tmpDay == Calendar.THURSDAY) dayName = "Thursday";
  		else if (tmpDay == Calendar.FRIDAY) dayName = "Friday";
  		else if (tmpDay == Calendar.SATURDAY) dayName = "Saturday";
  		else if (tmpDay == Calendar.SUNDAY) dayName = "Sunday";

  		return dayName;
  	}

  	public static int getIsoYear(Date _date) {
      Calendar cal = Calendar.getInstance();
      cal.setTime(_date);
      DateTime dt = new DateTime(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)+1, cal.get(Calendar.DAY_OF_MONTH), 0, 0, 0, 0);
      return (dt.getWeekyear());
  	}

  	public static int getIsoWeek(Date _date) {
      Calendar cal = Calendar.getInstance();
      cal.setTime(_date);
      DateTime dt = new DateTime(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)+1, cal.get(Calendar.DAY_OF_MONTH), 0, 0, 0, 0);
      return (dt.getWeekOfWeekyear());
  	}

  	public static Date getFirstDayOfWeek(Date _date) {
      DateTime dt = new DateTime(_date).withDayOfWeek(1);
      return (dt.toDate());
  	}

  	public static Date getLastDayOfWeek(Date _date) {
      DateTime dt = new DateTime(_date).withDayOfWeek(7);
      return (dt.toDate());
  	}

  	public static Date getFirstDayOfIsoWeek(int isoYear, int isoWeek) {
      DateTime dt = new DateTime().withWeekyear(isoYear).withWeekOfWeekyear(isoWeek).withDayOfWeek(1);
      return (dt.toDate());
  	}

  	public static Date getLastDayOfIsoWeek(int isoYear, int isoWeek) {
      DateTime dt = new DateTime().withWeekyear(isoYear).withWeekOfWeekyear(isoWeek).withDayOfWeek(7);
      return (dt.toDate());
  	}
}
