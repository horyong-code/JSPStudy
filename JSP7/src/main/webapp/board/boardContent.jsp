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
	<h1>boardContent.jsp</h1>
	<h2>게시판 본문</h2>
	<%
		// 전달 정보 저장 (파라미터 - bno, pageNum)
		int bno = Integer.parseInt(request.getParameter("bno")); // 클래스명.메서드명() => static 메서드
		String pageNum = request.getParameter("pageNum"); // DB에서 안 쓰기 때문에 굳이 int로 바꿀 필요 없음
		
		// BoardDaAO 객체 생성 [DB 처리]
		BoardDAO bdao = new BoardDAO();
		
		// 해당 글 조회수 증가
		bdao.updateReadCount(bno);
		
		// 특정 번호에 해당하는 글 정보를 가져오기
		BoardBean bb = bdao.getBoard(bno);
	%>
	<!-- 화면에 글 정보 출력 -->
		<table border="1">
			<tr>
				<th>글번호</th>
				<td><%=bb.getBno() %></td>
				<th>조회수</th>
				<td><%=bb.getReadcount() %></td>				
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=bb.getName() %></td>
				<th>작성일</th>
				<td><%=bb.getDate() %></td>				
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><%=bb.getSubject() %></td>			
			</tr>
			<tr>
				<th>첨부파일</th>
				<td colspan="3">
				<%if(bb.getFile() != null) {%>
				<a href="../upload/<%=bb.getFile() %>" download><%=bb.getFile() %></a><br> <!-- 가상 주소 이용 -->		
				<a href="../file/fileDownload.jsp?fileName=<%=bb.getFile() %>"><%=bb.getFile() %></a> <!-- 가상 주소 이용 -->	
				</td>	
				<%} %>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3"><%=bb.getContent() %></td>			
			</tr>
			<tr>
				<td colspan="4">
				<input type="button" value="수정하기" onclick="location.href='updateForm.jsp?bno=<%=bb.getBno() %>&pageNum=<%=pageNum %>';">
				<input type="button" value="삭제하기" onclick="location.href='deleteForm.jsp?bno=<%=bb.getBno() %>&pageNum=<%=pageNum %>';">
				<input type="button" value="답글쓰기" 
					onclick="location.href='reWriteForm.jsp?bno=<%=bb.getBno() %>&pageNum=<%=pageNum %>&re_ref=<%=bb.getRe_ref() %>&re_lev=<%=bb.getRe_lev() %>&re_seq=<%=bb.getRe_seq() %>';">
				<input type="button" value="목록으로" onclick="location.href='boardList.jsp?pageNum=<%=pageNum %>';">
				</td>	
			</tr>
		</table>
</body>
</html>