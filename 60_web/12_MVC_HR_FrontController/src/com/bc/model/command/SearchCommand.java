package com.bc.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.EmployeeDAO;
import com.bc.model.vo.EmployeeVO;

public class SearchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		
		String keyword = request.getParameter("keyword");
		System.out.println("> keyword : -" + keyword + "-");
		String path = "";
		if (keyword == null || keyword.trim().equals("")) {
			path = "search.jsp";
		} else { // DB데이터 조회 처리 후 결과페이지 이동 
			List<EmployeeVO> list =  EmployeeDAO.getSearch(idx, keyword);
			request.setAttribute("list", list);
			
			// 동적검색 형태 확인
			String title = "";
			switch (idx) {
			case "0" : title = "사번"; break;
			case "1" : title = "이름"; break;
			case "2" : title = "직종"; break;
			case "3" : title = "부서"; break;
			}
			request.setAttribute("title", title);
			request.setAttribute("keyword", keyword);
			
			path = "searchList.jsp";
			
		}
		return path;
	}

}
