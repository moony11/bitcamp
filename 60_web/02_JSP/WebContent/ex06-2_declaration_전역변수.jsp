<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부 전역변수</title>
</head>
<body>
<%!
	// 선언부(declaration)는 필드영역에 작성되는 코드
	// 선언부에 선언된 필드 변수는 값이 하나(생성된 객체가 하나기 떄문에 공유해서 사용)
	int globalNum = 0; // 필드변수 
%>
<% 
	// 스크립트릿 - service() 메소드 영역(로컬영역, 서비스 요청시 호출되고 실행)
	int localNum = 0; // 지역변수
	localNum++;
	globalNum++;
	
	System.out.println("globalNum : " + globalNum);
	System.out.println("localNum : " + localNum);
%>
	<h1>선언부/스크립트릿 변수값 확인</h1>
	<h2>globalNum : <%=globalNum %></h2>
	<h2>localNum : <%=localNum %></h2>



</body>
</html>









