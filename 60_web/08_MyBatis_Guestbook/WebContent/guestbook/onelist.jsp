<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터(idx)로 DB데이터 조회 후 화면 출력 --%>
<%
	//1. 전달받은 데이터 확인(추출)
	String idx = request.getParameter("idx");
	
	//2. DB관련 작업 - SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession();
	
	//3. DB관련 작업 - 데이터 가져오기
	GuestbookVO vo = ss.selectOne("guestbook.one", idx);
	ss.close();
	
	System.out.println("> vo : " + vo);
	
	//EL, JSTL 사용 + 검색 데이터 계속 사용을 위해 session에 등록
	session.setAttribute("guestbookVO", vo);
	System.out.println("> session guestbookVO : " + 
			session.getAttribute("guestbookVO"));
	
	
	//4. 화면에 표시 - HTML 태그에 데이터 표시
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세화면</title>
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
	#container tfoot { text-align: center; }
</style>
<script>
	function update_go() {
		location.href = "update.jsp"; // 수정 작업 페이지
	}
	function delete_go() {
		location.href = "delete.jsp"; // 삭제를 위한 암호확인 페이지
	}
</script>
</head>
<body>

<div id="container">
	<h2>방명록 : 상세화면</h2>
	<hr>
	<p><a href="list.jsp">[목록으로 이동]</a></p>
	
	<table>
		<tbody>
			<tr>
				<th>작성자</th>
				<td>${guestbookVO.name }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${guestbookVO.subject }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${guestbookVO.email }</td>
			</tr>
			<tr>
				<td colspan="2">${guestbookVO.content }</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수 정" onclick="update_go()">
					<input type="button" value="삭 제" onclick="delete_go()">
				</td>
			</tr>
		</tfoot>
	</table>
</div>

</body>
</html>