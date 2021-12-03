<%@page import="com.bc.bbs.common.Paging"%>
<%@page import="com.bc.bbs.dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 현재 페이지에 표시할 데이터를 화면 표시 
	1. 페이징 처리를 위한 객체(Paging) 생성해서 필요한 데이터 참조
	2. 페이징 객체에 설정할 데이터 저장
	3. (DB) 전체 데이터 건수 조회
	4. (DB) 현재 페이지 표시할 데이터 조회
	5. 데이터 화면 표시(화면컨트롤 - 스타일 지정)
--%>
<%
	//페이징 처리를 위한 Paging 객체 생성해서 값 읽고 설정
	Paging p = new Paging();

	//1. 전체 게시물의 수량 구하기	
	p.setTotalRecord(DAO.getTotalCount()); 
	p.setTotalPage();
	System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
	System.out.println("> 전체 페이지 수 : " + p.getTotalPage());
	
	//2. 현재 페이지 구하기
	String cPage = request.getParameter("cPage");
	if (cPage != null) {
		p.setNowPage(Integer.parseInt(cPage));
	}
	System.out.println("> cPage : " + cPage);
	System.out.println("> paging nowPage : " + p.getNowPage());
	
	//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
	p.setEnd(p.getNowPage() * p.getNumPerPage()); //현재페이지번호 * 페이지당게시글 수
	p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
	
	//(선택적) 3-1. 끝 번호가 데이터 건수보다 많아지면 데이터 건수와 동일한 번호로 설정
	if (p.getEnd() > p.getTotalRecord()) {
		p.setEnd(p.getTotalRecord());
	}
	System.out.println(">> 시작번호(begin) : " + p.getBegin());
	System.out.println(">> 끝번호(end) : " + p.getEnd());
	
	//---- 블록(block) 계산하기 ----------------
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글목록</title>
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
<table>
	<caption>게시글 목록</caption>
	<thead>
		<tr class="title">
			<th class="no">번호</th>
			<th class="subject">제목</th>
			<th class="writer">글쓴이</th>
			<th class="regdate">날짜</th>
			<th class="hit">조회수</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>1</td>
			<td>제목1</td>
			<td>테스터</td>
			<td>2021-10-05</td>
			<td>0</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="4">
				<ol class="paging">
					<li class="disable">이전으로</li>
					<li class="now">1</li>
					<li><a href="list.jsp?cPage=2">2</a></li>
					<li><a href="list.jsp?cPage=3">3</a></li>
					<li><a href="#">다음으로</a></li>
				</ol>
			</td>
			<td>
				<input type="button" value="글쓰기">
			</td>
		</tr>
		
	</tfoot>
</table>

</div>


</body>
</html>





