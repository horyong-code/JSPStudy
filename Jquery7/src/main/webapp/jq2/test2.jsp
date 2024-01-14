<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.aniBox {
		width: 50px;
		height: 50px;
		background-color: orange;
	}
</style>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<!-- bxslider -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<!-- bxslider -->

<script type="text/javascript">
	$(document).ready(function(){
		$('h1').click(function(){
			// $(this).hide(); <-> $().show();
			// slideUp / slideDown / slideToggle
			// fadeIn / fadeOut / fadeToggle
			
			$(this).next().fadeToggle('slow', function(){
				// 콜백 함수 : 지금 적용하는 효과 / 처리가 모두 완료된 후
				// 실행되는 함수
			}); // hide + show
		});
		
		$('.bxslider').bxSlider({ // .함수({}) => 나열
			auto: true,
			autoControls: true,
			stopAutoOnClick: true,
			pager: true,
			slideWidth: 600,
			speed: 5000
		});
		
		$('.aniBox').click(function(){
			// 클릭시마다 박스의 크기 증가
			var width = $(this).css('width');
			var height = $(this).css('height');
			
// 			alert(typeof width);
			
// 			$(this).css('width', parseInt(width) + 50);
// 			$(this).css('height', parseInt(height) + 50);
// 			alert(" 클릭 : w : " + width + ", h : " + height);

			$(this).animate({
				width : parseInt(width) + 50,
				height : parseInt(height) + 50				
			});
		});
	});
</script>
</head>
<body>
	<h1>열기 / 닫기 1</h1>
	<div>
		<h1>제목1</h1>
		<p>본문1</p>
	</div>
	
	<h1>열기 / 닫기 2</h1>
	<div>
		<h1>제목2</h1>
		<p>본문2</p>
	</div>
	
	<div class="bxslider">
    	<div>I am a slide.</div>
    	<div>I am other slide.</div>
    	<div>아이티윌 부산</div>
    	<div><img src="../jq1/1.jpg"></div>
    </div>
    
    <div class="aniBox"></div>
    
    
</body>
</html>