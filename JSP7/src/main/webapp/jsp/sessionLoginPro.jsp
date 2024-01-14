<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionLoginPro.jsp</h1>
	
	<h2>전달 받은 로그인 정보 처리</h2>
	
	<%! 
	 // JSP 선언문 => 멤버 변수, 멤버 메서드 선언 가능
	 String DBID = "admin";
	 String DBPW = "1234";
	%>
	
	<%
	// 한글처리
	
	request.setCharacterEncoding("UTF-8");
	
	// 2) 로그인정보 처리 (admin / 1234) 같은지 다른지 비교
	// 전달해준 정보 저장 (파라미터)
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 확인
	System.out.println("ID : " + id);
	System.out.println("PW : " + pw);
	
	// 2) 로그인 정보 처리 (admin / 1234) 같은지 다른지 비교
	if(id.equals(DBID)){
		if(pw.equals(DBPW)){
			System.out.println("본인! 로그인 성공!");
			// 세션에 정보 저장
			session.setAttribute("id", id);
			// 메인페이지 이동
			response.sendRedirect("sessionMain.jsp");
		}else{
			System.out.println("아이디는 있으나 비밀번호가 다름");
		}
	}else{
		System.out.println("비회원입니다.");
	};

	%>



</body>
</html>