<%@page import="com.itwillbs.board.BoardBean"%>
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
	<h1>updateForm.jsp</h1>
	<%
	// 전달 정보 저장
	int bno = Integer.parseInt(request.getParameter("bno"));
	String pageNum = request.getParameter("pageNum");
	
	// BoardDAO 객체 생성
	BoardDAO bdao = new BoardDAO();
	
	// 특정 번호에 해당하는 글 정보를 가져오기 - getBoard();
	BoardBean bb = bdao.getBoard(bno); // 리턴 있으면 변수에 저장
	
	// 정보 출력
	%>
	<form action="updatePro.jsp?pageNum=<%=pageNum %>" method="post" name="fr">
		<fieldset>
			<legend><b>ITWILL 게시판 글 수정하기</b></legend>
			<input type="hidden" name="bno" value="<%=bno %>">		
			<label>글쓴이 : <input type="text" name="name" value=<%=bb.getName() %>></label><br>
			<label>제목 : <input type="text" name="subject" value=<%=bb.getSubject() %>></label><br>
			<label>내용 : <br><textarea cols="20" rows="5" 
			name="content"><%=bb.getContent() %></textarea></label><br>
			<label>비밀번호 : <input type="password" name="pass" placeholder="비밀번호를 입력하세요!"></label><br>
			<hr>
			<input type="submit" value="글 수정하기">
		</fieldset>
	</form>
</body>
</html>