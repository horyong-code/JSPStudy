<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>object.jsp</h1>
	${requestScope.itwill }<hr>
	이름 : ${requestScope.itwill.name }<br>
	나이 : ${requestScope.itwill.age }<br>
	휴대폰 모델명 : ${requestScope.itwill.phone.model }<br>
	전화번호 : ${requestScope.itwill.phone.tel }<br>
	<hr>
	${requestScope.personList }<hr>
	1번 사람의 이름 : ${requestScope.personList[0].name }<br>
	2번 사람의 휴대폰 모델명 : ${requestScope.personList[1].phone.model }<br>
	1번 사람의 전화번호 : ${requestScope.personList[0].phone.tel }<br>
	2번 사람의 나이 : ${requestScope.personList[1].age }<br>
	
	

</body>
</html>