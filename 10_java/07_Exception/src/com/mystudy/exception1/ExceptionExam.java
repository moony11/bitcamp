package com.mystudy.exception1;

public class ExceptionExam {

	public static void main(String[] args) {
		System.out.println("--- main() 시작 ----");
		int num = 100;
		int num1 = 0;
		int num2 = 30;
		int result = 0;
		System.out.println(">> 연산 시작~~");
		
		//예외처리 ------------------
		if (num1 == 0) {
			System.out.println("[예외발생] 나누는 값이 0입니다");
		} else {
			result = num / num1;
			System.out.println("result : " + result);
		}
		
		//try ~ catch 문으로 예외 처리
		System.out.println("--- try ~ catch 문으로 예외 처리---");
		try {
			result = num / num1; //java.lang.ArithmeticException: / by zero
			System.out.println("result2 : " + result);
		} catch(ArithmeticException ex) {
			System.out.println("[예외발생-메시지] " + ex.getMessage());
			ex.printStackTrace();
		} catch(RuntimeException e) {
			System.out.println("[예외발생-runtime] " + e.getMessage());
		} catch(Exception e) {
			System.out.println();
		}
		System.out.println("------------------");
		//result = num / num1;
		
		System.out.println("--- main() 끝 ----");

	}

}






