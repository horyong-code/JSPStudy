package com.itwillbs.member.db;

import java.sql.Timestamp;

/**
 *  MemberDTO 클래스는 자바빈이다.
 *  	(Data Transfer Object) => 봉투
 *  => DB 테이블의 정보를 저장하는 객체
 */

public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private String gender;
	private int age;
	private String email;
	private Timestamp regdate;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
		System.out.println("자바빈 : 객체 초기화 (생성) 완료!");
		System.out.println("자바빈 : DB 정보를 저장할 준비 완료!");
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	// Alt + Shift + S -> S
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", gender=" + gender + ", age=" + age
				+ ", email=" + email + ", regdate=" + regdate + "]";
	}
	
	

}
