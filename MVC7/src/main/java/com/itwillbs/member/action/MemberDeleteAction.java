package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;
import com.itwillbs.util.JSMoveFunction;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberDeleteAction_execute() 호출 ");
		
		// 로그인 세션 제어 + 티켓
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
		}
		
		// 전달 정보 저장 (DTO)
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPw(request.getParameter("pw"));
		
		// MemberDAO 객체 생성 - 회원 삭제 메서드 호출
		MemberDAO dao = new MemberDAO();
		int result = dao.deleteMember(dto);
		
		// 결과에 따른 페이지 이동
		if(result == 1) {
			// 세션 정보 초기화
			session.invalidate();
			// 삭제 성공
			JSMoveFunction.alertLocation(response, "회원 탈퇴 성공!", "./Main.me");
			return null;
		}else if(result == 0) {
			// 삭제 실패 - 비밀번호 오류
			JSMoveFunction.alertBack(response, "회원 탈퇴 실패! - 비밀번호 오류");
			return null;
			
		}else { // result == -1
			// 삭제 실패 - 회원 정보 X
			JSMoveFunction.alertBack(response, "아이디 없음");
			
		}
		return null;
	}
}
