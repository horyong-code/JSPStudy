package com.itwillbs.member.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/*
 * MemberDAO : DB 데이터, MySQL과 관련된 모든 처리를 수행하는 객체
 * 		(Data Access Object)
 */
public class MemberDAO {
	
	// 공통 변수
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// 공통 메서드 (기능)
	////////////////////////////////////// DB 연결 메서드 //////////////////////////////////////
	private Connection getCon() throws Exception {
//		// DB 연결 정보
//				final String DRIVER = "com.mysql.cj.jdbc.Driver";
//				final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
//				final String DBID = "root";
//				final String DBPW = "1234";
//				
//				// 1. 드라이버 로드
//				Class.forName(DRIVER);
//				System.out.println("DAO : 드라이버 로드 성공!");
//				
//				// 2. DB 연결
//				con =
//				DriverManager.getConnection(DBURL, DBID, DBPW);
//				System.out.println("DAO : DB 연결 성공!");
		
//				Connection Pool을 사용한 DB 연결
				
				// 프로젝트의 정보를 확인 (JNDI)
				Context initCTX = new InitialContext(); // Context -> Ctrl + Space : javax.naming [업캐스팅 / 상속]
				// 1. 인터페이스 : 객체 생성 불가
				// 2. 형변환 연산자 X -> 자동 형변환 -> 업캐스팅 => 상속
				
				// 프로젝트 안에 작성된 DB 연결 정보 (context.xml)를 불러오기
				DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/mvc"); // java:comp/env/리소스명
				// DataSource -> Ctrl + Space : javax.sql
				// 다운캐스팅
				
				// DB 연결 수행
				con = ds.getConnection();
				System.out.println(" DAO : 디비 연결 성공! (커넥션 풀) ");
				System.out.println(" DAO : " + con);
				return con;
	}
	////////////////////////////////////// DB 연결 메서드 //////////////////////////////////////
	
	////////////////////////////////////// DB 연결 (자원) 해제 메서드 //////////////////////////////////////
	public void closeDB() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
			
			System.out.println(" DAO : DB 자원 해제 완료! ");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	////////////////////////////////////// DB 연결 (자원) 해제 메서드 //////////////////////////////////////
	
	////////////////////////////////////// 회원 가입 메서드 - insertMember(dto) //////////////////////////////////////
	public void insertMember(MemberDTO dto) { // 입력한 정보를 받아와서 insert -> 매개변수 : DTO 
		try {
			// 1. 2. DB 연결
			getCon();
			// 3. SQL 구문 작성 및 pstmt 객체 생성
			sql = "INSERT INTO itwill_member (id, pw, name, gender, age, email, regdate) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			// ? 정보 추가
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getGender());
			pstmt.setInt(5, dto.getAge());
			pstmt.setString(6, dto.getEmail());
			pstmt.setTimestamp(7, dto.getRegdate());
			
			// 4. SQL 구문 실행
			pstmt.executeUpdate();
			
			System.out.println(" DAO : 회원 가입 성공! ");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}
	////////////////////////////////////// 회원 가입 메서드 - insertMember(dto) //////////////////////////////////////
	
