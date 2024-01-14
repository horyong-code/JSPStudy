package com.itwillbs.board;

import java.sql.Date;

/**
 * itwill_board 테이블의 정보를
 * 한번에 저장하기 위해서 생성한 객체
 */

public class BoardBean { // 멤버 변수 선언
	private int bno;			// 글 번호 PK
	private String name;		// 글 작성자 이름 NN
	private String pass;		// 글 비밀번호 NN
	private String subject;		// 글 제목 NN
	private String content;		// 글 내용
	
	private int readcount;		// 조회수
	private int re_ref;			// 답글 정보
	private int re_lev;			// 답글 정보
	private int re_seq;			// 답글 정보
	
	private Date date;			// 글 작성일 => Date -> 자바빈 : java.sql 선택
	private String ip;			// 글 작성자 IP
	private String file;		// 파일 업로드 정보
	
	// Ctrl + Space
	public BoardBean() { // 기본 생성자 정의
		// TODO Auto-generated constructor stub
	}
	
	// Alt + Shift + S -> R
	public int getBno() { // get, set 메서드 정의
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRe_ref() {
		return re_ref;
	}
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}
	public int getRe_lev() {
		return re_lev;
	}
	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}

	// Alt + Shift + S -> S
	@Override
	public String toString() {
		return "BoardBean [bno=" + bno + ", name=" + name + ", pass=" + pass + ", subject=" + subject + ", content="
				+ content + ", readcount=" + readcount + ", re_ref=" + re_ref + ", re_lev=" + re_lev + ", re_seq="
				+ re_seq + ", date=" + date + ", ip=" + ip + ", file=" + file + "]";
	}
	
	

}
