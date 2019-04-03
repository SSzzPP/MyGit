/******************************************************************************
 * @File name   :      DateUtil.java
 *
 * @Author      :      Administrator
 *
 * @Date        :      2012-1-16
 *
 * @Copyright Notice: 
 * Copyright (c) 2012 Haier, Inc. All  Rights Reserved.
 * This software is published under the terms of the Haier Software
 * License version 1.0, a copy of which has been included with this
 * distribution in the LICENSE.txt file.
 * 
 * 
 * ----------------------------------------------------------------------------
 * Date                   Who         Version        Comments
 * 2012-1-16 下午4:17:47        Administrator     1.0            Initial Version
 *****************************************************************************/
package com.yhlt.showcase.base.util;

import org.apache.commons.lang3.StringUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 *
 */
public class DateUtil {

    private static Log log = LogFactory.getLog(DateUtil.class);
	public static final int BYWEEK = 1;//周
	public static final int BYMONTH = 2;//月
	public static final int BYSEASON = 3;//季
	public static final int BYSEMIYEAR = 4;//半年
	 /** 获得该日期指定天数之前的日期
     * @param dtDate
     * @param lDays
     * @return 返回日期
     */
    public static Date before(Date dtDate, long lDays)
    {
        long lCurrentDate = 0;
        lCurrentDate = dtDate.getTime() - lDays * 24 * 60 * 60 * 1000;
        Date dtBefor = new Date(lCurrentDate);
        return dtBefor;
    }
    /**
     * 根据年月获取前n个月的年和月
     * @author Fan Lei<lei.fan@capgemini.com>
     * @version 2012-11-21 上午9:54:26
     * @param year
     * @param month
     * @param IMonths
     * @return
     */
    public static String [] before(Integer year,Integer month,Integer iMonths){
    	Calendar c=Calendar.getInstance();
    	c.set(year, month, 0);
    	c.add(Calendar.MONTH, -iMonths);
    	return new String []{String.valueOf(c.get(Calendar.YEAR)),String.valueOf(c.get(Calendar.MONTH)+1)};
    }
    /**
     * 根据年月获取后n个月的年和月
     * @author Kevin Liu<kai-ks.liu@capgemini.com>
     * @version 2012-11-21 上午10:12:55
     * @param year
     * @param month
     * @param IMonths
     * @return
     */
    public static String [] after(Integer year,Integer month,Integer iMonths){
    	Calendar c=Calendar.getInstance();
    	c.set(year, month, 0);
    	c.add(Calendar.MONTH, +iMonths);
    	return new String []{String.valueOf(c.get(Calendar.YEAR)),String.valueOf(c.get(Calendar.MONTH)+1)};
    }
    /** 获得该日期指定天数之后的日期
     * @param dtDate
     * @param lDays
     * @return 返回日期
     */
    public static Date after(Date dtDate, long lDays)
    {
        long lCurrentDate = 0;
        lCurrentDate = dtDate.getTime() + lDays * 24 * 60 * 60 * 1000;
        Date dtAfter = new Date(lCurrentDate);
        return dtAfter;
    }
    /** 获得两个日期之间有多少天
     * 如果传入的日期为null，则返回-1
     * @param dtBeginDate
     * @param dtEndDate
     * @return
     */
    public static long intervalDays(Date dtBeginDate, Date dtEndDate)
    {
    	if(dtBeginDate==null||dtEndDate==null){
    		return -1;
    	}
		GregorianCalendar gc1, gc2;

		gc1 = new GregorianCalendar();
		gc1.setTime(dtBeginDate);
	    gc2 = new GregorianCalendar();
	    gc2.setTime(dtEndDate);

		gc1.clear(Calendar.MILLISECOND);
		gc1.clear(Calendar.SECOND);
		gc1.clear(Calendar.MINUTE);
		gc1.clear(Calendar.HOUR_OF_DAY);
		gc1.clear(Calendar.HOUR);

		gc2.clear(Calendar.MILLISECOND);
		gc2.clear(Calendar.SECOND);
		gc2.clear(Calendar.MINUTE);
		gc2.clear(Calendar.HOUR_OF_DAY);
		gc2.clear(Calendar.HOUR);


		long lInterval = 0;
		lInterval = gc2.getTime().getTime() - gc1.getTime().getTime();
		lInterval = lInterval / (24 * 60 * 60 * 1000);
		return lInterval;
    }

    private static HashMap<String, String> getDaysPerMonth()
    {
        HashMap<String, String> hm = new HashMap<String, String>();
        hm.put("1", "31");
        hm.put("2", "28");
        hm.put("3", "31");
        hm.put("4", "30");
        hm.put("5", "31");
        hm.put("6", "30");
        hm.put("7", "31");
        hm.put("8", "31");
        hm.put("9", "30");
        hm.put("10", "31");
        hm.put("11", "30");
        hm.put("12", "31");
        return hm;
    }
    /**
     * 获得给定月份的天数。
     * @param nYear
     * @param nMonth
     * @return
     */
    public static int getDaysOfMonth(int nYear, int nMonth)
    {
        int nDay = Integer.parseInt(getDaysPerMonth().get(String.valueOf(nMonth)).toString());
        if (nMonth == 2)
        {
            if ((nYear % 4 == 0) && (nYear % 100 > 0)) // 闰年
            {
                nDay = 29;
            }
        }
        return nDay;
       
    }
    
