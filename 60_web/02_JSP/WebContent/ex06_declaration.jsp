<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부 메소드</title>
</head>
<body>
	<h2>덧셈</h2>
	<h3>100 + 200 = 300</h3>
<%
	int a = 100; // 메소드 내에 선언된 로컬변수
	int b = 200;
	int sum = a + b;
%>
	<h3><%=a %> + <%=b %> = <%=sum %></h3>
	<hr>
	
	<h2>선언부의 메소드 선언 및 사용</h2>
	<h3>sum(a, b) : <%=a + " + " + b%> = <%=sum(a, b) %></h3>
	
<%
	tot = sum(a, b);
%>
	<h3>tot 출력 : <%=tot  %></h3>
<%!
	// 선언부에 작성된 코드는 필드영역에 작성되는 코드 
	private int sum(int a, int b) {
		return a + b;
	}
%>

<%!
	int tot = 0; //필드변수(전역변수)
%>
	
	
</body>
</html>












