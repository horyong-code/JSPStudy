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
	<h1>core_if.jsp</h1>
	<c:set var="name" value="ITWILL"/>
	<%-- <c:if test="조건문">
		조건문이 참일 때만 실행하는 문장
	</c:if> --%>
	
	<c:if test="${name == 'ITWILL' }">
		아이티윌! <hr>
	</c:if>
	
	<!-- action값이 없을 경우 자신의 페이지 호출 / GET 방식 (기본값) -->
	<form>
		<fieldset>
			<label>숫자1 : <input type="text" name="num1"></label> <br>
			<label>숫자2 : <input type="text" name="num2"></label> <br>
			<hr>
			<input type="submit" value="계산하기">
		</fieldset>
	</form>
	
	<hr>
	<h2>숫자1, 숫자2 중에서 더 큰 값을 출력</h2>
	숫자1 : ${param.num1 }<br>
	숫자2 : ${param.num2 }<br>
	
	<c:if test="${param.num1 > param.num2 }">
		<h3>결과 : ${param.num1 }</h3>
	</c:if>
	<c:if test="${param.num1 < param.num2 }">
		<h3>결과 : ${param.num2 }</h3>
	</c:if>
	
	<h2>파라미터 정수로 변경 후 결과</h2>
	<c:if test="${param.num1 != null && param.num2 != null }">
	<c:set var="num1" value="${Integer.parseInt(param.num1) }"/>
	<c:set var="num2" value="${Integer.parseInt(param.num2) }"/>
	</c:if>
	
	<c:if test="${num1 gt num2 }">
		<h3>결과 : ${num1 }</h3>
	</c:if>
	<c:if test="${num1 lt num2 }">
		<h3>결과 : ${num2 }</h3>
	</c:if>
	
	<h2>두 속성의 값이 동일한지 체크</h2>
	<c:if test="${param.num1 eq param.num2 }">
		<h3>num1, num2 값은 동일합니다</h3>
	</c:if>
	
	<h2>조건비교 구문 (switch-case와 유사함)</h2>
<%--     <c:choose> --%>
<%-- 		<c:when test=""></c:when> --%>
<%-- 		<c:when test=""></c:when> --%>
<%-- 		<c:when test=""></c:when> --%>
<%-- 		<c:otherwise></c:otherwise> --%>
<%-- 	</c:choose> --%>

 
 	<!-- num1, num2 값을 비교해서 값이 같은가? 더 큰 수를 찾기 -->
 	<c:choose>
 		<c:when test="${num1 gt num2 }">
 			${num1 }<hr>
 		</c:when>
 		<c:when test="${num1 lt num2 }">
 			${num2 }<hr>
 		</c:when>
 		<c:otherwise>
 			<c:if test="${!empty num1 }">
 				동일한 값!!!<hr>
 			</c:if>
 		</c:otherwise>
 	</c:choose>
 	
</body>
</html>