<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 DB에 저장(INSERT) 
	입력성공시 : 목록페이지로 이동(list.jsp)
	입력실패(예외) : 메시지 표시 후 이전화면(입력페이지) 이동
--%>
<%
	//0. 한글처리
	request.setCharacterEncoding("UTF-8");

	//1. 파라미터 값 추출해서 VO에 저장
%>
	<jsp:useBean id="guestbookVO" class="com.bc.mybatis.GuestbookVO" />
	<jsp:setProperty property="*" name="guestbookVO"/>
<%	
	System.out.println("> guestbookVO : " + guestbookVO);	

	//2. SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession(true); //자동커밋 상태로 세션객체 생성
	
	//3. SqlSession 객체 사용 매퍼의 insert SQL 실행(VO 데이터 전달)
	try {
		ss.insert("guestbook.insert", guestbookVO);
		//4. 페이지 이동(전환) 처리 - 정상처리된 경우
%>
		<script>
			alert("정상입력되었습니다\n목록페이지로 이동합니다");
			location.href = "list.jsp";
		</script>
<%		
	} catch (Exception e) {
		//4. 페이지 이동(전환) 처리 - 예외발생시
		System.out.println(">>[예외발생] 입력작업중 오류발생~~~");
		e.printStackTrace();
%>
		<script>
			alert("[예외발생] 입력중 예외가 발생했습니다\n"
					+ "담당자(8282)에게 연락하세요\n"
					+ "이전페이지로 이동합니다.");
			history.back();
		</script>
<%		
	} finally {
		ss.close();
	}
%>