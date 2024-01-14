package com.itwillbs.util;

/**
 * ActionForward - 페이지 이동에 필요한 정보를 저장하는 객체 (티켓)
 *  이동할 주소 : path (목적지)
 *  이동할 방식 : isRedirect - true  : sendRedirect() 방식으로 이동 (직행 / 환승)
 *                                     가상 -> 가상 (주소변경 O, 화면변경 O) 
 *                           - false : forward() 방식으로 이동
 *                                     가상 -> 실제 (주소변경 X, 화면변경 O)
 */
public class ActionForward {
	private String path;
	private boolean isRedirect;
	
	public ActionForward() {
		System.out.println("----------------------------");
		System.out.println("티켓 정보 생성");
		System.out.println("목적지 - X, 방식 - X");
		System.out.println("----------------------------");
	}
	
	// Getter / Setter 정의 : Alt + Shift + S -> R
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() { // get 메서드 -> boolean 타입의 변수가 is로 시작할 경우 바로 get 역할
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) { // set 메서드 - is 삭제
		this.isRedirect = isRedirect;
	}
	
	// Alt + Shift + S -> S
	@Override
	public String toString() {
		return "ActionForward (티켓) [path (목적지)=" + path + ", isRedirect (방법)=" + isRedirect + "]";
	}
	
	
	
	
	
}
