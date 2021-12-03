<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서브페이지</title>
</head>
<body>
	<h1>서브페이지(sub)</h1>
	<a href="main.jsp">메인페이지로 이동</a>
	<h2>서브페이지 내용</h2>
	<p>.................</p>
	<p>.................</p>
	<p>.................</p>
	<p>.................</p>


	<hr><hr>
	<%@ include file="01_declaration.jsp" %>
	<%@ include file="02_scriptlet.jspf" %>
	<%@ include file="footer.jsp" %>
	
	<hr>
	<footer>
		(주) 미리디대표 : 강창석사업자 등록번호: 113-86-21886통신판매번호: 2019-서울구로-0855호사업자번호조회
		
메일: miricanvas@miridih.com서울시 구로구 디지털로31길 12 태평양물산 8층 미리디 (우편번호08380)

ⓒ MIRIDIH ALL RIGHTS RESERVED.
	</footer>
</body>
</html>