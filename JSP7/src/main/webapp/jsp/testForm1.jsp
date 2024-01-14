<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testForm1.jsp</h1>
	<h2>Form 태그 : 사용자의 정보를 입력 받아서 전달하는 태그</h2>
	
	<fieldset>
	    <legend>폼 태그</legend>
	    <form action="testPro1.jsp" method="get" name="fr" onsubmit="return fn();"> 
	      아이디 : <input type="text" name="id"><br>
	      나이 : <input type="number" name="age"><br>
	      <input type ="submit" value="전송">
	    </form>
	</fieldset>
	
	<script type="text/javascript">
	function fn(){
		if(document.fr.id.value == ""){
			alert("아이디를 입력하세요");
			document.fr.id.focus();
			return false;
		};
	
	};
    </script>
</body>
</html>