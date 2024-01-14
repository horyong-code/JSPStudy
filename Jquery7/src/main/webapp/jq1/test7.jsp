<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<style type="text/css">
	.high_0 {background-color: red;}
	.high_1 {background-color: orange;}
	.high_2 {background-color: yellow;}
	.high_3 {background-color: green;}
	.high_4 {background-color: blue;}
</style>


<script>
	$(function(){
// 		var colArr = ['red', 'orange', 'yellow', 'green', 'blue'];
		
// 		$('h2').css('background-color', function(index){
// 			return colArr[index];
// 		});

		// h2 태그에 각각에 알맞은 클래스명을 추가
// 		$('h2').addClass(function(index){
// 			return "high_" + index;
// 		});
		$('h2').each(function(index){
			$(this).addClass("high_" + index);
			// this - 나 자신을 가리키는 레퍼런스
			//      => 이벤트가 발생된 대상
		});
		
	
	});
</script>

</head>
<body>
	<h1>text7.jsp</h1>
	

<!-- 	<h2 class="high_0">head - 0</h2> -->
<!-- 	<h2 class="high_1">head - 1</h2> -->
<!-- 	<h2 class="high_2">head - 2</h2> -->
<!-- 	<h2 class="high_3">head - 3</h2> -->
<!-- 	<h2 class="high_4">head - 4</h2> -->

	<h2>head - 0</h2>
	<h2>head - 1</h2>
	<h2>head - 2</h2>
	<h2>head - 3</h2>
	<h2>head - 4</h2>
</body>
</html>