package com.bc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.EmployeeDAO;
import com.bc.model.vo.EmployeeVO;

@WebServlet("/fullnameList")
public class FullnameListController extends HttpServlet {

		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
