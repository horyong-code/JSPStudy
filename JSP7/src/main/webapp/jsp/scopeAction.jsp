<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>scopeAction.jsp</h1>
	
	아이디 (파라미터) : <%=request.getParameter("id") %><br>
	비밀번호 (파라미터) : <%=request.getParameter("pw") %>
	<hr>
	page 영역값 : <%=pageContext.getAttribute("P") %><br>
    page2 영역값 : <%=pageContext.getAttribute("P2") %><br>
    request 영역값 : <%=request.getAttribute("R") %><br>
    session 영역값 : <%=session.getAttribute("S") %><br>
    application 영역값 : <%=application.getAttribute("A") %><br>
</body>
</html>