<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	request, session scope에 설정된 값 추출해서 화면에 표시 
--%>
<%
	//request, session scope에 설정된 값 사용
	String req_name = (String) request.getAttribute("req_name");
	String req_age = (String) request.getAttribute("req_age");
	
	// session 설정값
	String attr_name = (String) session.getAttribute("attr_name");
	String attr_age = (String) session.getAttribute("attr_age");
	
	// 세션 ID 및 상태 확인
	System.out.println(">> session id: " + session.getId()
				+ ", new : " + session.isNew());
	
	// 속성값 유무 확인
	if (attr_age == null) {
		attr_age = "세션에 속성 없음(attr_age)";
	}
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션(session) 범위</title>
<script>
	function sessionSet() {
		location.href = "ex01_sessionSet.jsp?name=hong&age=27";
	}
	
	function sessionRemove() {
		location.href = "ex01_sessionRemove.jsp";
	}
	
	function sessionInvalidate() {
		location.href = "ex01_sessionInvalidate.jsp";
	}
</script>
</head>
<body>
	<h1>세션(session) 테스트(ex01_session.jsp)</h1>
	<input type="button" value="세션 속성에 저장" onclick="sessionSet()">
	<input type="button" value="세션 속성에 삭제" onclick="sessionRemove()">
	<input type="button" value="세션 초기화(무효화)" onclick="sessionInvalidate()">
	<hr><hr>
	
	<h2>request 스코프(request)</h2>
	<h2>이름(request attr_name) : <%=req_name %></h2>
	<h2>나이(request attr_age) : <%=req_age %></h2>
	<hr>
	<h2>session 스코프</h2>
	<h2>이름(session attr_name) : <%=attr_name %></h2>
	<h2>나이(session attr_age) : <%=attr_age %></h2>
	
	
	
	
</body>
</html>