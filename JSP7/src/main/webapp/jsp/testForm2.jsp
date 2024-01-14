<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testForm2.jsp</h1>
	
	<fieldset>
		<legend>정보 입력</legend>
		<form action = "testPro2.jsp" method = "get" name = "fr">
			이름 : <input type = "text" name = "name"><br>
			나이 : <input type = "number" name = "age"><br>
			<hr>
			성별 : <input type = "radio" name = "gender" value = "남자">남자
				   <input type = "radio" name = "gender" value = "여자">여자<br>
			취미 : <input type = "checkbox" name = "hobby" value = "게임">게임
				   <input type = "checkbox" name = "hobby" value = "운동">운동
				   <input type = "checkbox" name = "hobby" value = "영화">영화<br>
			과목 : <select name = "subject">
						<option value="JAVA">JAVA</option>
						<option value="JSP">JSP</option>
						<option value="JS">JS</option>
						<option value="WEB">WEB</option>
						<option value="DB">DB</option>
				   </select>
			<hr>
			<input type = "submit" value = "전송">
		</form>
	</fieldset>
	
	

</body>
</html>