    /**
	 * 比较两个日期是否相等，按照年，月，日比较。
	 * @param dtOne
	 * @param dtOther
	 * @return int the value 0 if the argument Date is equal to this other Date; a value less than 0 if this Date is
	 * before the other Date; and a value greater than 0 if this Date is after the other Date.
	 */
	public static int compareDate(java.util.Date dtOne, java.util.Date dtOther)
	{
		
		int result = 0;
		
		if(dtOne == null || dtOther == null){
			return result;
		}

		Calendar calOne = Calendar.getInstance();
		calOne.clear();
		calOne.setTime(dtOne);
		calOne.set(Calendar.HOUR_OF_DAY, 0);
		calOne.set(Calendar.MINUTE, 0);
		calOne.set(Calendar.SECOND, 0);

		Calendar calOther = Calendar.getInstance();
		calOther.clear();
		calOther.setTime(dtOther);
		calOther.set(Calendar.HOUR_OF_DAY, 0);
		calOther.set(Calendar.MINUTE, 0);
		calOther.set(Calendar.SECOND, 0);
		return calOne.compareTo(calOther);
/*
		if (calOne.get(Calendar.YEAR) == calOther.get(Calendar.YEAR))
		{
			if (calOne.get(Calendar.MONTH) == calOther.get(Calendar.MONTH))
			{
				if (calOne.get(Calendar.DATE)
					== calOther.get(Calendar.DATE))
				{
					//日期相等
					result = 0;
				}
				else if (
					calOne.get(Calendar.DATE)
						> calOther.get(Calendar.DATE))
				{
					//第一个晚于第二个
					result = 1;
				}
				else if (
					calOne.get(Calendar.DATE)
						< calOther.get(Calendar.DATE))
				{
					//第一个早于第二个
					result = -1;
				}
			}
			else if (
				calOne.get(Calendar.MONTH) > calOther.get(Calendar.MONTH))
			{
				//第一个晚于第二个
				result = 1;
			}
			else if (
				calOne.get(Calendar.MONTH) < calOther.get(Calendar.MONTH))
			{
				//第一个早于第二个
				result = -1;
			}
		}
		else if (calOne.get(Calendar.YEAR) > calOther.get(Calendar.YEAR))
		{
			//第一个晚于第二个
			result = 1;
		}
		else if (calOne.get(Calendar.YEAR) < calOther.get(Calendar.YEAR))
		{
			//第一个早于第二个
			result = -1;
		}
		return result;*/
	}
    
    /**
     * 比较两个时间是否相等。比较年，月，日，时，分，秒。
     * 
     * @param dateOne
     * @param dateOther
     * @return 当dateOne和dateOther相等时，返回0；
     *         当dateOne在dateOther之前时，返回-1；
     *         当dateOne在dateOther之后时，返回1。
     *         当dateOne和dateOther都为null时，返回0。
     *         当dateOne为null，dateOther不为null时，返回-1，反之，返回1。
     */
    public static int compareDateTime(Date dateOne, Date dateOther)
    {
        int result = 0;
        
        if(dateOne!=null && dateOther!=null)
        {
            long lDateOne = dateOne.getTime()/1000*1000;//去掉时间的毫秒位
            long lDateOther = dateOther.getTime()/1000*1000;
            
            long lResult = lDateOne-lDateOther;
            
            if(lResult>0) 
            {
            	result=1;
            }
            else if(lResult<0) {
            	result = -1;
            }
            
        }else if(dateOne==null && dateOther!=null)
        {
            return -1;
        }else if(dateOne!=null && dateOther==null){
            return 1;
        }
        return result;
    }
	/**
	 * 得到下几天
	 * @param dtDate
	 * @param nDay
	 * @return
	 */
    public static Date getNextDate ( Date dtDate ,
			int nDay )
	{
		if (null == dtDate)
		{
			return null ;
		}
		GregorianCalendar calendar = new GregorianCalendar ( ) ;
		calendar.setTime ( dtDate ) ;
		calendar.add ( Calendar.DATE , nDay ) ;
		return calendar.getTime() ;		
	}
	/**
	 * 得到下几月
	 * @param dtDate
	 * @param nMonth
	 * @return
	 */
    public static Date getNextMonth (Date dtDate,
			int nMonth )
	{
		if (null == dtDate)
		{
			return null ;
		}
		java.util.Calendar calendar = Calendar.getInstance();
		calendar.setTime (dtDate);		
		return getDateTime ( calendar.get ( Calendar.YEAR ) , calendar
				.get ( Calendar.MONTH )
				+ 1 + nMonth , calendar.get ( Calendar.DATE ) , 0 , 0 , 0 ) ;
	}
    /**
     * 获取前几个月
     * @author Fan Lei<lei.fan@capgemini.com>
     * @version 2013-4-24 上午10:37:31
     * @param dtDate
     * @param nMonth
     * @return
     */
    public static Date getPreviousMonth (Date dtDate,int nMonth ){
		if (null == dtDate)
		{
			return null ;
		}
		java.util.Calendar calendar = Calendar.getInstance();
		calendar.setTime (dtDate);		
		return getDateTime ( calendar.get ( Calendar.YEAR ) , calendar.get ( Calendar.MONTH )+ 1- nMonth , calendar.get ( Calendar.DATE ) , 0 , 0 , 0 ) ;
	}
    
