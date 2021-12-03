<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- DB연결하고 프로그램 사용해서 사번구하기(가장 큰 사번 + 1111) --%>
<%
	// JDBC 프로그램 사용해서 사번구하기(가장 큰 사번 + 1111 자동생성) 
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER  = "mystudy";
	final String PASSWORD  = "mystudypw";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// 사용할 SQL 쿼리 작성
	String sql = "SELECT NVL(MAX(SABUN), 0) + 1111 AS SABUN FROM GUEST";
	int sabun = 0;
	
	try {
		// 1. 드라이버 로딩
		Class.forName(DRIVER);
		// 2. DB 연결 
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		// 3. Statement 객체 생성 (Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		// 4. 쿼리 실행
		rs = pstmt.executeQuery();
		// 5. 쿼리 실행 결과에 대한 처리 
		if (rs.next()) {
			sabun = rs.getInt("SABUN");
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		// close
		try {
			if (rs != null) rs.close();
			if (pstmt != null) rs.close();
			if (conn != null) rs.close();
		}  catch (Exception e) {
		e.printStackTrace();
	}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록</title>
</head>
<body>
	<h1>사원등록</h1>
	<form action="insert.jsp">
		<table>
			<tr>
				<th>사번</th>
				<td><input type="text" name="sabun" value="<%=sabun %>" readonly></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>금액</th>
				<td><input type="number" name="pay"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="사원등록"> 
				<input type="reset" value="초기화">
					</td>
			</tr>
		</table>
	</form>
</body>
</html>