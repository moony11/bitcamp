package com.mystudy.poly3_abstract_class;

//추상클래스 : abstract class
//구현메소드와 추상메소드가 함께 있는 클래스(추상메소드가 하나라도 있으면)
//추상클래스는 추상메소드가 있기 때문에 객체(인스턴스)를 생성할 수 없음
abstract class AbstractAnimal {
	String name; //이름, 명칭
	int legCnt; //다리갯수
	
	void eat() {
		System.out.println(">> 먹는다");
	}
	
	void sleep() {
		System.out.println(">> 잠을 잔다");
	}
	
	abstract void sound(); // 추상메소드(abstract method)

}


















