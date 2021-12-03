package com.spring.biz.view.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;
import com.spring.biz.uesr.UserVO;
import com.spring.biz.uesr.impl.UserDAO;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(">> DispatcherServlet.process() 실행 : *.do 요청에 대한 처리");

		// 1. 클라이언트에서 어떤 작업을 요청했는지 확인하기
		String uri = request.getRequestURI();
		System.out.println("uri : " + uri);
		String path = uri.substring(uri.lastIndexOf("/"));
		System.out.println("path : " + path);

		// 2. 클라이언트 요청형태에 따른 작업처리
		if ("/login.do".equals(path)) {
			System.out.println(" >> 로그인 처리 ");
			// 1. 사용자 전달한 데이터(정보)확인(추출)
			String id = request.getParameter("id");
			String password = request.getParameter("password");

			// 2. DB 연동작업(id, password 유무 확인)

			UserVO vo = new UserVO();
			vo.setId(id);
			vo.setPassword(password);

			UserDAO userDAO = new UserDAO();
			UserVO user = userDAO.getUser(vo);

			// 3. 화면 네비게이션(화면이동)
			// 로그인 성공 : 게시글 목록 보여주기
			// 로그인 실패 : 로그인 화면으로 이동
			if (user != null) {
				System.out.println(">>> 로그인 성공!!");
				response.sendRedirect("getBoardList.do");
			} else {
				System.out.println(">>> 로그인 실패~~");
				response.sendRedirect("login.jsp");
			}

		} else if ("/logout.do".equals(path)) {
			System.out.println(">>> 로그아웃 처리");
			// 1. 세션초기화(세션 객체 무효화)
			request.getSession().invalidate();
			// 2. 화면 네이게이션(화면이동)
			response.sendRedirect("login.jsp");
		} else if ("/getBoardList.do".equals(path)) {
			System.out.println(">>> 게시글 전체 목록 보여주기");
			// 1. 게시글 목록 조회(SELECT)
			BoardDAO boardDAO = new BoardDAO();
			List<BoardVO> boardList = boardDAO.getBoardList();

			// 2. 검색 결과를 세션에 저장하고 (목록화면 이동)
			request.getSession().setAttribute("boardList", boardList);

			// 3. 목록화면 이동
			response.sendRedirect("getBoardList.jsp");

		} else if ("/getBoard.do".equals(path)) {
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
			response.sendRedirect("getBoard.jsp");
		} else if ("/insertBoard.do".equals(path)) {
			System.out.println(">>> 게시글 입력");
			//1. 전달받은 데이터 추출(확인)
			String title = request.getParameter("title");
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			
			//2. DB연동처리(입력)
			BoardVO vo = new BoardVO();
			vo.setTitle(title);
			vo.setWriter(writer);
			vo.setContent(content);
			
			BoardDAO boardDAO= new BoardDAO();
			boardDAO.insertBoard(vo);
			
			//3. 화면 네이게이션(목록페이지로 이동)
			response.sendRedirect("getBoardList.do");
		}  else if("/updateBoard.do".equals(path)) {
	         System.out.println(">>> 게시글 수정");
	         // 1. 전발받은 데이터 추출(확인)
	         String seq = request.getParameter("seq");
	         String title = request.getParameter("title");
	         String writer = request.getParameter("writer");
	         String content = request.getParameter("content");
	         
	         // 2. DB연동처리(입력)
	         BoardVO vo = new BoardVO();
	         vo.setSeq(Integer.parseInt(seq));
	         vo.setTitle(title);
	         vo.setWriter(writer);
	         vo.setContent(content);
	         
	         BoardDAO boardDAO = new BoardDAO();
	         boardDAO.updateBoard(vo);
	               
	         // 3. 화면네비게이션(목록페이지로 이동)
	         response.sendRedirect("getBoardList.do");
	      }  else if("/deleteBoard.do".equals(path)) {
	         System.out.println(">>> 게시글 삭제");
	         // 1. 전발받은 데이터 추출(확인)
	         String seq = request.getParameter("seq");
	         
	         // 2. DB연동처리(입력)
	         BoardVO vo = new BoardVO();
	         vo.setSeq(Integer.parseInt(seq));
	         
	         BoardDAO boardDAO = new BoardDAO();
	         boardDAO.deleteBoard(vo);
	               
	         // 3. 화면네비게이션(목록페이지로 이동)
	         response.sendRedirect("getBoardList.do");
	      }
	} 

}
