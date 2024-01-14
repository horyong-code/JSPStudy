<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<fieldset>
	<legend>폼태그</legend>
 		<form action="scopePro.jsp" method="get">
 		아이디 : <input type="text" name="id">
 		<input type="submit" value="정보 전달">
</fieldset>

<%
 pageContext.setAttribute("P2", "pageValue2!");
%>


</body>
</html>