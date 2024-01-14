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
	<h1>core_set2.jsp</h1>
	
	<h2>core_set1.jsp에서 전달해준 정보 저장</h2>
	<%=request.getAttribute("model") %>
	<hr>
	model : ${requestScope.model }<br>
	<c:out value="${requestScope.model }"/>
	<hr>
	model : ${model }<br>
	price : ${requestScope.price }<br>
	color : ${sessionScope.color } [session 영역]<br>
	color : ${color } [request 영역]
	<hr>
	
	<!-- 속성 제거 -->
	<c:remove var="color" scope="request"/>
	color : ${sessionScope.color } [session 영역]<br>
	color : ${color } [request 영역 => 속성 제거 => session 영역]
	<hr>
	
	<h2>ExServlet에서 전달해준 정보를 출력</h2>
	<h3>[/exServlet 실행]</h3>
	이름 : ${person1.name }<br>
	나이 : ${person1.age }살<br>
	휴대폰 모델명 : ${person1.phone.model }<br>
	휴대폰 번호 : ${person1.phone.tel }<br>
	
	<hr>
	<c:set var="p" value="${requestScope.person1.phone }"/>
	휴대폰 모델명 : ${p.model }<br>
	휴대폰 번호 : ${p.tel }<br>
	
	<hr>
	<h2>ExServlet에서 전달해준 Vector 정보를 출력</h2>
	<c:set var="p0" value="${requestScope.personList[0] }"/>
	<c:set var="p1" value="${requestScope.personList[1] }"/>
	이름 : ${p0.name }<br>
	전화번호 : ${p0.phone.tel }
	<hr>
	이름 : ${p1.name }<br>
	전화번호 : ${p1.phone.tel }
	<hr>
</body>
</html>