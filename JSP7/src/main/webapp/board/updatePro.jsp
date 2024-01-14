<%@page import="com.itwillbs.board.BoardDAO"%>
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
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	// 페이지 번호
	String pageNum = request.getParameter("pageNum");
	
	// 전달 정보 저장
	// => 액션태그 - 자바빈 객체 사용 저장
	%>
	<!-- 자바빈 객체 생성 -->
	<jsp:useBean id="bb" class="com.itwillbs.board.BoardBean"/>
	
	<!-- 자바빈 객체 저장 -->
	<jsp:setProperty property="*" name="bb"/>
	
	<%
	// 확인
	System.out.println(bb);
	
	// BoardDAO - 정보 수정 메서드
	BoardDAO bdao = new BoardDAO();
	int result = bdao.updateBoard(bb); // updateBoard()는 정수를 리턴하므로 변수에 저장 -> 호출
	
	// result값에 따른 페이지 이동 (JS)
	// -1 [글 없음], 0 [글 있음 - 비밀번호 다름], 1 [글 있음 - 비밀번호 같음]
	if(result == 1){
	/* JSP */ %>
		<script>
			alert("수정 완료!");
			location.href="boardList.jsp?pageNum=<%=pageNum %>";
		</script>
	<% /*JSP */
	}else if(result == 0){
	%>
		<script type="text/javascript">
			alert("수정 실패 - 비밀번호 오류!");
			history.back();
		</script>
	<% 	
	}else{
		// result == -1
	%>
		<script type="text/javascript">
			alert("수정 실패 - 게시판 글 없음!");
		</script>
	<%
	}
	%>

</body>
</html>