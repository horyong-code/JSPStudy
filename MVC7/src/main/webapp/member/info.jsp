<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	<h1>info.jsp (MVC)</h1>
	<h2>내 정보 보기</h2>
	<!-- 로그인 세션 확인 -->
	<c:if test="${empty sessionScope.id }">
		<c:redirect url="./Main.me"/>
	</c:if>

	
	<h3>아이디 : ${requestScope.dto.id }</h3>
	<h3>비밀번호 : ${requestScope.dto.pw }</h3>
	<h3>이름 : ${requestScope.dto.name }</h3>
	<h3>나이 : ${requestScope.dto.age }</h3>
	<h3>성별 : ${requestScope.dto.gender }</h3>
	<h3>이메일 : ${requestScope.dto.email }</h3>
	<h3>회원가입일 : ${requestScope.dto.regdate }</h3>
	
	<h2><a href="./Main.me">메인 페이지로</a></h2>

</body>
</html>