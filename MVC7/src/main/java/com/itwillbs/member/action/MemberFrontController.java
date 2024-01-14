package com.itwillbs.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

/**
 * Controller
 * Member에 대한 정보 처리를 모두 수행하는 컨트롤러
 */

public class MemberFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n\n C : MemberFrontController_doProcess() 호출");
		System.out.println(" C : GET/POST방식 모두 처리");		
		
		System.out.println("\n ---------------------- 1. 가상 주소 계산 시작 ---------------------- ");
			System.out.println(request.getRequestURL());
			// URL : 프로토콜 + IP 주소 + 포트 번호 + 프로젝트명 + 파일명
			System.out.println(request.getRequestURI());
			// URI = URL - (프로토콜 + IP 주소 + 포트 번호)
			
			String requestURI = request.getRequestURI();
			System.out.println(" C : requestURI : " + requestURI);
			
			String CTXPath = request.getContextPath(); // Context = Project
			System.out.println(" C : CTXPath : " + CTXPath);
			String command = requestURI.substring(CTXPath.length());
			System.out.println(" C : command : " + command);
			
		System.out.println(" ---------------------- 1. 가상 주소 계산 끝 ---------------------- ");
		
		
		System.out.println("\n ---------------------- 2. 가상 주소 매핑 시작 ---------------------- ");
			
		ActionForward forward = null;
		Action action = null;
		if(command.equals("/MemberJoin.me")) {
				System.out.println(" C : /MemberJoin.me 매핑");
				System.out.println(" C : 패턴 1 - DB 처리 X, 뷰 페이지 이동");
				
				forward = new ActionForward();
				forward.setPath("./member/insertForm.jsp");
				forward.setRedirect(false);
				
				System.out.println(" C : " + forward);
			}else if(command.equals("/MemberJoinAction.me")) {
				System.out.println(" C : /MemberJoinAction.me 매핑 ");
				System.out.println(" C : 패턴 2 - DB 처리 O, 페이지 이동 ");
				
				// MemberJoinAction 객체 생성
				// MemberJoinAction mja = new MemberJoinAction();
				action = new MemberJoinAction(); // 업캐스팅
				try {
					// mja.execute(request, response);
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}else if(command.equals("/MemberLogin.me")) {
				System.out.println(" C : /MemberLogin.me 호출 ");
				System.out.println(" C : 패턴 1 - DB 처리 X, 뷰 페이지 이동 ");
				
				forward = new ActionForward();
				forward.setPath("./member/loginForm.jsp");
				forward.setRedirect(false);
				
			}else if(command.equals("/MemberLoginAction.me")) {
				System.out.println(" C : /MemberLoginAction.me 호출 ");
				System.out.println(" C : 패턴 2 - DB 처리 O, 페이지 이동 ");
				
				// MemberLoginAction() 객체 생성
				// 처리 결과를 가지고 이동
				action = new MemberLoginAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(command.equals("/Main.me")) {
				System.out.println(" C : /Main.me 호출 ");
				System.out.println(" C : 패턴 1 - DB 처리 X, 뷰 페이지 이동 ");
				forward = new ActionForward();
				forward.setPath("./member/main.jsp");
				forward.setRedirect(false);
			
			}else if(command.equals("/MemberLogout.me")) {
				System.out.println(" C : /MemberLogout.me 호출 ");
				System.out.println(" C : 패턴 2 - 데이터 처리 O, 페이지 이동 "); // 패턴 2 -> Action 객체 생성
				
				// MemberLogoutAction() 생성
				action = new MemberLogoutAction();
				try {
					forward = action.execute(request, response); // execute -> forward [예외 처리]
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			}else if(command.equals("/MemberInfo.me")) {
				System.out.println(" C : /MemberInfo.me 호출 ");
				System.out.println(" C : 패턴 3 - DB 처리 O, 페이지 출력 ");
				
				// MemberInfoAction() 객체 생성
				action = new MemberInfoAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}else if(command.equals("/MemberUpdate.me")) {
				System.out.println(" C : /MemberUpdate.me 호출 ");
				System.out.println(" C : 패턴 3 - DB 처리 O, 페이지 출력 ");
				
				// MemberUpdateAction() 객체 생성
				action = new MemberUpdateAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			}else if(command.equals("/MemberUpdateProAction.me")) {
				System.out.println(" C : /MemberUpdateProAction.me 호출 ");
				System.out.println(" C : 패턴 2 - DB 처리 O, 페이지 이동 ");
				
				// MemberUpdateProAction() 객체 생성
				action = new MemberUpdateProAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(command.equals("/MemberDelete.me")) {
				System.out.println(" C : /MemberDelete.me 호출 ");
				System.out.println(" C : 패턴 1  - DB 처리 X, 뷰 페이지 이동 ");
				forward = new ActionForward();
				forward.setPath("./member/deleteForm.jsp");
				forward.setRedirect(false);
			
			}else if(command.equals("/MemberDeleteAction.me")) {
				System.out.println(" C : /MemberDeleteAction.me 호출 ");
				System.out.println(" C : 패턴 2 - DB 처리 O, 페이지 이동 ");
				
				// MemberDeleteAction() 객체 생성
				action = new MemberDeleteAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}else if(command.equals("/MemberList.me")) {
				System.out.println(" C : /MemberList.me 호출 ");
				System.out.println(" C : 패턴 3 - DB 처리 O, 페이지 출력 ");
				action = new MemberListAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		
		System.out.println(" ---------------------- 2. 가상 주소 매핑 끝 ---------------------- ");
		
		
		System.out.println("\n ---------------------- 3. 가상 주소 이동 시작 ---------------------- ");
		if(forward != null) { // 이동 정보가 존재할 때 (티켓 O)
			 if(forward.isRedirect()) { // true 
				 System.out.println(" C : " + forward.getPath() + "로, 이동 방식 : sendRedirect()");
				 
				 response.sendRedirect(forward.getPath());
			 }else { // false
				 System.out.println(" C : " + forward.getPath() + "로, 이동 방식 : forward()");

				 RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				 dis.forward(request, response);
			 }
			
		}
		
		System.out.println(" ---------------------- 3. 가상 주소 이동 끝 ---------------------- ");
	}
	
	// Alt + Shift + S -> V
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" C : MemberFrontController_doGet() 호출");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" C : MemberFrontController_doPost() 호출");
		doProcess(request, response);
	}

}
