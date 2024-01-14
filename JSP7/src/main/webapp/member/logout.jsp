<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>logout.jsp</h1>
	
	<%
	// 로그아웃 -> 로그인 세션 정보 삭제 (초기화)
	session.invalidate();
	System.out.println("세션 정보 초기화 완료! 로그아웃 성공!");
	%>
	<script>
	alert("로그아웃되었습니다");
	location.href="main.jsp";
	</script>
	
</body>
</html>