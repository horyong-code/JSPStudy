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
	<h2>게시판 글 삭제</h2>
	
	<%
	// 전달 정보 저장
	int bno = Integer.parseInt(request.getParameter("bno"));
	String pageNum = request.getParameter("pageNum");
	%>
	
	<form action="deletePro.jsp?pageNum=<%=pageNum %>" method="post" name="fr">
		<fieldset>
			<legend>글 삭제하기</legend>
			<input type="hidden" name="bno" value=<%=bno %>>
			<label>글 비밀번호 : <input type="password" name="pass"></label>
			<input type="submit" value="삭제하기">
		</fieldset>
	</form>

</body>
</html>