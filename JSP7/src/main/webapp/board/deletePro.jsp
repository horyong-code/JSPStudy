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
	<h1>deletePro.jsp</h1>
	<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	// 전달 정보 저장 (bno, pass, pageNum)
	// pageNum => 파라미터
	String pageNum = request.getParameter("pageNum");
	
	%>
	<!-- bno, pass => 액션 태그 -->
	<!-- 자바빈 객체 생성 -->
	<jsp:useBean id="bb" class="com.itwillbs.board.BoardBean"/>
	
	<!-- 자바빈 객체 저장 -->
	<jsp:setProperty property="*" name="bb"/>
	
	<%
		// BoardDAO - 게시판 글 삭제 메서드 호출 (bno, pass)
		// BoardDAO - 게시판 글 삭제 메서드 호출 (bb) -> 하나라도 DB에 있으면 객체 생성
		BoardDAO bdao = new BoardDAO();
	
		// 글 삭제 메서드 호출 - deleteBoard()
		int result = bdao.deleteBoard(bb);
		
		// 처리 결과에 따른 페이지 이동
	if(result == 1){
	/* JSP */ %>
		<script>
			alert("삭제 완료!");
			location.href="boardList.jsp?pageNum=<%=pageNum %>";
		</script>
	<% /*JSP */
	}else if(result == 0){
	%>
		<script type="text/javascript">
			alert("삭제 실패 - 비밀번호 오류!");
			history.back();
		</script>
	<% 	
	}else{
		// result == -1
	%>
		<script type="text/javascript">
			alert("삭제 실패 - 게시판 글 없음!");
		</script>
	<%
	}
	%>

</body>
</html>