<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax XML</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	//$(document).ready(function(){});
	//$().ready(function(){});
	//$(function(){});
	$(document).ready(function(){
		$("#getDataBtn").click(getXmlMembers);
		
	});
	function getXmlMembers() {
		alert(">> getXmlMembers() 실행 ~~");
		//location.href = "getXmlMembers";
		
		$.ajax({
			url : "getXmlMembers",
			type : "get",
			//data : "name="+ name + "&age=" + age;
			//data : $("#inputForm").serialize(); //form 데이터 파라미터 전달
			dataType : "xml", //응답받을 데이터 타입 지정
			success : function(data){
				alert("Ajax 처리 성공 - 응답받은 데이터 : " + data);
				console.log(data);
				// 전달받은 XML 데이터 처리 
				//console.log($(this).find("idx").text()); // 여기서부터 안찍히네...
				
				let tbody = "";
				$(data).find("member").each(function(){
					tbody += "<tr>";
					tbody += "<td>" + $(this).find("idx").text() + "</td>";
					tbody += "<td>" + $(this).find("name").text() + "</td>";
					tbody += "<td>" + $(this).find("age").text() + "</td>";
					tbody += "<td>" + $(this).find("addr").text() + "</td>";
					tbody += "<td>" + $(this).find("regdate").text() + "</td>";
					tbody += "</tr>";
				});
				$("#tbody").html(tbody);
			},
			error : function(jqXHR, textStatus, errorThrown){
				alert("Ajax 처리 실패 : \n"
						+"jqXHR.readyState : " + jqXHR.readyState + "\n"
						+"textStatus : " + textStatus + "\n"
						+"errorThrown : " + errorThrown);
				
			}
			
		});

	}
</script>
</head>
<body>
	<h1>Ajax XML 데이터 요청 처리</h1>
	<button id="getDataBtn">Ajax - XML 데이터 가져오기</button>
	<hr>
	<table border>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>주소</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody id="tbody">
			<tr>
				<td>1</td>
				<td>홍길동</td>
				<td>27</td>
				<td>서울</td>
				<td>2021-10-07</td>
			</tr>
		</tbody>
	</table>
	<hr>
</body>
</html>