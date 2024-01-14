<%@page import="com.itwillbs.javabean.JavaBean2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>beanPro2.jsp</h2>
	<%
	// 한글처리
	request.setCharacterEncoding("UTF-8");
	
	// 전달 정보 저장
// 	String id = request.getParameter("id");
// 	String pw = request.getParameter("pw");
// 	int age = Integer.parseInt(request.getParameter("age"));
	%>
	
<%-- 	아이디 : <%=id %><br> --%>
<%-- 	비밀번호 : <%=pw %><br> --%>
<%-- 	나이 : <%=age %><hr> --%>

	<!-- 자바빈 객체 생성 -->
	<%
// 	JavaBean2 jb2 = new JavaBean2();
// 	jb2.setId(request.getParameter("id"));
// 	jb2.setPw(request.getParameter("pw"));
// 	jb2.setAge(Integer.parseInt(request.getParameter("age")));	
	%>
	
<%-- 	아이디 : <%=jb2.getId() %> --%>
<%-- 	비밀번호 : <%=jb2.getPw() %> --%>
<%-- 	나이 : <%=jb2.getAge() %> --%>
	
	<jsp:useBean id="jb3" class="com.itwillbs.javabean.JavaBean2"></jsp:useBean>
<%-- 	<jsp:setProperty property="id" name="jb3" param="id"/> --%>
<%-- 	<jsp:setProperty property="pw" name="jb3" param="pw"/> --%>
<%-- 	<jsp:setProperty property="age" name="jb3" param="age"/> --%>
	<jsp:setProperty property="*" name="jb3"/>
	<!-- param = property -> param 생략 가능 -->
	
	아이디(자바빈) : <jsp:getProperty property="id" name="jb3"/><br>
	비밀번호(자바빈) : <jsp:getProperty property="pw" name="jb3"/><br>
	나이(자바빈) : <jsp:getProperty property="age" name="jb3"/><br>

</body>
</html>