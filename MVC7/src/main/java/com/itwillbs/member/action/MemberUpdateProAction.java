package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;
import com.itwillbs.util.JSMoveFunction;

public class MemberUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberUpdateProAction_execute() 호출 ");
		
		// 로그인 세션 제어
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 전달된 수정 정보 (파라미터) 저장 -> 변수에 저장 : DTO
		MemberDTO dto = new MemberDTO();
		dto.setId(request.getParameter("id")); 
		// dto.setId(id);
		dto.setPw(request.getParameter("pw"));
		dto.setName(request.getParameter("name"));
		dto.setAge(Integer.parseInt(request.getParameter("age")));
		dto.setGender(request.getParameter("gender"));
		dto.setEmail(request.getParameter("email"));
		
		// MemberDAO 객체 생성 -> 정보 수정 메서드 호출
		MemberDAO dao = new MemberDAO();
		int result = dao.updateMember(dto);
		
		// 처리 결과에 따른 페이지 이동
//		JSMoveFunction.alertLocation(response, msg, url); // static 메서드 -> 인스턴스 생성 전 접근 가능 : 클래스명.메서드명();
		if(result == 1) {
			// 수정 완료 -> 메인 페이지로 이동
			JSMoveFunction.alertLocation(response, "회원 정보 수정 완료!", "./Main.me");
			return null;
		}else if(result == 0) {
			// 수정 실패 -> 비밀번호 오류 -> 뒤로 가기
			JSMoveFunction.alertBack(response, "회원 정보 수정 실패 - 비밀 번호 오류");
			return null;
		}else { // result == -1
			// 수정 실패
			JSMoveFunction.alertBack(response, "회원 정보가 없음");
		}
		return null;
	}
}
