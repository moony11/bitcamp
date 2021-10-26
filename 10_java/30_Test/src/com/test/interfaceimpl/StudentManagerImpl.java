package com.test.interfaceimpl;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

// StudentManager 인터페이스를 구현해서 데이터 저장하는 클래스
public class StudentManagerImpl implements StudentManger {
	//필드 : List / Set / Map 형태의 데이터 저장소 사용
	List<StudentVO> list = new ArrayList<>();
	
	@Override
	public boolean add(StudentVO vo) {
		if (isExist(vo)) return false;
		return list.add(vo);
	}

	@Override
	public StudentVO find(String id) {
		for (StudentVO student : list) {
			if (student.getId().equals(id)) {
				return student;
			}
		}
		return null;
	}

	@Override
	public List<StudentVO> findList(String name) {
		List<StudentVO> list = new ArrayList<>();
		for (StudentVO student : list) {
			if (student.getName().equals(name)) {
				list.add(student);
			}
		}
		
		return list;
	}

	@Override
	public boolean changeKor(String id, int kor) {
		StudentVO vo = find(id);
		if (vo == null) {
			return false;
		}
		vo.setKor(kor);
		return true;
	}

	@Override
	public boolean changeEng(String id, int eng) {
		return false;
	}

	@Override
	public boolean changeMath(String id, int math) {
		return false;
	}
	
	private boolean isExist(StudentVO vo) {
		for (StudentVO student : list) {
			if (student.getId().equals(vo.getId())) {
				return true;
			}
		}
		return false;
	}
	
	
	public void printData() {
		System.out.println(list);
	}

	


}
