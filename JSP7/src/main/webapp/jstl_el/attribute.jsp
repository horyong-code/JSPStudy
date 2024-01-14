<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>attribute.jsp</h1>
	<%
	 int cnt = 1000;
	 pageContext.setAttribute("cnt", 3000);
	%>
	
	JSP 표현식 - cnt : <%=cnt %><br>
	EL 표현식 - cnt : ${cnt }<br>
	EL 표현식 - cnt : ${requestScope.cnt }<br>
	EL 표현식 - cnt : ${sessionScope.cnt }<br>
	
	<h2>EL 표현식에서 영역 객체 정보를 생략 가능</h2>
	=> 데이터를 찾을 때 모든 영역에 데이터를 검색
	pageScope < requestScope < sessionScope < applicationScope
	             cnt = 2000
   cnt = 3000            
    => 만약 모든 영역에 값이 없을 때 (끝)
    => 동일한 이름의 속성 (Attribute)이 있을 경우 영역 객체 정보가 없으면
       영역의 범위가 적은 객체 정보를 사용
       
   EL 표현식 - cnt : ${sessionScope.cnt }<br>
</body>
</html>