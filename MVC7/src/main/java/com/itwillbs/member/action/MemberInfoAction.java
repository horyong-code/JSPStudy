package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class MemberInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberInfoAction_execute() 호출 ");
		
		// 로그인한 유저의 아이디
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward(); // execute를 실행하면 컨트롤러 3단계 '가상 주소 이동'으로 넘어가므로 path, isRedirect 설정
		if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward; // return : 종료
		}
		
		// DB에 저장되어있는 회원 정보를 가져오기 -> DB 처리 = DAO
		// MemberDAO 객체 생성
		MemberDAO dao = new MemberDAO();
		
		// 회원 정보 가져오는 메서드 호출
		MemberDTO dto = dao.getMember(id); // 리턴값이 있으므로 변수에 저장 -> 리턴 타입 : MemberDTO
		System.out.println(" M : 조회 결과 " + dto);
		
		// 화면 (view)에 출력 -> 출력 정보를 전달하고 뷰 페이지로 이동
		// 정보 전달
		// 1. 파라미터 (? or 폼태그)
		// 2. 영역 객체
		// request 영역에 정보를 저장
		request.setAttribute("dto", dto); // 포워딩 할 때 request를 가져감
		
		// 페이지로 이동 (./member/info.jsp)
		forward.setPath("./member/info.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
