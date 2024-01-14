<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check(){
		// 아이디 입력 여부 체크
		var id = document.fr.id.value;
		if(id == ""){
			alert("아이디를 입력하세요");
			document.fr.id.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<h1>insertForm.jsp (MVC)</h1>
	<!-- 사용자 정보 입력 -->
	
	<form action="./MemberJoinAction.me" method="post" name="fr" onsubmit="return check();">
		<fieldset>
			<legend><b>ITWILL 회원가입</b></legend>
			<label>아이디 : <input type="text" name="id"></label><br>
			<label>비밀번호 : <input type="password" name="pw"></label><br>
			<label>이름 : <input type="text" name="name"></label><br>
			<label>성별 : <input type="radio" name="gender" value="남" checked>남자
						<input type="radio" name="gender" value="여">여자 </label><br>
			<label>나이 : <input type="number" name="age">
			</label><br>
			<label>이메일 : <input type="email" name="email"></label><br>
			<hr>
			<input type="submit" value="회원가입">
		</fieldset>
	</form>
	

</body>
</html>