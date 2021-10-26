package com.mystudy.extends2;

// Phone 클래스를 상속받아(extends: 확장해서) Mp3Phone 만들기
class Mp3Phone extends Phone {
	
	public Mp3Phone(String phoneNo) {
		super("Mp3Phone타입", phoneNo);
	}
	
	public Mp3Phone(String type, String phoneNo) {
		super(type, phoneNo);
	}
	
	public void playMusic() {
		System.out.println(">> Mp3Phone - 음악플레이");
	}
}
