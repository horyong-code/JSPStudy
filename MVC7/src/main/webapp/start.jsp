<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>start.jsp</h1>
	MVC 프로젝트의 시작지점
	<%
		System.out.println("MVC 프로젝트의 시작지점");
		System.out.println("* MVC 프로젝트에서 실행가능한 유일한 JSP 파일");
		System.out.println("* 주소줄에 .jsp 호출 X");
		
		// 실행 주소
// 		response.sendRedirect("./member");
// 		response.sendRedirect("./member2");
// 		response.sendRedirect("./itwill.me");

// 		response.sendRedirect("./BoardList.bo"); // 서블릿 => ./파일명
		// JSP 내장 객체 request, response 존재 -> 컨트롤러 (서블릿) -> doGet, doPost -> doProcess -> MemberJoinAction
		
		response.sendRedirect("./Ajax.bo");
	%>
</body>
</html>