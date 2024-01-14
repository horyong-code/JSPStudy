<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.7.1.min.js"></script>

<script>
$(function(){
	// $('h2').css('color', 'red');
	var c = $('h2').css('color');
	alert('결과 : ' + c); // rgb(0,0,0) : 검정색
	
	// 글자색 - 파란색으로 변경
	// => 요소에 속성 하나를 적용
	$('h2').css('color', 'blue');
	c = $('h2').css('color');
	alert('결과 : ' + c); // rgb(0,0,255) : 파랑색
	// $('h2').css('color', 'blue', 'red'); : 속성 1개, 속성값 1개

	// h2 태그의 글자색 빨, 주, 노 순서대로 설정
	$('h2:first').css('color', 'red');
	$('h2:not(h2:first, h2:last)').css('color', 'orange');
	$('h2:last').css('color', 'yellow');
	
	var colorArr = ['red', 'orange', 'yellow'];
	
	// 각 요소별 각각에 다른 속성을 적용
	$('h2').css('color', function(index, value){ // 함수 = 익명함수
		alert(index + "/" + value);
		// 0, 1, 2 / rgb(0,0,255)
		return colorArr[index];
	});

// 	$('h2').css('color', function(value){ // 함수 = 익명함수
// 		alert(index + "/" + value);
// 		// 0, 1, 2 / rgb(0,0,255)
// 		return colorArr[value];
// 	});

// 	$('h2').css('background-color', 'black');
// 	$('h2').css('background-color', 'rgb(0,0,0)');
// 	$('h2').css('background-color', '#000000');

	// 하나의 요소에 여러 개의 속성을 적용
	// 글자색, 배경색 변경
	$('h2').css({
		'color' : function(index, value){
			return colorArr[index];
		},
		'background-color': 'black'
	});
	
});

</script>
</head>
<body>
	<h1>test3.jsp</h1>
	<h2>head - 0</h2>
	<h2>head - 1</h2>
	<h2>head - 2</h2>
	<h2>head - 3</h2>

</body>
</html>