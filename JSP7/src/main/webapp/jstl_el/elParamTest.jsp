<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>elParamTest.jsp</h1>
	
	<form action="elParamTestPro.jsp" method="post" name="fr">
		<fieldset>
			<legend>elParamTest.jsp</legend>
			<label><b>아이디 : </b><input type="text" name="id"></label><br>
			<label><b>이름 : </b><input type="text" name="name"></label><br>
			<label><b>나이 : </b><input type="number" name="age"></label><br>
			<hr>
			<label><b>좋아하는 음식 1 : </b><input type="text" name="foods"></label><br>
			<label><b>좋아하는 음식 2 : </b><input type="text" name="foods"></label><br>
			<hr>
			<label>
			취미 : <input type="checkbox" name="hobbys" value="게임">게임</label>
			<label><input type="checkbox" name="hobbys" value="운동">운동</label>
			<label><input type="checkbox" name="hobbys" value="영화">영화</label>
			<hr>
			<input type="submit" value="전송하기">
		</fieldset>
	</form>

</body>
</html>