package com.test.interfaceimpl;

import java.util.List;

public interface StudentManger {
	boolean add(StudentVO vo); //추가
	StudentVO find(String id);
	List<StudentVO> findList(String name);
	//List<StudentVO> selectAll();
	
	boolean changeKor(String id, int kor);
	boolean changeEng(String id, int eng);
	boolean changeMath(String id, int math);
	
	//boolean update(StudentVO vo);
	//int update(List<StudentVO> list); //일괄수정
	//boolean delete(String id);
	//int delete(StudentVO vo);
	//int delete(List<StudentVO> list); //일괄삭제
}







