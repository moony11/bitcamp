<%@page import="com.bc.bbs.vo.CommentVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.bbs.vo.BBSVO"%>
<%@page import="com.bc.bbs.dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 전달받은 파라미터 값 b_idx 
	1. 게시글 조회수 1증가(실습)
	2. 게시글(b_idx) 데이터 조회 후 화면 표시
	3. 게시글(b_idx)에 딸린 댓글이 있으면 화면 표시 
--%>
<%
	//파라미터 값 추출(확인)
	String b_idx = request.getParameter("b_idx");
	String cPage = request.getParameter("cPage");

	//1. 게시글 조회수 1증가(실습)
	
	//2. 게시글(b_idx) 데이터 조회
	int bIdx = Integer.parseInt(b_idx);
	BBSVO bvo = DAO.selectOne(bIdx);
	System.out.println("> bvo : " + bvo);
	
	//3. 게시글(b_idx)에 딸린 댓글이 있으면 가져오기
	List<CommentVO> list =  DAO.getCommList(bIdx);
	System.out.println("> list : " + list);
	
	// EL, JSTL 사용을 위한 scope상에 속성 등록하기
	
	//DB데이터 화면출력
	pageContext.setAttribute("c_list", list); //댓글 목록
	session.setAttribute("bvo", bvo); //게시글 하나
	session.setAttribute("cPage", cPage);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<script>
	function modify_go() {
			location.href = "modify_go()";
	}
	
	function delete_go() {
		location.href = "delete_go()";
	}
	
	function list_go() {
		location.href = "list.jsp?cPage=${cPage}";
	}

</script>
</head>
<style>
	#bbs table {
		width: 580px;
		margin-left: 10px;
		border-collapse: collapse;
		font-size: 14px;
	}
	#bbs table caption {
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	#bbs th, #bbs td {
		text-align: center;
		border: 1px solid black;
		padding: 4px 10px;
	}
	#bbs .align-left { text-align: left; }
	
	.title { background-color: lightsteelblue; }
	
	.no { width: 10%; }
	.writer { width: 15%; }
	.regdate { width: 20%; }
	.hit { width: 15%; }
	
	/****** 페이지 표시 영역 스타일(시작) **********/
	.paging { list-style: none; }
	.paging li {
		float: left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		border: 1px solid #00B3DC;
		font-weight: bold;
		color: black;
	}
	.paging .disable {
		border: 1px solid silver;
		padding: 3px 7px;
		color: silver;
	}
	.paging .now {
		border: 1px solid #ff4aa5;
		padding: 3px 7px;
		background-color: #ff4aa5;
	}
	
</style>
<body>

<div id="bbs">

<%-- 게시글 내용 표시 --%>
<table>
	<caption>상세보기</caption>
	<tbody>
		<tr>
			<th>제목</th>
			<td>${bvo.subject }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${bvo.writer }</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<c:if test="${empty bvo.file_name }">
					첨부파일없음
				</c:if>
				<c:if test="${not empty bvo.file_name }">
					<a href="download.jap?f_name=${bvo.file_name }">${bvo.ori_name }</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${bvo.content }</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="2">
				<input type="button" value="수정(작성실습)" onclick="modify_go()">
				<input type="button" value="삭제(작성실습)" onclick="delete_go()">
				<input type="button" value="목록" onclick="list_go()">
			<!--세션스코프에 있는 데이터 가져다가 인풋처리? bvo  -->
			</td>
		</tr>
	</tfoot>
</table>

<hr>

<%-- 게시글에 대한 댓글 작성 영역 --%>
<form action="ans_writer_ok.jsp" method="post"> 
	<p>이름 : <input type="text" name="writer">
	   비밀번호 : <input type="password" name="pwd">
	</p>
	<p>내용 : <textarea name="content" rows="4" cols="55"></textarea></p>
	<input type="submit" value="댓글저장">
	<input type="hidden" name="b_idx" value="${bvo.b_idx }">  <%-- 세션스코프 작성안했다면 이런식으로 넘겨줘야함--%>
<%-- <input type="hidden" name="cPage" value="${cPage }">  세션스코프 작성안했다면 이런식으로 넘겨줘야함--%>
</form>


<hr>
<%-- 게시글에 작성된 댓글 표시 영역 --%>
<c:forEach var="commVO" items="${c_list }">
<div class="comment">
	<form action="ans_del.jsp" method="post">
		<p>이름: ${commVO.writer } &nbsp;&nbsp; 작성일: ${commVO.write_date }</p>
		<p>내용: ${commVO.content }</p>
		<input type="submit" value="댓글삭제">
		<input type="hidden" name="c_idx" value="${commVO.c_idx }">
		<%-- 삭제처리 후 게시글 상세패이지로 이동시 (세션에 게시글정보 없으면 --%>
		<input type="hidden" name="b_idx" value="${commVO.b_idx }">
	</form>
</div>
</c:forEach>

</div>


</body>
</html>