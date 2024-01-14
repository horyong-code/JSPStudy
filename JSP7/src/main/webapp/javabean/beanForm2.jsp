<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>/javabean/beanForm2.jsp</h1>
	<form action="beanPro2.jsp" method="post">
		<fieldset>
		<legend>폼태그 제목</legend>
			<label>아이디 : <input type="text" name="id"></label><br>
			<label>비밀번호 : <input type="password" name="pw"></label><br>
			<label>나이 : <input type="number" name="age"></label><br>
			<input type="submit" value="전송">
		</fieldset>
	</form>

</body>
</html>