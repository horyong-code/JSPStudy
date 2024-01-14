package com.itwillbs.ex;

class Parent{
	public void pprn() {
		System.out.println("Parent-pprn()!");
	}
}
class Child extends Parent{
	public void cprn() {
		System.out.println("Child-cprn()!");
	}
}

public class Test2 {

	public static void main(String[] args) {
		
		// 데이터타입
		//1) 기본형타입 - 8개
		//	    형변환 - 자동형변환(묵시적형변환)
		//               메모리 크기가 작은곳 -> 큰곳			   
		//			   - 강제형변환(명시적형변환)		
		//               메모리 크기가 큰곳 -> 작은곳			   
		//              => 개발자가 문제상황을 확인 처리한다라는 의미
		
		//2) 참조형타입 - 8개를 제외한 모든타입
		//      * 상속관계에서만 형변환 가능
		//	    형변환 -  업캐스팅 (자동형변환)
		//               -> 부모타입의 클래스로 형변환 	   
		//			   -  다운캐스팅 (강제형변환)		
		//               -> 자식타입의 클래스로 형변환
		
		/////////////////////////////////////////////////////////////

		//class Parent{
		//	public void pprn() {
		//		System.out.println("Parent-pprn()!");
		//	}
		//}
		//class Child extends Parent{
		//	public void cprn() {
		//		System.out.println("Child-cprn()!");
		//	}
		//}

		Parent p1 = new Parent();
		p1.pprn();
		// p1.cprn();
		System.out.println("----------------------------------");
		Child c1 = new Child();
		c1.cprn();
		c1.pprn(); // 상속
		System.out.println("----------------------------------");
		
		// 업캐스팅 (+ 상속)
		// Parent p2 = new Test(); (X)
		Parent p2 = new Child();
		p2.pprn();
		// p2.cprn(); => 상속받은 부분만 사용 가능 (참조 영역의 축소)
		System.out.println("----------------------------------");
		// 다운캐스팅 (실패)
//		Child c2 = (Child)new Parent();
//		c2.pprn();
//		c2.cprn();
		System.out.println("----------------------------------");
		// 다운캐스팅 -> 업캐스팅 후 다운캐스팅
		Parent p3 = new Child(); // 업캐스팅
		Child c3 = (Child)p3; // 다운캐스팅
		c3.pprn();
		c3.cprn();
		
		
		
		
		
		
	}

}
