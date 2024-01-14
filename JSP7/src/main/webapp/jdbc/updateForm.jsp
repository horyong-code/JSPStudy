<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>updateForm.jsp</h1>
	
	<fieldset>
		<legend><b>폼태그 제목</b></legend>
		<form action="updatePro.jsp">
			<label>번호 : <input type="number" name="idx"></label><br>
			<label>수정할 이름 : <input type="text" name="name"></label><br>
			<input type="submit" value="수정">
		</form>
	</fieldset>

</body>
</html>