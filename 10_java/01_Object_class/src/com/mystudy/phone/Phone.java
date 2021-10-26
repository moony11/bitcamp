package com.mystudy.phone;

public class Phone {
	//속성(property) 
	String name; //모델명
	String type; //타입
	int hsize; //가로크기
	int vsize; //세로크기
	boolean hasLCD; //LCD 유무

	//생성자 선언 영역 ----------------
	Phone() {} //기본생성자 명시적 선언(정의)
	Phone(String name, String type) {
		this.name = name; // this 현재객체(인스턴스)
		this.type = type;
	}
	Phone(String name, String type, boolean hasLCD) {
//		this.name = name; 
//		this.type = type;
//		this.hasLCD = hasLCD;
		
		this(name, type); //현재객체(인스턴스) 생성자 호출
		this.hasLCD = hasLCD;
	}
	
	//메소드 선언 영역 ----------------
	void call() {
		System.out.println(">> 전화걸기~~");
	}
	void receiveCall() {
		System.out.println(">> 전화받기~~");
	}
	void sendSms(String msg) {
		System.out.println("[메시지전송]" + msg);
	}
	String receiveSms(String msg) {
		System.out.println("[메시지수신]" + msg);
		return msg;
	}
	
	void view() {
		System.out.println("--- 전화기 정보 ---");
		System.out.println("모델명 : " + name);
		System.out.println("타입 : " + type);
		System.out.println("가로크기 : " + hsize);
		System.out.println("세로크기 : " + vsize);
		System.out.println("LCD유무 : " + hasLCD);
	}
	
	
	
	
}














