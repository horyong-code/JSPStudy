<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 제이쿼리 라이브러리 추가 (CDN : Content Delivery Network) -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<script>
$(document).ready(function(){
	// $('img').css('width', '100');
	// => CSS 속성을 변경 / 제어
	
	// 요소의 속성을 변경 / 제어
	// 속성의 정보 확인 - 해당 요소 중 첫 번째 요소의 속성 값 조회
	var tmp = $('img').attr('src');
	alert(tmp);
	
	// 속성 값 변경
	$('img').attr('src', '2.jpg');
	
	// border 속성 변경 - 5, 10, 15
	var border = [5, 10, 15];
	$('img').attr('border', function(index, value){
		return border[index];
	});
	
	// 가로 길이 100, border - 2, 4, 6 크기로 설정
	$('img').attr({
		'width': '100',
		'border': function(index){
			return (index + 1) * 2;
		}
	});
	
	
	
	// 객체 : 메서드 (동작) + 프로퍼티 (속성, 특징)
	// <img src=""> : img - 요소 / src="" - 속성

});
</script>
</head>
<body>
	<h1>test4.jsp</h1>
	
	<img src="1.jpg" width="50">
	<img src="2.jpg" width="100">
	<img src="3.jpg" width="150">
</body>
</html>