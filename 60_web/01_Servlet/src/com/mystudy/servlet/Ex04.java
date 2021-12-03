package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class Ex04 extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest requset, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println("Ex04.doGet() 실행~~~");
		// request 객체(인스턴스)로부터 파라미터 값 추출
		// 1. getParameter(파라미터명) : 하나의 파라미터 값 추출
		// 2. getParameterValues(파라미터명) : 배열형태 값 추출(체크박스 등)
		// 3. getParameterMap() : 파라미터 값을 Map 형태로 추출
		// 기타 getParameterNames(); : 파라미터명 확인시 사용 (while 사용해서 추출??)
		
		// 전달받은 회원가입 정보를 추출해서 회원가입정보를 작성 후 응답처리
		String name = requset.getParameter("name");
		System.out.println(":: name : - " + name + " - ");
		String id = requset.getParameter("id");
		String pwd = requset.getParameter("pwd");
		String email = requset.getParameter("email");
		
		//String hobby = requset.getParameter("hobby"); // 값을 하나밖에못읽음
		//System.out.println("-- hobby : - " + hobby + " - ");
		
		// 취미(hobby)값 추출
		String[] hobby = requset.getParameterValues("hobby");
//		System.out.println("-- hobby : - " + hobby + " - ");
//		System.out.println("-- hobby 배열값: - " + Arrays.toString(hobby) + " - ");
		// System.out.println("-- hobby 첫번째 : - " + hobby[0] + " - "); // 선택된 값이 없으면 500 에러
		
		
		// 서버 콘솔에 값출력 - 추출된 데이터 확인 
		System.out.println("-------------------------");
		System.out.println("name : " + name);
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		System.out.println("email : " + email);
		
		System.out.println("-- hobby : - " + hobby + " - ");
		System.out.println("-- hobby 배열값: - " + Arrays.toString(hobby) + " - ");
		
		//========================
		// 클라이언트 (브라우저) 쪽으로 응답 처리
		// 응답데이터의 한글 깨짐 방지를 위한 문자셋 설정
		response.setContentType("text/html;charset=UTF-8"); // 문자셋 지정(한글처리)
		
		PrintWriter out = response.getWriter();
		out.println("<h2>회원가입정보</h2>");
		out.println("<ul>");
		out.println("<li>이름 : " + name + "</li>");
		out.println("<li>아이디 : " + id + "</li>");
		out.println("<li>비밀번호 : " + pwd + "</li>");
		out.println("<li>이메일 : " + email + "</li>");
		
		// 선택된 취미 정보
		out.println("<li>취미 : ");
		if(hobby == null) {
			out.write("선택사항없음");
		} else {
			for (String str : hobby) {
				out.write(str + "&nbsp;&nbsp;");
			}
		}
		out.println("</li>");
		out.println("</ul>");
		
	}
}
