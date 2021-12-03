<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%-- 주문한 내역에 따라 계산하고 결과를 표시 --%>
 <%
 	// 주문한 내역에 따라 계산하고 결과를 표시
 	// 1. 파라미터 값 추출
 	String coffee = request.getParameter("coffee");
 	//System.out.println(menu);
 	
 	int count = Integer.parseInt(request.getParameter("su"));
 	int inputmoney = Integer.parseInt(request.getParameter("money"));
 	
	
 	// 2. 계산처리(구입금액, 잔액)
 
 	String menu = ""; // 선택메뉴
 	int danga = 0; // 메뉴단가
 	
 	// 2-1 선택메뉴에 따른 메뉴명, 단가 확인
/* 	
 	if ("1".equals(coffee)) {
 		menu = "아메리카노";
 		danga = 3000;
 	}
 	if ("2".equals(coffee)) {
 		menu = "카페모카";
 		danga = 3500;
 	}
 	if ("3".equals(coffee)) {
 		menu = "에스프레소";
 		danga = 2500;
 	}
 	
 	if ("4".equals(coffee)) {
 		menu = "카페라떼";
 		danga = 4000;
 	}
*/

	switch (coffee) {
	case "1" : menu = "아메리카노"; danga = 3000; break;
	case "2" : menu = "카페모카"; danga = 3500; break;
	case "3" : menu = "에스프레소"; danga = 2500; break;
	case "4" : menu = "카페라떼"; danga = 4000; break;

	}
 	System.out.println(menu +  " : " + danga);
 	System.out.println(count +  "개");
 	
 	
 	int price = danga * count;
 	int change = inputmoney - price;
 	
 	String message;
 	if (inputmoney < price) {
 		message = "금액이 부족합니다.";
 	} else {
 		message = "입금완료";
 	}
 	
 	// 3. 계산결과 화면출력 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문결과</title>
</head>
<body>
	<h2>주문 계산 결과(응답)</h2>
<%--
	커피종류 : 아메리카노 
	단가 : 3000원
	수량 : 3개
	구입금액 : 9000원 (단가 * 수량)
	------------------------------
	입금액 : 10000원
	거스름돈 : 1000원 (입금액 - 구입금액)
 --%>
 	<ul>
 		<li>커피종류 : <%=menu %></li>
 		<li>단가 : <%=danga %>원</li>
 		<li>수량 : <%=count %>개</li>
 		<li>구입금액 : <%=price %>원</li>
 	</ul>
 	<hr>
 	<ul>
 		<li>입금액 : <%=inputmoney %>원</li>
 		<li>입금액 : <%=message %></li>
 		<li>거스름돈 : <%=change %>원</li>
 	</ul>

</body>
</html>