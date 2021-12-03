<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터(암호)와 DB 저장 암호 일치여부 확인 후 처리\
	비교값 : 전달받은 pwd 파라미터값과 session의 pwd 값과 비교
	- 일치하면 : DB데이터 삭제 후 목록페이지로 이동
	- 불일치면 : 이전페이지로 이동
--%>
<%
	//0. 한글처리를 위한 encoding 설정
	request.setCharacterEncoding("UTF-8");

	String pwd = request.getParameter("pwd");
	GuestbookVO vo = (GuestbookVO) session.getAttribute("guestbookVO");
	System.out.println("param pwd: " + pwd + ", vo pwd: " + vo.getPwd());
	
	//암호 일치여부 확인
	if (pwd.equals(vo.getPwd())) { //일치
		//(실습)암호 일치하는 경우 - DB데이터 삭제처리 후 목록페이지로 이동
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			//ss.delete("guestbook.delete", vo);
			ss.delete("guestbook.delete2", vo.getIdx());
%>
			<script>
				alert("정상삭제 되었습니다. 목록페이지 이동");
				location.href = "list.jsp";
			</script>
<%			
		} catch(Exception e) { %>
			<script>
				alert("[예외발생] 삭제실패!! 목록페이지 이동");
				location.href = "list.jsp";
			</script>
<%			
		} finally {
			ss.close();
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지</title>
<script>
	alert("암호불일치, 암호를 확인하세요");
	history.back();
</script>
</head>
<body>

</body>
</html>