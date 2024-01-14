package com.itwillbs.ex;

/**
 * 학생의 점수 kor, eng, math 정보 저장하는 객체
 */

public class Student {
	// 멤버 변수 선언 (접근 제한자 : private)
	private int kor; // [금고 - private (은행에서만)]
	private int eng;
	private int math;
	
	// Getter, Setter [은행원 - public]
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	
	// 메서드 정의

}
