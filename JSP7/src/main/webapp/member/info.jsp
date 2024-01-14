<%@page import="java.sql.ResultSet"%>
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
	<h1>info.jsp</h1>
	<h2>내 정보 보기</h2>
	<%
		// 로그인 세션 확인
		String id = (String)session.getAttribute("id");
	
		if(id == null){
			response.sendRedirect("loginForm.jsp");
		}
		
		// 내 정보(DB)를 화면에 출력
		
		// 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("드라이버 로드 성공!");
		
		// DB 연결
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234");
		System.out.println("DB 연결 성공!");
		
		// SQL 구문 작성 및 pstmt 객체 생성
		String sql = "SELECT * FROM itwill_member WHERE id = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		
		// SQL 구문 실행
		ResultSet rs = pstmt.executeQuery();
		
		// 데이터 처리
		if(rs.next()){
			// 내 정보 화면에 출력
			%>
			<h3>아이디 : <%=rs.getString("id") %></h3>
			<h3>이름 : <%=rs.getString("name") %></h3>
			<h3>성별 : <%=rs.getString("gender") %></h3>
			<h3>나이 : <%=rs.getInt("age") %></h3>
			<h3>이메일 : <%=rs.getString("email") %></h3>
			<h3>회원가입일 : <%=rs.getTimestamp("regdate") %></h3>
	
		<%}
		
	
	%>
	<h2><a href="main.jsp">메인 페이지로</a></h2>

</body>
</html>