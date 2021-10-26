package com.test.interfaceimpl;

public class StudentManagerTest {

	public static void main(String[] args) {
		//5명 학생 정보 만들고 구현메소드 확인(이름중복 2명이상)
		StudentManagerImpl students = new StudentManagerImpl();
		StudentVO svo1 = new StudentVO("21001", "김유신", 100, 90, 80);
		StudentVO svo2 = new StudentVO("21002", "홍길동", 100, 100, 100);
		boolean result = students.add(svo1);
		if (result) {
			System.out.println("입력성공!!!");
		} else {
			System.out.println(svo1);
		}
		result = students.add(svo1);
		if (result) {
			System.out.println("입력성공!!!");
		} else {
			System.out.println("입력실패 - " + svo1);
		}
		students.printData();
		
		StudentVO findVO = students.find("21001");
		System.out.println("찾은학생 : " + findVO);

	}

}
