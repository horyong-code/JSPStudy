<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionLoginForm.jsp</h1>
	<h2>로그인</h2>
	
	<fieldset>
		<legend>로그인 페이지</legend>
		<form action="sessionLoginPro.jsp" method="post" name="fr">
		id : <input type="text" name="id"><br>
		pw : <input type="password" name="pw"><br>
		<input type="submit" value="로그인">
		</form>
	</fieldset>
	

</body>
</html>