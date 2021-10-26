package com.mystudy.list1_arraylist;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ArrayListExam {

	public static void main(String[] args) {
		// ArrayList : Array(배열)의 속성을 가진 List(목록)
		ArrayList list1 = new ArrayList();
		System.out.println("list1.size() : " + list1.size());
		
		//입력(C) : 맨뒤에 추가
		list1.add(new Integer(5));
		list1.add(1); // int -> Integer 자동형변환 되어 입력처리됨
		list1.add(5);
		list1.add(6);
		list1.add(7);
		System.out.println(list1.toString());
		
		//입력 : 지정된 특정 위치에 데이터 추가
		list1.add(0, 100); //인덱스 위치에 데이터 추가(삽입)
		System.out.println("0번 인덱스에 100 add : " + list1.toString());
		
		//수정(U) : 지정된 위치의 데이터 수정(변경)
		list1.set(0, 999); //인덱스 위치의 데이터 변경(수정)
		System.out.println("0번 인덱스에 999 set : " + list1.toString());
		
		// set : 존재하지 않는 인덱스 접근 시 IndexOutOfBoundsException 예외발생
		//list1.set(100, 999); //인덱스 위치의 데이터 변경(수정)
		//System.out.println("100번 인덱스에 set : " + list1.toString());
		
		//삭제(D) : 특정 위치의 데이터 삭제
		list1.remove(0); //인덱스 위치 데이터 삭제
		System.out.println("0번 인덱스 remove : " + list1.toString());
		
		//검색,조회(R) : 특정 위치의 데이터 읽기(조회, 검색, 확인)
		Object obj = list1.get(0);
		System.out.println("list1.get(0) : " + obj);
		
		System.out.println("----------------");
		Collections.reverse(list1);
		System.out.println("reverse 후 : " + list1);
		
		System.out.println("list1.subList(1, 4) : " + list1.subList(1, 4));
		
		ArrayList list2 = new ArrayList(list1.subList(1, 4));
		System.out.println("list2 : " + list2);
		
		System.out.println("--- Collections.sort() ----");
		System.out.println("list1 : " + list1);
		Collections.sort(list1);
		System.out.println("sort() 후 list1 : " + list1);
		
		System.out.println("--- Collections.reverse() ----");
		Collections.reverse(list1);
		System.out.println("reverse() 후 list1 : " + list1);
		
		System.out.println("===========================");
		System.out.println("list1 : " + list1);
		System.out.println("list2 : " + list2);
		
		list2.add("BB");
		list2.add("TEST");
		System.out.println("list2 : " + list2);
		
		System.out.println("첫 데이터 : " + list2.get(0));
		System.out.println("list2.size() : " + list2.size());
		System.out.println("마지막 데이터 : " + list2.get(list2.size() - 1));
		System.out.println("list2 : " + list2);
		
		int list2Cnt = list2.size(); 
		for (int i = 0; i < list2Cnt; i++) {
			System.out.println(i + " - " + list2.get(i));
		}
		printData(list2);
		printData("list2", list2);
//		printData("list3", new ArrayList());
//		ArrayList list4 = null;
//		printData("list4", list4);
		
		//데이터가 있는 지 여부 확인
		System.out.println("list2.contains(5) : " + list2.contains(5));
		
		System.out.println("---- list2의 데이터를 전체 삭제 ----");
		printData("list2 삭제전", list2);
		//맨 앞에 있는 데이터 삭제
//		int listCount = list2.size();
//		for (int i = 0; i < listCount; i++) {
//			list2.remove(0);
//		}
		
		//맨 뒤쪽에 있는 데이터를 삭제
//		list2.remove(4); 
//		list2.remove(3); 
//		list2.remove(2);
//		list2.remove(1);
//		list2.remove(0);
		
//		int lastIndex = list2.size() - 1;
//		for (int i = list2.size() - 1; i >= 0; i--) {
//			list2.remove(i);
//		}
		
//		int listCount = list2.size();
//		for (int i = 0; i < listCount; i++) {
//			list2.remove(list2.size() - 1); //마지막 인덱스
//		}
		
		list2.clear();
		
		printData("list2 삭제후", list2);
		
		
	}
	
	static void printData(List list) {
		if (list == null || list.size() < 1) return;
		System.out.print(list.get(0));
		for (int i = 1; i < list.size(); i++) {
			System.out.print(", " + list.get(i));
		}
		System.out.println();
	}
	
	static void printData(String title, List list) {
		//if (list == null || list.size() < 1) return;
		if (list == null) {
			System.out.println(title + " : null");
			return;
		}
		if (list.size() < 1) {
			System.out.println(title + " : 데이터건수 0");
			return;
		}
		System.out.print(title + " : " + list.get(0));
		for (int i = 1; i < list.size(); i++) {
			System.out.print(", " + list.get(i));
		}
		System.out.println();
	}

}








