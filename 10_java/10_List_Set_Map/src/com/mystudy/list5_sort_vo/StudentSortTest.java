package com.mystudy.list5_sort_vo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class StudentSortTest {

	public static void main(String[] args) {
		StudentVO stu1 = new StudentVO("홍길동", 100, 90, 81);
		StudentVO stu2 = new StudentVO("이순신", 95, 88, 92);
		StudentVO stu3 = new StudentVO("김유신", 90, 87, 77);
		
		List<StudentVO> list = new ArrayList<>();
		list.add(stu1);
		list.add(stu2);
		list.add(stu3);	
		printData(list);
		
		System.out.println("----- sort 진행전 -----");
		printData(list);
		
		Collections.sort(list);
		
		System.out.println("----- sort 진행후 -----");
		printData(list);
		

	}
	static void printData(List<StudentVO> list) {
		for (StudentVO vo : list) {
			vo.printData();
		}
	}	

}