	////////////////////////////////////// 로그인 체크 메서드 - loginMember(dto) //////////////////////////////////////
	public int loginMember(MemberDTO dto) {
		int result = -1; // 처리 결과를 정수로 리턴 : -1 [ID 없음], 0 [비밀번호 다름], 1 [로그인 완료]
		
		try {
			// 1 ~ 2. DB 연결
			con = getCon();
			
			// 3. SQL 구문 작성 및 pstmt 객체 생성
			sql = "SELECT pw FROM itwill_member WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			// ? 정보 추가
			pstmt.setString(1, dto.getId());
			
			// 4. SQL 구문 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()) { // 회원정보가 있음
				if(dto.getPw().equals(rs.getString("pw"))) {
					// 비밀번호 동일
					result = 1;
				}else {
					// 비밀번호 다름
					result = 0;
				}
			}else { // 회원정보가 없음
				result = -1;
			}
			System.out.println(" DAO : 로그인 처리 완료 (" + result + ")");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	////////////////////////////////////// 로그인 체크 메서드 - loginMember(dto) //////////////////////////////////////
	
	////////////////////////////////////// 회원 정보 조회 메서드 - getMember(id) //////////////////////////////////////
	public MemberDTO getMember(String id) { // id를 받아서 회원 정보 조회 '매개변수 : String id' -> 변수에 저장 '리턴타입 : MemberDTO' [유사 : bno]
		MemberDTO dto = null; // DB 회원 정보 - 변수에 저장 -> MemberDTO 객체 생성 [try 전 / 전역 변수]
		try {
			// 1. 2. DB 연결
			con = getCon();
			// 3. SQL 구문 작성 및 pstmt 객체 생성
			sql = "SELECT * FROM itwill_member WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			
			// ? 정보 추가
			pstmt.setString(1, id);
			
			// 4. SQL 구문 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리 (DB에 저장된 정보 (rs)를 DTO로 저장)
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail(rs.getString("email"));
				dto.setRegdate(rs.getTimestamp("regdate"));
			}
			System.out.println(" DAO : 회원정보 조회 완료! ");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return dto; // 리턴 타입이 MemberDTO이므로 return dto; [마지막에]
	}
	////////////////////////////////////// 회원 정보 조회 메서드 - getMember(id) //////////////////////////////////////
	
	////////////////////////////////////// 회원 정보 수정 메서드 - updateMember(dto) //////////////////////////////////////
	public int updateMember(MemberDTO dto) { // 입력한 정보를 받아와서 정보 수정 - 매개변수 : MemberDTO dto, 처리 여부를 정수로 리턴 - 리턴 타입 : int
		int result = -1; // -1, 0, 1
		
		try {
			// 1. 2. DB 연결
			con = getCon();
			// 3. SQL 구문 작성 (SELECT) 및 pstmt 객체 생성
			sql = "SELECT pw FROM itwill_member WHERE id = ?"; // 글 수정 전에 비밀번호가 일치하는지 확인
			pstmt = con.prepareStatement(sql);
			
			// ? 정보 추가
			pstmt.setString(1, dto.getId());
			
			// 4. SQL 구문 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()) {
				if(rs.getString("pw").equals(dto.getPw())) { // 비밀번호 일치
					//  5-3. SQL 구문 작성 (UPDATE) 및 pstmt 객체 생성
					sql = "UPDATE itwill_member SET name = ?, gender = ? WHERE id = ?"; // = : 할당
					pstmt = con.prepareStatement(sql);
					
					// ? 정보 추가
					pstmt.setString(1, dto.getName());
					pstmt.setString(2, dto.getGender());
					pstmt.setString(3, dto.getId());
			
					//  5-4. SQL 구문 실행
					result = pstmt.executeUpdate(); // executeUpdate()는 행 개수 리턴
					
				}else { // 사용자의 비밀번호 오류 (불일치)
					result = 0;
				}
			}else { // 회원 정보 없음, 에러 발생
				result = -1;
			}
			System.out.println(" DAO : 회원 정보 수정 완료! (" + result + ")");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}
	////////////////////////////////////// 회원 정보 수정 메서드 - updateMember(dto) //////////////////////////////////////
	
	////////////////////////////////////// 회원 정보 삭제 메서드 - deleteMember(dto) //////////////////////////////////////
	public int deleteMember(MemberDTO dto) { // 입력한 정보를 받아와서 삭제 -> 매개변수 : MemberDTO dto, 처리 여부를 정수로 리턴 - 리턴 타입 : int
		int result = -1; // -1, 0, 1
		try {
			// 1. 2. DB 연결
			con = getCon();
			
			// 3. SQL 구문 작성 (SELECT) 및 pstmt 객체 생성
			sql = "SELECT pw FROM itwill_member WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			
			// ? 정보 추가
			pstmt.setString(1, dto.getId());
			
			// 4. SQL 구문 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()) { // 회원 정보 O
				if(dto.getPw().equals(rs.getString("pw"))) { // 비밀번호 일치
					// 3. SQL 구문 작성 (DELETE) 및 pstmt 객체 생성
					sql = "DELETE FROM itwill_member WHERE id = ?";
					pstmt = con.prepareStatement(sql);
					
					// ? 정보 추가
					pstmt.setString(1, dto.getId());
					
					// 4. SQL 구문 실행
					result = pstmt.executeUpdate(); // 행 개수 리턴
					
				}else { // 비밀번호 불일치
					result = 0;
				}
			}else { // 회원 정보 X
				result = -1;
			}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		System.out.println(" DAO : 회원 정보 삭제 완료! (" + result + ")");
		return result;
	}
	////////////////////////////////////// 회원 정보 삭제 메서드 - deleteMember(dto) //////////////////////////////////////
	
	////////////////////////////////////// 회원 정보 목록 메서드 - getMemberList() //////////////////////////////////////
	public ArrayList getMemberList() { // 목록 조회 : 리턴타입 ArrayList, 매개변수 startRow, pageSize
		ArrayList memberList = new ArrayList(); // try 위 : ArrayList 객체 생성
		try {
			// 1. 2. DB 연결
			con = getCon();
			// 3. SQL 구문 작성 및 pstmt 객체 생성
			sql = "SELECT * FROM itwill_member";
			pstmt = con.prepareStatement(sql);
					
			// 4. SQL 구문 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			while(rs.next()) {
				// rs -> dto -> list [rs -> list (X)]
				MemberDTO dto = new MemberDTO(); // while 안
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail(rs.getString("email"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				// rs -> dto 저장 완료
				memberList.add(dto);
				// dto -> list 저장 완료
			}
			System.out.println(" DAO : 회원 목록 조회 완료! ");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return memberList;
	}
	////////////////////////////////////// 회원 정보 목록 메서드 - getMemberList() //////////////////////////////////////
}
