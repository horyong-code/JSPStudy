<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>.file/fileDownload.jsp</h1>
	
	<%
		// 전달 정보 저장 (fileName)
		String fileName = request.getParameter("fileName");
	
		// 서버에 업로드되는 폴더 [가상 주소]
		String savePath = "upload";
		
		// 서버 안에 들어있는 업로드 폴더 위치 (realPath) [실제 주소]
		
		// 프로젝트 정보를 가져오기
		ServletContext CTX = getServletContext();
		// 업로드 폴더의 실제 위치 정보 가져오기
		String downloadPath = CTX.getRealPath(savePath);
		System.out.println("downloadPath : " + downloadPath);
		// 최종적으로 다운로드할 파일의 위치 가져오기 [최종 위치]
		String dFilePath = downloadPath+"\\"+fileName;
		System.out.println("dFilePath : " + dFilePath);
		
		// 데이터 전송 배열 (버퍼)
		// 데이터 임시 저장소
		byte[] b = new byte[4096]; // 4096byte => 4 * 1024 = 4KB
		
		// 파일을 열어서 읽을 수 있는 객체 생성
		FileInputStream fis = new FileInputStream(dFilePath);
		
		// MIME 타입 설정
		// 데이터를 올바르게 처리하기 위한 식별자
		String mimeType = getServletContext().getMimeType(dFilePath);
		if(mimeType == null){
			mimeType = "application/octet-stream"; // 다운로드
		}
		System.out.println("mimeType : " + mimeType);
		
		// 응답할 페이지의 타입을 마임타입으로 설정
		// (각 타입별 준비)
		response.setContentType(mimeType); // 마임타입이 pdf라면 페이지를 pdf 타입으로 변경
		
		// 인코딩
		// 브라우저 정보 확인
		String agent = request.getHeader("User-Agent");
		
		// ie를 사용하는 경우 체크
		boolean ieBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1);
		// MSIE 또는 Trident가 들어있으면 IE
		
		if(ieBrowser){
			// true - 'ie'일 때
			fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
			// fileName을 UTF-8로 인코딩 후에 공백을 %20으로 치환
		}else{
			// false - 'ie'가 아닐 때
			fileName = new String(fileName.getBytes("UTF-8"),"iso-8859-1");
			// fileName을 UTF-8로 인코딩 후에 바이트 배열로 가져온 후 iso-8859-1로 디코딩
			
		}
		
		// 모든 파일의 다운로드 시, 일반적인 다운로드 형태로 적용
		response.setHeader("Content-Disposition", "attachment; filename="+fileName);
		
		// 새로운 OutputStream을 만들기 때문에 기존 OutputStream 정리
		out.clear();
		out = pageContext.pushBody();
		
		// 파일을 다운로드 (= 파일을 출력)
		// fis = 파일을 열어서 읽을 수 있는 객체 -> out2 = 출력
		ServletOutputStream out2 = response.getOutputStream();
		
		// 출력
		int data = 0;
		while((data = fis.read(b,0,b.length)) != -1){ // 버퍼의 0부터 길이만큼 데이터를 읽어오겠다 [-1 = EOF (파일의 끝) => EOF 전까지] -> 읽기
				out2.write(b,0,data); // 출력
			
		}
		
		out2.flush(); // 버퍼가 꽉 차지 않았을 때 공백을 채워서 이동 [기존 : 버퍼가 꽉 차야 이동]
		
		// 자원 해제
		out2.close();
		fis.close();
		
	%>
	
</body>
</html>