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
	<h1>reWritePro.jsp</h1>
	
	<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	// 전달 정보 저장 (pageNum, bno, re_ref, re_lev, re_seq, name, subject, content, pass)
	String pageNum = request.getParameter("pageNum");
	%>
	<jsp:useBean id="bb" class="com.itwillbs.board.BoardBean"/>
	<jsp:setProperty property="*" name="bb"/>
	
	<%
	// IP 주소 저장
	bb.setIp(request.getRemoteAddr());
	
	// BoardDAO - 답글 작성 메서드
	BoardDAO bdao = new BoardDAO();
	bdao.reInsertBoard(bb);
	
	// 페이지 이동 (boardList)
	response.sendRedirect("boardList.jsp?pageNum="+pageNum);
	%>

</body>
</html>