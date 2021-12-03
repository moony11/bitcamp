<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%> 

	<h1>[  ex11_rewp_redirect.js페이지]</h1>
	<hr>
	<h2>ID: <%=id %></h2>
	<h2>PW: <%=pwd %></h2>
	
<%
	//재요청 처리 (리다이렉트)
	response.sendRedirect("ex11_resp_redirect-2.jsp");
	//response.sendRedirect("ex11_resp_redirect-2.jsp?id=" + id + "&pwd=" + pwd);
%>
</body>
</html>