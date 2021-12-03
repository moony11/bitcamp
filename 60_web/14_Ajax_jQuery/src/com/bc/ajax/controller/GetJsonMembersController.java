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


@WebServlet("/getJsonMembers")
public class GetJsonMembersController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		// DB데이터 가져오기 
		List<MemberVO> list =  MemberDAO.getList();
		System.out.println("list : " + list);
		
		String result = makeJson(list);
		System.out.println("응답 JSON 문자열 : " + result);
		
		// JSON 문자열 출력 
		PrintWriter out = response.getWriter();
		out.print(result);
	}


	private String makeJson(List<MemberVO> list) {
		/* {"list" : [{}, {}, {}, ...., {}] }
		   {"list" : [
		   		{
		   			"idx" : 1,
		   			"name" : "홍길동",
		   			"age" : 27,
		   			"addr" :"서울",
		   			"regdate" : "2021-10-07"
		   		}, {}, {},.....{}
		   ] }
		 */
		
		//JSON 형태 문자열로 바꾸기
		StringBuilder result = new StringBuilder();
		result.append(" {\"list\" : [");
		for (MemberVO vo : list) {
			result.append("{");
			result.append("\"idx\" : " + vo.getIdx() + ",");
			result.append("\"name\" : \"" + vo.getName() + "\",");
			result.append("\"age\" : " + vo.getAge() + ",");
			result.append("\"addr\" : \"" + vo.getAddr() + "\",");
			result.append("\"regdate\" : \"" + vo.getRegdate() + "\"");
			result.append("},");
		}
		result.delete(result.length() - 1, result.length()); // for문 안에 마지막 ',' 삭제하기
		//result.toString().substring(0, result.length() - 1);
		result.append("]}");
		
		return result.toString();
	}

}











