package com.itwillbs.member.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class MemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberListAction_execute() 호출 ");
		
		// 로그인 제어 & 티켓
		// (로그인을 했는지? + 아이디가 관리자 아이디인지 체크)
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null || !id.equals("admin")) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// MemberDAO 객체 생성 - 회원 목록 조회 메서드
		MemberDAO dao = new MemberDAO();
		ArrayList memberList = dao.getMemberList(); // 리턴 타입이 있으므로 변수에 저장 [리턴 타입 : ArrayList]
		
		// request 영역에 정보를 저장
		request.setAttribute("memberList", memberList); // 패턴 3은 request를 가지고 뷰 페이지 이동 [forward]
		
		// 페이지 이동 [./member/list.jsp]
		forward.setPath("./member/list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