	/**
	 * construct a Date through year,month,day,hour,minute,second
	 * 
	 * @param year
	 * @param month
	 * @param day
	 * @param hour
	 * @param minute
	 * @param second
	 * @return
	 */
	public static Date getDateTime ( int year , int month ,
			int day , int hour , int minute , int second )
	{
		java.util.Calendar calendar = Calendar.getInstance ( ) ;
		calendar.set ( year , month - 1 , day , hour , minute , second ) ;
		return calendar.getTime ( ) ;		
	}
	/**
	 * 得到当月第一天
	 * @param dtDate
	 * @return
	 */
	public static Date getFirstDateOfMonth ( Date dtDate )
	{
		if (null == dtDate)
		{
			return null ;
		}
		java.util.Calendar calendar = Calendar.getInstance ( ) ;
		calendar.setTime ( dtDate ) ;
		return getDateTime ( calendar.get ( Calendar.YEAR ) , calendar
				.get ( Calendar.MONTH ) + 1 ,
				1 , 0 , 0 , 0 ) ;
	}
	/**
	 * 得到当月最后一天
	 * @param dtDate
	 * @return
	 */
	public static Date getLastDateOfMonth (Date dtDate)
	{
		if (null == dtDate)
		{
			return null ;
		}
		Date firstday=getFirstDateOfMonth(dtDate);
		Date nextMonth=getNextMonth(firstday,1);
		return getPreviousDate(nextMonth);
	}
	/**
	 * 得到上一天
	 * 
	 * @param dtDate
	 *            日期
	 */
	public static Date getPreviousDate ( Date dtDate )
	{
		if (null == dtDate)
		{
			return null ;
		}
		java.util.Calendar calendar = Calendar.getInstance ( ) ;
		calendar.setTime ( dtDate ) ;		
		return getDateTime ( calendar.get ( Calendar.YEAR ) , calendar
				.get ( Calendar.MONTH ) + 1 ,
				calendar.get ( Calendar.DATE ) - 1 , 
				calendar.get ( Calendar.HOUR_OF_DAY ) , 
				calendar.get ( Calendar.MINUTE ) , 0 ) ;
	}	
	/**
	 * 得到季的最后一天
	 * 
	 * @param dtDate
	 *            日期
	 */
	public static Date getLastDateOfSeason(Date dtDate)
	{
		if (null == dtDate)
		{
			return null ;
		}
		Date dtRes = null;
        int nMonth = getMonth(dtDate);
        if(nMonth <= Calendar.MARCH)//第一季
        {
        	dtRes = getLastDateOfMonth(getNextMonth(dtDate,Calendar.MARCH-nMonth));
        }        
        else if(nMonth <= Calendar.JUNE)//第二季
        {
        	dtRes = getLastDateOfMonth(getNextMonth(dtDate,Calendar.JUNE-nMonth));
        }else if(nMonth <= Calendar.SEPTEMBER)//第三季
        {
        	dtRes = getLastDateOfMonth(getNextMonth(dtDate,Calendar.SEPTEMBER-nMonth));
        }
        else//第四季
        {
        	dtRes = getLastDateOfMonth(getNextMonth(dtDate,Calendar.DECEMBER-nMonth));
        }
		return dtRes;
	}	
	/**
	 * 得到半年的最后一天
	 * 
	 * @param dtDate
	 *            日期
	 */
	public static Date getLastDateOfSemiYear(Date dtDate)
	{
		if (null == dtDate)
		{
			return null ;
		}
		Date dtRes = null;
        int nMonth = getMonth(dtDate);
        if(nMonth <= Calendar.JUNE)//第一个半年
        {
        	dtRes = getLastDateOfMonth(getNextMonth(dtDate,Calendar.JUNE-nMonth));
        }        
        else//第二个半年
        {
        	dtRes = getLastDateOfMonth(getNextMonth(dtDate,Calendar.DECEMBER-nMonth));  	
        }
		return dtRes;
	}	
	/**
	 * 得到一个日期的年份，比如2005-08-11，返回2005
	 */
	public static int getYear(Date dtDate )
	{
		if (null == dtDate)
		{
			return -1 ;
		}
		java.util.Calendar calendar = Calendar.getInstance ( ) ;
		calendar.setTime ( dtDate ) ;
		return calendar.get ( Calendar.YEAR );
	}
	/**
	 * 得到一个日期的月份,用0-11表示
	 */
	public static int getMonth(Date dtDate )
	{
		if (null == dtDate)
		{
			return -1 ;
		}
		java.util.Calendar calendar = Calendar.getInstance ( ) ;
		calendar.setTime ( dtDate ) ;
		return calendar.get ( Calendar.MONTH )+1;
	}
	/**
	 * 得到一个日期号数，比如2005-08-11，返回11
	 */
	public static int getDay(Date dtDate )
	{
		if (null == dtDate){
			return -1 ;
		}
		java.util.Calendar calendar = Calendar.getInstance ( ) ;
		calendar.setTime ( dtDate ) ;
		return calendar.get ( Calendar.DATE );
	}
	/**
	 * 根据传入日期判断当前是星期几
	 * @return 
	 * Calendar.SUNDAY
	 * Calendar.MONDAY
	 * Calendar.TUESDAY
	 * ......
	 * Calendar.SATURDAY
	 * */
	public static int getWeekDay(Date dtDate)
	{
		Calendar calendar = GregorianCalendar.getInstance();
		calendar.setTime(dtDate);		
		return calendar.get(Calendar.DAY_OF_WEEK);		
	}
	/**
	 * 按周期分段，统计报表里要用到
	 * 
	 * @param beginDate
	 * @param endDate
	 * @param nType	 *
	 * @return Date[] 依次记录了每个时间段的开始日期和结束日期            
	 */
	
