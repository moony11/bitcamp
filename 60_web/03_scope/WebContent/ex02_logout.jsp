<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 세션초기화(무효화) 하고 이동처리 --%>

<%
	// 세션 초기화(무효화)
	session.invalidate();

	// ex01_session.jsp 로 이동(재요청 처리)
	response.sendRedirect("ex02_login.jsp");
%>

