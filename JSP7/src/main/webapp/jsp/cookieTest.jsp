<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieTest.jsp</h1>
	<h2>클라이언트 (나)</h2>
	
	<%
	// 쿠키값 확인
	// 쿠키 정보를 가져오기
	Cookie[] cookies = request.getCookies();
	
	// 쿠키 정보 저장 변수
	String value = "";
	
	// 내가 만든 쿠키가 있는지 체크 (배열에 값을 찾기)
	if(cookies != null)
	for(int i = 0;i<cookies.length;i++){		
		if(cookies[i].getName().equals("name")){
			// 내가 만든 쿠키가 있다
			value = cookies[i].getValue();
		}
	}	
	%>	
	<h2>쿠키값 : <%=value %></h2>	
	<input type="button" value="쿠키값 생성" onclick="location.href='cookieSet.jsp';">	
	<input type="button" value="쿠키 삭제" onclick="location.href='cookieDel.jsp';">

</body>
</html>