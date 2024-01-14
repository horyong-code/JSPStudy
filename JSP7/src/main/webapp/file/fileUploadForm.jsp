<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>./file/fileUploadForm.jsp</h1>
	<%
		// 파일 업로드 (P.305)
		// => 자바의 입출력 스트림 사용 (직접 X => 컴포넌트 사용 [누가 만들어놓은 것])
		// => cos.jar 라이브러리 사용
	%>
	<!-- 반드시 "post" 방식으로 / enctype="multipart/form-data" 속성을 사용 -->
	<form action="fileUploadPro.jsp" method="post" enctype="multipart/form-data">
		<fieldset>
			<legend>파일 업로드</legend>
			<label>이름 : <input type="text" name="name"></label><br>
			<label>메세지 : <input type="text" name="msg"></label><br>
			<label>첨부파일 : <input type="file" name="file"></label><br>
			<hr>
			<input type="submit" value="전송하기">
		</fieldset>
	</form>
</body>
</html>