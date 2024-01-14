<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<script>
$(function(){
	$('input').click(function(){
		alert("클릭! (JQuery)");
	});
	
	$('h2').click(function(){
		$(this).append("+");
	});
	
	// 이미지 변경하기
// 	$('img').mouseover(function(){
// 		$(this).attr('src', '../jq1/2.jpg');
// 	});
	
// 	$('img').mouseout(function(){
// 		$(this).attr('src', '../jq1/1.jpg');
// 	});
	
	// 체이닝 기법 : [. 연산자]를 사용하여 한 번에 
	$('img').mouseover(function(){
		$(this).attr('src', '../jq1/2.jpg');
	}).mouseout(function(){
		$(this).attr('src', '../jq1/1.jpg');
	});
	
	// 키보드 이벤트
	$('textarea').keyup(function(){
		// 입력된 글자수 체크
		var txtLength = $('textarea').val().length;
// 		alert(txtLength);
		
		// 200 - 입력된 글자수 => 화면에 출력 (h3 내용을 변경)
		$('h3').html(200 - txtLength);
		
		if(txtLength > 200){
			$('h3').css('color', 'red');
		}else {
			$('h3').css('color', 'black');
		}
	});
	
});
</script>
</head>
<body>
	<h1>test1.jsp</h1>
	
	<input type="button" value="버튼" onclick="alert('안녕하세요');">
	<h2>head-0</h2>
	<h2>head-1</h2>
	<h2>head-2</h2>
	
	<hr>
	<h2>이미지에 마우스를 올렸을 때, 이미지 변경
	    이미지에서 마우스를 내렸을 때, 원래 이미지로 변경</h2>
	<img src="../jq1/1.jpg">
	
	<hr>
	
	<h2>키보드 이벤트</h2>
	
	<h2>자소서 200자 작성! (200자가 넘으면 카운트 숫자를 빨간색으로 변경)</h2>
	<h3>200</h3>
	<textarea rows="10" cols="50"></textarea>

</body>
</html>