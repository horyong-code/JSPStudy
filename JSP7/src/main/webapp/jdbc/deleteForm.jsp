<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>deleteForm.jsp</h1>
	<!-- 인덱스 번호, 주민번호 입력해서 해당 사용자 정보 삭제 -->
	
	<fieldset>
		<legend>폼태그 제목</legend>
			<form action="deletePro.jsp">
			<label>번호 : <input type="number" name="idx"></label><br>
			<label>주민번호 : <input type="text" name="jumin1">-<input type="text" name="jumin2"></label>
			<input type="submit" value="삭제">
			</form>
	</fieldset>

</body>
</html>