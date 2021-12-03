<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 VO 데이터를 화면에 표시하고 수정데이터 작성 --%>
<%
	//0. 전달받은 데이터 확인(session 에 있는)
	System.out.println(">> update.jsp session guestbookVO : "
			+ session.getAttribute("guestbookVO"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정화면</title>
<link href="../css/guestbook.css" rel="stylesheet" type="text/css">
<script>
	function save_go(frm) {
		//비밀번호 확인 후 수정 요청 처리
		var pwd1 = frm.pwd.value; //지금 입력한 암호
		var pwd2 = "${guestbookVO.pwd}"; //EL 데이터 문자열 처리
		if (pwd1 != pwd2) {
			alert("암호가 일치하지 않습니다. 암호를 확인하세요");
			frm.pwd.value = "";
			frm.pwd.focus();
			return false;
		}
		
		frm.action = "update_ok.jsp"; //DB 수정 작업 처리 페이지
		frm.submit();
	}
</script>
</head>
<body>

<div id="container">
	<h2>방명록 : 수정화면</h2>
	<hr>
	<p><a href="list.jsp">[목록으로 이동]</a></p>
	
	<form method="post">
	<table>
		<tbody>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="name" value="${guestbookVO.name }"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" value="${guestbookVO.subject }"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" value="${guestbookVO.email }"></td>
			</tr>
			<tr>
				<th>비밀번호확인</th>
				<td><input type="text" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" rows="5" cols="60">${guestbookVO.content }</textarea> 
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수 정" onclick="save_go(this.form)">
					<input type="reset" value="다시작성">
					<input type="hidden" name="idx" value="${guestbookVO.idx }">
				</td>
			</tr>
		</tfoot>
	</table>	
	</form>
</div>

</body>
</html>