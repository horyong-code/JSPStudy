<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testPro2.jsp</h1>
	
	전달 정보 출력 (파라미터)<br>
	
	<%
	  // 한글 처리 (인코딩 설정)
	  request.setCharacterEncoding("UTF-8");
	
	  String name = request.getParameter("name");
	  int age = Integer.parseInt(request.getParameter("age"));
	  String gender = request.getParameter("gender");
	  // String hobby = request.getParameter("hobby");
	  String[] hobby = request.getParameterValues("hobby");
	  // hobby[0] hobby[1] hobby[2]에 저장
	  // hobby가 2개라면 hobby[0], hobby[1]에만 저장
	  // 반복문을 통해서 반복 시작
	  // 배열이 있을 때만 반복
	  // 0부터 시작해서 돎
	  // 0은 있으니까 1번 돌고 증감식 통해서 1로 감
	  // 1도 성립하니까 한 번 더 함
	  // 증감식 통해서 2로 감
	  // 배열의 길이가 1이라서 i < hobby.length가 성립 안 함
	  // 반복문 빠져나옴
	  String subject = request.getParameter("subject");
	  
	  
	%>
	
	이름 : <%=name %><br>
	이름 + 100 : <%=name + 100 %><br>
	나이 : <%=age %><br>
	나이 + 100 : <%=age + 100 %><br>
	성별 : <%=gender %><br>
	<%
	    if(hobby != null){ // 배열이 있을 때
	     for(int i = 0; i < hobby.length; i++){
	    	 %>
	    	 취미 : <%=hobby[i] %><br>
	    	 <%	 
	    	 };};%>
	
    
	과목 : <%=subject %>

</body>
</html>