package com.mystudy.list4_vo;

import java.util.ArrayList;
import java.util.List;

public class StudentManager {

	public static void main(String[] args) {
		/* (실습) List를 사용한 성적 처리
		1. 3명의 학생데이터(성명,국어,영어,수학)를 
		   StudentVO 클래스를 이용해서 만들고(저장하고)
		   "홍길동", 100, 90, 81
		   "이순신", 95, 88, 92
		   "김유신", 90, 87, 77
		2. ArrayList 타입의 변수(list)에 저장하고
		3. list에 있는 데이터를 사용해서 화면출력
		     성명    국어   영어  수학    총점     평균
		   --------------------------
		    홍길동   100  90  81  270  90.33
		   ...
		************************************/
		StudentVO stu1 = new StudentVO("홍길동", 100, 90, 81);
		System.out.println(stu1.getName());
		stu1.printData();
		
		StudentVO stu2 = new StudentVO("이순신", 95, 88, 92);
		StudentVO stu3 = new StudentVO("김유신", 90, 87, 77);
		
		List<StudentVO> list = new ArrayList<>();
//		list.add(stu1);
//		stu1 = new StudentVO("이순신", 95, 88, 92);
//		list.add(stu1);
//		list.add(new StudentVO("김유신", 90, 87, 77));
		
		list.add(stu1);
		list.add(stu2);
		list.add(stu3);
		
		System.out.println(stu1.getName());
		System.out.println(list);
		System.out.println("======================");
		
//		StudentVO svo1 = list.get(0);
//		String name = svo1.getName();
//		int kor = svo1.getKor();
//		int eng = svo1.getEng();
//		
//		list.get(0).getName();
		
		for (int i = 0; i < list.size(); i++) {
			//StudentVO vo = (StudentVO) list.get(i); //StudentVO <- Object
			StudentVO vo = list.get(i);
			vo.printData();
		}
		System.out.println("----------");
		for (StudentVO vo : list) {
			vo.printData();
		}
		
		System.out.println("==========");
		printData(list);
		
		System.out.println("===== 리스트의 데이터 값 변경 ====");
		System.out.println("--- 데이터 변경전 ----");
		stu1.printData();
		list.get(0).printData();
		
		list.get(0).setKor(95);
		
		System.out.println("--- 데이터 변경후 ----");
		stu1.printData();
		list.get(0).printData();
	}
	
	static void printData(List<StudentVO> list) {
		for (StudentVO vo : list) {
			vo.printData();
		}
	}

}






