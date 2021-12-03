<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- (실습) 전달받은 데이터(파라미터값) 사용해서 DB데이터 수정 처리 
	수정할 데이터 : 성명, 금액, 날짜(SYSDATE)
	정상처리후 : list.jsp 이동 또는 detail.jsp 페이지 이동 처리
	예외발생시 : 현재페이지에 오류 메시지 보여주기
--%>
<%
	//1.전달받은 파라미터 값 확인(추출)
	int sabun = Integer.parseInt(request.getParameter("sabun"));
	String name = request.getParameter("name");
	int pay = Integer.parseInt(request.getParameter("pay"));
	
	//2. DB수정 작업
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
		String sql = "";
		sql += "UPDATE GUEST ";
		sql += "   SET NAME = ? ";
		sql += "     , PAY = ? ";
		sql += "     , REGDATE = SYSDATE ";
		sql += " WHERE SABUN = ? ";
		//3-1. Connection 객체로 부터 Statement 객체 생성
		pstmt = conn.prepareStatement(sql);
		//3-2. 바인드변수에 값 설정
		pstmt.setString(1, name);
		pstmt.setInt(2, pay);
		pstmt.setInt(3, sabun);
		
		//4. 쿼리 실행
		result = pstmt.executeUpdate();
	} catch (Exception e) {
		result = -1;
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
	if (result > 0) {
		//response.sendRedirect("list.jsp");
		response.sendRedirect("detail.jsp?sabun=" + sabun);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외발생</title>
</head>
<body>
	<h1>사원정보 수정 실패</h1>
	<p>수정처리를 하지 못했습니다<br>
	담당자(8282)에게 연락하세요</p>
	<a href="detail.jsp?sabun=<%=sabun %>">상세페이지로 이동</a>
	<a href="list.jsp">전체목록 보기</a>
</body>
</html>


