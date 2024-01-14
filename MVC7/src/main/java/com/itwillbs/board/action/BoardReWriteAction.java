package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class BoardReWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("\t M : BoardReWriteAction_execute() 호출 ");
		
		// 한글 처리 (필터) - 생략
		// 전달 정보 저장 (BoardDTO) 저장
		BoardDTO dto = new BoardDTO();
		dto.setBno(Integer.parseInt(request.getParameter("bno")));
		dto.setSubject(request.getParameter("subject"));
		dto.setName(request.getParameter("name"));
		dto.setContent(request.getParameter("content"));
		dto.setPass(request.getParameter("pass"));
		dto.setRe_ref(Integer.parseInt(request.getParameter("re_ref")));
		dto.setRe_lev(Integer.parseInt(request.getParameter("re_lev")));
		dto.setRe_seq(Integer.parseInt(request.getParameter("re_seq")));
		
		// 사용자의 IP 주소 추가
		dto.setIp(request.getRemoteAddr());
		System.out.println(" M : dto - " + dto);
		
		// pageNum 저장
		String pageNum = request.getParameter("pageNum");
		
		// BoardDAO 객체 생성 -> 답글 쓰기 메서드 호출
		BoardDAO dao = new BoardDAO(); // F3으로 이동
		dao.reInsertBoard(dto);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./BoardList.bo?pageNum=" + pageNum);
		forward.setRedirect(true);
		return forward;
	}

}
