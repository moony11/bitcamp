package com.bc.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.EmployeeDAO;
import com.bc.model.vo.EmployeeVO;

public class ListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 //1. DB연결하고 데이터 가져오기
	      List<EmployeeVO> list = EmployeeDAO.getList();
	      System.out.println("list : " + list);
	      //2. 응답페이지(list.jsp)에 데이터 전달
	      request.setAttribute("list", list);
	      
	      //3. 응답페이지(list.jsp)로 화면 이동(전환)
	      //request.getRequestDispatcher("list.jsp").forward(request, response);
		return "list.jsp";
	}

}
