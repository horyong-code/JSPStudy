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
		$.getJSON("json2.json", function(data){
			alert("json2.json 데이터 가져옴!");
			$(data).each(function(index, item){
				
				var tmpData = "<tr>";
				tmpData += "<td>" + item.id + "</td>";
				tmpData += "<td>" + item.pw + "</td>";
				tmpData += "<td>" + item.email + "</td>";
				tmpData += "</tr>"
				$('table').append(tmpData);
				
// 				$('table').append("<tr><td>" + item.id + "</td><td>" + item.pw + "</td><td>" + item.email + "</td></tr>")	
			
			});
		})
	});
</script>
</head>
<body>
	<h1>jsonTest2.jsp</h1>
	
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이메일</td>
		</tr>
	</table>

</body>
</html>