<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionSet.jsp</h1>
	<h2>서버 (카페)</h2>
	
	<%
	// 사용자 정보를 세션 영역에 저장
	session.setAttribute("userName", "ITWILL");
	session.setAttribute("userTel", "010-1234-5678");
	System.out.println("S : 사용자 정보 저장 완료 (세션)");
	%>
	
	<script type="text/javascript">
		alert("클라이언트 요청 처리 중... (커피 만드는 중)");
		location.href="sessionTest.jsp";
	</script>

</body>
</html>