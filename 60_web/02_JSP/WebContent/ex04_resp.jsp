<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터(파라미터값)을 화면 출력--%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
%>   
<!DOCTYPE html>  
<html>
<head>
<meta charset="UTF-8">
<title>응답페이지</title>
</head>
<body>
	<h1>응답페이지(ex04_resp.jsp)</h1>
	<h2>(응답)당신이 입력한 값이 맞나요?</h2>
	<h2>아이디 : <%=id %></h2>
	<h2>암호 : <%=pw %></h2>
</body>
</html>




