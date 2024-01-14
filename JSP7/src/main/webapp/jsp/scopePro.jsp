<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>scopePro.jsp</h1>
<%String id = request.getParameter("id"); %>
아이디 (파라미터) : <%=id %>

<h2>영역 객체 생성</h2>
<%
	// 해당 페이지에서만 사용 가능
	pageContext.setAttribute("P", "pageValue!");
	request.setAttribute("R", "requestValue!");
	session.setAttribute("S", "sessionValue!");
	application.setAttribute("A", "applicationValue!");

%>

<h2>영역 객체 사용</h2>
	page 영역값 : <%=pageContext.getAttribute("P") %><br>
    request 영역값 : <%=request.getAttribute("R") %><br>
    session 영역값 : <%=session.getAttribute("S") %><br>
    application 영역값 : <%=application.getAttribute("A") %><br>
    
    
    <hr>
    <h2>페이지 이동 시 영역 객체 사용</h2>
    
    <h2>1. HTML 코드 : a 태그</h2>
    <h3>전달 가능 데이터 : 파라미터, session, application</h3>
    <a href="scopeAction.jsp?id=<%=id %>&pw=1234" title="a태그 페이지 이동" target="_self">a 태그 페이지 이동</a>
    
    
    <h2>2. JavaScript 코드 : location.href</h2>
	<script type="text/javascript">
		alert("js코드 페이지 이동");
<%-- 		location.href="scopeAction.jsp?id=<%=id %>&pw=1234"; --%>
	
	</script>
	
	
	<h2>3. JSP 코드 : response.sendRedirect()</h2>
	<%
		// JSP 파일 실행 순서
		// JSP (Java) => HTML => JavaScript
		// * JSP, JS 코드 : 페이지 이동 처리는 둘 중에 하나만 사용
		//response.sendRedirect("scopeAction.jsp?id="+id+"&pw=1234");
	%>
	
	<!-- 포워딩 (forward) :
	1) request 영역 정보 전달 가능
	2) 주소 변경 X, 화면 변경 O -->
<h2>4. 액션 태그 : forward</h2>
<h3>전달 가능 데이터 : 파라미터, request, session, application</h3>
	<jsp:forward page="scopeAction.jsp?id=<%=id %>&pw=1234"/>
</body>
</html>