package com.mystudy.poly5_interface2;

public class TypeTest {

	public static void main(String[] args) {
		//Cat, AbstractAnimal 메소드 사용 가능
		System.out.println("<Cat>---------------------------");
		Cat cat1 = new Cat();
		cat1.eat();
		cat1.test();
		
		System.out.println("<Dog>---------------------------");
		Dog dog1 = new Dog();
		dog1.eat();
		
		System.out.println("<Pig>---------------------------");
		Pig pig1 = new Pig();
		pig1.eat();
		
		System.out.println("---- AbstractAnimal 타입으로 사용 ----");
		AbstractAnimal cat2 = new Cat(); //부모클래스 타입으로 사용
		cat2.eat();
		cat2.sound();
		
		AbstractAnimal dog2 = new Dog();
		dog2.eat();
		
		AbstractAnimal pig2 = new Pig();
		pig2.eat();
		
		System.out.println("\n--- Animal 인터페이스 타입으로 사용 -------");
		// Animal 인터페이스 타입이 되면
		// Animal 인터페이스에 정의된 메소드만 사용 가능
		Animal cat = new Cat(); // 구현한 인터페이스 타입으로 사용
		Animal dog = new Dog();
		cat.eat();
		cat.sleep();
		cat.sound();
		
		System.out.println("----------------");
		sound(cat);
		sound(dog);

	}

	static void sound(Animal animal) {
		animal.sound();
	}
	
}










