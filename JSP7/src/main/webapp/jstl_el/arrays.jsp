<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>arrays.jsp</h1>
	
	<h3>EL 표현식 전달 데이터 출력</h3>
	
	${requestScope.foods } : 주소 [=객체]<hr>
	${requestScope.foods.toString() }<hr>
	${foods[0] }, ${foods[1] }, ${foods[2] }, ${foods[3] }, ${foods[4] }<br>
	[ ${foods[5] } ] : EL 표현식의 null은 공백 문자가 출력됨
	<hr>
	EL 표현식 JSP 반복문 사용이 불가능!<hr>
	
	<% // request 영역 데이터 가져오기
	String[] foods = (String[])request.getAttribute("foods"); // 다운캐스팅 [= 강제 형변환] -> 업캐스팅 필요
	for(int i = 0; i < foods.length; i++) {%>
		${foods[i] } @
	<%} %>
	<hr>
	${requestScope.sportsList }<hr>
	${requestScope.sportsList.toString() }<hr>
	${requestScope.sportsList[0] }<hr>
	${requestScope.sportsList.get(0) }<hr>
	
	<h2>EL 표현식 반복문 사용 불가 => JSTL 반복문을 사용해서 해결</h2>
</body>
</html>