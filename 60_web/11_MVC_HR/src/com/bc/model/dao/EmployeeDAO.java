package com.bc.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.EmployeeVO;
import com.bc.mybatis.DBService;

public class EmployeeDAO {
	
	
	// 전체 직원 목록 조회
	public static List<EmployeeVO> getList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<EmployeeVO> list =  ss.selectList("HR.list");
		ss.close();
		return list;
	}

	// 이름으로 검색
	public static List<EmployeeVO> fullnameList(String fullname) {
		SqlSession ss = DBService.getFactory().openSession();
		List<EmployeeVO> list =  ss.selectList("HR.fullnameList", fullname);
		ss.close();
		return list;
	}
	
	
	
}
