<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>sessionDel.jsp</h1>
<h2> 서버 (카페) </h2>
<% // 세션값 삭제
session.removeAttribute("userName"); 
System.out.println("S : 사용자 정보 삭제 (세션값 삭제)");
%>

<script type="text/javascript">
alert("세션 정보 삭제 완료");
location.href="sessionTest.jsp";</script>

</body>
</html>