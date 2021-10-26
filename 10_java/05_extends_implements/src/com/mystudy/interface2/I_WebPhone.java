package com.mystudy.interface2;

//전화기 기본기능 + 음악플레이 + 웹서치기능
public interface I_WebPhone extends I_Phone, I_Mp3Phone {
//	public abstract void view();
//	public void call(); //abstract 생략해도 abstract 메소드
//	void receiveCall(); //public abstract 메소드
//	void sendSMS(); //public abstract 생략됨
//	void receiveSMS(); //public abstract 생략됨
//	
//	void playMusic();
	
	//웹서치기능
	void webSearch();
}













