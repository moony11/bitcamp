package com.mystudy.interface1;

/*
- 기능
	1. 전화정보 확인(view)
	2. 전화걸기(call)
	3. 전화받기(receiveCall)
	4. 메시지 보내기
	5. 메시지 받기
*/
interface I_Phone {
	//{} 없음 : 추상메소드(abstract 메소드 - 구현부 없음)
	//인터페이스에 정의되는 메소드는 기본적으로 public abstract 임
	public abstract void view();
	public void call(); //abstract 생략해도 abstract 메소드
	void receiveCall(); //public abstract 메소드
	void sendSMS(); //public abstract 생략됨
	void receiveSMS(); //public abstract 생략됨
}


















