package com.itwillbs.ex;

public class MainClass {
	
	public static void main(String[] args) {
		// 1. 변수
		String name = "홍길동";
		int kor = 88;
		int eng = 79;
		int math = 98;
		
		// "'이름'의 총점 : 00점, 평균 : 00점"
		System.out.println(name+"의 총점 : " + (kor + eng + math) 
				+ "점, 평균 : " + ((kor + eng + math)/3.0) + "점");
		
		System.out.print(name + "의 총점 : " + sum(kor, eng, math) + "점, "); avg(kor, eng, math);
		
		avg(sum(kor, eng, math));
		
		// 객체 - 클래스 (학생 점수 저장)
		// 학생의 정보를 객체로 생성 -> 총점, 평균 계산
		Student kim = new Student();
		
		//kim.kor = 100;
		kim.setKor(100);
		kim.setEng(60);
		kim.setMath(77);
		
		System.out.println("총점 (객체) : " + sum(kim.getKor(), kim.getEng(), kim.getMath()) + "점");
		
		System.out.println("총점 (객체) : " + sum(kim) + "점");
		
		// 객체 - 기능 분리 (총점, 평균)
		// 계산기 필요함
		Calculator cal = new Calculator();
		System.out.println(cal.sum(kim));
		cal.avg(cal.sum(kim));
		
		Student kim2 = new Student();
		
		//kim2.kor = 100;
		kim2.setKor(90);
		kim2.setEng(70);
		kim2.setMath(85);
		
		cal.sum(kim2);
		
		
		
	}
	
	// sum -> 전달인자 3개, 총합의 결과를 리턴
	// avg -> 전달인자 3개, 평균의 결과를 출력
	
	public static int sum(int kor, int eng, int math) {
		return kor + eng + math;
	}
	
	public static int sum(Student s) { // 인스턴스 생성 -> 생성자 변수명
		return s.getKor() + s.getEng() + s.getMath(); 
	}
	
	public static void avg(int kor, int eng, int math) {
		System.out.println("평균 : " + ((kor + eng + math)/3.0) + "점");
	}
	
	// 총점 사용해서 평균을 계산하는 메서드 (오버로딩 메서드)
	public static void avg(int sum) {
		System.out.println("평균 : " + (sum / 3.0) + "점");
	}

}


	
