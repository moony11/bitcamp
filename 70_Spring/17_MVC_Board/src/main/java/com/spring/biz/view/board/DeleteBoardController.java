package com.spring.biz.view.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;
import com.spring.biz.view.controller.Controller;

public class DeleteBoardController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		 System.out.println(">>> 게시글 삭제");
         // 1. 전발받은 데이터 추출(확인)
         String seq = request.getParameter("seq");
         
         // 2. DB연동처리(입력)
         BoardVO vo = new BoardVO();
         vo.setSeq(Integer.parseInt(seq));
         
         BoardDAO boardDAO = new BoardDAO();
         boardDAO.deleteBoard(vo);
               
         // 3. 화면네비게이션(목록페이지로 이동)
         //response.sendRedirect("getBoardList.do");
		return "getBoardList.do";
	}

}
