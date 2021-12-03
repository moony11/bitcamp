<%@page import="com.mystudy.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터(파라미터값)를 저장하고 화면 출력 
	1. MemberVO 타입의 객체(memberVO)를 생성
	2. 전달받은 파라미터 값을 memverVO 객체(인스턴스)에 저장
	3. memverVO 값을 화면 출력
--%>
<%--
	MemberVO memberVO = new MemberVO();
	memberVO.setId(request.getParameter("id"));
	memberVO.setPwd(request.getParameter("pwd"));
--%>
	<jsp:useBean id="memberVO" class="com.mystudy.MemberVO" />
	<jsp:setProperty property="*" name="memberVO"/>
<%
	System.out.println("memberVO : " + memberVO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입정보</title>
</head>
<body>
	<h1>회원가입정보</h1>
	<ul>
		<li>아이디 : <%=memberVO.getId() %></li>
		<li>암호 : <%=memberVO.getPwd() %></li>
		<li>이름 : <%=memberVO.getName() %></li>
		<li>성별 : <%=memberVO.getGender() %></li>
		<li>취미(배열값 처리) : 

<%
		for (String hobby : memberVO.getHobby()) {
			out.print(hobby + " ");
		}
%>
		</li>
	</ul>
</body>
</html>