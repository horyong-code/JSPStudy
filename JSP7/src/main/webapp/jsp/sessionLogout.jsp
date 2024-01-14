<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionLogout.jsp</h1>
	
	<% // 로그아웃 처리
	session.invalidate(); 
	System.out.println("로그아웃!");
	%>
	
	<script type="text/javascript">
	 alert("회원님의 정보가 안전하게 로그아웃 되었습니다!");
	 location.href="sessionMain.jsp";
	
	</script>

</body>
</html>