package com.itwillbs.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : BoardListAction_execute() 실행 ");
		
		// 전달 정보 검색어 정보 저장
		String search = request.getParameter("search");
		System.out.println(" M : 검색어 - " + search);
		
		// 기존에 저장된 글 정보를 가져와서 화면에 출력
		// DB에 저장된 글의 수를 체크해서 있을 때만 글 정보 모두를 조회
		BoardDAO dao = new BoardDAO();
		
		int count = 0;
		if(search == null) { // 검색어 X
			System.out.println(" M : 검색어 없음 ");
			count = dao.getBoardCount();
		}else { // 검색어 O - 검색 결과 O / X
			System.out.println(" M : 검색어 있음 (" + search + ")");
			count = dao.getBoardCount(search); // 오버로딩
		}
		
		System.out.println(" M : 글 개수 - " + count);
		
		// 페이징 처리
		// *************************페이징 처리 1*************************
		
		// 한 페이지에 출력할 글의 개수 설정
		int pageSize = 5; // 2로 변경
		
		// 현 페이지가 몇 페이지인지 확인
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		
		// 시작 행 번호 계산하기
		// 1 11 21
		int currentPage = Integer.parseInt(pageNum);
		int startRow = ((currentPage - 1) * pageSize) + 1;
		
		// 끝 행 번호 계산
		int endRow = currentPage * pageSize;
		
		// *************************페이징 처리 1*************************
		
		// DAO - 글 정보 모두 (list)를 가져오는 메서드 호출 - getBoardList()
		ArrayList dto = null;
		if(count > 0 && search == null){
			dto = dao.getBoardList(startRow, pageSize);
		}else if(count > 0 && search != null) {
			dto = dao.getBoardList(startRow, pageSize, search);
		}else {
			// 글이 없는 경우
		}
		
		System.out.println(" M : size - " + dto.size());
		
		// 리스트를 출력 => 연결된 뷰페이지에서 출력하도록 정보 전달
		request.setAttribute("dto", dto);
		
		// *************************페이징 처리 2*************************
		// 페이지 블럭 (1, 2, 3, ..., 10) 생성

			// 전체 페이지수
			// 글 15 / 페이지당 10 => 2개
			// 글 78 / 페이지당 10 => 8개
			int pageCount = count / pageSize + (count % pageSize == 0? 0 : 1);
					
			// 한 화면에 보여줄 페이지 블럭 개수
			int pageBlock = 3; // 3으로 변경
					
			// 페이지 블럭의 시작 번호 계산
			// 1페이지 => 1 / 11페이지 => 11
			// 5페이지 => 1 / 25페이지 => 21
			int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
					
			// 페이지 블럭의 마지막 번호 계산
			// 1페이지 => 10 / 13페이지 => 20
			// 5페이지 => 10 
			int endPage = startPage + pageBlock - 1;
					
			// 페이지의 글이 없는 경우
			if(endPage > pageCount){
				endPage = pageCount;
			}
					
		// *************************페이징 처리 2*************************

		// 페이징 처리에 필요한 정보 모두를 request 영역에 저장해서 전달
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		// + request.setAttribute("dto", dto); : 6 + 1 = 7
		
		// 페이지 이동 준비
		ActionForward forward = new ActionForward();
		forward.setPath("./board/boardList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
