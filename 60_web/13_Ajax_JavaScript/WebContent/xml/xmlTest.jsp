<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax XML</title>
</head>
<body>
	<h1>Ajax XML 데이터 요청처리</h1>
	<hr>
<script>
	//javaScript에서 Ajax 사용할때 XMLHttpRequest 객체 사용
	//1. XMLHttpRequest 객체 생성
	var request = new XMLHttpRequest();
	
	request.onreadystatechange = function(){
		if (request.readyState == 4 && request.status == 200) {//응답완료 + 정상처림
			alert("리턴받은 값(문자열) : \n" + request.responseXML);
			console.log(request.responseXML);
		
			//XML 데이터 추출
			let xml = request.responseXML;
			let names = xml.getElementsByTagName("name");
			let prices = xml.getElementsByTagName("price");
			console.log(names);
			
			//데이터 사용 
			let output = "";
			for (let i = 0; i < names.length; i++) {
				console.log(names[i]); //<name>우유</name>
				let name = names[i].childNodes[0].nodeValue;
				console.log(name);
				let price = prices[i].childNodes[0].nodeValue;
				
				output += "<h2>" + name + " : " + price + "</h2>";
			}
			document.body.innerHTML += output;
		} 
		
	};
	
	//2. open("전송방식", "요청정보", "비동기여부")
	request.open("GET", "data.xml", true);
	
	//3. send() 실행
	request.send();
</script>
</body>
</html>