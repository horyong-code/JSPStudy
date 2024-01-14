<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			url : "json1.jsp",
			dataType : "json",
			success : function(data){
				console.log(data);
				$('body').append(data.name + "/" + data.age + "/" + data.regdate);
				alert("jason1.jsp 처리 완료!"); /* alert, console.log는 제일 마지막에 */
			}
		}); // ajax
		
		// 비동기 방식으로 JSON 데이터 처리 가능
		$.getJSON("json1.jsp", function(data){
			console.log(data);
			$('body').append(data.name + "/" + data.age + "/" + data.regdate);
			alert("jason1.jsp 처리 완료!");
		});
		
	}); // jquery
</script>
</head>
<body>
	<h1>jsonTest1.jsp</h1>

</body>
</html>