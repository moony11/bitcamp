<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청페이지</title>
</head>
<body>
	<%-- JSP 요청페이지에서 데이터 전달하고 응답받기 --%>
	<h2>(요청) ID, PW 값 서버측으로 전달</h2>
	<form action="ex04_resp.jsp">
		<h2>ID : <input type="text" name="id" value="홍길동"></h2>
		<h2>PW : <input type="password" name="pw" value="pw1234"></h2>
		<input type="submit" value="서버로 전송">
		
		
	</form>
</body>
</html>