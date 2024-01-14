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
	<h1>deletePro.jsp</h1>
	
	<% 
	  // 한글처리 
	  request.setCharacterEncoding("UTF-8");
	  // 전달정보 저장(idx,jumin)
	  int idx =Integer.parseInt(request.getParameter("idx"));
	  String jumin = request.getParameter("jumin");
	%>
	
	<h2>삭제할 정보</h2>
	  번호 : <%=idx %><br>
	  주민번호 : <%=jumin %><br>
	  
	<%
	// 디비연결 정보 (상수)
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";

	// 1. 드라이버 로드
	 Class.forName(DRIVER);
	System.out.println(" 드라이버 로드 성공! ");
	// 2. 디비 연결
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println(" 디비연결 성공! ");
	
	// 3. sql 작성 & pstmt 객체
	String sql 
	= "select jumin from itwill_member where idx=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	//???
	pstmt.setInt(1, idx);
	
	// 4. sql 실행
	ResultSet rs = pstmt.executeQuery();
	
	// 5. 데이터 처리
	if(rs.next()){
		if(jumin.equals(rs.getString("jumin"))){
			
			//3. SQL작성 & pstmt 객체
			sql = "delete from itwill_member where idx=?";
			pstmt = con.prepareStatement(sql);
			
			// ???
			pstmt.setInt(1,idx);		
					
			//4. SQL 실행
			pstmt.executeUpdate();
			System.out.println(" 삭제 완료! ");
			
		}
		
	}
	
	
	%>  	
	
	<a href="select.jsp"> 결과 확인하기 </a>
	
	
</body>
</html>