	public static Date[] splitIntoSections(Date beginDate,Date endDate,int nType)
	{
		Date[] timeTable= null;
		ArrayList<Date> lstTimeTable = new ArrayList<Date>();
    	Date dtTemp = null;
		switch (nType)
        {
            case BYWEEK:
            	dtTemp = beginDate;
            	//第一周
            	lstTimeTable.add(dtTemp);//周的第一天
            	int nWeekDay = getWeekDay(dtTemp);	                
                dtTemp = getNextDate(dtTemp,Calendar.SATURDAY-nWeekDay);
                if(dtTemp.getTime()>=endDate.getTime())
                {
                	dtTemp = endDate;
                }
                lstTimeTable.add(dtTemp);//周的最后一天
                //下一周
                while(dtTemp.getTime()<endDate.getTime())
            	{   
                	dtTemp = getNextDate(dtTemp,1);
                	lstTimeTable.add(dtTemp);//周的第一天
	                nWeekDay = getWeekDay(dtTemp);	                
	                dtTemp = getNextDate(dtTemp,Calendar.SATURDAY-nWeekDay);
	                if(dtTemp.getTime()>=endDate.getTime())
	                {
	                	dtTemp = endDate;
	                }
	                lstTimeTable.add(dtTemp);//周的最后一天
            	}                
                break;
            case BYMONTH:
            	dtTemp = beginDate;
            	//第一月
            	lstTimeTable.add(dtTemp);//月的第一天      		                
                dtTemp = getLastDateOfMonth(dtTemp);
                if(dtTemp.getTime()>=endDate.getTime())
                {
                	dtTemp = endDate;
                }
                lstTimeTable.add(dtTemp);//月的最后一天
                //下一个月
                while(dtTemp.getTime()<endDate.getTime())
            	{   
                	dtTemp = getNextDate(dtTemp,1);
                	lstTimeTable.add(dtTemp);//月的第一天
                	dtTemp = getLastDateOfMonth(dtTemp);
	                if(dtTemp.getTime()>=endDate.getTime())
	                {
	                	dtTemp = endDate;
	                }
	                lstTimeTable.add(dtTemp);//月的最后一天
            	}
                break;
            case BYSEASON:
            	dtTemp = beginDate;
            	//第一季
            	lstTimeTable.add(dtTemp);//季的第一天      		                
                dtTemp = getLastDateOfSeason(dtTemp);
                if(dtTemp.getTime()>=endDate.getTime())
                {
                	dtTemp = endDate;
                }
                lstTimeTable.add(dtTemp);//季的最后一天
                //下一个季
                while(dtTemp.getTime()<endDate.getTime())
            	{   
                	dtTemp = getNextDate(dtTemp,1);
                	lstTimeTable.add(dtTemp);//季的第一天
                	dtTemp = getLastDateOfSeason(dtTemp);
	                if(dtTemp.getTime()>=endDate.getTime())
	                {
	                	dtTemp = endDate;
	                }
	                lstTimeTable.add(dtTemp);//季的最后一天
            	}    
                break;      
            case BYSEMIYEAR:            	
            	dtTemp = beginDate;
            	//第一个半年
            	lstTimeTable.add(dtTemp);//半年的第一天      		                
                dtTemp = getLastDateOfSemiYear(dtTemp);
                if(dtTemp.getTime()>=endDate.getTime())
                {
                	dtTemp = endDate;
                }
                lstTimeTable.add(dtTemp);//半年的最后一天
                //下一个半年
                while(dtTemp.getTime()<endDate.getTime())
            	{   
                	dtTemp = getNextDate(dtTemp,1);
                	lstTimeTable.add(dtTemp);//半年的第一天
                	dtTemp = getLastDateOfSemiYear(dtTemp);
	                if(dtTemp.getTime()>=endDate.getTime())
	                {
	                	dtTemp = endDate;
	                }
	                lstTimeTable.add(dtTemp);//半年的最后一天
            	}    
                break;
        }
		timeTable = new Date[0];
		timeTable =
			(Date[]) lstTimeTable.toArray(
					timeTable);		
		return timeTable;
	}

