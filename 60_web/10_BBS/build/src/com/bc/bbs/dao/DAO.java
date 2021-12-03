package com.bc.bbs.dao;

import org.apache.ibatis.session.SqlSession;

import com.bc.bbs.mybatis.DBService;

public class DAO {
	
	//게시글(BBS_T)의 전체 건수 조회
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("bbs.totalCount");
		ss.close();
		return totalCount;
	}
	
	//현재 페이지에 해당하는 글목록(게시글) 가져오기
	
}
