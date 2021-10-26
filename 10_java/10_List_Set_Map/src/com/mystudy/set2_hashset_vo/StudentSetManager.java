package com.mystudy.set2_hashset_vo;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import com.mystudy.list4_vo.StudentVO;

public class StudentSetManager {

	public static void main(String[] args) {
		//1. 3명의 학생데이터(성명,국어,영어,수학)를 
		//   StudentVO 클래스를 이용해서 만들고(저장하고)
		//   "홍길동", 100, 90, 81
		//   "이순신", 95, 88, 92
		//   "김유신", 90, 87, 77
		//   ---------------------
		//2. HashSet<StudentVO> 타입의 변수(set)에 저장하고
		//3. set에 있는 데이터를 사용해서 화면출력
		//   성명    국어   영어  수학    총점     평균
		//   --------------------------
		//   홍길동   100  90  81  270  90.33
		//   ...
		//   -----------------------------
		//4. 저장된 set에 있는 김유신 학생의 국어 점수를 95점으로 수정
		//5. "김유신" 학생의 성적만 화면 출력
		//-----------------------------------------------
		
		//1. 3명의 학생데이터(성명,국어,영어,수학)를 
		//   StudentVO 클래스를 이용해서 만들고(저장하고)
		StudentVO stu1 = new StudentVO("홍길동", 100, 90, 81);
		StudentVO stu2 = new StudentVO("이순신", 95, 88, 92);
		StudentVO stu3 = new StudentVO("김유신", 90, 87, 77);
		
		//2. HashSet<StudentVO> 타입의 변수(set)에 저장하고
		Set<StudentVO> set = new HashSet<>();
		set.add(stu1);
		set.add(stu2);
		set.add(stu3);
		System.out.println(set);
		
		//3. set에 있는 데이터를 사용해서 화면출력
		Iterator<StudentVO> ite = set.iterator();
		while (ite.hasNext()) {
			StudentVO student = ite.next();
			student.printData();
		}
		
		System.out.println("----------");
		for (StudentVO student : set) {
			student.printData();
		}
		
		System.out.println("--- 김유신 국어점수 95점으로 변경 ---");
		//4. 저장된 set에 있는 김유신 학생의 국어 점수를 95점으로 수정
		for (StudentVO student : set) {
			System.out.println("처리중 학생이름 : " + student.getName());
			if ("김유신".equals(student.getName())) {
				student.setKor(95);
				break;
			}
		}
		
		//5. "김유신" 학생의 성적만 화면 출력
		for (StudentVO student : set) {
			if ("김유신".equals(student.getName())) {
				student.printData();
			}
		}
		
		System.out.println("---- main() 끝 ----");
	}

}













