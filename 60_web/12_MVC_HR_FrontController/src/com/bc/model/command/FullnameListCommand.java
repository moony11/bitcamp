package com.bc.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.EmployeeDAO;
import com.bc.model.vo.EmployeeVO;

public class FullnameListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 파라미터 값 추출(확인)
		String fullname = request.getParameter("fullname");
		
		//2. DB에서 데이터 가져오기
		List<EmployeeVO> list = EmployeeDAO.fullnameList(fullname);
		
		// 3. DB 데이터 request scope에 저장
		request.setAttribute("list", list);
		

		return "fullnameList.jsp";
	}

}
