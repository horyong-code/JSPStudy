<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "myColor.jsp" %>
<%!
   //String myColor = "orange";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgColor="<%=myColor%>">
	<h1>itwillMain.jsp</h1>
	
	<table border="1" width="600" height="600">
	<tr>
	  <td colspan="2" height="100">
	  	<!--<h2>ITWILL 부산</h2>-->
	  	<!-- JSP 액션 태그 (JSP : ~) -->
	  	<jsp:include page="../inc/top.jsp"></jsp:include>
	    top - 로고, 메인 메뉴, 로그인창, 검색창</td> 
	</tr>
	<tr>
	  <td width="100">
	    <jsp:include page="../inc/left.jsp"></jsp:include>
	    left - 서브 메뉴
	  </td>
	  <td>center - 메인 페이지 (본문)</td>	  
	</tr>
	<tr>
	  <td colspan="2" height="100">
	    <jsp:include page="../inc/bottom.jsp"></jsp:include>
	  	bottom - 회사 소개, 안내, 관리자 정보
	  </td>   
	</tr>		
	</table>
	
</body>
</html>