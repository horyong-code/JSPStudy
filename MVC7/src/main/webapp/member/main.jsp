<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>main.jsp (MVC)</h1>
	<!-- 메인 페이지는 로그인을 수행한 사용자만 확인 가능 
		 로그인 없이 접근 한 경우 로그인 처리할 수 있도록 페이지 이동
	-->
	<c:if test="${empty sessionScope.id }">
		<c:redirect url="./MemberLogin.me"/>
	</c:if>
	
	
	<h2>사용자 아이디 (JSP) : <%=session.getAttribute("id") %></h2>
	<h2>사용자 아이디 (EL) : ${sessionScope.id }</h2>
	<h2>사용자 아이디 (EL) : ${id }</h2> <!-- 영역 객체 생략 -->
	
	<input type="button" value="로그아웃" onclick="location.href='./MemberLogout.me';">
	<!-- ./MemberLogout.me로 가면 *.me가 매핑이 되어있으므로 자동으로 컨트롤러로 이동해서 가상 주소 계산 -->
	<hr>
	<h3><a href="./MemberInfo.me">회원 정보 조회</a></h3>
	<hr>
	<h3><a href="./MemberUpdate.me">회원 정보 수정</a></h3>
	<hr>
	<h3><a href="./MemberDelete.me">회원 정보 삭제</a></h3>
		<hr>
	<h3><a href="./BoardWrite.bo">게시판 글쓰기</a></h3>
	
	<!-- 관리자 (admin) 전용 메뉴 -->
	<c:if test="${!empty sessionScope.id && sessionScope.id.equals('admin')}">
	<hr>
	<h3><a href="./MemberList.me">회원 목록 조회</a></h3>
	</c:if>
</body>
</html>