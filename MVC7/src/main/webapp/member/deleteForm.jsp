<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>deleteForm.jsp (MVC)</h1>
	<c:if test="${empty sessionScope.id }">
		<c:redirect url="./Main.me"/>
	</c:if>
	
	<form action="MemberDeleteAction.me" method="post" name="fr">
		<fieldset>
			<legend><b>회원 정보 삭제 (탈퇴)</b></legend>				
				<label><input type="hidden" name="id" value="${sessionScope.id }"></label>
				<label>비밀번호 : <input type="password" name="pw"></label><br>
				<input type="submit" value="삭제하기">
		</fieldset>
	</form>
</body>
</html>