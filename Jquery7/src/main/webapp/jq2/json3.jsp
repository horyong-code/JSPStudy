<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.itwillbs.board.db.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	// model 1 방식으로 게시판 글 정보 조회
	// 1. 설치
	// 2. 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	// 3. DB 연결
	Connection con = 
	DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234");
	
	// 4. SQL 구문 작성 (SELECT) 및 pstmt 객체 생성
	String sql = "SELECT bno, subject, name, date, readcount FROM itwill_board";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// 5. SQL 구문 실행
	ResultSet rs = pstmt.executeQuery();
	
	// 6. 데이터 처리
// 	ArrayList boardList = new ArrayList();
	JSONArray boardList = new JSONArray(); // ArrayList -> JSONArray
	while(rs.next()){
		// rs -> DTO -> list 
// 		BoardDTO dto = new BoardDTO();
		JSONObject dto = new JSONObject();
		dto.put("bno", rs.getInt(1));
		dto.put("subject", rs.getString(2));
		dto.put("name", rs.getString(3));
		dto.put("date", rs.getDate(4).toString());
		dto.put("readcount", rs.getInt(5));
		
// 		dto.setBno(rs.getInt(1));
// 		dto.setSubject(rs.getString(2));
// 		dto.setName(rs.getString(3));
// 		dto.setDate(rs.getDate(4));
// 		dto.setReadcount(rs.getInt(5));
		boardList.add(dto);
	}
	
	%>
	<%=boardList %>