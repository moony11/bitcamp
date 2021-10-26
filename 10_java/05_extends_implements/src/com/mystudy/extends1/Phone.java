package com.mystudy.extends1;

class Phone extends Object {
	// 필드(속성)-------------------
	private String type; //전화타입(형태)
	private String phoneNo;
	
	//생성자 --------------------------
	public Phone(String phoneNo) {
		this.type = "Phone 타입";
		this.phoneNo = phoneNo;
	}

	public Phone(String type, String phoneNo) {
		super();
		this.type = type;
		this.phoneNo = phoneNo;
	}

	//메소드 -----------------------
	public String getType() {
		return type;
	}

	public String getPhoneNo() {
		return phoneNo;
	}
	
	//==============================
	//전화 걸기 기능
	public void call() {
		System.out.println(">> 전화걸기");
	}
	//전화 받기 기능
	public void receiveCall() {
		System.out.println(">> 전화받기");
	}
	//전화 정보 보기
	public void view() {
		System.out.println("타입: " + type + ", 전화번호: " + phoneNo);
	}
	
}








