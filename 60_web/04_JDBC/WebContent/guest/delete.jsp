<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- (실습) 전달받은 데이터(파라미터값) 사용해서 DB데이터 삭제 처리 
	정상처리후 : list.jsp 이동
	예외발생시 : 현재페이지에 오류 메시지 보여주기
--%>
<%
	//1.전달받은 파라미터 값 확인(추출)
	int sabun = Integer.parseInt(request.getParameter("sabun"));
	
	//2. DB 데이터 삭제 처리
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	
	Connection conn = null;
	PreparedStatement pstmt = null;	
	
	int result = 0;
	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. DB연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		//3. Statement 객체 생성(Connection 객체로 부터)
		String sql = "DELETE FROM GUEST WHERE SABUN = ?";
		//3-1. Connection 객체로 부터 Statement 객체 생성
		pstmt = conn.prepareStatement(sql);
		//3-2. 바인드변수에 값 설정
		pstmt.setInt(1, sabun);
		
		//4. 쿼리 실행
		result = pstmt.executeUpdate();
		System.out.println(">>> result : " + result);
	} catch (Exception e) {
		result = -999;
		e.printStackTrace();
	} finally {
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}				
	//3. 페이지 이동처리
	if (result == 0) { //SQL문장은 정상실행되었으나 데이터 없어서 삭제 못함
%>
		<script>
			alert("[삭제실패] 데이터가 없어서 삭제하지 못했습니다\n"
					+ "목록페이지로 이동합니다");
			location.href = "list.jsp";
		</script>
<%		
	} else if (result > 0) { //SQL문장은 정상실행 + 데이터 삭제 처리
%>
		<script>
			alert("[삭제완료] 삭제완료하고 목록페이지로 이동합니다");
			location.href = "list.jsp";
		</script>
<%		
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외발생</title>
</head>
<body>
	<h1>사원정보 삭제 실패</h1>
	<p>삭제처리를 하지 못했습니다<br>
	담당자(8282)에게 연락하세요</p>
	<a href="detail.jsp?sabun=<%=sabun %>">상세페이지로 이동</a>
	<a href="list.jsp">전체목록 보기</a>
</body>
</html>