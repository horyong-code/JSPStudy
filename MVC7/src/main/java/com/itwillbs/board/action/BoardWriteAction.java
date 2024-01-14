package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class BoardWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("\t M : BoardWriteAction_execute() 호출 ");
		
		// 한글 처리 (생략 -> 필터 설정)
		// request.setCharacterEncoding("UTF-8");
		// response.setContentType("text/html; charset=UTF-8");
		
		// 전달 정보 저장 (DTO)
		// String name = request.getParameter("name");
		// String subject = request.getParameter("subject");
		// String content = request.getParameter("content");
		// String pass = request.getParameter("pass");
		
		BoardDTO dto = new BoardDTO();
		dto.setName(request.getParameter("name"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setPass(request.getParameter("pass"));

		// IP 주소 저장
		dto.setIp(request.getRemoteAddr());;
		System.out.println("\t M : " + dto);
		
		// 메서드 호출 (DAO)
		BoardDAO dao = new BoardDAO();
		dao.insertBoard(dto);
		
		// 결과에 따른 페이지 이동 [티켓]
		ActionForward forward = new ActionForward();
		forward.setPath("./BoardList.bo");
		forward.setRedirect(true);
		return forward;
	}

}
