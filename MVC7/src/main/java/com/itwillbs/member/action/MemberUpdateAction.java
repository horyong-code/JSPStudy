package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class MemberUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberUpdateAction_execute() 호출 ");
		
		// 로그인 세션 제어
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// DB에서 회원 정보를 조회 - MemberDAO 객체 생성 - 회원 정보 조회 메서드 호출
		MemberDAO dao = new MemberDAO();
		
		// 변수에 저장 - DTO
		MemberDTO dto = dao.getMember(id);
		
		// request 영역에 저장
		request.setAttribute("dto", dto); // dto의 수정 가능성이 있다
//		dto.setAge(100);
		session.setAttribute("dto", dto);
		
//		request.setAttribute("dto", dao.getMember(id)); // dto 그대로 바로 보내기
		
		// 페이지 이동 (./member/updateForm.jsp)
		forward.setPath("./member/updateForm.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
