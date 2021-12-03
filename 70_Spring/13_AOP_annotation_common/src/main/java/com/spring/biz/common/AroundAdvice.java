package com.spring.biz.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Pointcut;

//(실습) AOP 관련 어노테이션 설정
// @Aspect, @Pointcut, @Around


public class AroundAdvice {
	
	// 포인트컷 작성 : 명칭은 메소드명 
	@Pointcut("execution(* com.spring.biz..*Impl.*(..))")
	public void allPointcut() {}
	
	// 포인트컷 작성 : 명칭은 메소드명 
	@Pointcut("execution(* com.spring.biz..*Impl.get*(..))")
	public void getPointcut() {}
	
	@Around(argNames = "allPointcut()", value = "returnObj")
	public Object aroundLog(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("[Around BEFORE] 실행전 로그");
		Object returnObj = pjp.proceed();
		System.out.println("[Around BEFORE] 실행후 로그");
		return returnObj;
		
	}
}