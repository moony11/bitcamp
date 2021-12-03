package com.spring.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class AfterThrowingAdvice {
	
	// 포인트컷 작성 : 명칭은 메소드명 
	@AfterThrowing(pointcut = "PointcutCommon.allPointcut()", throwing = "exceptionObj")
	public void execeptionLog(JoinPoint jp, Exception exceptionObj) {
		System.out.println("[후처리 - AfterThrowingAdvice.execeptionLog]"
				+ " 로직 수행 중 예외발생시 로그 - " + exceptionObj);
	}
	

}
