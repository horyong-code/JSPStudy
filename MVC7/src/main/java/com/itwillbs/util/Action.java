package com.itwillbs.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 인터페이스는 자생력이 없다. (객체 생성 불가능)
// => 추상 메서드를 포함하기 때문
// => 추상 메서드는 body가 없어서 실행 구문이 없음
public interface Action {
	// 상수
	// 추상 메서드
//	public void method();
//	public abstract void method2();
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
