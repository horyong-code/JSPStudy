<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.7.1.min.js"></script>
<script>
	// document.fr.id -> JS로 객체 접근
	// $ ('요소 선택자') -> $ ('input' / '#id') -> JQuery
	// 덮어쓰기 [넓음 -> 좁음]
	
	$(document).ready(function(){
		alert("준비 끝!"); // document 완료 (HTML 완료) -> JQuery
	$('*').css('color', 'red'); // 모든 요소 - 선택자
	$('h2').css('color', 'blue'); // 태그 요소 - 선택자
	// 클래스 요소 - 선택자
	$('.t1').css('color', 'orange');
	// 아이디 요소 - 선택자
	$('#t2').css('color', 'green');
	
	// 클래스 - 아이디 속성의 차이점
	// => 중복 여부, 클래스명은 여러 개 사용 [아이디 (중복 불가) : 위에서 아래로 1개만 적용]
	
	$('#id').css('color', 'orange');
	
	// 속성 탐색 선택자
// 	$('input').css('color', 'pink');
	$('input[type=text]').css('color', 'pink');
// 	$('input[type=password]').css('color', 'blue');
	$('input[type^=p]').css('color', 'blue');
	
	// 입력된 비밀번호를 저장하는 객체
	var tag = $('input[type=password]').val();
	console.log(tag);
// 	alert('비밀번호 : ' + tag);
	
	// $('tr').css('color', 'black'); - 안 바뀜
	// $('td').css('color', 'black'); - 다 바뀜
	
	$('tr:first > td').css('color', 'black');
	
	// 홀수 행 - red 배경색
	// 짝수 행 - blue 배경색
	$('tr:odd td').css('background-color', 'red');
	$('tr:even td').css('background-color', 'blue');
	
	
	
});
</script>
</head>
<body>
	<h1>test2.jsp</h1>
	
<!-- 	<form action="" name="fr"> -->
<!-- 		<input type="text" name="id" id="id"> -->
<!-- 	</form> -->
	
	<hr>
	
	<h2 class="t1" id="t2">제목 1</h2>
	<h2 class="t1" id="t2">제목 2</h2>
	
	<hr>
	
	아이디 : <input type="text" name="id" id="id"><br>
	비밀번호 : <input type="password" name="pass" id="pass" value="1234"><br>
	
	<hr>
	
	<table border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>성별</td>
		</tr>
		<tr>
			<td>1</td>
			<td>홍학생</td>
			<td>남</td>
		</tr>
		<tr>
			<td>2</td>
			<td>김학생</td>
			<td>여</td>
		</tr>
		<tr>
			<td>3</td>
			<td>이학생</td>
			<td>남</td>
		</tr>
	</table>

</body>
</html>