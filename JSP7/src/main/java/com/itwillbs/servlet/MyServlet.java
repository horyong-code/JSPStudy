package com.itwillbs.servlet;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet { // 상속 -> 서블릿이 됨 -> Ctrl + Space = import
	
	// Alt + Shift + S -> V
	// http://localhost:8088/JSP7/myServlet (X)
	// http://localhost:8088/JSP7/myServlet.com (O)
	
	@Override
	public void init() throws ServletException {
		System.out.println("init() 실행 - 서블릿 클래스 (객체) 초기화!");
	} 
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MyServlet-doGet() 실행");
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MyServlet-doPost() 실행");
//		response.setContentType("text/html; charset=UTF-8");
//		response.getWriter().append("안녕하세요!");
//		response.getWriter().append("<h1>ITWILL 서블릿 수업</h1>");
		// => 직접적으로 태그를 작성해서 사용 (불편함)
		// => JSP 페이지 사용
		
		// 서블릿 [매핑] + JSP [화면] 같이 사용
		// => JSP 페이지로 이동 [서블릿 실행 -> JSP 페이지 이동] => 포워딩
		/* <jsp:~> 액션태그 포워딩은 JSP 페이지에서만 사용 가능 */
		
		RequestDispatcher dis = request.getRequestDispatcher("./board/myServlet.jsp"); // Ctrl + Space = import
		dis.forward(request, response);
	}

	@Override
	public void destroy() {
		System.out.println("detroy() 호출 - 서블릿 객체 소멸!");
	}


	
	
	
}
