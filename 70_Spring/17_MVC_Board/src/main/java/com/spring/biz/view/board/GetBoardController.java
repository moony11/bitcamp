package com.spring.biz.view.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;
import com.spring.biz.view.controller.Controller;

public class GetBoardController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		System.out.println(">>> 게시글 상세 보여주기");
		// 1. 전달받은 데이터 추출
		String seq = request.getParameter("seq");

		// 2. 게시글 목록 조회(SELECT)
		BoardVO vo = new BoardVO();
		vo.setSeq(Integer.parseInt(seq));

		BoardDAO boardDAO = new BoardDAO();
		BoardVO board = boardDAO.getBoard(vo);

		// 3. 검색 결과를 세션에 저장(뷰에서 사용토록)
		HttpSession session = request.getSession();
		session.setAttribute("board", board);
		// 4. 상세보기 화면으로 이동
		//response.sendRedirect("getBoard.jsp");
		return "getBoard";
	}
	
}
