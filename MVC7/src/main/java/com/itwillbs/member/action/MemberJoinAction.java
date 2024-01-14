package com.itwillbs.member.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

/**
 * 회원가입을 처리하는 객체 : insertPro.jsp 페이지의 동작 수행 // Model
 */
public class MemberJoinAction implements Action{
	// Action -> Pro
	// DB 처리를 하기 위해서 execute() -> request, response 필요 (순수 자바 X) => 인터페이스 상속

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : MemberJoinAction_execute() 실행 ");
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		// 전달정보 (파라미터) 저장 + 회원 가입일 -> DTO (= 자바빈)
		MemberDTO dto = new MemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setName(request.getParameter("name"));
		dto.setAge(Integer.parseInt(request.getParameter("age")));
		dto.setGender(request.getParameter("gender"));
		dto.setEmail(request.getParameter("email"));
		dto.setRegdate(new Timestamp(System.currentTimeMillis()));
		
		System.out.println(" M : " + dto);
		
		// DB 연결 - SQL 구문 실행 -> DAO
		MemberDAO dao = new MemberDAO();
		
		// 회원 가입 메서드를 호출
		dao.insertMember(dto);
		
		// 페이지 이동 (로그인 페이지) => 컨트롤러에서만 가능
		// 티켓 생성
		ActionForward forward = new ActionForward();
		forward.setPath("./MemberLogin.me");
		forward.setRedirect(true);
		
		System.out.println(" M  : " + forward);
		
		return forward;

	} // execute() 끝

}
