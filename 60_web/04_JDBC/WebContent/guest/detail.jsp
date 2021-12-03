<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 사번으로 DB에서 조회해서 가져온 데이터 화면 표시 --%>
<%
	//1. 전달받은 사번 값 추출(확인)
	String sabun = request.getParameter("sabun");
	
	//2. DB 데이터 조회
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//DB 데이터 저장용 변수
	String name = "";
	Date regdate = null;
	int pay = 0;
	
	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. DB연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		//3. Statement 객체 생성(Connection 객체로 부터)
		String sql = "";
		sql += "SELECT SABUN, NAME, REGDATE, PAY ";
		sql += "  FROM GUEST ";
		sql += " WHERE SABUN = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(sabun));
		
		//4. 쿼리실행
		rs = pstmt.executeQuery();
		
		//5. 쿼리 실행 결과에 대한 처리
		if (rs.next()) {
			//sabun = rs.getInt("SABUN");
			name = rs.getString("NAME");
			regdate = rs.getDate("REGDATE");
			pay = rs.getInt("PAY");
		}
		
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}		
	//3. 조회된 데이터 화면 표시
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
</head>
<body>
	<h1>상세정보</h1>
	<table border>
		<tr>
			<th>사번</th>
			<td><%=sabun %></td>
		</tr>
		<tr>
			<th>성명</th>
			<td><%=name %></td>
		</tr>
		<tr>
			<th>날짜</th>
			<td><%=regdate %></td>
		</tr>
		<tr>
			<th>금액</th>
			<td><%=pay %></td>
		</tr>
	</table>
	<a href="editForm.jsp?sabun=<%=sabun %>&name=<%=name %>&pay=<%=pay %>">수정</a>
	<a href="delete.jsp?sabun=<%=sabun %>">삭제</a>
	<a href="list.jsp">목록보기</a>
</body>
</html>




