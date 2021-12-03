<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업선택</title>
<script>
	function all_search() {
		//location.href = list.jsp; // 예전방식 JSP 직접호출
		//location.href = "list"; // list 작업요청
		location.href = "controller?type=all";
	}
	function fullname_search() {
		//location.href = "fullname"; // 이름입력 화면으로 가기
		location.href = "controller?type=fullname";
	}
	function search_go() {
		location.href = "controller?type=search";
	}
</script>
</head>
<body>
	<h1>작업선택</h1>
	<button onclick="all_search()">전체보기</button>
	<button onclick="fullname_search()">성명검색(성, 이름 포함)</button>
	
	<button onclick="search_go()">동적검색</button>
</body>
</html>



