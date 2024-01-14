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
	<h1>list.jsp</h1>
	<h2>ITWILL 회원정보 출력</h2>
	
	<%
		// 세션 제어 [로그인, 관리자]
		String id = (String)session.getAttribute("id");
		if(id == null || !id.equals("admin")){
			response.sendRedirect("loginForm.jsp");
		}
	
		// DB 접근해서 모든 회원정보 가져오기
		// 1. 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("드라이버 로드 성공!");
		
		// 2. DB 연결
		Connection con = 
		DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234");
		System.out.println("DB 연결 성공!");
		
		// 3. SQL 구문 작성 및 pstmt 객체 생성
		String sql = "SELECT * FROM itwill_member WHERE id != 'admin'";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// 4. SQL 구문 실행
		ResultSet rs =
		pstmt.executeQuery();
	%>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>성별</th>
				<th>나이</th>
				<th>이메일</th>
				<th>회원가입</th>
			</tr>
			<% 
			// 5. 데이터 처리
			// 화면에 출력 (테이블)
			while(rs.next()){
				// 관리자 정보 제외
				if(rs.getString("id").equals("admin")){
					System.out.println("관리자!!!");
					continue;
				}
			%>
			<tr>
				<td><%=rs.getString("id") %></td>
				<td><%=rs.getString("pw") %></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("gender") %></td>
				<td><%=rs.getInt("age") %></td>
				<td><%=rs.getString("email") %></td>
				<td><%=rs.getTimestamp("regdate") %></td>
			</tr>
			<%}%>
		</table>
		
		<br>
		<button type="button"><a href="main.jsp">메인으로 이동</a></button>

</body>
</html>