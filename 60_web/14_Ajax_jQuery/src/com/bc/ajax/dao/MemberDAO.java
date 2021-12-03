package com.bc.ajax.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.ajax.vo.MemberVO;
import com.bc.mybatis.DBService;

public class MemberDAO {
	
	public static List<MemberVO> getList () {
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list = ss.selectList("members.all");
		ss.close();
		return list;
	}
}
