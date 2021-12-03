<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 파일 업로드 처리하고 파일정보를 화면 표시--%>
<%
	// 한글처리를 위한 UTF-8 설정
	request.setCharacterEncoding("UTF-8");
	
	//(주의) form 태그에 enctype="multipart/form-data" 설정하면
	// request 객체를 통한 파라미터값 조회 안됨(MultiperRequest)
	String name = request.getParameter("name");
	System.out.println("> name : " + name);
	
	// 파일 저장할 위치 
	//String path = "c:/MyStudy/temp";
	String path = this.getServletContext().getRealPath("/upload"); //서비스 
	System.out.println("> path : " + path);
	
	MultipartRequest mr = new MultipartRequest(
			request, // 요청객체
			path, // 실제 파일을 저장할 경로
			10 * 1024 * 1024,
			"UTF-8", // 인코딩 형식
			new DefaultFileRenamePolicy()
			); 
%>

	<h1>파일업로드 결과 보기</h1>
	<h2>올린사람(name) : <%=mr.getParameter("name") %></h2>
	<h2>제목(title) : <%=mr.getParameter("title") %></h2>
	<h2>파일(f_name) : <%=mr.getParameter("f_name") %></h2>
	<h2>원본파일명 : <%=mr.getOriginalFileName("f_name") %></h2>
	<h2>저장파일명 : <%=mr.getFilesystemName("f_name") %></h2>
	<h2>파일타입 : <%=mr.getContentType("f_name") %></h2>
	<hr>
<%
	File file = mr.getFile("f_name");
	out.println("<h2>" + file.getName() + "</h2>");
	out.println("<h2>" + file.length() + "</h2>");
	
%>
	<hr>
	<h2>파일다운로드</h2>
	<a href="download.jsp?path=upload&name=<%=mr.getFilesystemName("f_name") %>">다운로드할 파일(<%=mr.getOriginalFileName("f_name") %>)</a>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	