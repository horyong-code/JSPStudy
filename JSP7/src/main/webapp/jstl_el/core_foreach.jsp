<%@page import="java.util.ArrayList"%>
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
	<h1>core_foreach.jsp</h1>
	
	<%
		// JSP "안녕하세요" X5
		for(int i = 0; i < 5; i++){%>
			<h2>안녕하세요!</h2>
		<%}
	%>
	
	<h1>JSTL을 사용한 반복문 foreach</h1>
	<c:forEach begin="1" end="5" step="1">
		조건문이 참일 때 반복 실행<br>
	</c:forEach>

	<hr>
	<h2>1 ~ 10까지의 숫자를 화면에 가로 출력</h2>
	<c:forEach var="i" begin="1" end="10" step="1">
		${i }
	</c:forEach>
	
	<!-- step 감소 사용 X (항상 0보다 크거나 같다)  -->
<%-- 	<c:forEach var="i" begin="10" end="1" step="-1"> --%>
<%-- 		${i } --%>
<%-- 	</c:forEach> --%>

	<h2>1~20까지의 숫자 중에 홀수만 화면에 가로 출력</h2>
	<c:forEach var="i" begin="1" end="20" step="2">
		${i }
	</c:forEach>
	
	<%
		ArrayList arr = new ArrayList(); // ArrayList 객체 생성
		for(int i = 0; i < 10; i++){ // 0 ~ 9까지 반복
			arr.add(i * 10); // ArrayList 배열에 값 추가 (반복문)
		}
		pageContext.setAttribute("arr", arr); // 영역 객체에 값 추가
	%>
	
	<h2>배열에 들어있는 요소를 반복문 사용 출력</h2>
	<c:forEach var="i" begin="0" end="${arr.size() }" step="1">
		${arr[i] }
	</c:forEach>
	<hr>
	<c:forEach var="num" items="${arr }">
		${num }
	</c:forEach>
	
	<hr>
	<h2>ExServlet에서 전달받은 Vector 정보 personList를 출력</h2>
	<c:forEach var="person" items="${personList }">
		이름 : ${person.name }<br>
		나이 : ${person.age }<br>
		모델명 : ${person.phone.model }<br>
		<c:set var="ph" value="${person.phone }"/>
		전화번호 : ${ph.tel }<hr>
	</c:forEach>
	
	<c:forTokens var="tmp" items="a, b, c, d, e, f, g" delims=",">
		${tmp }
	</c:forTokens>


</body>
</html>