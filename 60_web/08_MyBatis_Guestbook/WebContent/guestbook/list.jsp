<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%-- DB에서 전체데이터 조회 후 화면 출력 --%>
<%
	//DB에서 전체데이터 조회 후 화면 출력
	/*
	openSession(true) : 자동커밋 상태로 세션 객체 생성(SQL문장 실행 후 자동커밋)
	openSession(), openSession(false) : Auto Commit 해제 상태(트랜잭션 처리 필요)
		- insert, update, delete 작업 후 명시적으로 commit 처리 필요
	*/
	//1. SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession();
	
	//2. 매퍼(Mapper)의 SQL 실행해서 데이터 가져오기
	//SqlSession selectList(매퍼id) : select 결과를 List 형태로 받기
	//SqlSession selectOne(매퍼id) : select 결과를 하나(1, 0)인 경우
	List<GuestbookVO> list = ss.selectList("guestbook.all");
	ss.close();
	
	System.out.println("> list : " + list);
	
	//3. SQL문 실행 후 받은 데이터 화면 출력
	pageContext.setAttribute("attr_list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체목록</title>
<style>
	#container {
		width: 512px; margin: auto;
		/* border: 1px solid blue; */
	}
	#container h2 { text-align: center; }
	#container p { text-align: center; }
	#container table { 
		width: 100%;
		border-collapse: collapse;
	}
	#container th {
		background-color: #9cf;
	}
	th, td { border: 1px solid black; }
	#container .center { text-align: center; }
</style>
</head>
<body>

<div id="container">
	<h2>방명록</h2>
	<hr>
	<p><a href="write.jsp">[방명록쓰기]</a></p>
	<table>
		<colgroup>
			<col width="10%">
			<col width="50%">
			<col width="20%">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<%-- 
			<tr>
				<td class="center">1</td>
				<td class="center">홍일동</td>
				<td>제목1</td>
				<td>2021-09-27</td>
			</tr>
			--%>
		<%-- SQL실행 후 결과 List 사용 tr태그 만들기(EL, JSTL 사용) --%>
		<c:if test="${not empty attr_list }">
			<c:forEach var="vo" items="${attr_list }">
				<tr>
					<td class="center">${vo.getIdx() }</td>
					<td>
						<a href="onelist.jsp?idx=${vo.idx }">${vo.subject }</a>
					</td>
					<td class="center">${vo.name }</td>
					<td class="center">${vo.regdate.substring(0,10) }</td>
				</tr>
			</c:forEach>
		</c:if>
		
		<%-- <c:if test="${attr_list.size() <= 0 }"> --%>
		<c:if test="${empty attr_list }">
			<tr>
				<td colspan="4">검색된 데이터가 없습니다</td>
			</tr>
		</c:if>
		</tbody>
	</table>
	
</div>


</body>
</html>




