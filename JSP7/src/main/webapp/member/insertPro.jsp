<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>insertPro.jsp</h1>
	<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	// 전달 정보 (파라미터) 확인, 저장
	// 	String id = request.getParameter("id");
	// 	String pw = request.getParameter("pw");
	// 	String name = request.getParameter("name");
	// 	String gender = request.getParameter("gender");
	// 	int age = Integer.parseInt(request.getParameter("bYear")) - 2023;
	// => 액션 태그 사용
	%>
	<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"/>
	<jsp:setProperty property="*" name="mb"/>
	
	<%
	System.out.println(mb.toString());
	
	// 나이 정보 계산
	int bYear = Integer.parseInt(request.getParameter("bYear"));
	// System.out.println(bYear);
	Date today = new Date();
	// System.out.println(today);
	
	// Deprecated.  As of JDK version 1.1,replaced by Calendar.get(Calendar.YEAR) - 1900.
	// Returns a value that is the result of subtracting 1900 from theyear that contains or begins with the instant in time representedby this Date object, as interpreted in the localtime zone.
	// Returns:the year represented by this date, minus 1900.See Also:java.util.Calendar
	// System.out.println(today.getYear()+1900 - bYear);
	mb.setAge(today.getYear()+1900 - bYear);
	mb.setRegdate(new Timestamp(System.currentTimeMillis()));
	
	System.out.println(mb.toString());
	// 전달된 데이터를 DB에 저장
	// 0. 설치
	// 1. 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("드라이버 로드 성공!");
	
	// 2. DB 연결
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234");
	System.out.println("DB 연결 성공!");
	
	// 3. SQL 구문 작성 및 pstmt 객체 생성
	String sql = "INSERT INTO itwill_member VALUES(?, ?, ?, ?, ?, ?, ?)";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, mb.getId());
	pstmt.setString(2, mb.getPw());
	pstmt.setString(3, mb.getName());
	pstmt.setString(4, mb.getGender());
	pstmt.setInt(5, mb.getAge());
	pstmt.setString(6, mb.getEmail());
	pstmt.setTimestamp(7, mb.getRegdate());
	
	// 4. SQL 구문 실행
	pstmt.executeUpdate();
	System.out.println("회원가입 성공");
	
	// 로그인 페이지로 이동
	response.sendRedirect("loginForm.jsp");
	%>
	
</body>
</html>