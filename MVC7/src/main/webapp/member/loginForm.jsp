<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>loginForm.jsp (MVC)</h1>
	<%
		System.out.println(" V : loginForm.jsp (MVC) 실행 ");
	%>
	
	<form action="./MemberLoginAction.me" method="post">
		<fieldset>
			<legend><b>ITWILL 로그인 페이지</b></legend>
			<label>아이디 : <input type="text" name="id"></label>
			<label>비밀번호 : <input type="password" name="pw"></label>
			<hr>
			<input type="submit" value="로그인">
			<input type="button" value="회원가입" onclick="location.href='./MemberJoin.me'">
		</fieldset>
	</form>
</body>
</html>