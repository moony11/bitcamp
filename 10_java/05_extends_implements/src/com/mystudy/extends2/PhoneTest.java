package com.mystudy.extends2;

class PhoneTest {

	public static void main(String[] args) {
		// Phone 객체 생성 후 기능 테스트
		System.out.println("==== Phone =====");
		Phone ph1 = new Phone("010-1111-1111");
		ph1.view();
		ph1.call();
		ph1.receiveCall();
		
		Phone ph2 = new Phone("삼성갤럭시", "010-2222-2222");
		ph2.view();
		ph2.call();
		ph2.receiveCall();
		String str = ph2.toString(); //Object 클래스의 toString() 메소드 사용
		System.out.println(str);
		System.out.println(ph2.toString());
		System.out.println(ph2);
		
		System.out.println("===== Mp3Phone =========");
		Mp3Phone mp3ph = new Mp3Phone("010-3333-3333");
		mp3ph.view();
		mp3ph.call();
		mp3ph.receiveCall();
		System.out.println("전화번호: " + mp3ph.getPhoneNo()); 
		
		mp3ph.playMusic();
		
		System.out.println("===== WebPhone =========");
		WebPhone webPhone = new WebPhone("010-4444-4444");
		webPhone.view();
		webPhone.call();
		webPhone.receiveCall();
		
		webPhone.webSearch();
		webPhone.playMusic();
		webPhone.webSearch("코로나19");
		
		WebPhone webPhone2 = new WebPhone("크롬브라우저폰", "010-5555-5555");
		webPhone2.view();
	}

}







