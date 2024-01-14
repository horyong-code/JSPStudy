<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>main.jsp</h1>
	<!-- 
		메인페이지는 로그인을 성공한 경우만 사용 가능
		로그인하지 않고 접근 하는 경우, 로그인 페이지로 이동
	 -->
	 
	 <%
	 String id = (String)session.getAttribute("id");
	 if(id == null){
		 System.out.println("로그인 정보 없음! 로그인 페이지 이동!");
		 response.sendRedirect("loginForm.jsp");
	 }
	 
	 %>
	 <h2><%=id %>님 환영합니다!</h2>
	 <input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
	 
	 <hr>
	 <h2><a href="info.jsp">회원정보 조회 (내 정보 보기)</a></h2>
	 <h2><a href="updateForm.jsp">회원정보 수정</a></h2>
	 <h2><a href="deleteForm.jsp">회원정보 삭제</a></h2>
	 
	 <% 
	 // if(id != null && id.equals("admin")){
	 if(id != null){
	 	if(id.equals("admin")){
	 		// null은 equals 비교 불가능
	 %>
	 <h2>관리자 전용 메뉴</h2>
	 <h2><a href="list.jsp">회원정보 목록 보기</a></h2>
	 <% 
	 	}	
	 }
	 %>
	


</body>
</html>