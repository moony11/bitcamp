package com.spring.biz.board;

import java.util.List;

import com.spring.biz.board.impl.BoardDAO;

public class BoardTest {

	public static void main(String[] args) {
		BoardVO vo = new BoardVO();
		vo.setTitle("테스트2");
		vo.setWriter("홍길동2");
		vo.setContent("테스트2-내용");
		
		BoardDAO dao = new BoardDAO();
		dao.insertBoard(vo);
		
		List<BoardVO> list = dao.getBoardList();
		for (BoardVO board : list) {
			System.out.println(board);
		}

	}

}
