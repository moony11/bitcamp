<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터 사용해서 파일 다운로드 처리 --%>
<%
	// 한글처리 위한 UTF-8 설정 
	request.setCharacterEncoding("UTF-8");
	
	// 전달받은 파라미터 값 추출(확인)
	String path = request.getParameter("path"); // 경로
	String name = request.getParameter("name"); // 물리적 저장된 파일명
	System.out.println("> path : " + path);
	System.out.println("> name : " + name);
	
	// 실제 파일이 저장된 경로 확인 
	String realPath= this.getServletContext().getRealPath(path);
	System.out.println("> realPath : " + realPath);
	
	// 다운로드 받을 수 있도록 클라이언트 응답 문서타입 변경
	response.setContentType("application/x-msdownload");
	
	// 클라이언트 헤더정보를 첨부파일이 있는 것으로 변경
	response.setHeader("Content-Disposition", "attachment;filename=" + name);
	
	// --------------- 실제 파일 읽고 쓰기 작업 --------------
	// 물리적으로 실제 파일을 복사하는 작업을 구현 
	File file = new File(realPath + "/" + name);
	
	// input, output 스트림(바이트계열) 객체 생성
	FileInputStream fis = null;
	BufferedInputStream bis = null;
	
	BufferedOutputStream bos = null;
	
	if (file.isFile()) {
		try {
			// 파일 읽기 객체 생성
			fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis);
			
			// 파일 쓰기 객체 생성
			bos = new BufferedOutputStream(response.getOutputStream());
			
			// 파일 읽고, 쓰기
			int readValue = bis.read();
			while (readValue != -1) {
				bos.write(readValue);
				readValue = bis.read();
			}
			bos.flush();
			
			// JSP 출력스트림과 서블릿 출력스트림이 겹쳐서 
			// 발생하는 오류 발생시 해결법 
			out.clear(); // 아웃객체 클리어
			out = pageContext.pushBody();
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			bos.close();
			bis.close();
		}
	}
	
%>









