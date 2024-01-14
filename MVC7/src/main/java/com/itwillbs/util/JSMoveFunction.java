package com.itwillbs.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

/**
 * JSMoveFunction : 컨트롤러 사용없이 JS만 사용해서 페이지 이동 처리하는 객체
 *
 */
public class JSMoveFunction {
	
	// alert + location.href 기능
	public static void alertLocation(HttpServletResponse response, 
			String msg, 
			String url) { // 순수 자바 : response 없음 -> response 있을 때만 실행, msg 출력용, url 이동용
		System.out.println(" JSMoveFunction_alertLocation() 호출 ");
		// public : 누구나 접근 가능
		// static : 인스턴스 생성 전 접근 가능
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter(); // Surround with try/catch
			out.println("<script>");
			out.println(" alert('"+ msg +"'); ");
			out.println(" location.href='"+ url +"'; ");
			out.println("</script>");
			out.close(); // 자원 해제
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// alert + history.back 기능
	public static void alertBack(HttpServletResponse response, 
			String msg) {
		System.out.println(" JSMoveFunction_alertBack() 호출 ");
		// public : 누구나 접근 가능
		// static : 인스턴스 생성 전 접근 가능
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter(); // Surround with try/catch
			out.println("<script>");
			out.println(" alert('"+ msg +"'); ");
			out.println(" history.back(); ");
			out.println("</script>");
			out.close(); // 자원 해제
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
