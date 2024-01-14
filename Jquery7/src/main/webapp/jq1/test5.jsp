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
$(function(){
	// 요소의 값을 변경 - html() / text()
	
	// html() 해당 요소 중 첫 번째 요소의 값을 가져오기
	var tmpHtml = $('h2').html();
	
	alert(tmpHtml);

	// text() 모든 해당 요소의 값을 가져오기
	var tmpText = $('h2').text();
	
	alert(tmpText);
	
	// 해당 모든 대상의 값을 변경
	// => 값이 태그 형태라면 태그를 적용 후 출력
// 	$('h2').html("아이티윌");
	$('div').html("<h3>아이티윌</h3>")
	
	// 해당 모든 대상의 값을 변경
	// => 값이 태그 형태라면 문자 그대로 출력
// 	$('h2').text("ITWILL");
// 	$('div').text("<h3>아이티윌</h3>")

	$('h2').html(function(index, oldHTML){
// 		alert(index + "/" + oldHTML);
		var tmpStar = "";
		for(var i = 0; i < index; i++){
			tmpStar += " * "
		}
		return oldHTML + tmpStar;
	});
	
	// div 출력되는 '아이티윌' - 서울지점, 부산지점, 전국통합지점
	var itwill = ["서울지점", "부산지점", "전국통합지점"];
	$('div').html(function(index, oldHTML){
		return "<h3> 아이티윌 - "  + itwill[index] + "</h3>";
	});
	


});

</script>
</head>
<body>
	<h1>test5.jsp</h1>
	
	<h2>head-0 </h2>
	<h2>head-1 </h2>
	<h2>head-2 </h2>
	
	<hr>
	
	<div>아이티윌</div>
	<div>아이티윌</div>
	<div>아이티윌</div>

</body>
</html>