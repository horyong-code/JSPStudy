<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>./file/fileUploadPro.jsp</h1>
	<%
		// 1. cos.jar 라이브러리 설치 (프로젝트당 1번)
		// 2. 파일이 업로드되는 장소 (upload 폴더)
		// 3. 업로드 파일의 크기 제한 (5mb)
		
		// 파일이 저장되는 장소 (tomcat 서버에 저장되는 장소)
		// => 가상 주소
		String realPath = request.getRealPath("/upload"); // 가상 주소의 실제 주소
		System.out.println("realPath " + realPath);
		
		// byte -> KB (1024byte) -> MB (1024KB)
		// 파일의 크기
		int maxSize = 5 * 1024 * 1024; // 숫자 * MB * KB * byte [ex. 5MB = 5 (숫자) * 1024 (KB) * 1024 (byte)]
		
		// 파일 업로드 => MultipartRequest 객체를 생성
		MultipartRequest multi = new MultipartRequest(
				request, // 폼태그 파라미터
				realPath, // upload 폴도
				maxSize, // 크기 제한
				"UTF-8", // 한글 처리
				new DefaultFileRenamePolicy() // 파일명 중복 처리
				);
		System.out.println("파일 업로드 성공!");
		
		// 전달 정보 처리 (파라미터 name, msg)
		// => request 처리 불가능 -> MultipartRequest
// 		String name = Request.getParameter("name");
		String name = multi.getParameter("name");
		String msg = multi.getParameter("msg");
		
		// 업로드된 파일의 이름정보
		// => 파라미터 정보 처리 불가능
		String fileName = multi.getParameter("file"); // 파일 업로드는 안 됨
		String fileName1 = multi.getFilesystemName("file");
		// => 업로드 시 파일의 이름 (중복일 경우 이름이 변경)
		String fileName2 = multi.getOriginalFileName("file");
		// => 업로드 시 파일의 원본 이름
	%>
	<h2>전달정보 (name) : <%=name %></h2>
	<h2>전달정보 (msg) : <%=msg %></h2>
	<h2>전달정보 (fileName) : <%=fileName %></h2>
	<h2>전달정보 (fileName1) : <%=fileName1 %></h2>
	<h2>전달정보 (fileName2) : <%=fileName2 %></h2>
	
	<hr>
	<h2>파일 다운로드</h2>
	<a href="../upload/<%=fileName1 %>"><%=fileName1 %></a><br>
	<!-- html5 제공하는 a태그 속성 -->
	<a href="../upload/<%=fileName1 %>" download><%=fileName1 %></a>
	다운로드 (JSP) : <a href="fileDownload.jsp?fileName=<%=fileName1 %>"><%=fileName1 %></a> 
	<!-- 링크에 넣을 때는 가상 주소 사용 -->
	
</body>
</html>