	/**
	 * 根据时间，把参数中的日期转换为yyyy-MM-dd HH:mm:ss格式的日期字符串
	* @Date
	* @param date
	* @param datePattern
	* @return
	 */
	public static String toString(Date date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault());
		return sdf.format(date);
	}
	/**
	 * 根据日期格式，把参数中的日期转换为对应格式的日期
	* @Date        :      2012-2-17
	* @param date
	* @param datePattern
	* @return
	 */
	public static Date formatDate(Date date,String datePattern){
		SimpleDateFormat sdf = new SimpleDateFormat(datePattern, Locale.getDefault());
		String strDate = sdf.format(date);
		Date result = null;
		try {
			result = sdf.parse(strDate);
		} catch (ParseException e) {
			return new Date();
		}
		return result;
	}
	
	/**
	 * 根据日期格式，把参数中的日期转换为对应格式的日期 字符串 转 date
	* @Date        :      2012-2-17
	* @param date
	* @param datePattern
	* @return
	 */
	public static Date formatDate(String dateStr,String datePattern){
		SimpleDateFormat sdf = new SimpleDateFormat(datePattern);
//		String strDate = sdf.format(dateStr);
		Date result = null;
		try {
			result = sdf.parse(dateStr);
		} catch (ParseException e) {
			return new Date();
		}
		return result;
	}
	
	
	/**
	 * 根据日期格式，把参数中的日期转换为对应格式的字符串
	* @Date        :      2012-2-17
	* @param date
	* @param datePattern
	* @return
	 */
	public static String formatDate2Str(Date date,String datePattern){
		SimpleDateFormat sdf = new SimpleDateFormat(datePattern, Locale.getDefault());
		return sdf.format(date);
		
	}
	/**
	 * 根据一个日期的月份，分别判断该月份周一至周七分别有几天
	 */
	public static Map<Integer,Integer> getWeekAmtByMonth(Date date){
		Map<Integer,Integer> weeks = new HashMap<Integer,Integer>();
		Date d0 = getFirstDateOfMonth(date);
		Date d1 = getNextDate(d0, 27);
		Date d2 = getLastDateOfMonth(date);
		long days = intervalDays(d1, d2);
		int week1 = getWeekDay(d1);
		if(days==0){
			for (int i = 0; i < 7; i++) {
				weeks.put((week1+i)>=7?(week1+i-7):(week1+i), 4);
			}
		}
		if(days==1){
			weeks.put(week1, 5);
			for (int i = 1; i < 7; i++) {
				weeks.put((week1+i)>=7?(week1+i-7):(week1+i), 4);
			}
		}
		if(days==2){
			weeks.put(week1, 5);
			weeks.put((week1+1)>=7?(week1+1-7):(week1+1), 5);
			for (int i = 2; i < 7; i++) {
				weeks.put((week1+i)>=7?(week1+i-7):(week1+i), 4);
			}
		}
		if(days==3){
			weeks.put(week1, 5);
			weeks.put((week1+1)>=7?(week1+1-7):(week1+1), 5);
			weeks.put((week1+2)>=7?(week1+2-7):(week1+2), 5);
			for (int i = 3; i < 7; i++) {
				weeks.put((week1+i)>=7?(week1+i-7):(week1+i), 4);
			}
		}
		return weeks;
		
	}
	
	/**
	 * 
	 * 计算指定日期属于当年的第几周
	 * 
	 * @param date
	 *            格式 yyyy-MM-dd
	 * 
	 */

	public static int getWeekOfYear(String date) {

		try {

			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

			Calendar cal = Calendar.getInstance();

			cal.setTime(df.parse(date));

			return cal.get(Calendar.WEEK_OF_YEAR);

		} catch (Exception e) {

			log.error(e.getMessage());

		}

		return 0;

	}
	
	/**
	 * 获取当前时间的年份
	 * 
	 */
	public static int getCurrentYear() {
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		return year;
	}
	
	/**
	 * 获取当前时间的月份
	 * 
	 */
	public static int getCurrentMonth() {
		Calendar c = Calendar.getInstance();
		int month = c.get(Calendar.MONTH) + 1;
		return month;
	}

	/**
	 * 获取当前时间是本年的第几周
	 * 
	 */
	public static int getCurrentWeek() {
		Calendar c = Calendar.getInstance();
		int yearOfWeek = c.get(Calendar.WEEK_OF_YEAR);
		return yearOfWeek;
	}

	/**
	 * 获取当前日期是星期几
	 * 
	 */
	public static int getCurrentWeekDay() {
		Calendar c = Calendar.getInstance();
		int day = c.get(Calendar.DAY_OF_WEEK);
		return day - 1;
	}
	
	
	/**
	 * 获取某年第n周的日期范围
	 * 
	 */
	public static String[] getDaysOfYearWeek(int year, int week) {
		String[] weekDays =new String[7];
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		c.set(Calendar.YEAR, year);//指定是哪年
		c.set(Calendar.WEEK_OF_YEAR, week);//指定是第几周
		c.set(Calendar.DAY_OF_WEEK, 1);
		weekDays[0] =df.format(c.getTime());//周日
		c.set(Calendar.DAY_OF_WEEK, 2);
		weekDays[1] =df.format(c.getTime());//周一
		c.set(Calendar.DAY_OF_WEEK, 3);
		weekDays[2] =df.format(c.getTime());//周二
		c.set(Calendar.DAY_OF_WEEK, 4);
		weekDays[3] =df.format(c.getTime());//周三
		c.set(Calendar.DAY_OF_WEEK, 5);
		weekDays[4] =df.format(c.getTime());//周四
		c.set(Calendar.DAY_OF_WEEK, 6);
		weekDays[5] =df.format(c.getTime());//周五
		c.set(Calendar.DAY_OF_WEEK, 7);
		weekDays[6] =df.format(c.getTime());//周六
		return weekDays;
	}
	
	/**
	 * 获取某年第n周的日期范围
	 * 
	 */
	public static String getWeekDaysOfYearWeek(int year, int week) {
		String weekDays ="";
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		c.set(Calendar.YEAR, year);//指定是哪年
		c.set(Calendar.WEEK_OF_YEAR, week);//指定是第几周
		c.set(Calendar.DAY_OF_WEEK, 1);
		weekDays =df.format(c.getTime())+","; //周日
		c.set(Calendar.DAY_OF_WEEK, 2);
		weekDays +=df.format(c.getTime())+","; //周一
		c.set(Calendar.DAY_OF_WEEK, 3);
		weekDays +=df.format(c.getTime())+","; //周二
		c.set(Calendar.DAY_OF_WEEK, 4);
		weekDays +=df.format(c.getTime())+","; //周三
		c.set(Calendar.DAY_OF_WEEK, 5);
		weekDays +=df.format(c.getTime())+","; //周四
		c.set(Calendar.DAY_OF_WEEK, 6);
		weekDays +=df.format(c.getTime())+","; //周五
		c.set(Calendar.DAY_OF_WEEK, 7);
		weekDays +=df.format(c.getTime()); //周六
		return weekDays;
	}
	
	/**
	 * 根据指定的年和月获取当年当月范围的海尔周的查询下拉
	 */
	public static List<String> getHaierWeeks(int year, int month){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		List<String> weeks =new ArrayList<String>();
		int days =DateUtil.getDaysOfMonth(year, month);
		for (int i = 1; i <= days; i++) {
			String dateStr =year + "-" + month + "-" +i;
			Date date;
			try {
				date = df.parse(dateStr);
				int weekDay =DateUtil.getWeekDay(date)-1;//星期几
				if(weekDay==3){ //判断是星期三的日期
					//获取该日是当年的第几周
					int weekNo =DateUtil.getWeekOfYear(dateStr);
					weeks.add(String.valueOf(weekNo));//获取海尔周
				}
				
			} catch (ParseException e) {
				return null;
			}
			
		}
		return weeks;
	}
	
	/**
	 * 
	 * 判断指定日期所在的年月周(海尔周)
	 * 
	 * @param date
	 *            格式 yyyy-MM-dd
	 * 
	 */

	public static int[] getOldYYYYMMWWOfDate(String date) {

		int[] result =new int[3];
		try {

			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

			Calendar cal = Calendar.getInstance();

			cal.setTime(df.parse(date));
			
			result[0] =cal.get(Calendar.YEAR);//所属年

			result[2] =cal.get(Calendar.WEEK_OF_YEAR);//所属周
			
			String wenDay =getWenDayOfYearWeek(result[0], result[2]);//所在周的周三对应日期
			
			cal.setTime(df.parse(wenDay));
			
			result[1] = cal.get(Calendar.MONTH) + 1;//所属月——根据周三判断

		} catch (Exception e) {

			log.error(e.getMessage());

		}

		return result;

	}
	
	/**
	 * 
	 * 判断指定日期所在的年月周(海尔周)
	 * 
	 * @param date
	 *            格式 yyyy-MM-dd
	 * 
	 */

	public static int[] getYYYYMMWWOfDate(String date) {
		Date lastDay=null;
		Date thisDay;
		try {
			thisDay = new SimpleDateFormat("yyyy-MM-dd").parse(date);
			switch (DateUtil.getWeekDay(thisDay)-1) {
			case 0:
				lastDay =DateUtil.after(thisDay, 6L);
				break;
			case 1:
				lastDay =DateUtil.after(thisDay, 5L);
				break;
			case 2:
				lastDay =DateUtil.after(thisDay, 4L);
				break;
			case 3:
				lastDay =DateUtil.after(thisDay, 3L);
				break;
			case 4:
				lastDay =DateUtil.after(thisDay, 2L);
				break;
			case 5:
				lastDay =DateUtil.after(thisDay, 1L);
				break;
			case 6:
				lastDay =thisDay;
				break;
			default:
				lastDay =thisDay;
				break;
			}
		} catch (ParseException e) {
			log.error(e.getMessage());
		}

		int[] result =new int[3];

		Calendar cal = Calendar.getInstance();

		cal.setTime(lastDay);
		
		result[0] =cal.get(Calendar.YEAR);//所属年
		
//		result[1] = cal.get(Calendar.MONTH) + 1;//所属月——根据周六判断

		result[2] =cal.get(Calendar.WEEK_OF_YEAR);//所属周
		
		cal.setTime(DateUtil.before(lastDay, 3L));
		
		result[1] = cal.get(Calendar.MONTH) + 1;//所属月——根据周三判断

		return result;

	}
	
	/**
	 * 下达计划时的所属年月周的判断获取
	 * @return
	 */
	public static int[] getYYYYMMWWForNewPlan() {

		int[] result =new int[3];
		try {

			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

			Calendar cal = Calendar.getInstance();

			cal.setTime(new Date());//根据系统当前日期推断
			
			int weekDay = cal.get(Calendar.DAY_OF_WEEK) - 1;//当前是周几
			
			int currentYear=cal.get(Calendar.YEAR);//当前日期所属年

			int currentWeek =cal.get(Calendar.WEEK_OF_YEAR);//当前日期所属周
			
			String wenDay =getWenDayOfYearWeek(currentYear, currentWeek);//当前周的周三对应日期
			
			String addWenDay ="";
			
			if(weekDay < 2){ //周日到周一下达下周的计划
				addWenDay =df.format(DateUtil.after(df.parse(wenDay), 7));//下周的周三
			}else{ //周二到周六下达下下周的计划
				addWenDay =df.format(DateUtil.after(df.parse(wenDay), 14));//隔周的周三
			}
			
			
			result =getYYYYMMWWOfDate(addWenDay);

		} catch (Exception e) {

			log.error(e.getMessage());

		}

		return result;

	}
	
	/**
	 * 获取指定年的指定周的周三的日期
	 * 
	 */
	public static String getWenDayOfYearWeek(int year, int week) {
		String wenDay ="";
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		c.set(Calendar.YEAR, year);//指定是哪年
		c.set(Calendar.WEEK_OF_YEAR, week);//指定是第几周
		c.set(Calendar.DAY_OF_WEEK, 4);
		wenDay =df.format(c.getTime());//周三
		
		return wenDay;
	}
	
	/**
	 * 获取指定海尔周的前面的周
	 * @param year 指定海尔周所在的年
	 * @param week 指定的海尔周
	 * @param weeks 取指定海尔周前面的第几周
	 * @return int[] 年、月、周
	 */
	public static int[] getBeforeWeek(int year, int week, long weeks) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		c.set(Calendar.YEAR, year);//指定是哪年
		c.set(Calendar.WEEK_OF_YEAR, week);//指定是第几周
		c.set(Calendar.DAY_OF_WEEK, 4);
		Date sunDay =c.getTime();//周三
		Date sunDayOfBeforeWeek =DateUtil.before(sunDay, weeks*7);
		return getYYYYMMWWOfDate(df.format(sunDayOfBeforeWeek));
	}
	
	/**
	 * 获取指定海尔周的后面的周
	 * @param year 指定海尔周所在的年
	 * @param week 指定的海尔周
	 * @param weeks 取指定海尔周后面的第几周
	 * @return int[] 年、月、周
	 */
	public static int[] getAfterWeek(int year, int week, long weeks) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		c.set(Calendar.YEAR, year);//指定是哪年
		c.set(Calendar.WEEK_OF_YEAR, week);//指定是第几周
		c.set(Calendar.DAY_OF_WEEK, 4);
		Date sunDay =c.getTime();//周三
		Date sunDayOfAfterWeek =DateUtil.after(sunDay, weeks*7);
		return getYYYYMMWWOfDate(df.format(sunDayOfAfterWeek));
	}
	
	/**
	 * 获取指定周的前四周的起始和结束日期
	 * 
	 */
	public static String[] getStartAndEndDayOfPriorFourWeeks(int year, int week) {
		String[] startAndEndDay =new String[2];
		//获取指定周的第一天，即周日
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		c.set(Calendar.YEAR, year);//指定是哪年
		c.set(Calendar.WEEK_OF_YEAR, week);//指定是第几周
		c.set(Calendar.DAY_OF_WEEK, 1);
		Date sunDay =c.getTime();//周日
		startAndEndDay[0] =df.format(DateUtil.before(sunDay, 28));//前四周起始日期
		startAndEndDay[1] =df.format(DateUtil.before(sunDay, 1));//前四周截止日期
		
		return startAndEndDay;
	}
	
	/**
	 * 获得指定日期的00:00:00
	 * 
	 * @param date
	 * @return
	 */
	public static String getZeroPoint(Date date) {
		String sReDate = formatDate2Str(date, "yyyy-MM-dd HH:mm:ss").substring(
				0, 11)
				+ "00:00:00";
		return sReDate;
	}
	
	/**
	 * 获得指定日期的23:00:00
	 * 
	 * @param date
	 * @return
	 */
	public static String get23Point(Date date) {
		String sReDate = formatDate2Str(date, "yyyy-MM-dd HH:mm:ss").substring(
				0, 11)
				+ "23:00:00";
		return sReDate;
	}

	/**
	 * 获得指定日期的23:59:59
	 * 
	 * @param date
	 * @return
	 */
	public static String get24Point(Date date) {
		String sReDate = formatDate2Str(date, "yyyy-MM-dd HH:mm:ss").substring(
				0, 11)
				+ "23:59:59";
		return sReDate;
	}
	public static Date formatParse(String str) {
		return formatParse(str, "yyyy-MM-dd HH:mm:ss");
	}
	
	public static Date formatParse(String str, String param) {
		SimpleDateFormat format = new SimpleDateFormat(param);
		try {
			return format.parse(str);
		} catch (ParseException e) {
			return null;
		}
	}
	
	/**
	 * 根据提供年月周获取其(yyyyMMww)格式的年月周
	 * @param year
	 * @param month
	 * @param week
	 * @return
	 */
	public static String getTimeScope(String year, String month, String week){
		String yyyy ="";
		String mm ="";
		String ww ="";
		if(StringUtils.isBlank(year)){
			yyyy ="0000";
		}else{
			yyyy =year;
		}
		if(StringUtils.isBlank(month)){
			mm ="00";
		}else{
			mm =month;
			if(mm.length()<2){
				mm ="0" + mm;
			}
		}
		if(StringUtils.isBlank(week)){
			ww ="00";
		}else{
			ww =week;
			if(ww.length()<2){
				ww ="0" + ww;
			}
		}
		
		return yyyy+mm+ww;
	}
	
	/**
	 * 根据提供年月获取其(yyyyMM)格式的年月
	 * @param year
	 * @param month
	 * @return
	 */
	public static String getMonthTimeScope(String year, String month){
		String yyyy ="";
		String mm ="";
		if(StringUtils.isBlank(year)){
			yyyy ="0000";
		}else{
			yyyy =year;
		}
		if(StringUtils.isBlank(month)){
			mm ="00";
		}else{
			mm =month;
			if(mm.length()<2){
				mm ="0" + mm;
			}
		}
		return yyyy+mm;
	}

	
	/**
	 * 根据提供年月获取其(yyyyMM)格式的年月
	 * @param year
	 * @param month
	 * @return
	 */
	public static String getTimeScope(String year, String month){
		String yyyy ="";
		String mm ="";
		if(StringUtils.isBlank(year)){
			yyyy ="0000";
		}else{
			yyyy =year;
		}
		if(StringUtils.isBlank(month)){
			mm ="00";
		}else{
			mm =month;
			if(mm.length()<2){
				mm ="0" + mm;
			}
		}
		
		return yyyy+mm;
	}
	

	/**
	 * 根据当前月获取季度
	 */
	public static String getCurrentQuarter(){
		Calendar temp = Calendar.getInstance();
		int month = temp.get(Calendar.MONTH) + 1;
		switch(month){
			case 1:
			case 2:
			case 3:
				return "1";
			case 4:
			case 5:
			case 6:
				return "2";
			case 7:
			case 8:
			case 9:
				return "3";
			case 10:
			case 11:
			case 12:
				return "4";
			default:
				return "error";
		}
	}
	
	public static String getCurrentQuarter(int month){
		switch(month){
			case 1:
			case 2:
			case 3:
				return "1";
			case 4:
			case 5:
			case 6:
				return "2";
			case 7:
			case 8:
			case 9:
				return "3";
			case 10:
			case 11:
			case 12:
				return "4";
			default:
				return "error";
		}
	}
	
	/**
	 * 根据年、月判断对应的年、季度
	 * @param year
	 * @param month
	 * @return 年、季度
	 */
	public static String[] getQuarter(int year, int month){
		String[] result =new String[2];
		result[0] =String.valueOf(year);
		switch(month){
			case 1:
			case 2:
			case 3:
				result[1] ="1";
				return result;
			case 4:
			case 5:
			case 6:
				result[1] ="2";
				return result;
			case 7:
			case 8:
			case 9:
				result[1] ="3";
				return result;
			case 10:
			case 11:
			case 12:
				result[1] ="4";
				return result;
			default:
				result[1] ="";
				return result;
		}
	}
	
	/**
	 * 根据年、季度后推后面的年、季度
	 * @param year
	 * @param quarter
	 * @param quarters
	 * @return 年、季度
	 */
	public static String[] getBeforeQuarter(int year, int quarter, int quarters){
		String[] yearMonth =before(year, quarter*3, 3*quarters);
		return getQuarter(Integer.valueOf(yearMonth[0]), Integer.valueOf(yearMonth[1]));
	}
	
	/**
	 * 根据年、季度前推前面的年、季度
	 * @param year
	 * @param quarter
	 * @param quarters
	 * @return 年、季度
	 */
	public static String[] getAfterQuarter(int year, int quarter, int quarters){
		String[] yearMonth =after(year, quarter*3, 3*quarters);
		return getQuarter(Integer.valueOf(yearMonth[0]), Integer.valueOf(yearMonth[1]));
	}
	
	/**
	 * 获取年和月
	 */
	public static int[] getYearMonthOfDate(Date dtDate)
	{
		java.util.Calendar calendar = Calendar.getInstance ( ) ;
		calendar.setTime ( dtDate ) ;
		return new int[]{calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1};
	}

	public static void main(String[] args) {
		//System.out.println(DateUtil.getPreviousMonth(new Date(), 1));
	}
	
	public static Long getCurrentTime(){
		Calendar c = Calendar.getInstance();
		return c.getTimeInMillis();
	}
}
