package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;
import com.itwillbs.util.JSMoveFunction;

public class BoardDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("\t M : BoardDeleteAction_execute() 호출 ");
		
		// 전달 정보 저장 (bno, pass, pageNum)
		String pageNum = request.getParameter("pageNum");
		
		BoardDTO dto = new BoardDTO();
		dto.setBno(Integer.parseInt(request.getParameter("bno")));
		dto.setPass(request.getParameter("pass"));
		
		// DB에 가서 해당 글 정보를 삭제 (DAO)
		BoardDAO dao = new BoardDAO();
		int result = dao.deleteBoard(dto);
		
		if(result == 0) {
			JSMoveFunction.alertBack(response, "비밀번호 오류!");
			return null;
		}else if(result == -1) {
			JSMoveFunction.alertBack(response, "글 정보 없음!");
			return null;
		}
		// result == 1
		JSMoveFunction.alertLocation(response, "삭제 완료!", "./BoardList.bo?pageNum=" + pageNum);
		return null;
	}

}
