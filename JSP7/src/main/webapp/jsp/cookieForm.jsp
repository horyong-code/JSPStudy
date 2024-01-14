<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieForm.jsp</h1>
	
<!-- 설정된 언어값을 사용하여 메세지 출력
		한국어(kor) - "안녕하세요! 쿠키 테스트입니다."
		영어(eng) - "Hello! It's Cookie Test!"
-->
<%
	// 쿠키값을 모두 가져오기 (배열)
	String lang = "kor";
	Cookie[] cookies = request.getCookies(); 
	// 배열에 들어있는 요소 중에서 언어 설정 값을 찾기
	if(cookies != null){
		for(int i = 0; i < cookies.length; i++){
			if(cookies[i].getName().equals("lang")){ // getName()을 하지 않으면 쿠키가 너무 많음
				// 해당 요소가 있을 때 (언어 설정값)
				lang = cookies[i].getValue();
				// 값이 존재할 때 메세지 출력
				if(cookies[i].getValue().equals("kor")){
					out.println("안녕하세요! 쿠키 테스트입니다.");
					System.out.println("안녕하세요! 쿠키 테스트입니다.");
				}else{
					out.println("Hello! This is Cookie Test!");
					System.out.println("Hello! This is Cookie Test!");
			}
		}	
	}	
}
%> 
<br>
쿠키값 : <%=lang %>
<fieldset>
	<legend>언어</legend>
		<form action="cookiePro.jsp" method="get">
			<input type="radio" name="language" value="kor" 
			<%if(lang.equals("kor")){ %>
			checked
			<%} %>
			> 한국어
			<input type="radio" name="language" value="eng"
			<%if(lang.equals("eng")){ %>
			checked
			<%} %>
			> 영어
			<input type="submit" value="언어 설정">
	</form>
</fieldset>
	

</body>
</html>