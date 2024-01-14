<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieSet.jsp</h1>
	<h2>서버 (카페)</h2>
	
	<%
		System.out.println("클라이언트 요청 처리 중...");
	
		// 쿠키 생성 (서블릿 API)
		Cookie cookie = new Cookie("name", "ITWILL");
		
		// 쿠키 설정 (유효 기간 (단위 : 초))
		cookie.setMaxAge(10 * 60);
		
		// 쿠키 정보 전달
		response.addCookie(cookie);
		
	%>
	
	<script>
	    alert("요청 처리 완료! 쿠키 생성 완료!");
	    location.href="cookieTest.jsp";
	</script>

</body>
</html>