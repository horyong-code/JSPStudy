<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>updatePro.jsp</h1>
	<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	// 전달 정보 저장
	int idx = Integer.parseInt(request.getParameter("idx"));
	String name = request.getParameter("name");
	%>
	
	<h2>수정 정보</h2>
	번호 : <%=idx %><br>
	수정할 이름 : <%=name %>
	
	<%
	// DB 테이블의 정보를 수정
	// 0. 설치
	// 1. 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("드라이버 로드 성공!");
	// 2. DB 연결
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234");
	System.out.println("DB 연결 성공!");
	// 3. sql 구문 작성 & pstmt 객체 생성 [? 정보 전달]
	String sql = "UPDATE itwill_member SET name = ? WHERE idx = ?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	// ? 정보 추가
	pstmt.setString(1, name);
	pstmt.setInt(2, idx);
	
	// 4. sql 구문 실행
	pstmt.executeUpdate();
	
	// 5. 데이터 처리 <- SELECT
	
	%>
	<br>
	<a href="select.jsp"><button type="button">결과 확인하기</button></a>

</body>
</html>