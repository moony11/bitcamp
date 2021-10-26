package com.mystudy.map1;

import java.util.TreeMap;

public class TreeMapExam {

	public static void main(String[] args) {
		// TreeMap : 키(key) 값 기준으로 오름차순 정렬해서 저장
		TreeMap<String, Integer> map = new TreeMap<>();
		map.put("홍길동", 100);
		map.put("김유신", 100);
		map.put("강감찬", 88);
		map.put("강감국", 88);
		map.put("100", 93);
		map.put("20", 93);
		map.put("10", 93);
		map.put("8", 93);
		map.put("a", 93);
		map.put("A", 93);
		map.put("!", 93);
		map.put("*", 93);
		map.put("%", 93);
		map.put("@", 93);
		map.put("-", 93);
		map.put("-", 99);
		
		System.out.println("map : " + map);
		
		for (String key : map.keySet()) {
			System.out.println(key + " : " + map.get(key));
		}

	}

}
