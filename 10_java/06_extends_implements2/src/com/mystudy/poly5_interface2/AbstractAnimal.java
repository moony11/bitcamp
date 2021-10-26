package com.mystudy.poly5_interface2;

public abstract class AbstractAnimal implements Animal {

	@Override
	public void eat() {
		System.out.println(">>먹는다(AbstractAnimal)");
	}

	@Override
	public void sleep() {
		System.out.println(">> 잠을 잔다(AbstractAnimal)");
	}

	@Override
	public abstract void sound(); //선언만 한 추상메소드 구현은 구현체(클래스)에서

}








