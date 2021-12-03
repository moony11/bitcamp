package com.bc.frontcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.EmployeeDAO;
import com.bc.model.vo.EmployeeVO;

//@WebServlet("/controller")
public class FrontController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController doGet() 실행~~" );
		String type = request.getParameter("type");
		System.out.println("> type : " + type);
		
		if("all".equals(type)) {
			  //1. DB연결하고 데이터 가져오기
		      List<EmployeeVO> list = EmployeeDAO.getList();
		      System.out.println("list : " + list);
		      //2. 응답페이지(list.jsp)에 데이터 전달
		      request.setAttribute("list", list);
		      
		      //3. 응답페이지(list.jsp)로 화면 이동(전환)
		      request.getRequestDispatcher("list.jsp").forward(request, response);
			
		} else if ("fullname".equals(type)) {
			request.getRequestDispatcher("fullname.jsp").forward(request, response);
		}  else if ("fullnameList".equals(type)) {
			//1. 파라미터 값 추출(확인)
			String fullname = request.getParameter("fullname");
			
			//2. DB에서 데이터 가져오기
			List<EmployeeVO> list = EmployeeDAO.fullnameList(fullname);
			
			// 3. DB 데이터 request scope에 저장
			request.setAttribute("list", list);
			
			//4. fullnameList.jsp 페이지로 위임(전가) 처리
			request.getRequestDispatcher("fullnameList.jsp").forward(request, response);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(">> FrontController doPost() 실행-----------" );
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
}
