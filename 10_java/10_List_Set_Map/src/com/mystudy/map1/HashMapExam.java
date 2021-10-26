package com.mystudy.map1;

import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

public class HashMapExam {

	public static void main(String[] args) {
		// Map<K,V> 인터페이스 : 키(key)-값(value) 쌍으로 데이터 저장 관리
		// - 순서가 없다
		// - 키(key) : 중복 안됨(중복값 없이 유일한 데이터)
		// - 값(value) : 중복 데이터 저장 가능
		//---------------------------------
		HashMap<String, Integer> map = new HashMap<>();
		map.put("홍길동", 100); //데이터 입력/수정
		map.put("김유신", new Integer(95));
		map.put("강감찬", 88);
		System.out.println(map.put("계백", 88));
		System.out.println(map.put("홍길동", 93)); //동일한 key가 있으면 수정처리됨
		System.out.println(map);
		
		HashMap<String, Integer> map2 = new HashMap<>();
		map2.put("일지매", 92);
		map2.put("전우치", 82);
		System.out.println(map2);
		
		map2.remove("일지매"); //데이터 삭제
		map2.remove("전우치");
		System.out.println(map2);
		
		//--------------------
		System.out.println("map.isEmpty() : " + map.isEmpty());
		System.out.println("map2.isEmpty() : " + map2.isEmpty());
		System.out.println("map.get(\"홍길동\") : " + map.get("홍길동"));
		System.out.println("map.containsKey(\"을지문덕\") : " 
				+ map.containsKey("을지문덕"));
		System.out.println("map.containsValue(88) : " + map.containsValue(88));
		
		//데이터 수정
		System.out.println("-------------");
		//{홍길동=93, 김유신=95, 계백=88, 강감찬=88}
		System.out.println("map : " + map);
		System.out.println("map.replace(\"홍길동\", 99) : " + map.replace("홍길동", 99));
		System.out.println("map.replace(\"을지문덕\", 99) : " + map.replace("을지문덕", 99));
		
		System.out.println("map : " + map);
		
		//============================
		System.out.println("===== Map 전체 데이터 조회 ===========");
		// Map<K,V> 에서는 키(key)를 이용해서 데이터(value) 조회
		System.out.println("--- 키(key) 추출 : keySet() 사용 ---");
		Set<String> keySet = map.keySet();
		System.out.println("keySet : " + keySet);
		Iterator<String> ite = keySet.iterator();
		while (ite.hasNext()) {
			String key = ite.next();
			Integer value = map.get(key);
			System.out.println("key: " + key + ", value: " + value);
		}
		// 개선된 for문 형태 ------------------
		
		//-----------------
		System.out.println("--- 값(value) 추출 : values() 사용 ----");
		Collection<Integer> values = map.values();
		System.out.println("값(values) : " + values);
		
		// 값들의 합계 구하기
		Iterator<Integer> iteValues = values.iterator();
		int sum = 0;
		while (iteValues.hasNext()) {
			Integer value = iteValues.next();
			sum += value;
			System.out.println("점수 : " + value);
		}
		System.out.println("합계 : " + sum);
		
		
		System.out.println("========= Map 데이터 전체 조회 =========");
		System.out.println("--- entrySet() 사용 ----");
		// Entry : Map 내부에 선언된 인터페이스 - Map.Entry
		Set<Entry<String, Integer>> entrySet = map.entrySet();
		System.out.println("entrySet : " + entrySet);
		
		Iterator<Entry<String, Integer>> entryIte = entrySet.iterator();
		while (entryIte.hasNext()) {
			Entry<String, Integer> entry = entryIte.next();
			System.out.println("key: " + entry.getKey() + ", value: " 
					+ entry.getValue());
		}
	}

}











