<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSON XML</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	//$(document).ready(function(){});
	//$().ready(function(){});
	//$(function(){});
	$(document).ready(function(){
		$("#getDataBtn").click(getJsonMembers);
		
	});
	function getJsonMembers() {
		alert(">> getJsonMembers() 실행 ~~");
		
		$.ajax("getJsonMembers", { // url 밖으로 뻄
			type : "get",
			dataType : "json", //응답받을 데이터 타입 지정
			success : function(data){
				alert("Ajax 처리 성공 - 응답받은 데이터 : " + data);
				console.log(data);
				console.log(data.list);
				
				
				// 전달받은 json 데이터 처리 
				
				let tbody = "";
				let alist = data.list; //JSON 객체의 속성명 "list"의 값 추출
				$.each(alist, function(index, member){
					//console.log("this.name : " + this.name);
					tbody += "<tr>";
					tbody += "<td>" + this.idx + "</td>";
					tbody += "<td>" + this.name + "</td>";
					tbody += "<td>" + this["age"] + "</td>";
					tbody += "<td>" + this["addr"] + "</td>";
					//tbody += "<td>" + member."regdate" + "</td>";
					tbody += "<td>" + member["regdate"] + "</td>";
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
	<h1>JSON XML 데이터 요청 처리</h1>
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