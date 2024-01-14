package com.itwillbs.ex;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("A" == "A");
		// => 기본 데이터타입 비교
		System.out.println("A".equals("A"));
		// => 참조 데이터타입 비교
		
		// 문자열 상수
		String a0 = "A";
		String a1 = "A";
		
		System.out.println(a0 == a1); // 객체의 값을 비교
		
		// 문자열 객체
		String b0 = new String("B");
		String b1 = new String("B");
		
		System.out.println(b0 == b1); // 객체 주소를 비교 (값 비교 X)
		System.out.println(b0.equals(b1)); // 객체 주소 X, 객체의 값을 비교
		

	}

}
