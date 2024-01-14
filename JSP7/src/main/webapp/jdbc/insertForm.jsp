<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>insertForm.jsp</h1>
	
	<h2>사용자가 정보를 입력하는 페이지</h2>
	<!-- 이름, 성별, 나이, 주민번호 -->
	
	<fieldset>
		<legend>폼태그</legend>
		<form action="insertPro.jsp" method="post">
			<label>이름 : <input type="text" name="name"></label>
			<label>성별 : <input type="radio" name="gender" value="M">M
				 <input type="radio" name="gender" value="W">W</label>
			<label>나이 : <input type="number" name="age"></label>
			<label>주민번호 : <input type="text" name="jumin1">-<input type="text" name="jumin2"></label>
			<input type="submit" value="정보 전달">
		</form>
	</fieldset>
</body>
</html>