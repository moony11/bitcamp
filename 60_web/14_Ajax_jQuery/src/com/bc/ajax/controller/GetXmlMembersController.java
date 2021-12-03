package com.bc.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.ajax.dao.MemberDAO;
import com.bc.ajax.vo.MemberVO;

@WebServlet("/getXmlMembers")
public class GetXmlMembersController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> GetXmlMembersController doGet() 실행~~");
		response.setContentType("text/html;charset=UTF-8");
		
		// DB데이터 가져오기 
		List<MemberVO> list =  MemberDAO.getList();
		System.out.println("list : " + list);
		
		/*
		 <?xml version="1.0" encoding="UTF-8"?>
		 <members>
			<member>
				<idx>1</idx>
				<name>홍길동1</name>
				<age>27</age>
				<addr>서울</addr>
				<regdate>2021-10-07</regdate>
			</member>
			...
		</members>
		 */
		
		//XML 데이터 만들어서 응답처리 
		PrintWriter out = response.getWriter();
		StringBuilder result = new StringBuilder();
		result.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		result.append("<members>");
		
		for (MemberVO vo : list) {
			result.append("<member>");
			result.append("<idx>" + vo.getIdx() + "</idx>");
			result.append("<name>" + vo.getName() + "</name>");
			result.append("<age>" + vo.getAge() + "</age>");
			result.append("<addr>" + vo.getAddr() + "</addr>");
			result.append("<regdate>" + vo.getRegdate() + "</regdate>");
			result.append("</member>");
		}
		
		result.append("</members>");
		System.out.println("result : \n" + result.toString());
		
		out.print(result.toString());
		
		
	}
}









