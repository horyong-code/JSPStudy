package com.itwillbs.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet2 extends HttpServlet {
	// http://localhost:8088/JSP7/test2

	// Alt + Shift + S -> V
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet2_doGet() 호출");
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet2_doPost() 호출");
		
		// 배열의 데이터를 전달
		String[] foods = {"돈까스", "햄버거", "피자", "라면", "치킨"};
		
		// request 영역에 정보를 저장
		request.setAttribute("foods", foods); // foods = String[] -> Object [업캐스팅]
		
		// ArrayList 데이터를 전달
		ArrayList sportsList = new ArrayList();
		sportsList.add("축구"); // String -> Object [업캐스팅]
		sportsList.add("야구");
		sportsList.add("농구");
		sportsList.add("배구");
		sportsList.add("족구");
		
		// request 영역에 정보를 저장
		request.setAttribute("sportsList", sportsList);
		
		
		// 페이지 이동 [포워딩]
		RequestDispatcher dis = request.getRequestDispatcher("./jstl_el/arrays.jsp");
		dis.forward(request, response);
	}

}
