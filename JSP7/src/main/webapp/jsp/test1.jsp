<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test1.jsp</h1>
	<!--  ctrl + F11 실행 -->

	<!-- HTML 주석문 : ctrl + shift + / , \ -->
	
	<script type="text/javascript">

	// JS 주석문/*  */
	/* JS 주석문 */
	</script>
	
	<%-- JSP 주석문 --%>
	<% 
	  // JAVA (JSP) 주석문
	  /* JAVA (JSP) 주석문 */
	%>
		<!-- 1. 선언문  -->
	<%!
	 int itwill = 100;
	
	 // 메서드 선언 O (호출 X)
	 public void methodA(){
		System.out.println(itwill);
	 };

	%>
	<!-- 2. 스크립틀릿 -->
	<%
	 int busan = 200; // 지역 변수
	 // 메서드 호출 O
	 	System.out.println(itwill);
	 	System.out.println(busan);
	%>
	
	<!-- 3. 표현식 -->
	<%=itwill %><br>
	busan = <%=busan %> <br>

	
</body>
</html>