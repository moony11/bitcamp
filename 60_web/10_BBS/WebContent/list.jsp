<%@page import="com.bc.bbs.vo.BBSVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.bbs.common.Paging"%>
<%@page import="com.bc.bbs.dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	//4. 블록의 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
	//시작페이지 구하기
	int nowPage = p.getNowPage();
	int beginPage = (nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
	p.setBeginPage(beginPage);
	p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
/*
	(개인실습) 현재페이지 번호로 현재 블록(nowBlock) 구한 후
	시작페이지, 끝페이지 구하기(끝페이지 구하고 시작페이지 구하기)
*/
	//4-1. 끝페이지(endPage)가 전체페이지 수(totalPage) 보다 크면
	// 끝페이지를 전체페이지 수로 변경 처리
	if (p.getEndPage() > p.getTotalPage()) {
		p.setEndPage(p.getTotalPage());
	}
	System.out.println(">> beginPage : " + p.getBeginPage());
	System.out.println(">> endPage : " + p.getEndPage());
%>
<%
	//====================================
	//현재페이지 기준으로 DB데이터(게시글) 가져오기
	//시작글번호, 끝 글번호로 
	List<BBSVO> list = DAO.getList(p.getBegin(), p.getEnd());
	System.out.println("> 현재페이지 글목록(list) : " + list);
%>
<%
	//===============================
	//EL, JSTL 사용을 위해 scope에 데이터 등록(page 영역)
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("pvo", p);
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
	<%-- 
		<tr>
			<td>1</td>
			<td>제목1</td>
			<td>테스터</td>
			<td>2021-10-05</td>
			<td>0</td>
		</tr>
	--%>
	<c:choose>
	<c:when test="${empty list }">
		<tr>
			<td colspan="5">
				<h2>현재 등록된 게시글이 없습니다</h2>
			</td>
		</tr>
	</c:when>
	<c:otherwise>
		<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.b_idx }</td>
			<td class="align-left">
				<a href="view.jsp?b_idx=${vo.b_idx }&cPage=${pvo.nowPage}">${vo.subject }</a>
			</td>
			<td>${vo.writer }</td>
			<td>${vo.write_date.substring(0,10) }</td>
			<td>${vo.hit }</td>
		</tr>
		</c:forEach>
	</c:otherwise>
	</c:choose>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="4">
				<ol class="paging">
				<c:choose><%--[이전으로]에 대한 사용여부 처리 --%>
				<c:when test="${pvo.beginPage == 1 }">
					<li class="disable">이전으로</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="list.jsp?cPage=${pvo.beginPage - 1 }">이전으로</a>
					</li>
				</c:otherwise>
				</c:choose>	
				
				<%--블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지) --%>
				<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
				<c:choose>
				<c:when test="${pageNo == pvo.nowPage }">
					<li class="now">${pageNo }</li>
				</c:when>
				<c:otherwise>
					<li><a href="list.jsp?cPage=${pageNo }">${pageNo }</a></li>
				</c:otherwise>	
				</c:choose>
				</c:forEach>
				
				
				<%--[다음으로]에 대한 사용여부 처리 --%>	
				<c:if test="${pvo.endPage < pvo.totalPage }">					
					<li><a href="list.jsp?cPage=${pvo.endPage + 1 }">다음으로</a></li>
				</c:if>
				<c:if test="${pvo.endPage >= pvo.totalPage }">					
					<li class="disable">다음으로</li>
				</c:if>
				</ol>
			</td>
			<td>
				<input type="button" value="글쓰기"
					onclick="javascript:location.href='write.jsp'">
			</td>
		</tr>
	</tfoot>
</table>

</div>


</body>
</html>





