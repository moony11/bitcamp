package com.mystudy.set1_hashset;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

public class TreeSetLotto {

	public static void main(String[] args) {
		// (실습)Set 을 이용한 로또 만들기 : 1~45 랜덤숫자 6개를 Set에 저장
		// 1. 로또번호 6개를 추첨해서 Set에 저장하고 화면 출력
		//    Math.random() : 0.0 ~ 0.9999999 실수형데이터 중 랜덤 값 리턴(0~1 미만 실수형)
		//    Math.random() 사용 : (int)(Math.random() * 45 + 1)
		// 2. 출력은 작은숫자부터 큰 숫자 형태로
		//    예) 금주의 로또번호 : 5, 8, 10, 25, 33, 41
		//-------------------------------------
		
		// TreeSet : 데이터를 정렬해서 저장
		Set<Integer> lottoSet = new TreeSet<>();
		
		int lottoNo;
		for ( ; lottoSet.size() < 6; ) {
			lottoNo = (int)(Math.random() * 45) + 1;
			System.out.print(lottoNo + ", ");
			lottoSet.add(lottoNo);
		}
		System.out.println();
		System.out.println("로또번호: " + lottoSet);
		
		for (Integer num : lottoSet) {
			System.out.print(num + ", ");
		}
		System.out.println();
		
		System.out.println("----------------");
		lottoSet.clear();
		while (lottoSet.size() < 6) {
			lottoNo = (int)(Math.random() * 45) + 1;
			System.out.print(lottoNo + ", ");
			lottoSet.add(lottoNo);
		}
		System.out.println();
		System.out.println("로또번호: " + lottoSet);
		
		System.out.println("===================");
		lottoSet.clear();
		while (lottoSet.size() < 6) { //Set 데이터가 6개가 될때까지
			lottoSet.add((int)(Math.random() * 45) + 1);
		}
		System.out.println("로또번호(Set): " + lottoSet);
		
		// TreeSet : 저장되는 데이터가 정렬이 되어서 저장되므로 정렬 불필요
//		System.out.println("---- 정렬작업 진행 ----");
//		ArrayList<Integer> list = new ArrayList<>(lottoSet);
//		System.out.println("list : " + list);
//		
//		Collections.sort(list);
//		System.out.println("정렬된로또번호(list) : " + list);
		
		
	}

}

















