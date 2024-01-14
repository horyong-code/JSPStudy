package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class MemberLoginAction implements Action {
	
	// Alt + Shift + S -> V
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(" M : MemberLoginAction_execute() 호출 ");
		
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 전달 정보 저장 (id, pw) -> DTO
//		String id = request.getParameter("id");
//		String pw = request.getParameter("pw");
		MemberDTO dto = new MemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		
		// DB 연결 ~ SQL 구문 실행 -> DAO 객체 생성
		MemberDAO dao = new MemberDAO();
		
		// 로그인 체크 메서드 [호출]
		int result = dao.loginMember(dto);
		System.out.println(" M : result : " + result);
		
		ActionForward forward = null;
		if(result == 1) {
			// 페이지 이동 (= JSP)
			// 아이디 정보를 세션에 저장
			HttpSession session = request.getSession(); // Session이 없으므로 Session 생성
			session.setAttribute("id", dto.getId()); // 유효 범위 : Session (= 브라우저)이 유지되는 동안 모든 페이지
			
			// response.sendRedirect(null);
			forward = new ActionForward();
			forward.setPath("./Main.me");
			forward.setRedirect(true); // ./MemberLoginAction.me <-> ./Main.me
			return forward; // return : 메서드 종료

		}else if(result == 0) {
			// 페이지 이동 (= JS)
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println(" <script> ");
			out.println(" alert(' 사용자 비밀번호 오류! '); ");
			out.println(" history.back(); ");
			out.println(" </script> ");
			out.close();
			return null; // ActionForward 정보가 null (= 페이지 이동 정보 [티켓]) => 컨트롤러 페이지 이동 X
			
		}else { // result == -1
			// 페이지 이동 (= JS)
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println(" <script> ");
			out.println(" alert(' 회원 정보 없음! '); ");
			out.println(" history.back(); ");
			out.println(" </script> ");
			out.close();
		}
		return null;
	}
}
