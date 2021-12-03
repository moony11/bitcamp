package com.spring.biz.view.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spring.biz.view.board.DeleteBoardController;
import com.spring.biz.view.board.GetBoardController;
import com.spring.biz.view.board.GetBoardListController;
import com.spring.biz.view.board.InsertBoardController;
import com.spring.biz.view.board.UpdateBoardController;
import com.spring.biz.view.user.LoginController;
import com.spring.biz.view.user.LogoutController;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HandlerMapping handlerMapping;
	private ViewResolver viewResolver;
	
	
	@Override
	public void init() throws ServletException {
		handlerMapping = new HandlerMapping();
		viewResolver = new ViewResolver();
		viewResolver.setPrefix("./");
		viewResolver.setSufix(".jsp");
	}

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
		System.out.println("uri : " + uri); // /biz/login.do
		String path = uri.substring(uri.lastIndexOf("/"));
		System.out.println("path : " + path); // /lodin.do

		// 2. 클라이언트 요청형태에 따른 작업처리
		Controller controller = handlerMapping.getController(path);
		System.out.println("controller : " + controller);
		
		String viewName = controller.handleRequest(request, response);
		System.out.println(">> viewName : " + viewName);
		
		String view = viewResolver.getView(viewName);
		
		// 3. 이동할 view 이름 정보를 작성하고
		// viewName에 ".do" 가 없으면 뷰리졸버 적용
		// viewName에 ".do" 가 있으면 그대로 요청처리
		
		if (viewName.contains(".do")) {
			view = viewName;
		} else {
			view = viewResolver.getView(viewName);
		}
		
		
		System.out.println(">> view : " + view);
		
		// 4. 응답페이지 호출 
		response.sendRedirect(view);
		
		/*
		if ("/login.do".equals(path)) {
			LoginController loginController = new LoginController();
			String view = loginController.handleRequest(request, response);
			response.sendRedirect(view);
			
		} else if ("/logout.do".equals(path)) {
			LogoutController logoutController = new LogoutController();
			String view = logoutController.handleRequest(request, response);
			response.sendRedirect(view);
			
		} else if ("/getBoardList.do".equals(path)) {
			Controller controller = new GetBoardListController();
			String view = controller.handleRequest(request, response);
			response.sendRedirect(view);

		} else if ("/getBoard.do".equals(path)) {
			Controller controller = new GetBoardController();
			String view = controller.handleRequest(request, response);
			response.sendRedirect(view);
			
		} else if ("/insertBoard.do".equals(path)) {
			Controller controller = new InsertBoardController();
			String view = controller.handleRequest(request, response);
			response.sendRedirect(view);
			
		}  else if("/updateBoard.do".equals(path)) {
			Controller controller = new UpdateBoardController();
			String view = controller.handleRequest(request, response);
			response.sendRedirect(view);
			
	      }  else if("/deleteBoard.do".equals(path)) {
	    	Controller controller = new DeleteBoardController();
			String view = controller.handleRequest(request, response);
			response.sendRedirect(view);
	      }
	      
	      */
	} 

}
