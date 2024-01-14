<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>fmt_Number.jsp</h1>
	HTML : 1000000000 <hr>
	<!-- fmt:formatNumber 기본값으로 숫자를 3자리마다 [,]로 구분한다  -->
	fmt : <fmt:formatNumber value="1000000000"/><hr>
	fmt : <fmt:formatNumber value="1000000000" groupingUsed="true"/><hr>
	fmt : <fmt:formatNumber value="1000000000" groupingUsed="false"/><hr>
	
	<b>[3.123478964] 숫자를 사용해서 소수점 2자리까지 표현 = [3.12]</b><br>
	3.123478964<br>
	<fmt:formatNumber value="3.123478964"/><br>
	<fmt:formatNumber value="3.125478964" pattern="#.##"/><br>
	<fmt:formatNumber value="3.125478964" pattern="#.#####"/><br>
	<br>
	(int)(3.125478964 * 100 + 0.5) / 100 [소수점 둘째자리 (100)까지 반올림]<br> 
	312.5478964 + 0.5 = 313.0478964 => 3.13<br>
	312.3478964 + 0.5 = 312.8478964 => 3.12<br>
	<hr>
	
	<b>[10.5] 숫자 (실수)를 소수점 아래 2자리까지 표시 = [10.50]</b><br>
	<fmt:formatNumber value="10.5"/><br>
	<fmt:formatNumber value="10.5" pattern="##.##"/><br>
	<fmt:formatNumber value="10.5" pattern="##.00"/><br>
	<fmt:formatNumber value="10.5" pattern="##.0000"/><br>
	<hr>
	
	<b>퍼센트 계산하기</b><br>
	<fmt:formatNumber value="0.5"/><br>
	<fmt:formatNumber value="${37 / 77 }" type="percent"/><br>
	<br>
	<b>통화 표시하기</b><br>
	<fmt:formatNumber value="10000" type="currency"/><br>
	
	<fmt:setLocale value="en_us"/>
	<fmt:formatNumber value="10000" type="currency"/><br>
	 
	<fmt:formatNumber value="10000" type="currency" currencySymbol="@@"/><br>
</body>
</html>