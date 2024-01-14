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
	<h1>deletePro.jsp</h1>
	<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	// 전달 정보 저장
	String ju1 = request.getParameter("jumin1");
	String ju2 = request.getParameter("jumin2");
	String jumin = ju1 + "-" + ju2;
	int idx = Integer.parseInt(request.getParameter("idx"));
	%>
	
	<%
	// 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("드라이버 로드 성공!");
	
	// DB 연결
	Connection con 
	= DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234");
	
	// sql 구문 작성 및 pstmt 객체 생성
	String sql = "DELETE FROM itwill_member WHERE idx = ? && jumin = ?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// ? 정보 추가
	pstmt.setInt(1, idx);
	pstmt.setString(2, jumin);
	
	// sql 구문 실행
	pstmt.executeUpdate();
	System.out.println("회원 정보 삭제 완료!");
	%>

	<h2>삭제할 정보</h2>
	번호 : <%=idx %><br>
	주민번호 : <%=jumin %><br>
</body>
</html>