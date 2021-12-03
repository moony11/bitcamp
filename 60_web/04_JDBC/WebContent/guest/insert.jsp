<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- (실습)전달받은 데이터를 이용해서 DB에 입력처리 
	정상입력 : list.jsp 페이지로 이동
	예외발생 : 현재페이지 오류메시지 보여주기
--%>
<%
	//1. 파라미터 값 추출(sabun, name, pay)
	//int sabun = Integer.parseInt(request.getParameter("sabun"));	
	String sabun = request.getParameter("sabun");
	String name = request.getParameter("name");
	int pay = Integer.parseInt(request.getParameter("pay"));
	
	//2. DB 입력작업
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
		sql += "INSERT INTO GUEST ";
		sql += "       (SABUN, NAME, REGDATE, PAY) ";
		sql += "VALUES (?, ?, SYSDATE, ?) ";
		//3-1. Connection 객체로 부터 Statement 객체 생성
		pstmt = conn.prepareStatement(sql);
		//3-2. 바인드변수에 값 설정
		//pstmt.setInt(1, sabun);
		pstmt.setInt(1, Integer.parseInt(sabun));
		pstmt.setString(2, name);
		pstmt.setInt(3, pay);
		
		//4. 쿼리 실행
		result = pstmt.executeUpdate();
	} catch (Exception e) {
		result = -1;
		System.out.println(">>>> catch 절 실행 result: " + result);
		e.printStackTrace();
	} finally {
		System.out.println(">>>> finally 구문 실행~~~~");
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}			
	
	//3. 페이지 이동처리
	if (result > 0) {
		response.sendRedirect("list.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외발생</title>
</head>
<body>
	<h1>사원 등록 실패</h1>
	<p>입력처리를 하지 못했습니다<br>
	담당자(8282)에게 연락하세요</p>
	<a href="addForm.jsp">입력페이지로 이동</a>
	<a href="list.jsp">전체목록 보기</a>
</body>
</html>




