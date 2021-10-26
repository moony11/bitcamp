package com.mystudy.localdate_time;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Calendar;

public class LocalDate_Test {

	public static void main(String[] args) {
		// 전통적인 Calendar 사용 : 값이 변경됨(Muttable)
		Calendar cal = Calendar.getInstance(); //현재시간
		System.out.println("Calendar.getInstance() : " + cal);
		cal.add(Calendar.DATE, 3);
		System.out.println("3일 뒤 : " + cal);
		
		//LocalDate, LocalTime 날짜, 시간만 표현(불변 - immutable)
		System.out.println("=== LocalDate ======");
		LocalDate nowDate = LocalDate.now();
		System.out.println("LocalDate.now() : " + nowDate.toString());
		System.out.println("년 : " + nowDate.getYear());
		System.out.println("월 : " + nowDate.getMonthValue()); //1~12월
		System.out.println("일 : " + nowDate.getDayOfMonth()); 
		
		LocalDate newLocalDate = nowDate.plusYears(2).plusMonths(2).plusDays(-2);
		System.out.println("nowDate : " + nowDate);
		System.out.println("newLocalDate : " + newLocalDate);
		
		System.out.println("=== LocalTime ======");
		LocalTime nowTime = LocalTime.now();
		System.out.println("LocalTime.now() : " + nowTime.toString());
		System.out.println(nowTime.getHour());
		System.out.println(nowTime.getMinute());
		System.out.println(nowTime.getSecond());
		System.out.println(nowTime.getNano());
		
		LocalTime newLocalTime = nowTime.plusHours(2).plusMinutes(10).plusSeconds(10);
		System.out.println("newLocalTime : " + newLocalTime);

		System.out.println("====== LocalDateTime =========");
		LocalDateTime nowDT = LocalDateTime.now();
		System.out.println("LocalDateTime.now() : " + LocalDateTime.now());
		System.out.println("년 : " + nowDT.getYear());
		System.out.println("월 : " + nowDT.getMonthValue()); //1~12월
		System.out.println("일 : " + nowDT.getDayOfMonth()); 
		System.out.println("시 : " + nowDT.getHour());
		System.out.println("분 : " + nowDT.getMinute());
		System.out.println("초 : " + nowDT.getSecond());
		
		LocalDateTime newLocatDateTime = nowDT.plusYears(3); //3년 후
		System.out.println("newLocatDateTime(3년후) : " + newLocatDateTime);
		
		newLocatDateTime = nowDT.minusDays(10); //10일 전
		System.out.println("newLocatDateTime(10일전) : " + newLocatDateTime);
	}

}











