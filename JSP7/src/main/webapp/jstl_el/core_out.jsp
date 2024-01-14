<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 반드시 JSTL 실행전 추가!!! -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>./jstl_el/core_out.jsp</h1>
	JSTL : <c:out value="안녕하세요!!"/>
	<hr>
	html : 안녕하세요!
	<hr>
	EL : ${"안녕하세요@" }
	<hr>
	JSP : <%="안녕하세요#" %>
	<hr>
	<hr>
	<c:out value="100+200"/><hr>
	JSTL+el 같이 사용하면 연산 수행 가능<br>
	<c:out value="${100+200 } }"/><hr>
	${100+200 }<hr>
	
	
	<c:out value="${person.name }" default=""/><hr>
	<c:out value="${person.name }" default="null값 대신 출력되는 기본값"/><hr>
	
	<hr>
	<abc> 태그는 abc 태그의 정보를 출력합니다 <br>
	&lt;abc> 태그는 abc 태그의 정보를 출력합니다 <br>
	<c:out value="<abc> 태그는 abc 태그의 정보를 출력합니다 <br>"/>
	<hr>
	<![CDATA[
		<abc> 태그는 abc 태그의 정보를 출력합니다 <br>
	]]>
	
	
	

</body>
</html>