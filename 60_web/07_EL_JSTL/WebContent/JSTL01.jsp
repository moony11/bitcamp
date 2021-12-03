<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
<%-- JSTL(JSP Standard Tag Labrary)
	0. 라이브러리 구하기(인터넷)
		다운로드 : https://tomcat.apache.org/download-taglibs.cgi
		다운로드 : https://mvnrepository.com/ > jstl 검색
	1. 라이브러리 등록
		WebContent > WEB-INF > lib > jar 파일 등록
	2. JSTL 디렉티브(지시어) taglib 추가
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
--%>
	<h2>JSTL 사용</h2>
	<h3>속성설정 : set</h3>
	<%-- set : 속성 선언 태그 setAttribute 역할 
		<c:set var="속성명" value="속성값" scope="범위" />
		scope : page | request | session | application
	--%>
	<c:set var="test" value="Hello JSTL!!! - page" />
	<c:set var="test" value="Hello JSTL!!! - request" scope="request"/>
	<c:set var="test" value="Hello JSTL!!! - session" scope="session"/>
<%
	//System.out.println("test : " + test); //test cannot be resolved to a variable
	System.out.println("test : " + pageContext.getAttribute("test"));
%>
	<hr>
	<h3>속성값 출력 : out</h3>
	<p><c:out value="Hello World~~~" /></p>
	<p>page test(c:out) : <c:out value="${pageScope.test }"></c:out>
	<p>page test(EL) : ${pageScope.test }</p>
	<p>session test(EL) : ${sessionScope.test }</p>
	
	<p>application test(EL) : ${application.test }</p>
	<p>application test(c:out) :
		<c:out value="${application.test }" default="데이터없음!!!"/>
	</p>
	<hr>
	
	<h3>삭제 : remove</h3>
	<c:remove var="test" scope="page"/>
	
	<p>EL(scope 지정 안한 경우) : ${test }</p>
	<p>EL(page) : ${pageScope.test }</p>
	<p>EL(request) : ${requestScope.test }</p>
	<p>EL(session) : ${sessionScope.test }</p>
	<hr><hr>
	
	<%-- ======== if문 =========== --%>
	<h2>JSTL : if 태그의 test 속성</h2>
	<%-- JSTL에는 else 문이 제공되지 않음 --%>
	<c:if test="${20 > 10 }">
		<p>20 &gt; 10 결과 true인 경우 실행 문장</p>
	</c:if>
	<c:if test="${20 <= 10 }">
		<p>20 le 10 결과 true인 경우 실행 문장</p>
	</c:if>

	<h3>JSTL : if 태그2</h3>
	<c:set var="n1" value="30" />
	<c:set var="n2" value="50" />
	<c:if test="${n1 > n2 }" var="result">
		<p>if문 결과 n1이 n2 보다 큽니다(result : ${result })</p>
	</c:if>
	<c:if test="${n1 <= n2 }">
		<p>if문 결과 n1이 n2 보다 작거나 같습니다(result : ${result })</p>
	</c:if>
	<hr>

	<%--======= choose ~ when ~ otherwise ============--%>
	<h1>if문 choose문 비교 확인</h1>
	<c:set var="jumsu" value="80" />
	<c:if test="${jumsu >= 90 }">
		<p>판정결과(${jumsu }) : A</p>
	</c:if>
	<c:if test="${jumsu >= 80 }">
		<p>판정결과(${jumsu }) : B</p>
	</c:if>
	<hr>
	
	<h2>JSTL : choose ~ when ~ otherwise</h2>
	<p>자바코드의 if ~ else if ~ else if ~ else 처럼 동작</p>
	<c:choose>
		<c:when test="${jumsu >= 90 }">
			<p>판정결과(${jumsu }) : A</p>
		</c:when>
		<c:when test="${jumsu >= 80 }">
			<p>판정결과(${jumsu }) : B</p>
		</c:when>
		<c:when test="${jumsu >= 70 }">
			<p>판정결과(${jumsu }) : C</p>
		</c:when>
		<c:otherwise>
			<p>판정결과(${jumsu }) : 노력필요</p>
		</c:otherwise>
	</c:choose>
	
	<%-- ====== JSTL 반목문 forEach ========= --%>
	
	
	<br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br>
</body>
</html>






