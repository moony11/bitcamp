package com.mystudy.exception3_sungjuk;

public class SungjukTest {

	public static void main(String[] args) {
		System.out.println("--- main() 시작 ---");
		StudentVO svo = new StudentVO("홍길동", 100, 90, 81);
		System.out.println(svo);
	
		System.out.println(">> 국어점수 수정처리 ---");
		try {
			svo.setKor(999);
		} catch (JumsuOutOfValueException e) {
			e.printStackTrace();
			//System.out.println(e.getMessage());
		}
		System.out.println(svo);
		
		System.out.println("--- main() 끝 ---");

	}

}
