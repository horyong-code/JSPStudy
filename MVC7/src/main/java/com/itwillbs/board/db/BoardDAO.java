package com.itwillbs.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

// Ctrl + Shift + O : import 정리

public class BoardDAO {

	// 공통 변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	// 공통) DB 연결하기 (CP)
	private Connection getCon() throws Exception {
		Context initCTX = new InitialContext();
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/mvc");

		System.out.println(" DAO : DB 연결 성공! ");
		System.out.println(" DAO : " + con);
		con = ds.getConnection();
		return con;
	}
	// 공통) DB 연결하기

	// 공통) DB 자원해제
	public void closeDB() {
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (con != null) con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// 공통) DB 자원해제

	// 글쓰기 메서드 - insertBoard(BoardDTO dto) 매개변수 dto, 리턴타입 void
	public void insertBoard(BoardDTO dto) {
		int bno = 0;
		try {
			// 1. 2. DB 연결
			con = getCon();

			// * bno 계산하기 => 1부터 1씩 증가
			// 3. SQL 구문 작성 및 pstmt 객체 생성
			sql = "SELECT MAX(bno) FROM itwill_board";
			pstmt = con.prepareStatement(sql);

			// 4. SQL 구문 실행
			rs = pstmt.executeQuery();

			// 5. 데이터 처리
			if (rs.next()) {
//				bno = rs.getInt("MAX(bno)") + 1;
				bno = rs.getInt(1) + 1;
			}
			System.out.println(" DAO : 글번호 - " + bno);
//			else {
//				bno = 1;
//			}

			// 3. SQL 구문 작성 및 pstmt 객체 생성
			sql = "INSERT INTO itwill_board (bno, name, pass, subject, content, readcount, "
					+ "re_ref, re_lev, re_seq, date, ip, file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?, ?)";
			pstmt = con.prepareStatement(sql);

			// ? 정보 추가
			pstmt.setInt(1, bno);
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setInt(6, 0); // 조회수 0
			pstmt.setInt(7, bno); // 그룹 번호는 글 번호와 동일 (일반글)
			pstmt.setInt(8, 0); // re_lev : 0으로 초기화
			pstmt.setInt(9, 0); // re_seq : 0으로 초기화
			pstmt.setString(10, dto.getIp());
			pstmt.setString(11, dto.getFile());

			// 4. SQL 구문 실행
			pstmt.executeUpdate();

			System.out.println(" DAO : 글쓰기 완료! (bno : " + bno + ")");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	// 글쓰기 메서드 - insertBoard(BoardDTO dto)

	// 글 개수 계산 메서드 - getBoardCount() 리턴타입 int
	public int getBoardCount() {
		int result = 0;

		try {
			// 1. 드라이버 로드
			// 2. DB 연결
			con = getCon();

			// 3. SQL 구문 작성 및 pstmt 객체 생성
			sql = "SELECT COUNT(*) FROM itwill_board";
			pstmt = con.prepareStatement(sql);

			// 4. SQL 구문 실행
			rs = pstmt.executeQuery();

			// 5. 데이터 처리 - 개수를 저장
			if (rs.next()) {
				result = rs.getInt(1);
				// result = rs.getInt("COUNT(*)");
			}
			System.out.println("DAO : 개수 : " + result + "개");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}
	// 글 개수 계산 메서드 - getBoardCount()

	// 글 개수 계산 메서드 - getBoardCount() 리턴타입 int [오버로딩]
	public int getBoardCount(String search) {
		int result = 0;

		try {
			// 1. 드라이버 로드
			// 2. DB 연결
			con = getCon();

			// 3. SQL 구문 작성 및 pstmt 객체 생성
			sql = "SELECT COUNT(*) FROM itwill_board WHERE subject LIKE ?"; // ? 옆에는 아무 것도 못 붙임
			pstmt = con.prepareStatement(sql);

			// ? 정보 추가
			pstmt.setString(1, "%" + search + "%");

			// 4. SQL 구문 실행
			rs = pstmt.executeQuery();

			// 5. 데이터 처리 - 개수를 저장
			if (rs.next()) {
				result = rs.getInt(1);
				// result = rs.getInt("COUNT(*)");
			}
			System.out.println("DAO : 개수 : " + result + "개");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}
	// 글 개수 계산 메서드 - getBoardCount(search)

	// 글 정보 목록을 가져오는 메서드 - getBoardList(startRow, pageSize)
	public ArrayList getBoardList(int startRow, int pageSize) { // 오버로딩
		ArrayList boardList = new ArrayList(); // ArrayList 객체 생성
		try {
			// DB 연결 정보
			// 1. 드라이버 로드
			// 2. DB 연결
			con = getCon();
			// 3. SQL 구문 작성 (SELECT) & pstmt 객체 생성
			sql = "SELECT * FROM itwill_board ORDER BY re_ref DESC, re_seq LIMIT ?, ?";
			pstmt = con.prepareStatement(sql);
			// ???
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);
			// 4. SQL 구문 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			// 글 정보 전부 가져오기
			// BoardBean 객체 여러개 => ArrayList 저장
			while (rs.next()) {
				// 글 하나의 정보 => BoardBean 저장 [rs -> BoardBean]
				BoardDTO dto = new BoardDTO();
				dto.setBno(rs.getInt("bno"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getDate("date"));
				dto.setFile(rs.getString("file"));
				dto.setIp(rs.getString("ip"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setRe_ref(rs.getInt("re_ref"));
				dto.setRe_lev(rs.getInt("re_lev"));
				dto.setRe_seq(rs.getInt("re_seq"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setSubject(rs.getString("subject"));

				// 글 하나의 정보를 배열의 한 칸에 저장 [BoardBean -> List]
				boardList.add(dto);
			} // while
			System.out.println("DAO : 게시판 글 목록 조회 성공!");
			System.out.println("DAO : " + boardList.size());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return boardList;
	}
	// 글 정보 목록을 가져오는 메서드 - getBoardList(startRow, pageSize)

	// 글 정보 목록을 가져오는 메서드 - getBoardList(startRow, pageSize, search)
	public ArrayList getBoardList(int startRow, int pageSize, String search) { // 오버로딩
		ArrayList boardList = new ArrayList(); // ArrayList 객체 생성
		try {
			// DB 연결 정보
			// 1. 드라이버 로드
			// 2. DB 연결
			con = getCon();
			// 3. SQL 구문 작성 (SELECT) & pstmt 객체 생성
			sql = "SELECT * FROM itwill_board WHERE subject LIKE ? ORDER BY re_ref DESC, re_seq LIMIT ?, ?"; // 줄 바꿀 때 공백 들어있는지 확인
			pstmt = con.prepareStatement(sql);
			// ???
			pstmt.setString(1, "%" + search + "%");
			pstmt.setInt(2, startRow - 1);
			pstmt.setInt(3, pageSize);
			// 4. SQL 구문 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			// 글 정보 전부 가져오기
			// BoardBean 객체 여러개 => ArrayList 저장
			while (rs.next()) {
				// 글 하나의 정보 => BoardBean 저장 [rs -> BoardBean]
				BoardDTO dto = new BoardDTO();
				dto.setBno(rs.getInt("bno"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getDate("date"));
				dto.setFile(rs.getString("file"));
				dto.setIp(rs.getString("ip"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setRe_ref(rs.getInt("re_ref"));
				dto.setRe_lev(rs.getInt("re_lev"));
				dto.setRe_seq(rs.getInt("re_seq"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setSubject(rs.getString("subject"));

				// 글 하나의 정보를 배열의 한 칸에 저장 [BoardBean -> List]
				boardList.add(dto);
			} // while
			System.out.println("DAO : 게시판 글 목록 조회 성공!");
			System.out.println("DAO : " + boardList.size());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return boardList;
	}
	// 글 정보 목록을 가져오는 메서드 - getBoardList(startRow, pageSize, search)
	
	// 특정 글 조회수 1 증가 - updateReadcount() : 매개변수 bno, 리턴타입 void
	public void updateReadcount(int bno) {
		try {
			// 1. 2. DB 연결
			con = getCon();
			
			// 3. SQL 구문 작성 및 pstmt 객체 생성
			sql = "UPDATE itwill_board SET readcount = readcount + 1 WHERE bno = ?";
			pstmt = con.prepareStatement(sql);
			
			// ? 정보 추가
			pstmt.setInt(1, bno);
			
			// 4. SQL 구문 실행
			pstmt.executeUpdate();
			
			System.out.println("DAO : 게시판 글 조회수 1증가 완료!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
	}
	// 특정 글 조회수 1 증가() - updateReadcount() : 매개변수 bno, 리턴타입 void
	
	// 특정 글의 정보를 가져오기() - getBoard() : 매개변수 bno, 리턴타입 dto
	public BoardDTO getBoard(int bno) {
		BoardDTO dto = null;
		
		try {
			// 1. 2. DB 연결
			con = getCon();
			
			// 3. SQL 구문 작성 및 pstmt 객체 생성
			sql = "SELECT * FROM itwill_board WHERE bno = ?";
			pstmt = con.prepareStatement(sql);
			
			// ? 정보 추가
			pstmt.setInt(1, bno);
			
			// 4. SQL 구문 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()) {
				dto = new BoardDTO();
				
				dto.setBno(bno);
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRe_ref(rs.getInt("re_ref"));
				dto.setRe_lev(rs.getInt("re_lev"));
				dto.setRe_seq(rs.getInt("re_seq"));
				dto.setDate(rs.getDate("date"));
				dto.setIp(rs.getString("ip"));
				dto.setFile(rs.getString("file"));
			} // if
			
			System.out.println("DAO : 글 정보 조회 성공!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return dto;
	}
	// 특정 글의 정보를 가져오기() - getBoard() : 매개변수 bno, 리턴타입 dto
	
	// 특정 글 정보 수정하는 메서드 - updateBoard(dto) : 매개변수 DTO, 리턴타입 int
	public int updateBoard(BoardDTO dto) {
		int result = -1; // -1 (글 정보 없음, 에러), 0 (비밀번호 오류), 1 (정상 처리)
		
		try {
			// 1. 2. DB 연결
			con = getCon();
			
			// 3. SQL 구문 작성 및 pstmt 객체 생성
			sql = "SELECT pass FROM itwill_board WHERE bno = ?";
			pstmt = con.prepareStatement(sql);
			
			// ? 정보 추가
			pstmt.setInt(1, dto.getBno());
			System.out.println(dto.getBno());
			
			// 4. SQL 구문 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()) { // 글 정보 O
				if(dto.getPass().equals(rs.getString("pass"))) { // 비밀번호 일치
					// 3. SQL 구문 작성 및 pstmt 객체 생성
					sql = "UPDATE itwill_board SET name = ?, subject = ?, content = ? WHERE bno = ?";
					pstmt = con.prepareStatement(sql);
					
					// ? 정보 추가
					pstmt.setString(1, dto.getName());
					pstmt.setString(2, dto.getSubject());
					pstmt.setString(3, dto.getContent());
					pstmt.setInt(4, dto.getBno());
					
					// 4. SQL 구문 실행
					result = pstmt.executeUpdate();
				}else { // 비밀번호 불일치
					result = 0;
				}
			}else { // 글 정보 X
				result = -1;
			}
			System.out.println("DAO : 게시판 정보를 수정 완료! - result : " + result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}
	// 특정 글 정보 수정하는 메서드 - updateBoard(DTO) : 매개변수 bno, 리턴타입 int	
	
	// 특정 글 삭제하는 메서드 - deleteBoard(DTO) : 매개변수 dto, 리턴타입 int
	public int deleteBoard(BoardDTO dto) {
		int result = -1;
		
		try {
			// 1. 2. DB 연결
			con = getCon();
			
			// 3. SQL 구문 작성 및 pstmt 객체 생성
			sql = "SELECT pass FROM itwill_board WHERE bno = ?";
			pstmt = con.prepareStatement(sql);
			
			// ? 정보 추가
			pstmt.setInt(1, dto.getBno());
			
			// 4. SQL 구문 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()) { // 글 정보 O
				if(dto.getPass().equals(rs.getString("pass"))) { // 비밀번호 일치
					// 3. SQL 구문 작성 및 pstmt 객체 생성
					sql = "DELETE FROM itwill_board WHERE bno = ?";
					pstmt = con.prepareStatement(sql);
					
					// ? 정보 추가
					pstmt.setInt(1, dto.getBno());
					
					// 4. SQL 구문 실행
					result = pstmt.executeUpdate();
					
				}else { // 비밀번호 불일치
					result = 0;
				}
				
			}else { // 글 정보 X
				result = -1;
			}
			System.out.println("DAO : 글 삭제 완료! : result - " + result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}
	// 특정 글 삭제하는 메서드 - deleteBoard(DTO) : 매개변수 dto, 리턴타입 int
	
	// 답글 쓰기 메서드 - reInsertBoard(DTO) : 매개변수 dto, 리턴타입 void
	public void reInsertBoard(BoardDTO dto) {
		int bno = 0;
		try {
			// 1. 글 번호 계산
			// 1. 2. DB 연결
			con = getCon();
			// 3. SQL 구문 작성 및 pstmt 객체 생성
			sql = "SELECT MAX(bno) FROM itwill_board";
			pstmt = con.prepareStatement(sql);
			
			// 4. SQL 구문 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리

			if(rs.next()) {
//				bno = rs.getInt("MAX(bno)") + 1;
				bno = rs.getInt(1) + 1;
			}
			System.out.println("DAO : 답글번호 - " + bno);
			// 1. 글 번호 계산
			
			// 2. 답글 순서 재배치
			// 3. SQL 구문 작성 및 pstmt 객체 생성
			sql = "UPDATE itwill_board SET re_seq = re_seq + 1 "
					+ "WHERE re_ref = ? AND re_seq > ?";
			pstmt = con.prepareStatement(sql);
			
			// ? 정보 추가
			pstmt.setInt(1, dto.getRe_ref());
			pstmt.setInt(2, dto.getRe_seq());
			
			// 4. SQL 구문 실행
			int tmp = pstmt.executeUpdate();
			
			if(tmp != 0) {
				System.out.println("DAO : 답글 순서 재배치!");
			}
			// 2. 답글 순서 재배치
			
			// 3. 답글 작성
			// 3. SQL 구문 작성 및 pstmt 객체 생성
			sql = "INSERT INTO itwill_board "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			// ? 정보 추가
			pstmt.setInt(1, bno);
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setInt(6, 0); // 조회수 : 0
			pstmt.setInt(7, dto.getRe_ref()); // 그룹번호 : 원글 = 답글 [원글 = bno]
			pstmt.setInt(8, dto.getRe_lev() + 1); // 레벨값 : 원글의 lev + 1 [원글 = 0]
			pstmt.setInt(9, dto.getRe_seq() + 1); // 순서값 : 원글의 seq + 1 [원글 = 0]
			pstmt.setString(10, dto.getIp());
			pstmt.setString(11, dto.getFile());
			
			// 4. SQL 구문 실행
			pstmt.executeUpdate();
			System.out.println("DAO : 답글 작성 완료!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	// 답글 쓰기 메서드 - reInsertBoard(DTO) : 매개변수 dto, 리턴타입 void
}
