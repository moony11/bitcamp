package com.mystudy.set1_hashset;

import java.util.HashSet;
import java.util.Iterator;

public class HashSetExam {

	public static void main(String[] args) {
		// HashSet : Set 인터페이스를 구현한 구현체(클래스)
		// 순서가 없고, 중복데이터 허용안함(동일데이터는 하나만 저장)
		// Set 에서 동일데이터 여부 확인은 hashCode(), equals() 값 확인
		// 1. 해시코드 값 확인 : hashCode()
		// 2. equals() 메소드 결과값이 모두 일치하면 동일데이터
		//-----------------------------------------
		HashSet<String> set = new HashSet<>();
		set.add("홍길동");
		set.add("홍길동");
		set.add("김유신");
		set.add(new String("홍길동"));
		
		System.out.println("홍길동 해시코드 : " + "홍길동".hashCode());
		System.out.println("new String(\"홍길동\") 해시코드 : " + new String("홍길동").hashCode());
		System.out.println(set);
		
		System.out.println("set.size() : " + set.size());
		System.out.println("set.contains(\"홍길동\") : " + set.contains("홍길동"));
		
		set.add("을지문덕");
		set.add("홍경래");
		System.out.println(set);
		
		System.out.println("---- Set 전체 데이터 조회(Iterator) ----");
		Iterator<String> ite = set.iterator();
		while (ite.hasNext()) {
			System.out.println(ite.next());
		}
		System.out.println("---------");
		for (String name : set) {
			System.out.println(name);
		}
		
		//------------------------------
		//(실습) 수정(변경) : 김유신 --> 강감찬
		// 김유신 삭제 and 강감찬 입력
		// 강감찬 입력 and 김유신 삭제
		System.out.println("--- 김유신 ==> 강감찬(수정/변경 처리) ---");
		//System.out.println("set.remove(\"일지매\") : " + set.remove("일지매"));
		//System.out.println("set.remove(\"김유신\") : " + set.remove("김유신"));
		
		set.remove("김유신");
		set.add("강감찬");
		
		if (set.contains("김유신")) {
			set.remove("김유신");
			System.out.println(">> 김유신 데이터가 삭제되었습니다");
			set.add("강감찬");
		} else {
			System.out.println(">> 김유신 데이터가 없습니다");
		}
		
		if (set.remove("홍길동")) {
			System.out.println(">> 홍길동 데이터가 삭제되었습니다");
		} else {
			System.out.println(">> 홍길동 삭제실패! 데이터를 확인하세요");
		}
		
		
		System.out.println(set);
		
	}
	

}








