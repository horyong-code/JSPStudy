package com.itwillbs.board.action;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardFileWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : BoardFileWriteAction_execute() 실행 ");
		
		// upload 가상의 폴더 생성 [webapp - upload => tomcat에도 생김]
		String realPath = request.getRealPath("/upload");
		System.out.println(" M : realPath - " + realPath);
		
		// 첨부파일의 크기 설정 (5MB)
		int maxSize = 5 * 1024 * 1024; // MB : 1024 (byte) * 1024 (Kbyte) * 5 (Mbyte)
		
		// 파일 업로드 [MultipartRequest 객체 생성]
		MultipartRequest multi = new MultipartRequest(
				request, // request
				realPath, // 경로
				maxSize, // 크기 제한
				"UTF-8", // 인코딩
				new DefaultFileRenamePolicy() // 중복 파일명 처리
				);
		
		System.out.println("M : 파일 업로드 성공!");
		
//		File file = new File(realPath + "/" + multi.getFilesystemName("file")); // File -> java.io
// 		삭제할 때는 DB에서 파일명을 받아놓고 새 파일을 올린 후 기존 파일 삭제
//		file.delete(); // 파일 삭제
		
		
		// 나머지 정보 저장
		BoardDTO dto = new BoardDTO();
		dto.setName(multi.getParameter("name")); // 폼 영역에 있는 건 MultipartRequest 이용 [없는 건 request 이용]
		dto.setSubject(multi.getParameter("subject"));
		dto.setContent(multi.getParameter("content"));
		dto.setPass(multi.getParameter("pass"));
		dto.setFile(multi.getFilesystemName("file")); // 파일은 getParameter로 가져올 수 없음
		// getFilesystemName : 서버 파일 이름 (O)
		// getOriginalFileName : 원본 파일 이름
		dto.setIp(request.getRemoteAddr());
		
		// BoardDAO 객체 -> 첨부파일 저장
		BoardDAO bdao = new BoardDAO();
		bdao.insertBoard(dto);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./BoardList.bo");
		forward.setRedirect(true);
		return forward;
	}

}
