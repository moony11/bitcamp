package com.spring.biz.view.controller;

/* ViewResolver 클래스는 Controller 가 리턴한 String(뷰)에
 * 접두어(prefix)와 접미어(sufix)를 결합해서
 * 재요청(응답할) 페이지의 경로와 파일명을 완성해서 리턴
 * DispatcherServlet의 init() 호출시 생성
 
 */
public class ViewResolver {
	private String prefix;
	private String sufix;
	
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	public void setSufix(String sufix) {
		this.sufix = sufix;
	}
	
	// login.jsp 응답처리 -> 전달되는 viewName은 login
	// 리턴값 : "./" + "login" + ".jsp" (./ 는 현재위치)
	public String getView(String viewName) {
		return prefix + viewName + sufix;
	}
}
