<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test1.jsp</title>
<!-- 제이쿼리 라이브러리 추가 (고정) -->
<!-- <script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script> -->
<!-- 제이쿼리 라이브러리 추가 (CDN : Content Delivery Network) -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>



<script type="text/javascript">
	// 자바스크립트 코드 작성
	
	// 제이쿼리 사용 준비 완료
	$(document).ready(function(){
		alert(" JQUERY1 실행 ");
	});
	
	$(function(){
		alert(" JQUERY2 실행 ");		
	});
</script>

</head>
<body>
	<h1>test1.jsp</h1>

</body>
</html>