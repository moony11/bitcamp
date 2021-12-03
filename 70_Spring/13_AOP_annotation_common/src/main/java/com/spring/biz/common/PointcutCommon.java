package com.spring.biz.common;

import org.aspectj.lang.annotation.Pointcut;

	public class PointcutCommon {
		// 포인트컷 작성 : 명칭은 메소드명 
		@Pointcut("execution(* com.spring.biz..*Impl.*(..))")
		public void allPointcut() {}
		
		// 포인트컷 작성 : 명칭은 메소드명 
		@Pointcut("execution(* com.spring.biz..*Impl.get*(..))")
		public void getPointcut() {}
		
}
