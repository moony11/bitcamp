package com.mystudy.innerclass;

interface TestInter {
	int DATA = 100;
	void printData(); //추상메소드
}

//인터페이스를 구현한 클래스
class TestInterImpl implements TestInter {
	@Override
	public void printData() {
		System.out.println(">>>> 구현한 메소드");
	}
}

public class AnonymousClassTest {

	public static void main(String[] args) {
		TestInterImpl imp = new TestInterImpl();
		imp.printData();
		
		TestInterImpl imp2 = new TestInterImpl();
		imp2.printData();

		//익명클래스 : 클래스에 이름이 없는 클래스
		//한번만 사용하는 용도로 만들어 사용하는 클래스
		TestInter test = new TestInter() {
			@Override
			public void printData() {
				System.out.println("DATA : " + DATA);
			}
		};
		test.printData();
		
		TestInter test2 = new TestInter() {
			@Override
			public void printData() {
				System.out.println("나는 클래스 이름이 없어요~~~");
			}
		};
		test2.printData();
	}

}





