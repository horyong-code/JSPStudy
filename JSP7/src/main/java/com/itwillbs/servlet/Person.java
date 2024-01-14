package com.itwillbs.servlet;

public class Person {
	// 멤버 변수 선언
	private String name;
	private int age;
	private Phone phone;
	
	// Getter / Setter 메서드 정의 : Alt + Shift + S -> R
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Phone getPhone() {
		return phone;
	}
	public void setPhone(Phone phone) {
		this.phone = phone;
	}
	
	// toString() 오버라이딩 : Alt + Shift + S -> S
	@Override
	public String toString() {
		return "Person [name=" + name + ", age=" + age + ", phone=" + phone + "]";
	}
	
	
	
	

}
