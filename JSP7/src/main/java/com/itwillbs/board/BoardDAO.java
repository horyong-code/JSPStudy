package com.itwillbs.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * DAO : Data Access Object [데이터 처리 객체]
 * => DB 데이터, MySQL과 관련된 모든 처리를 수행하는 객체
 * 
 * DTO : Data Transfer Object [데이터 전송 객체]
 * => 자바빈 객체 / VO
 * => DB에 저장된 데이터를 한번에 저장하는 객체
 */

public class BoardDAO {
	
	// 공통 변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	/**
	 * getConnection()
	 * BoardDAO 객체 안에서만 사용가능한 메서드
	 * 디비 연결에 관한 동작 모두 처리
	 * @throws ClassNotFoundException 
	 */
	// DB 연결 처리 메서드 - getConnection();
	private Connection getConnection() throws Exception {
		// DB 연결 정보
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		// 1. 드라이버 로드
		Class.forName(DRIVER);
		System.out.println("DAO : 드라이버 로드 성공!");
		
		// 2. DB 연결
		con =
		DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("DAO : DB 연결 성공!");
		
		return con;
	}
	
	// 글 정보 저장 메서드 - insertBoard()
	public void insertBoard(BoardBean bb) {
		// DB 연결 정보
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		int bno = 0;
		try {
			// 1. 드라이버 로드
			Class.forName(DRIVER);
			System.out.println("DAO : 드라이버 로드 성공!");
			
			// 2. DB 연결
			Connection con =
			DriverManager.getConnection(DBURL, DBID, DBPW);
			System.out.println("DAO : DB 연결 성공!");
			
			// 3. SQL 구문 작성 및 pstmt 객체 생성
			// -> 글 번호 계산
			String sql = "SELECT MAX(bno) from itwill_board";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = 
			pstmt.executeQuery();
			
			// 4. SQL 구문 실행
			if(rs.next()) {
//				bno = rs.getInt("MAX(bno)")+1; // 컬럼명
				bno = rs.getInt(1)+1; // 인덱스 번호
				// => getInt() 리턴값이 SQL - null일 때 0을 리턴
			}
			
			System.out.println("DAO :  bno : " + bno);
			
			// 3. SQL 구문 작성 (insert) 및 pstmt 객체 생성
			sql = "INSERT INTO itwill_board(bno, name, pass, subject, content, readcount, "
					+ "re_ref, re_lev, re_seq, date, ip, file) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			// ???
			pstmt.setInt(1, bno); // 계산한 글번호
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			
			pstmt.setInt(6, 0); // 조회수 0
			pstmt.setInt(7, bno); // bno == re_ref (신규글)
			pstmt.setInt(8, 0); // re_rev = 0 (신규글)
			pstmt.setInt(9, 0); // re_seq = 0 (신규글)
			
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());
			
			// 4. SQL 구문 실행
			pstmt.executeUpdate();
			System.out.println("DAO : 글쓰기 완료!");
		} 
//		catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} 
		catch (Exception e) {
			e.printStackTrace();
		}	
	}
	// 글 정보 저장 메서드 - insertBoard()
	
	// 글 개수 계산 메서드 - getBoardCount()
	public int getBoardCount() {
		int result = 0;
		// DB 연결 정보
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";

		try {
			// 1. 드라이버 로드
			Class.forName(DRIVER);
			System.out.println("DAO : 드라이버 로드 성공!");
			
			// 2. DB 연결
			Connection con =
			DriverManager.getConnection(DBURL, DBID, DBPW);
			System.out.println("DAO : DB 연결 성공!");
			
			// 3. SQL 구문 작성 및 pstmt 객체 생성
			String sql = "SELECT COUNT(*) FROM itwill_board";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			// 4. SQL 구문 실행
			ResultSet rs = 
			pstmt.executeQuery();
			
			// 5. 데이터 처리 - 개수를 저장
			if(rs.next()) {
				result = rs.getInt(1);
				// result = rs.getInt("COUNT(*)");
			}
			System.out.println("DAO : 개수 : " + result + "개");
			
			}
			catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	// 글 개수 계산 메서드 - getBoardCount()
	
	// 글 정보 목록을 가져오는 메서드 - getBoardList()
	public ArrayList getBoardList(){ // 리턴 타입이 ArrayList
		ArrayList boardList = new ArrayList(); // ArrayList 객체 생성
		try {
			// DB 연결 정보
			// 1. 드라이버 로드
			// 2. DB 연결
			con = getConnection();
			// 3. SQL 구문 작성 (SELECT) & pstmt 객체 생성
			sql = "SELECT * FROM itwill_board ORDER BY bno DESC LIMIT 0, 10";
			pstmt = con.prepareStatement(sql);
			// 4. SQL 구문 실행
			rs = 
			pstmt.executeQuery();
			// 5. 데이터 처리
			// 글 정보 전부 가져오기
			// BoardBean 객체 여러개 => ArrayList 저장
			while(rs.next()) {
				// 글 하나의 정보 => BoardBean 저장 [rs -> BoardBean]
				BoardBean bb = new BoardBean();
				bb.setBno(rs.getInt("bno"));
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
		
				// 글 하나의 정보를 배열의 한 칸에 저장 [BoardBean -> List]
				boardList.add(bb);
			} // while
			System.out.println("DAO : 게시판 글 목록 조회 성공!");
			System.out.println("DAO : " + boardList.size());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return boardList;
	}
	// 글 정보 목록을 가져오는 메서드 - getBoardList()
	
	// 글 정보 목록을 가져오는 메서드 - getBoardList(startRow, pageSize)
	public ArrayList getBoardList(int startRow, int pageSize){ // 오버로딩
		ArrayList boardList = new ArrayList(); // ArrayList 객체 생성
		try {
			// DB 연결 정보
			// 1. 드라이버 로드
			// 2. DB 연결
			con = getConnection();
			// 3. SQL 구문 작성 (SELECT) & pstmt 객체 생성
			sql = "SELECT * FROM itwill_board ORDER BY re_ref DESC, re_seq LIMIT ?, ?";
			pstmt = con.prepareStatement(sql);
			// ???
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			// 4. SQL 구문 실행
			rs = 
			pstmt.executeQuery();
			// 5. 데이터 처리
			// 글 정보 전부 가져오기
			// BoardBean 객체 여러개 => ArrayList 저장
			while(rs.next()) {
				// 글 하나의 정보 => BoardBean 저장 [rs -> BoardBean]
				BoardBean bb = new BoardBean();
				bb.setBno(rs.getInt("bno"));
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
		
				// 글 하나의 정보를 배열의 한 칸에 저장 [BoardBean -> List]
				boardList.add(bb);
			} // while
			System.out.println("DAO : 게시판 글 목록 조회 성공!");
			System.out.println("DAO : " + boardList.size());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return boardList;
	}
	// 글 정보 목록을 가져오는 메서드 - getBoardList(startRow, pageSize)
	
	// 해당글 조회수 1 증가 - updateReadCount()
	public void updateReadCount(int bno) {
		try {
			// DB 연결 정보
			// 1. 드라이버 로드
			// 2. DB 연결
			con = getConnection();
			// 3. SQL 구문 작성 및 pstmt 객체 생성
			// 특정 글의 조회수를 1 증가
			sql = "UPDATE itwill_board SET readcount = readcount + 1 WHERE bno = ?";
			pstmt = con.prepareStatement(sql);
			// ? 정보 추가
			pstmt.setInt(1, bno);
			// 4. SQL 구문 실행
			pstmt.executeUpdate();
			System.out.println("DAO : 게시판 조회수 1 증가 완료!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// 해당글 조회수 1 증가 - updateReadCount()
	
	// 특정 번호에 해당하는 글 정보를 가져오기 - getBoard()
	public BoardBean getBoard(int bno) {
//		BoardBean bb;
//		System.out.println(bb.getBno()); // 오류 [초기화 X]
		BoardBean bb = null; // 리턴 타입이 BoardBean이므로 BoardBean 변수 선언 + 초기화 = null [try 전]
//		System.out.println(bb.getBno()); // 경고
		try {
			// 1 - 2. DB 연결
			con = getConnection();
			// 3. SQL 구문 작성 (SELECT) 및 pstmt 객체 생성
			sql = "SELECT * FROM itwill_board WHERE bno = ?";
			pstmt = con.prepareStatement(sql);
			// ? 정보 추가
			pstmt.setInt(1, bno);
			// 4. SQL 구문 실행
			rs = 
			pstmt.executeQuery();
			// 5. 데이터 처리 (rs -> BoardBean)
			if(rs.next()) {
//				BoardBean bb = new BoardBean(); // 지역 변수
				bb = new BoardBean(); // 참일 때만 BoardBean 객체 생성
				bb.setBno(rs.getInt("bno"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setDate(rs.getDate("date"));
				bb.setIp(rs.getString("ip"));
				bb.setFile(rs.getString("file"));
				
			}
			System.out.println("DAO : 글 정보 저장 완료!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bb; // 리턴 타입이 BoardBean이므로 bb 리턴 [catch 후]
	}
	// 특정 번호에 해당하는 글 정보를 가져오기 - getBoard()
	
	// 게시판 글 수정하기 - updateBoard(bb) 
	public int updateBoard(BoardBean bb) { // 입력한 정보를 받아와서 수정해야하므로 BoardBean 객체 생성 = BoardBean -> DB
		int result = -1; // -1 0 1 [업데이트 여부를 정수로 리턴]
		try {
			// 1. 2. DB 연결
			con = getConnection();
			// 3. SQL 구문 작성 및 pstmt 객체 생성
			sql = "SELECT pass FROM itwill_board WHERE bno = ?"; // 글이 있는지 없는지부터 판단 - bno로 검색
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bb.getBno());
			// 4. SQL 구문 실행
			rs = 
			pstmt.executeQuery();
			// 5. 데이터 처리
			if(rs.next()) { 
			// 게시판에 글이 있을 때
				if(bb.getPass().equals(rs.getString("pass"))) { // 입력한 pass와 DB의 pass가 같은지 확인
					// 게시판에 글이 있음 - 비밀번호 같음
					// => 글 수정 [이미 DB 연결되어 있음]
					sql = "UPDATE itwill_board SET name = ?, subject = ?, content = ? WHERE bno = ?";
					pstmt = con.prepareStatement(sql);
					
					// ? 정보 추가
					pstmt.setString(1, bb.getName()); // pstmt 객체를 생성하지 않으면 1을 맨 위의 bno로 인식
					pstmt.setString(2, bb.getSubject());
					pstmt.setString(3, bb.getContent());
					pstmt.setInt(4, bb.getBno());	
					
					// SQL 구문 실행
					result = pstmt.executeUpdate();
					// => SQL 구문 (INSERT, UPDATE, DELETE)이 몇 줄에 영향을 미치는가를 정수형으로 리턴 [행 개수 리턴] 
					System.out.println("DAO : 게시판 글 수정 완료!");
					System.out.println("DAO : result : " + result);
					// WHERE절의 bno가 PK이므로 무조건 '1'
					
					// 수정 완료 값 저장
					// result = 1;
				}else {
					// 게시판에 글이 있음 - 비밀번호 다름
					result = 0;
				}
					
			}else {
			// 게시판에 글이 없을 때 : -1
				result = -1;
			}
			System.out.println("DAO : 글 수정처리 완료 : " + result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	// 게시판 글 수정하기 - updateBoard(bb)
	
	// 게시판 글 삭제하기 - deleteBoard(bb)
		public int deleteBoard(BoardBean bb) { // 입력한 비밀번호를 받아와서 삭제해야하므로 BoardBean 객체 생성 = BoardBean -> DB
			int result = -1;
			
			try {
				// 1. 2. DB 연결
				con = getConnection();
				// 3. SQL 구문 작성 및 pstmt 객체 생성
				sql = "SELECT pass FROM itwill_board WHERE bno = ?";
				pstmt = con.prepareStatement(sql);
				// ? 정보 추가
				pstmt.setInt(1, bb.getBno());
				// 4. SQL 구문 실행
				rs = 
				pstmt.executeQuery();
				// 5. 데이터 처리
				if(rs.next()) { // 글 있음
					if(bb.getPass().equals(rs.getString("pass"))) { // 비밀번호 일치
						// 이미 DB 연결
						// 3. SQL 구문 작성 및 pstmt 객체 생성
						sql = "DELETE FROM itwill_board WHERE bno = ?";
						pstmt = con.prepareStatement(sql);
						// ? 정보 추가
						pstmt.setInt(1, bb.getBno());
						// 4. SQL 구문 실행
						result = pstmt.executeUpdate();
						System.out.println("DAO : 게시판 글 삭제 완료!");
						System.out.println("DAO : result : " + result);
					}else {
						// 비밀번호 불일치	
						result = 0;
					}
				}else {
					// 글 없음
					result = -1;
				}
				System.out.println("DAO : 글 삭제처리 완료 : " + result);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result;
		}
	// 게시판 글 삭제하기 - deleteBoard(bb)
		
		// 답글 쓰기 메서드 - reInsertBoard(bb)
		public void reInsertBoard(BoardBean bb) {
		// 입력한 정보를 받아와서 답글을 쓰므로 BoardBean 객체 생성
			int bno = 0; // 답글번호 bno 선언, 초기화 [try 전]
			try {
				/***************** 1. 답글번호 (bno) 계산 *****************/
				// 1.2. DB 연결
				con = getConnection();
				// 3. SQL 구문 작성 & pstmt 객체
				sql = "SELECT MAX(bno) FROM itwill_board";
				// bno는 MAX(bno)로 최대값을 구해서 +1을 시킨다
				pstmt = con.prepareStatement(sql);
				// 4. SQL 구문 실행
				rs = pstmt.executeQuery();
				// 5. 데이터 처리
				if(rs.next()) {
					//bno = rs.getInt(1)+1;
					bno = rs.getInt("MAX(bno)")+1;
				}
				System.out.println(" DAO : 답글 bno "+ bno);
				/***************** 1. 답글번호(bno) 계산 *****************/
					
				/***************** 2. 답글 seq 계산 (기존값보다 큰게 있는지) *****************/
				// => 답글순서 재배치 (같은 그룹의 글 중에서 기존의 seq보다 큰값이 존재하는 경우 +1)
				// 3. SQL 작성 & pstmt 객체
				sql = "UPDATE itwill_board SET re_seq = re_seq + 1 WHERE re_ref = ? AND re_seq > ?";
				// re_ref = 원글의 re_ref
				// re_seq > 원글의 re_seq
				// re_seq : 기존의 값 + 1
				pstmt = con.prepareStatement(sql);
					
				// ??? 
				pstmt.setInt(1, bb.getRe_ref());
				pstmt.setInt(2, bb.getRe_seq());
					
				// 4. sql 실행
				int tmp = pstmt.executeUpdate();
				if(tmp >= 1) {
					System.out.println(" DAO : 답글 순서 재배치 완료! ("+tmp+"개)");
				}
				/***************** 2. 답글 seq 계산 (기존값보다 큰게 있는지) *****************/
					
				/***************** 3. 나머지 정보 사용 글쓰기 (ref,lev,seq계산) *****************/
				// => insertBoard 참고 (ref,lev,seq 로직값 설정)
				// 3. sql 작성(insert) & pstmt 객체
				sql = "INSERT INTO itwill_board (bno, name, pass, subject, content, readcount, "
						+ "re_ref, re_lev, re_seq, date, ip, file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?, ?)";
				pstmt = con.prepareStatement(sql);
					
				// ???
				pstmt.setInt(1, bno);
				pstmt.setString(2, bb.getName());
				pstmt.setString(3, bb.getPass());
				pstmt.setString(4, bb.getSubject());
				pstmt.setString(5, bb.getContent());
					
				pstmt.setInt(6, bb.getReadcount());
				pstmt.setInt(7, bb.getRe_ref()); // re_ref => 원글의 ref값 사용
				pstmt.setInt(8, bb.getRe_lev()+1); // re_lev => 원글의 lev + 1
				pstmt.setInt(9, bb.getRe_seq()+1); // re_seq => 원글의 seq + 1
					
				pstmt.setString(10, bb.getIp());
				pstmt.setString(11, bb.getFile());
					
				// 4. sql 실행
				pstmt.executeUpdate();			
					
				/***************** 3. 나머지 정보 사용 글쓰기 (ref,lev,seq계산) *****************/
					
				System.out.println(" DAO : 답글 작성 완료! ");
					
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}
		// 답글 쓰기 메서드 - reInsertBoard(bb)
		
} // DAO 끝