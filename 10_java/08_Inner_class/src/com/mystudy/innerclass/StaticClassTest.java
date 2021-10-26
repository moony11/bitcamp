package com.mystudy.innerclass;

public class StaticClassTest {
	int a = 10;
	private int b = 100;
	static int c = 200;
	
	static int sum = 0;
	static int sNum1 = 20;
	static int sNum2 = 30;
	
	static void sum() {
		sum = Inner.d + sNum2;
	}
	
	//스태틱 내부 클래스
	static class Inner {
		static int d = 1000;
		int e = 2000; //non-static
		
		void printData() { //non-static 메소드
			//System.out.println("int a : " + a); //non-static
			//System.out.println("private int b : " + b); //non-static
			System.out.println("외부 static int c : " + c); //static
			System.out.println("내부 static int d : " + d); //static
			System.out.println("내부Inner int e : " + e);
		}
	}

	public static void main(String[] args) {
		int num = StaticClassTest.c;
		
		//static 내부클래스의 static 필드변수 사용
		int innerNum = StaticClassTest.Inner.d;
		
		//static 내부클래스의 객체(인스턴스) 생성 후 non-static 메소드 사용
		StaticClassTest.Inner inner = new StaticClassTest.Inner();
		inner.printData();
	}

}








