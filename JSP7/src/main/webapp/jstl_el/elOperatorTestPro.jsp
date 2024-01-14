<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>elOperatorTestPro.jsp</h1>
	<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	%>
	
	숫자1 (EL) : ${param.num1 }<br>
	숫자2 (EL) : ${param.num2 }<br>
	<hr>
	
	<h3>기본적인 형변환 제공, 하나의 EL 표현식 안에서 연산 수행</h3>
	숫자1 + 숫자2 : ${param.num1} + ${param.num2}<br>
	숫자1 + 숫자2 : ${param.num1 + param.num2 }<br>
	숫자1 * 숫자2 : ${param.num1 * param.num2 }<br>
	
	Q. num1, num2 값이 모두 양수인가? A. ${(param.num1 > 0) && (param.num2 > 0)}<hr>
	
	Q. num1, num2 값이 같은지, 다른지 비교 A. ${param.num1 == param.num2? "같다" : "다르다"}<hr>
	
	Q. 사용자의 아이디가 있는 경우 "000님 안녕하세요!", 없는 경우 "Guest님 안녕하세요!" 출력<br>
<%-- 	A. ${param.id == null} --%>
	=> ${param.id == ""? "Guest" : param.id }님 안녕하세요!<br>
	=> ${empty param.id? "Guest" : param.id }님 안녕하세요!<br>

</body>
</html>