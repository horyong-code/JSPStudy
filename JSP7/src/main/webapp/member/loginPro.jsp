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
	<h1>loginPro.jsp</h1>
	
	<%
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		// 전달 정보 저장
		// => 액션 태그 사용
	%>
	
		<!-- 자바빈 객체 생성 -->
		<jsp:useBean id="mb2" class="com.itwillbs.member.MemberBean"></jsp:useBean>
		<!-- 자바빈 객체 저장 -->
		<jsp:setProperty property="*" name="mb2"/>
	
	<%
		System.out.println(mb2.toString());
		// DB에 가서 회원정보가 있는지 없는지 체크
		
		// 아이디 O - '회원'
		//       - 비밀번호 O - '본인 - 로그인 성공' 
		//       - 비밀번호 X - '회원 - 비밀번호 오류'
		// 아이디 X - '비회원'
		
		// 1. 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 2. DB 연결
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234");
		
		// 3. SQL 구문 작성 및 pstmt 객체 생성
		String sql = "SELECT pw FROM itwill_member WHERE id = ?"; // 회원인지 확인
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mb2.getId());
		
		// 4. SQL 구문 실행
		ResultSet rs = pstmt.executeQuery();
		
		// 5. 데이터 처리
		if(rs.next()){
			// 아이디 O - '회원'
			if(mb2.getPw().equals(rs.getString("pw"))){
				//       - 비밀번호 O - '본인 - 로그인 성공' 
				System.out.println("로그인 성공!");
				// 로그인 아이디를 세션 영역에 저장
				session.setAttribute("id", mb2.getId());
				// 메인 페이지로 이동
				response.sendRedirect("main.jsp");
			}else{
				//       - 비밀번호 X - '회원 - 비밀번호 오류'
				System.out.println("로그인 실패! - 비밀번호 오류");
				%>
				<script type="text/javascript">
				alert("로그인 실패! - 비밀번호 오류");
				history.back();
				</script>
				<%
			}
		}else{
			// 아이디 X - '비회원'
			System.out.println("로그인 실패! - 비회원");
			%>
			<script type="text/javascript">
				//alert("로그인 실패! - 비회원");
				var joinResult = confirm("로그인 실패! - 비회원입니다. 회원가입을 진행하시겠습니까?");
				if(joinResult){
					location.href="insertForm.jsp";
				}else{
					history.back();
				}
			</script>
			<%
		}
	%>
	
</body>
</html>