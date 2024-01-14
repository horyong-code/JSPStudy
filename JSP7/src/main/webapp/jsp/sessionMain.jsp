<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionMain.jsp</h1>
	
	<!-- OOOO님, 안녕하세요! 출력
	* 아이디 정보가 없는 경우 (로그인 X) 로그인 페이지로 이동
	-->
	<%
	 // 세션 정보 확인
	 String id = (String)session.getAttribute("id");
	
	if(id == null){ // 아이디 정보 없음, 로그인 X
		response.sendRedirect("sessionLoginForm.jsp");
	}
	%>
	
	<h2><%=id %>님, 안녕하세요!</h2>
	<input type="button" value="로그아웃" onclick="location.href='sessionLogout.jsp';">




	

</body>
</html>