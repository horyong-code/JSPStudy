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
	<h1>insertForm.jsp</h1>
	<!-- 사용자 정보 입력 -->
	
	<form action="insertPro.jsp" method="post" name="fr" onsubmit="return check();">
		<fieldset>
			<legend><b>ITWILL 회원가입</b></legend>
			<label>아이디 : <input type="text" name="id"></label><br>
			<label>비밀번호 : <input type="password" name="pw"></label><br>
			<label>이름 : <input type="text" name="name"></label><br>
			<label>성별 : <input type="radio" name="gender" value="남자" checked>남자
						<input type="radio" name="gender" value="여자">여자 </label><br>
			<label>생년월일 (나이) :
			<select name="bYear">
				<option value="">연</option>
				<%for(int i = 2023; i >= 1900; i--) {%>
					<option value="<%=i %>"><%=i %>년</option>
				<%} %>
			</select>
			<select name="bMonth">
				<option value="">월</option>
				<%for(int i = 1; i <= 12; i++) {%>
					<option value="<%=i %>"><%=i %>월</option>
				<%} %>
			</select>
			<select name="bDay">
				<option value="">일</option>
				<%for(int i = 1; i <= 31; i++) {%>
					<option value="<%=i %>"><%=i %>일</option>
				<%} %>
			</select>
			</label><br>
			<label>이메일 : <input type="email" name="email"></label><br>
			<hr>
			<input type="submit" value="회원가입">
		</fieldset>
	</form>
	

</body>
</html>