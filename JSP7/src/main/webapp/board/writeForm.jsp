<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>writeForm.jsp</h1>
	<form action="writePro.jsp" method="post" name="fr">
		<fieldset>
			<legend><b>ITWILL 게시판 글쓰기</b></legend>
			<label>글쓴이 : <input type="text" name="name"></label><br>
			<label>제목 : <input type="text" name="subject"></label><br>
			<label>내용 : <br><textarea cols="20" rows="5" 
			name="content"></textarea></label><br>
			<label>비밀번호 : <input type="password" name="pass"></label><br>
			<hr>
			<input type="submit" value="글쓰기">
		</fieldset>
	</form>
</body>
</html>