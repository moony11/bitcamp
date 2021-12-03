<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forEach varStatus</title>
</head>
<body>
<%

	List<String> list = new ArrayList<>();
	list.add("홍길동-1");
	list.add("홍길동-2");
	list.add("홍길동-3");
	list.add("홍길동-4");
	System.out.println(" >> list : " + list);
	System.out.println(" >> list.size() +1) : " + list.size());
	pageContext.setAttribute("alist", list);
%>
	<h2>forEach List 데이터 표스</h2>
	<p>List 데이터 :
	<c:forEach items="${alist }" var = "listItem">
	${listItem }&nbsp;&nbsp;
	
	</c:forEach>
	</p>
	<hr>
	
	<ol>
	<c:forEach var='listItem' items="${alist }" 
		varStatus="status" begin="0" end="${alist.size() - 1 }" step="1">
		<li>
		var값 : ${listItem }<br>
		status.currut : ${status.current }<br><%-- 현재 처리중인 데이터 --%>
		status.count : ${status.count }<br><%-- 처리되는 데이터 건수 --%>
		status.index : ${status.index }<br><%-- 인덱스 번호--%>
		status.first : ${status.first }<br><%-- 첫번째 데이터인지 여부 --%>
		status.last : ${status.last }<br><%-- 마지막 데이터인지 여부 --%>
		
		status.begin : ${status.begin }<br><%-- begin 속성값 --%>
		status.end : ${status.end }<br><%-- end 속성값 --%>
		status.step : ${status.step }<br><%-- step 속성값 --%>
		
		status : ${status } 
		</li>
	
	</c:forEach>
	</ol>
	
	
	
</body>
</html>






