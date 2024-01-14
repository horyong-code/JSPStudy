package com.itwillbs.servlet;

public class Phone {
	// 멤버 변수 선언
	private String model;
	private String tel;
	
	// Alt + Shift + S -> R : Getter / Setter 정의
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	// Alt + Shift + S -> S : toString() 오버라이딩
	@Override
	public String toString() {
		return "Phone [model=" + model + ", tel=" + tel + "]";
	}
	
	
	
	

}
