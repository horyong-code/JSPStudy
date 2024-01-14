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
	<h1>updatePro.jsp</h1>
	
	<%
	// 로그인 세션 제어
	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("loginForm.jsp");
	}
	
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	// 전달 정보 저장 -> 자바빈 액션태그
	%>
	<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"></jsp:useBean>
	<jsp:setProperty property="*" name="mb"/>
	
	<%
		// 수정할 정보를 DB에 전달
		// 1. 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("드라이버 로드 성공!");
		
		// 2. DB 연결
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234");
		System.out.println("DB 연결 성공!");
		
		// 3. SQL 구문 작성 (SELECT) 및 pstmt 객체 생성
		String sql = "SELECT pw FROM itwill_member WHERE id = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, id);
		
		// 4. SQL 구문 실행
		ResultSet rs =
		pstmt.executeQuery();
		
		// 5. 데이터 처리 (UPDATE)
		if(rs.next()){ 
			// 회원 정보가 있음
			if(mb.getPw().equals(rs.getString("pw"))){ // 입력 비밀번호 = 저장 비밀번호
				// 회원 정보 수정
				// 3. SQL 구문 작성 & pstmt 객체 생성
				sql = "UPDATE itwill_member SET name = ?, gender = ? WHERE id = ?"; // 변수 재사용
				pstmt = con.prepareStatement(sql); // 변수 재사용
				
				pstmt.setString(1, mb.getName()); 
				pstmt.setString(2, mb.getGender());
				pstmt.setString(3, mb.getId()); 
				
				// 4. SQL 구문 실행
				pstmt.executeUpdate();
				System.out.println("수정 완료!");
				
				// 메인 페이지로 이동
				response.sendRedirect("main.jsp");
			}else{
				// 회원 정보 수정 X - 비밀 번호 오류
				%>
				<script type="text/javascript">
					alert("수정 X - 비밀번호 오류!!");
					history.back();
				</script>
				<%
			}
		}else{
			// 회원 정보가 없음
			%>
			<script type="text/javascript">
				alert("수정 X - 회원 정보 없음!!");
				history.back();
			</script>
			<%
		}
	%>
	

</body>
</html>