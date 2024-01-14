package com.itwillbs.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/test3") => web.xml 코드에서 매핑한 효과 (서블릿 3.1 이후 사용 가능)
@WebServlet("/test3")
public class TestServlet3 extends HttpServlet {
	// http://localhost:8088/JSP7/test3

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet3_doGet()!!!");
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet3_doPost()!!!");
		
		// 학생 한명의 정보를 생성해서 전달
		// 이름 : 아이티윌
		// 나이 : 20
		// 휴대폰 : 아이폰15, 010-1234-1234
		
		Phone iPhone = new Phone();
		iPhone.setModel("아이폰15");
		iPhone.setTel("010-1234-1234");
		
		Person itwill = new Person();
		itwill.setName("아이티윌");
		itwill.setAge(20);
		itwill.setPhone(iPhone);
		
		request.setAttribute("itwill", itwill);
		
		Phone iPhone2 = new Phone();
		iPhone2.setModel("갤럭시S23");
		iPhone2.setTel("010-2222-2222");
		
		Person itwill2 = new Person();
		itwill2.setName("아이티윌2");
		itwill2.setAge(30);
		itwill2.setPhone(iPhone2);
		
		// 두 명의 정보를 ArrayList에 담아서 전달
		ArrayList personList = new ArrayList();
		personList.add(itwill);
		personList.add(itwill2);
		
		request.setAttribute("personList", personList);
		// ./jstl_el/object.jsp 페이지에서 정보 전달 받아서 출력
		RequestDispatcher dis = 
				request.getRequestDispatcher("./jstl_el/object.jsp");
		dis.forward(request, response);
		
		
	}
	

}
