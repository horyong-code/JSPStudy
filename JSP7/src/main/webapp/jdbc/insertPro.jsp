<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
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
	<h1>/jdbc/insertPro.jsp</h1>
	<!-- 전달 정보 저장 -->
	
	<%request.setCharacterEncoding("UTF-8");
	
	// 전달 정보 (파라미터) 저장
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	int age = Integer.parseInt(request.getParameter("age"));
	
	String jumin1 = request.getParameter("jumin1");
	String jumin2 = request.getParameter("jumin2");
	
	String jumin = jumin1+ "-" +jumin2;
	%>
	
	이름 : <%=name %><br>
	성별 : <%=gender %><br>
	나이 : <%=age %><br>
	주민번호 : <%=jumin %><br>
	
	<h2>전달받은 정보를 DB로 전달</h2>
	<%
	// 1. 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("드라이버 로드 성공!");
	
	// 2. DB 연결
	Connection con =
	DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234");
	System.out.println("DB 연결 성공!");
	
	// 3. SQL 구문 작성 & stmt 객체 생성
	// String sql = "insert into itwill_member(idx, name, gender, age, jumin) values(null, '"+name+"', '"+gender+"', '"+age+"', '"+jumin+"')";
	String sql = "insert into itwill_member(idx, name, gender, age, jumin) values(null, ?, ?, ?, ?)";
	
	//Statement stmt = con.createStatement();
	PreparedStatement pstmt = con.prepareStatement(sql); 
	System.out.println("stmt 객체 생성 성공!");
	
	// ???
	pstmt.setString(1, name);
	pstmt.setString(2, gender);
	pstmt.setInt(3, age);
	pstmt.setString(4, jumin);

	
	// 4. SQL 구문 실행
	// stmt.executeUpdate(sql);
	pstmt.executeUpdate();
	// 실행의 결과가 테이블에 변화를 주는 경우 executeUpdate() 사용
	System.out.println("회원 정보 저장 완료!");
	%>

</body>
</html>