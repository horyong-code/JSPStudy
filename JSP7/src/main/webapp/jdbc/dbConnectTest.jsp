<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>/jdbc/dbConnectTest.jsp</h1>
	
	<h2>JSP + MySQL 연결 => JDBC 사용</h2>
	<p>JDBC (Java DataBase Connectivity) :
	   자바와 데이터베이스를 연결하는 도구 (API)</p>
	   
	<%
		// 0. JDBC 라이브러리 설치 (프로젝트 당 1번)
		// => ./WEB-INF/lib/mysql-connector-j-8.1.0.jar
		
		// 1. 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("드라이버 로드 성공!");
		
		// 2. DB 연결
		Connection con 
		= DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb","root","1234");
		System.out.println("디비 연결 성공!");
		
		System.out.println("con : " + con);
	%>

</body>
</html>