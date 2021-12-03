<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 요청 사이트에 따라 재요청 처리 --%>
<%
	// 요청 사이트에 따라 해당 웹사이트로 이동 
	String site = request.getParameter("site");
	System.out.println(">> ex10_resp_redirect.jsp site : " + site);
	
	switch (site) {
	case "naver" : // 네이버 웹페이지로 이동처리(재요청)
		response.sendRedirect("http://www.naver.com");
		break;
	case "daum" : // 네이버 웹페이지로 이동처리(재요청)
		response.sendRedirect("http://www.daum.net");
		break;
	case "google" : // 네이버 웹페이지로 이동처리(재요청)
		response.sendRedirect("http://www.google.com");
		break;
	}
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응갑페이지</title>
</head>
<body>
	<h1>응답페이지(ex10_resp_redirect.jsp)</h1>
</body>
</html>