package com.itwillbs.ex;

/**
 * 학생의 정보를 전달받아서
 * 총점, 평균을 계산하는 계산기
 */

public class Calculator {
	// 계산하는 기능만 필요 => 메서드
	public int sum(int kor, int eng, int math) {
		return kor + eng + math;
	}
	
	public int sum(Student s) { // 인스턴스 생성 -> 생성자 변수명
		return s.getKor() + s.getEng() + s.getMath(); 
	}
	
	public void avg(int kor, int eng, int math) {
		System.out.println("평균 : " + ((kor + eng + math)/3.0) + "점");
	}
	
	// 총점 사용해서 평균을 계산하는 메서드 (오버로딩 메서드)
	public void avg(int sum) {
		System.out.println("평균 : " + (sum / 3.0) + "점");
	}
}
