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
			url : "json3.jsp",
			success : function(data){
				alert("성공!");
				console.log(data);
// 				$('body').append(data);
				
				$(data).each(function(index, item){
					var tmpData = "<tr>";
					tmpData += "<td>" + item.bno + "</td>";
					tmpData += "<td>" + item.subject + "</td>";
					tmpData += "<td>" + item.name + "</td>";
					tmpData += "<td>" + item.date + "</td>";
					tmpData += "<td>" + item.readcount + "</td>";
					tmpData += "</tr>";
					$('table').append(tmpData);
				});
				
			}
		});
	});
</script>
</head>
<body>
	<h1>jsonTest3.jsp</h1>
	
	<h2>메인페이지</h2>
	
	<table border="1">
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
	</table>

</body>
</html>