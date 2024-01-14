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
	<h1>deletePro.jsp</h1>
	
	<%
	// 세션 제어 [잘못된 접근 제어]
	String id =(String)session.getAttribute("id");	
	if(id == null){
		response.sendRedirect("loginForm.jsp");
	}
			
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	// 전달 정보 저장
	// String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 전달된 정보 확인하여 회원 정보 삭제
	// (DB에 저장된 회원 정보 삭제)
	
	// 0. 설치
	// 1. 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("드라이버 로드 성공!");
	
	// 2. DB 연결
	Connection con = 
	DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234");
	System.out.println("DB 연결 성공!");
	
	// 3. SQL 구문 작성 (SELECT) 및 pstmt 객체 생성
	String sql = "SELECT pw FROM itwill_member WHERE id = ?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, id);
	
	// 4. SQL 구문 실행
	ResultSet rs =
	pstmt.executeQuery();
	
	// 5. 데이터 처리
	if(rs.next()){ // ID가 있음
		if(rs.getString("pw").equals(pw)){ // 비밀번호가 일치함
			// 3. SQL 구문 작성 (DELETE) 및 pstmt 객체 생성
			sql = "DELETE FROM itwill_member WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			// 4. SQL 구문 실행
			pstmt.executeUpdate();
			
			// 세션 정보 전체 삭제
			session.invalidate();
			
			// 페이지 이동 %>
			<script>
			alert("모든 정보가 삭제되었습니다. 로그인 페이지로 이동합니다.")
			location.href="main.jsp";
			</script>
			<%
		}else{ // 비밀번호가 일치하지 않음 %>
			<script>
			alert("비밀번호가 일치하지 않으므로 탈퇴할 수 없습니다. 이전 페이지로 돌아갑니다.");
			history.back();
			</script>
		<%}
	}else{
		%>
		<script type="text/javascript">
			alert("회원 정보가 없으므로 탈퇴할 수 없습니다. 이전 페이지로 돌아갑니다.");
			history.back();
		</script>
		<%	
	}
	%>

	

</body>
</html>