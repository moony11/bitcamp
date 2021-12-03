package com.spring.biz.view.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.biz.board.BoardService;
import com.spring.biz.board.BoardVO;

@Controller
@SessionAttributes("board") // board 라는 이름의 Model있으면 session에 저장
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	public BoardController() {
		System.out.println("--->> BoardController() 객체 생성");
	}
	
	// 메소드에 선언된 @ModelAttribute 는 리턴된 데이터를 View에 전달  
	// @ModelAttribute 선언된 메소드는 @RequestMapping 메소드보다 먼저 실행
	// @ModelAttribute("conditionMap") 뷰에 전달될때 설정된 명칭 (예 : conditionMap)
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		System.out.println("--->> Map searchConditionMap() 실행 ");
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		
		return conditionMap;
		
	}
	
	// 리턴타입 : ModelAndView -> String으로 변경
	// 전달할 데이터 저장 : ModelAndView -> Model
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model) {
		System.out.println(">>> 게시글 상세 보여주기");
		BoardVO board = boardService.getBoard(vo);


		model.addAttribute("board", board);// Model 객체 사용 View로 데이터 전달
		
		System.out.println("getBoard board : " + board);
		return "getBoard.jsp";
	}
	
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardVO vo, Model model) {
		System.out.println(">>> 게시글 전체 목록 보여주기");
		System.out.println(":: getBoardList() vo : " + vo);
		// 검색조건 값이 없을 때 기본값 설정
		if(vo.getSearchCondition() == null) {
			vo.setSearchCondition("TITLE");
		}
		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		
		//List<BoardVO> boardList = boardDAO.getBoardList();
		List<BoardVO> boardList = boardService.getBoardList(vo);
		
		model.addAttribute("boardList", boardList);
		return "getBoardList.jsp";
	}
	     
	@RequestMapping("/insertBoard.do")
	public String insert(BoardVO vo) {
		System.out.println(">>> 게시글 입력");
		System.out.println("insert vo : "  + vo);

		boardService.insertBoard(vo);

		return "getBoardList.do";
	}
	
	@RequestMapping("/updateBoard.do")
	public String update(@ModelAttribute("board") BoardVO vo) {
		System.out.println(">>> 게시글 수정");
		System.out.println("update vo : " + vo);
		boardService.updateBoard(vo);

		return "getBoardList.do";

	}
	
	@RequestMapping("/deleteBoard.do")
	public String delete(BoardVO vo) {
		 System.out.println(">>> 게시글 삭제");
		 System.out.println("delete vo : " + vo);
		 
		 boardService.deleteBoard(vo);
               
 		 return "getBoardList.do";
	}
	
	
}
