package com.mystudy.calendar;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CalendarExam {

	public static void main(String[] args) {
		Date date = new Date();
		System.out.println("new Date() : " + date);
		
		//년 : 입력된 년도 값에 1900이 더해진 결과값이 사용됨
		//월 : 0~11 - 0:1월, 1:2월, 2:3월, ..., 6:7월, 7:8월, ..., 11: 12월
		date = new Date(2021 - 1900, 7 - 1, 29); 
		System.out.println(date);
		
		System.out.println("-------- Calendar --------");
		Calendar cal = Calendar.getInstance();
		System.out.println(cal);
		//java.util.GregorianCalendar[time=1627537646794,areFieldsSet=true,areAllFieldsSet=true,lenient=true,zone=sun.util.calendar.ZoneInfo[id="Asia/Seoul",offset=32400000,dstSavings=0,useDaylight=false,transitions=30,lastRule=null],firstDayOfWeek=1,minimalDaysInFirstWeek=1,ERA=1,YEAR=2021,MONTH=6,WEEK_OF_YEAR=31,WEEK_OF_MONTH=5,DAY_OF_MONTH=29,DAY_OF_YEAR=210,DAY_OF_WEEK=5,DAY_OF_WEEK_IN_MONTH=5,AM_PM=1,HOUR=2,HOUR_OF_DAY=14,MINUTE=47,SECOND=26,MILLISECOND=794,ZONE_OFFSET=32400000,DST_OFFSET=0]
		
		System.out.println("년도 : " + cal.get(Calendar.YEAR));
		System.out.println("월 : " + (cal.get(Calendar.MONTH) + 1) );
		System.out.println("일 : " + cal.get(Calendar.DATE));
		System.out.println("일 : " + cal.get(Calendar.DAY_OF_MONTH));

		//cal.add(Calendar.HOUR, -5);
		System.out.println("오전오후 : " + cal.get(Calendar.AM_PM));
		System.out.println("시(12시간) : " + cal.get(Calendar.HOUR));
		System.out.println("시(24시간) : " + cal.get(Calendar.HOUR_OF_DAY));
		System.out.println("분 : " + cal.get(Calendar.MINUTE));
		System.out.println("초 : " + cal.get(Calendar.SECOND));
		
		System.out.println("-------------");
		//년-월-일 시:분:초 또는 년/월/일 시:분:초
		String dateTime = cal.get(Calendar.YEAR)
				+ "-" + (cal.get(Calendar.MONTH) + 1)
				+ "-" + cal.get(Calendar.DATE)
				+ " " + cal.get(Calendar.HOUR_OF_DAY)
				+ ":" + cal.get(Calendar.MINUTE)
				+ ":" + cal.get(Calendar.SECOND);
		System.out.println(">> 년-월-일 시:분:초 : " + dateTime);
		System.out.println();
		cal.add(Calendar.YEAR, 2);
		cal.add(Calendar.MONTH, 2);
		cal.add(Calendar.DATE, 2);
		cal.add(Calendar.HOUR_OF_DAY, 2);
		cal.add(Calendar.MINUTE, 2);
		cal.add(Calendar.SECOND, 2);
		showDate(cal);
		
		System.out.println("======= SimpleDateFormat ========");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		date = new Date();
		System.out.println("new Date() : " + date);
		
		System.out.println("yyyy-MM-dd hh:mm:ss : " + sdf.format(date));
		sdf = new SimpleDateFormat("yyyy/MM/dd a h:m:s");
		System.out.println("yyyy/MM/dd a h:m:s : " + sdf.format(date));
	}
	
	static void showDate(Calendar cal) {
		String dateTime = cal.get(Calendar.YEAR)
				+ "-" + (cal.get(Calendar.MONTH) + 1)
				+ "-" + cal.get(Calendar.DATE)
				+ " " + cal.get(Calendar.HOUR_OF_DAY)
				+ ":" + cal.get(Calendar.MINUTE)
				+ ":" + cal.get(Calendar.SECOND);
		System.out.println(">> 년-월-일 시:분:초 : " + dateTime);
	}

}









