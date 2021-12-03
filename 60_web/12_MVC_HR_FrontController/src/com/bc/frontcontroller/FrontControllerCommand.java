package com.bc.frontcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.command.Command;
import com.bc.model.command.FullnameCommand;
import com.bc.model.command.FullnameListCommand;
import com.bc.model.command.ListCommand;
import com.bc.model.command.SearchCommand;
import com.bc.model.dao.EmployeeDAO;
import com.bc.model.vo.EmployeeVO;

@WebServlet("/controller")
public class FrontControllerCommand extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontControllerCommend doGet() 실행~~" );
		String type = request.getParameter("type");
		System.out.println("> type : " + type);
		
		Command command = null;
		if("all".equals(type)) {
			command = new ListCommand();
			//String path = command.exec(request, response);
		    //request.getRequestDispatcher(path).forward(request, response);
			
		} else if ("fullname".equals(type)) {
			command = new FullnameCommand();
			//String path = command.exec(request, response);
			//request.getRequestDispatcher(path).forward(request, response);
		}  else if ("fullnameList".equals(type)) {
			command = new FullnameListCommand();
			//String path = command.exec(request, response); 
			//request.getRequestDispatcher(path).forward(request, response);
		} else if ("search".equals(type)) {
			command = new SearchCommand();
		}
		String path = command.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(">> FrontControllerCommend doPost() 실행-----------" );
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
}
