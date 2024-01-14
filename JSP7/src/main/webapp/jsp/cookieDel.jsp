<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieDel.jsp</h1>
	
	<h2>서버 (카페)</h2>
	<%
		// 쿠키 정보 삭제 => 쿠키의 유효기간 삭제
		// 쿠키 정보 가져오기
		Cookie[] cookies = request.getCookies();
		
		// 내가 만든 쿠키 찾기
		if(cookies != null){
			for(int i=0; i<cookies.length;i++){
				if(cookies[i].getName().equals("name")){
					// 내가 만든 쿠키를 찾음
					// 유효 기간 재설정
					cookies[i].setMaxAge(0);
					
					// 다시 클라이언트로 전송
					response.addCookie(cookies[i]);
					
				}
			}
		}
	
	%>
	
	<script>
		alert("쿠키 삭제 완료!");
		location.href="cookieTest.jsp";
	
	</script>

</body>
</html>