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
	<h1>core_set.jsp</h1>
	<%
		/* JSP (Java) 코드 사용 변수 사용 => 해당 페이지에서만 사용 가능 */
		int num1 = 100;
		int num2 = 300;
		int sum = num1 + num2;
		
		pageContext.setAttribute("itwill", 2000);
	%>
	
	결과값 (num1 + num2) : <%=sum %><br> 

	<!-- 속성 (Attribute)을 정의  -->
	<%--<c:set var="변수명" value="값"/>--%>
	<c:set var="num3" value="100" scope="page"/>
	<c:set var="num4" value="300"/>
	<c:set var="sum2" value="${num3 + num4}"/>
	
	결과값 (num3 + num4) : <c:out value="sum2"/><br> <!-- sum2 cannot be resolved to a variable -->
	결과값 (num3 + num4) : <c:out value="${sum2 }"/><br>
	
	<hr>
	${pageScope }
	<hr>
	
	<h2>속성의 정보를 선언 후 다른 페이지에서도 사용</h2>
	<c:set var="model" value="a0001" scope="request"/>
	<!-- price - 10000 정보 전달 -->
	<c:set var="price" value="10000" scope="request"/>
	<!-- color - black 정보 전달 -->
	<c:set var="color" value="black" scope="session"/>
	<c:set var="color" value="red" scope="request"/>
	
	
	<!-- 다음 페이지로 이동 -->
	<h2>request 영역의 데이터를 가지고 이동 => forward 방식</h2>
	<jsp:forward page="core_set2.jsp"/>

	
</body>
</html>