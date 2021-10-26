package com.mystudy.poly5_interface2;

//public class Pig implements Animal {
public class Pig extends AbstractAnimal {

	@Override
	public void eat() {
		System.out.println(">>뭐든 잘먹고 많이 먹는다");
	}

	@Override
	public void sleep() {
		System.out.println(">>잠도 잘자고 많이 잔다");
	}

	@Override
	public void sound() {
		System.out.println(">>꿀~꿀~");
	}

}
