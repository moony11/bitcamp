package com.mystudy.list2_vector;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.Vector;

public class VectorExam {

	public static void main(String[] args) {
		// Vector 클래스 : List 계열
		Vector<String> v = new Vector<String>(5); //용량(capacity) 5
		v.add("1");
		v.add("2");
		v.add("3");
		System.out.println(v);
		System.out.println("v.size(): " + v.size());
		System.out.println("v.capacity(): " + v.capacity());
		
		String temp = v.toString();
		System.out.println(temp);
		
		v.remove(2);
		System.out.println(v);
		System.out.println("v.size(): " + v.size());
		System.out.println("v.capacity(): " + v.capacity());
		
		System.out.println("---- trimToSize() 실행후 ---");
		v.trimToSize();
		System.out.println(v);
		System.out.println("v.size(): " + v.size());
		System.out.println("v.capacity(): " + v.capacity());

		v.addElement("4");
		System.out.println(v);
		System.out.println("v.size(): " + v.size());
		System.out.println("v.capacity(): " + v.capacity());
		
		v.add("AA"); //추가입력(맨뒤에 insert)
		System.out.println(v);
		
		v.add(2, "BB"); //삽입, 특정위치에 입력(insert)
		System.out.println(v);
		
		v.add(2, "CCC");
		System.out.println(v);
		
		System.out.println("------ clone() 실행후 -----");
		Vector<String> v2 = (Vector) v.clone();
		System.out.println("v : " + v);
		System.out.println("v2 : " + v2);
		
		System.out.println("--- v2.clear 실행후 ----");
		v2.clear();
		System.out.println("v : " + v);
		System.out.println("v2 : " + v2);
		
		System.out.println("======= Enumeration 객체 사용 조회 =======");
		Enumeration<String> enu = v.elements();
		while (enu.hasMoreElements()) {
			System.out.println("enu.nextElement() : " + enu.nextElement());
		}
		System.out.println(v);
		
		System.out.println("===== Iterator 활용 조회 ======");
		Iterator<String> ite = v.iterator();
		System.out.println("ite.hasNext() : " + ite.hasNext());
		while (ite.hasNext()) {
			System.out.println("ite.next() : " + ite.next());
		}
		System.out.println("ite.hasNext() : " + ite.hasNext());
		
	}

}







