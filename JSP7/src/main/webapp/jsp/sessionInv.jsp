<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>sessionInv.jsp</h1>
<h2> 서버 (카페) </h2>
<% // 세션값 초기화
session.invalidate(); 
System.out.println("S : 사용자 정보 초기화 (세션 초기화)");
%>

<script type="text/javascript">
alert("세션 초기화 완료");
location.href="sessionTest.jsp";</script>


</body>
</html>