<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답페이지</title>
</head>
<body>
	<h1>[ ex11_resp_forward.jsp]</h1>
	<h3>ID : <%=id %></h3>
	<h3>PW : <%=pwd %></h3>
</body>
</html>


<%
	//포워딩 처리(위임처리)
	RequestDispatcher rd = request.getRequestDispatcher("ex11_resp_forward-2.jsp");
	rd.forward(request, response);

%>




