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
	<h1>list.jsp (MVC)</h1>
	
	<table border="1">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>나이</th>
		<th>성별</th>
		<th>이메일</th>
		<th>회원가입일</th>
	</tr>
	<c:forEach var="dto" items="${requestScope.memberList }">
	<tr>
		<td>${dto.id }</td>
		<td>${dto.name }</td>
		<td>${dto.age }</td>
		<td>${dto.gender }</td>
		<td>${dto.email }</td>
		<td>${dto.regdate }</td>
	</tr>
	</c:forEach>
	</table>
	<hr>
	<a href="./Main.me"><button>메인 페이지</button></a>

</body>
</html>