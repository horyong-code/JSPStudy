<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>fmt_Date.jsp</h1>
	
	today : <%=new Date() %><hr>
	<c:set var="today" value="<%=new Date() %>"/>
	<fmt:formatDate value="<%=new Date() %>"/><br>
	<fmt:formatDate value="${today }"/><br>
	
	<fmt:formatDate value="${today }" type="date"/><br>
	<fmt:formatDate value="${today }" type="time"/><br>
	<fmt:formatDate value="${today }" type="both"/><br>
	
	<hr>
	<fmt:formatDate value="${today }" type="date" dateStyle="full"/><br>
	<fmt:formatDate value="${today }" type="date" dateStyle="long"/><br>
	<fmt:formatDate value="${today }" type="date" dateStyle="medium"/><br>
	<fmt:formatDate value="${today }" type="date" dateStyle="short"/><br>
	
	<hr>
	<fmt:formatDate value="${today }" type="time" timeStyle="full"/><br>
	<fmt:formatDate value="${today }" type="time" timeStyle="long"/><br>
	<fmt:formatDate value="${today }" type="time" timeStyle="medium"/><br>
	<fmt:formatDate value="${today }" type="time" timeStyle="short"/><br>
	
	<hr>
	<h2>2023년 10월 6일 금요일 오전 10:14:00</h2>
	<fmt:formatDate value="${today }" type="date" dateStyle="full"/>
	<fmt:formatDate value="${today }" type="time" timeStyle="medium"/><br>
	<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="medium"/><br>
	
	<h2>2023/10/6 (금)</h2>
	<fmt:formatDate value="${today }" type="date" pattern="yyyy/MM/dd (E)"/><br>
	<fmt:formatDate value="${today }" type="date" pattern="yy-MM-dd [E]"/><br>
	<br>
	<fmt:formatDate value="${today }" type="time" pattern="(a) hh:mm:ss"/>
</body>
</html>