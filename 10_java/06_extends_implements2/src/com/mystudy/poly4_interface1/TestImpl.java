package com.mystudy.poly4_interface1;

public class TestImpl implements InterfaceTest{

	@Override
	public void eat() {
		System.out.println(">>먹는다");
	}

	@Override
	public String sleep() {
		return "잠을잔다";
	}

	@Override
	public void sound() {
		System.out.println(">>> 소리낸다");
	}

}
