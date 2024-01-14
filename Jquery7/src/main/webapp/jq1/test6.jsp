<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<script>
	$(document).ready(function(){
		// append() : 뒤에 추가 / prepend() : 앞에 추가
		$('body').append("안녕하세요!");
		$('body').append("<h2>안녕하세요!</h2>");
		$('body').prepend("<h2>아이티윌 부산</h2>");
		
		$('div').append(function(index, HTML){
			return " - " + index;
		});
		
		var tableData = [
			{no : 1, name : "김학생", gender : "남"}, // {객체}
			{no : 2, name : "이학생", gender : "여"},
			{no : 3, name : "박학생", gender : "여"},
			{no : 4, name : "최학생", gender : "남"},
			{no : 5, name : "정학생", gender : "남"}
		];
		
// 		$('tr').append("<tr><td>" + tableData[0].no + "</td><td>" + tableData[0].name + "</td><td>" + tableData[0].gender + "</td></tr>");
		
		for(var i = 0; i < tableData.length; i++){
		$('table').append("<tr><td>" + tableData[i].no + "</td><td>" + tableData[i].name + "</td><td>" + tableData[i].gender + "</td></tr>");
		}
		
		// $.each() : 선택한 요소를 순차적으로 접근할 때 사용하는 메서드
		$.each(tableData, function(index, item){
// 			alert(index + '/' + item);
			$('table').append("<tr><td>" + item.no + "</td><td>" + item.name + "</td><td>" + item.gender + "</td></tr>");
		});
		
		setInterval(function(){
			//console.log("A");
			$('#imgDiv').append($('img').first());
		}, 1000);
		
	});
</script>

</head>
<body>
	<h1>test6.jsp</h1>
	
	<div> 내용 </div>
	<div> 내용 </div>
	<div> 내용 </div>
	
	<hr><hr>
	<table border="1">
		<tr>
			<td>no</td>
			<td>name</td>
			<td>gender</td>
		</tr>
	</table>
	
	<hr><hr>
	<div id="imgDiv">
	<img src="1.jpg">
	<img src="2.jpg">
	<img src="3.jpg">
	</div>
	
</body>
</html>