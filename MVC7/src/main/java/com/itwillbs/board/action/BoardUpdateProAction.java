package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;
import com.itwillbs.util.JSMoveFunction;

public class BoardUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("\t M : BoardUpdateProAction_execute() 호출 ");
		
		// 전달 정보 저장 (bno, name, subject, content, pass, pageNum)
		// => BoardDETO 객체에 저장
		BoardDTO dto = new BoardDTO();
		dto.setBno(Integer.parseInt(request.getParameter("bno")));
		dto.setName(request.getParameter("name"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setPass(request.getParameter("pass"));
		String pageNum = request.getParameter("pageNum");
		
		// 전달받은 정보를 사용해서 기존의 정보 수정
		BoardDAO dao = new BoardDAO();
		int result = dao.updateBoard(dto);
		
		if(result == 0) {
			// JS 사용 - 페이지 이동
			JSMoveFunction.alertBack(response, "비밀번호 오류!");
			return null;
			
		}else if(result == -1) {
			JSMoveFunction.alertBack(response, "게시판 글 없음!");
			return null;
		}
		
		// result == 1
		JSMoveFunction.alertLocation(response, "수정 성공!", "./BoardList.bo?pageNum=" + pageNum);
		return null;
	}
}
