package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/test03")
public class Ex03 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> Ex03.doGet() 실행~~");
		// 한글깨짐 방지를 위한 문자 타입 처리(UTF-8)
		response.setContentType("text/html;charset=UTF-8");
		// 클라이언트가 전달한 데이터를 받아서 HTML문서를 만들어서 되돌려줌
		// URL 요청 형식 : ?파라미터명=값&파라미터=값
		// URL 요청 작성 예) test03?name=hong&age=33
		// 파라미터 값 : 요청시 서버쪽으로 전달한 값
		// ------------
		// 응답처리 형식
		// 이름 : hong 
		// 나이 : 33
		
		// request 객체(인스턴스)로부터 파라미터 값 추출
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		System.out.println("> name : " + name + ", age : " + age);
		
		// 응답처리
		PrintWriter out = response.getWriter();
		out.println("<h1>전달 받은 데이더(이름, 나이)</h1>");
		out.println("<h2>이름 : " + name + "</h2>");
		out.println("<h2>나이 : " + age + "</h2>");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> Ex03.doPost() 실행!!!!");
		// 전달받은 데이터 한글처리(UTF-8)
		request.setCharacterEncoding("UTF-8");
		
		
		doGet(request, response);
	}

}
