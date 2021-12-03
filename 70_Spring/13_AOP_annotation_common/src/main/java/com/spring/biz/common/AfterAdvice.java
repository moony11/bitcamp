package com.spring.biz.common;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

//(실습) AOP 관련 어노테이션 설정
//@Aspect, @Pointcut, @After
@Service
@Aspect
public class AfterAdvice {

	// 포인트컷 작성 : 명칭은 메소드명 
	@Pointcut("execution(* com.spring.biz..*Impl.*(..))")
	public void allPointcut() {}
	
	@After("allPointcut()")
	public void afterLog() {
		 System.out.println("[후처리 - AfterAdvice.afterLog] 실행 후 로그 (무조건)");
	}
}
