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
	
	<%
	// 세션 제어
	String id = (String)session.getAttribute("id");	
	if(id == null){%>
		<script>
		alert("로그인 정보가 없습니다. 로그인 페이지로 돌아갑니다.");
		location.href="loginForm.jsp";
		</script>
	<% } %>
	
	<form action="deletePro.jsp" method="post" name="fr">
		<fieldset>
			<legend><b>회원 정보 삭제 (탈퇴)</b></legend>				
				<label><input type="hidden" name="id" value="<%=id %>"></label>
				<label>비밀번호 : <input type="password" name="pw"></label><br>
				<input type="submit" value="삭제하기">
		</fieldset>
	</form>
</body>
</html>