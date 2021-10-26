package com.mystudy.scanner1;

import java.util.Scanner;

public class ScannerExam1 {

	public static void main(String[] args) {
		// Scanner : 특정위치에서 값을 읽어 사용하기 위한 클래스
		// 입력 : 성명, 국어, 영어, 수학 점수를 입력받아
		// 처리 : 총점, 평균 구하기
		// 출력 : 성적처리된 데이터 화면 출력
		/*
		이름 : 홍길동
		국어 : 100
		영어 : 90
		수학 : 81
		-----------
		총점 : 271
		평균 : 90.33
		******************** */
		//입력 -----------------------------
		Scanner scan = new Scanner(System.in);
		System.out.print("이름 : ");
		//String name = "홍길동";
		String name = scan.next(); //String 데이터 읽기
		
		System.out.print("국어 : ");
		int kor = scan.nextInt();
		
		System.out.print("영어 : ");
		int eng = scan.nextInt();
		scan.nextLine(); //줄바꿈 이전에 있는 빈문자열 읽기
		
		System.out.print("수학 : ");
		String strMath = scan.nextLine();
		System.out.println("strMath : -" + strMath + "-");
		int math = Integer.parseInt(strMath);
		
		//처리 ------------------------
		int tot = kor + eng + math;
		double avg = tot * 100 / 3 / 100.0;
				
		//출력 ------------------------
		System.out.println("=== 성적처리결과 ==");
		
		
	}

}








