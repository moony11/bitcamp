package com.spring.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;


@Service
@Aspect
public class AfterReturningAdvice {

   
   //어드바이스 
   @AfterReturning(pointcut = "PointcutCommon.getPointcut()" , returning = "returnObj")
   public void afterReturningLog(JoinPoint jp, Object returnObj) {
      System.out.println("[후처리-AfterReturningAdvice.afterReturningLog ]" + "정상실행 후 로그" + returnObj);
      
   }
   
   
   
}