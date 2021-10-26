package com.mystudy.interface2;

public class PhoneTest {

	public static void main(String[] args) {
		System.out.println("=== Phone ===");
		Phone ph1 = new Phone("010-1111-1111");
		ph1.view();
		ph1.call();
		ph1.receiveCall();
		ph1.sendSMS();
		ph1.receiveSMS();
		System.out.println("타입: " + ph1.getType());
		System.out.println("번호: " + ph1.getPhoneNo());
		

	}

}












