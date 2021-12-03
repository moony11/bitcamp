package com.spring.biz.common;

public class AfterThrowingAdvice {
	public void exceptionLog() {
		System.out.println("[후처리 AfterAdvice.exceptionLog] "
				+ "비즈니스 로직 수행 중 예외 발생시 로그");
	}
}
