package com.spring.biz.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service //객체(인스턴스) 생성 (xml파일에bean 태그 대신 사용됐다고 생각하면됨)
@Aspect // 포인트컷 + 어드바이스 연결 
public class BeforeAdvice {
	
	// 포인트컷 작성 : 명칭은 메소드명 
	@Pointcut("execution(* com.spring.biz..*Impl.*(..))")
	public void allPointcut() {}
	
	// 어드바이스 동작 시점 설정 + 포인트컷 지정 
	@Before("allPointcut()")
	public void beforeLog() {
		System.out.println("[사전처리 - BeforeAdvice.beforeLog] 실행전 로그");
	}
	
}
