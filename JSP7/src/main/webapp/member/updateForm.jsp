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
<script type="text/javascript">
	function check(){
		// 아이디 입력 여부 체크
		var pw = document.fr.pw.value;
		if(pw == ""){
			alert("비밀번호를 입력하세요");
			document.fr.id.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<h1>updateForm.jsp</h1>
	<%
			//  로그인정보 체크
			String id = (String) session.getAttribute("id");
			
			if(id == null){
				response.sendRedirect("loginForm.jsp");
			}
			
			// DB에 저장된 사용자의 정보 조회
				// 디비연결정보 
				final String DRIVER = "com.mysql.cj.jdbc.Driver";
				final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
				final String DBID = "root";
				final String DBPW = "1234";
			
				// 1. 드라이버 로드
				Class.forName(DRIVER);
				System.out.println(" 드라이버 로드 성공! ");
				// 2. 디비연결
				Connection con =
				  DriverManager.getConnection(DBURL, DBID, DBPW);
				// 3. SQL 구문 작성 & pstmt 객체
				String sql = "select * from itwill_member where id=?";
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				// ???
				pstmt.setString(1, id);
				
				// 4. SQL 실행
				ResultSet rs = pstmt.executeQuery();
				
				// 5. 데이터 처리
				if(rs.next()){
					
		%>
		<fieldset>
			<legend> ITWILL 회원정보 수정 </legend>
			<form action="updatePro.jsp" method="post" name="fr" onsubmit="return check();">
				아이디 : <input type="text" name="id" value="<%=rs.getString("id")%>" readonly> <br>
				비밀번호 : <input type="password" name="pw"> <br>
				이름 : <input type="text" name="name" value="<%=rs.getString("name")%>"><br>
				성별 : <input type="radio" name="gender" value="남자" 
						<%if(rs.getString("gender").equals("남자")){ %>
						     checked					
						<%} %>
						>남
				       <input type="radio" name="gender" value="여자" 
				       <%if(rs.getString("gender").equals("여자")){ %>	
				       		 checked			
						<%} %>
				       >여<br>
				이메일 : <input type="email" name="email" value="<%=rs.getString("email")%>" readonly><br>
				
				<hr>
				<input type="submit" value=" 수정하기 ">
			</form>		
		</fieldset>
	 <% 		} %>	

</body>
</html>