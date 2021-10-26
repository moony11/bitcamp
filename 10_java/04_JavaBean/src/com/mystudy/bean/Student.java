package com.mystudy.bean;

/*
자바빈(JavaBean)
	- 멤버변수(property)의 접근제어자는 private
	- 멤버변수(property) 마다 get/set 메소드 제공(선택적으로 get만 제공)
	- get/set 메소드는 public
	- get 메소드는 파라미터 없고, set 메소드는 하나 이상의 파라미터 존재
	- 멤버변수(property)가 boolean 타입이면 get 메소드 대신 is 메소드 사용가능
	- 외부에서 멤버변수(property) 접근시에는 get/set 메소드를 통해 접근
*/
class Student extends Object {
	private String name; //private 선언으로 외부에서 접근 불가
	private int kor;
	private int eng;
	private int math;
	private int tot;
	private double avg;
	
	private boolean ok;
	
	public Student() {
		//super : 부모(조상) 클래스로 만들어진 객체(인스턴스)
		//생성자의 맨 처음에 작성
		super(); //생략하면 컴파일 시 자동 삽입되어 처리됨
	}
	public Student(String name) {
		super();
		this.name = name;
	}
	
	public Student(String name, int kor, int eng, int math) {
		super();
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		computeTotAvg();
	}
	
	public void computeTotAvg() {
		tot = kor + eng + math;
		avg = tot * 100 / 3 / 100.0;
	}
	
	//name에 대한 get 메소드(getter)
	public String getName() {
		return this.name;
	}
	//name에 대한 set 메소드(setter)
	public void setName(String name) {
		this.name = name;
	}
	
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		if (kor >= 0 && kor <= 100) { //정상데이터
			this.kor = kor;
			computeTotAvg();
		} else {
			System.out.println("[예외발생] 점수가 범위(0~100) 벗어남");
		}
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		if (eng < 0 || eng > 100) {
			System.out.println("[예외발생] 점수가 범위(0~100) 벗어남");
			return;
		}
		this.eng = eng;
		computeTotAvg();
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		if (math >= 0 && math <= 100) { //정상데이터
			this.math = math;
			computeTotAvg();
		} else {
			System.out.println("[예외발생] 점수가 범위(0~100) 벗어남");
		}
	}
	public int getTot() {
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	@Override
	public String toString() {
		return "Student [name=" + name + ", kor=" + kor + ", eng=" + eng + ", math=" + math + ", tot=" + tot + ", avg="
				+ avg + ", ok=" + ok + "]";
	}
	
	
}














