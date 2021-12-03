package com.spring.biz.view.board;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;

@Controller
public class BoardController {
	
	// 리턴타입 : ModelAndView -> String으로 변경
	// 전달할 데이터 저장 : ModelAndView -> Model
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, BoardDAO boardDAO, Model model) {
		System.out.println(">>> 게시글 상세 보여주기");
		System.out.println("getBoard vo : " + vo);

		BoardVO board = boardDAO.getBoard(vo);

		model.addAttribute("board", board);// Model 객체 사용 View로 데이터 전달
		
		return "getBoard.jsp";
	}
	
	// @RequestParam : 파라미터 값을 메소드 파라미터 값으로 설정
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardDAO boardDAO, Model model, 
			@RequestParam(value = "searchCondition", defaultValue = "TITLE" , required = false)
			String condition,
			@RequestParam(value = "searchKeyword" , defaultValue = "" , required = false)
			String keyword) {
		System.out.println(">>> 게시글 전체 목록 보여주기");
		System.out.println("condition : " + condition);
		System.out.println("keyword : " + keyword);
		
		//List<BoardVO> boardList = boardDAO.getBoardList();
		List<BoardVO> boardList = boardDAO.getBoardList(condition, keyword);
		model.addAttribute("boardList", boardList);
		
		return "getBoardList.jsp";
	}
	     
	@RequestMapping("/insertBoard.do")
	public String insert(BoardVO vo, BoardDAO boardDAO) {
		System.out.println(">>> 게시글 입력");
		System.out.println("insert vo : "  + vo);

		boardDAO.insertBoard(vo);

		return "getBoardList.do";
	}
	
	@RequestMapping("/updateBoard.do")
	public String update(BoardVO vo, BoardDAO boardDAO) {
		System.out.println(">>> 게시글 수정");
		System.out.println("update vo : " + vo);
		boardDAO.updateBoard(vo);

		return "getBoardList.do";

	}
	
	@RequestMapping("/deleteBoard.do")
	public String delete(BoardVO vo, BoardDAO boardDAO) {
		 System.out.println(">>> 게시글 삭제");
		 System.out.println("delete vo : " + vo);
		 
         boardDAO.deleteBoard(vo);
               
 		 return "getBoardList.do";
	}
	
	
}
