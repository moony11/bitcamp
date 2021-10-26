package class1.basic;

//클래스의 접근제한 : public 있고, 없고
//public class Ex02_class {
class Ex02_class {
	// =========== 변수 선언 영역 ==============
	//필드(필드변수, 멤버변수, 인스턴스변수, 속성-property, attribute, 값, 전역변수) 선언
	int num = 111; //초기값 생략가능
	
	//클래스변수, 스태틱(static)변수 - 의미상 인스턴스(객체) 공통 변수
	static int staticNum = 222;
	
	//======== 생성자 선언 영역 ===============
	Ex02_class() {} //기본 생성자(default constructor) 생략 가능
	Ex02_class(int num) {
		this.num = num;
	}

	//======== 메소드 선언 영역 ===============
	//메소드, 메서드(method) : 기능(동작) 작성
	public static void main(String[] args) {
		//System.out.println("num : " + num); //static 에서 non-static 직접 접근 불가
		
		//로컬변수(지역변수)
		int num1 = 200;
		int num2 = 100;
		int result = 0;
		result = num1 + num2;
		System.out.println("result : " + result);
		System.out.println("------------------");
		
		//메소드사용(호출) : 메소드명(인수값1, 인수값2, ..., 인수값n)
		result = add(num1, num2);
		System.out.println("result(add 연산결과) : " + result);

		//sub(num1, num2); //static 에서 non-static 직접 접근 불가
		//===================================
		System.out.println("==========================");
		//Ex02_class ex02; //변수만 선언
		//ex02 = new Ex02_class(); //객체(인스턴스) 생성
		Ex02_class ex02 = new Ex02_class();
		System.out.println("num : " + ex02.num);
		System.out.println("staticNum : " + ex02.staticNum);
		
		
		result = ex02.sub(num1, num2);
		System.out.println("result(sub 연산결과) : " + result);
		
		result = ex02.add(num1, num2);
		System.out.println("result(add 연산결과) : " + result);
	}
	//2개의 정수값을 전달받아 2개의 정수값을 더한 결과를 되돌려줌(return)
	public static int add(int a, int b) {
		return a + b;
	}
	//2개의 정수값을 전달받아 첫번째 값에서 두번째 값을 뺀 결과를 되돌려줌(return)
	public int sub(int a, int b) {
		return a - b;
	}
	
	/* **** 메소드(method) 4가지 형태 ******
	1. 리턴값 없음, 전달받는 파라미터 값 없음 
	 	void 메소드명() {}
	2. 리턴값 없음, 전달받는 파라미터 값 있음 
	 	void 메소드명(파라미터타입 변수명, ...) {}
	3. 리턴값 있음, 전달받는 파라미터 값 없음 
	 	리턴타입 메소드명() { return 리턴값; }
	4. 리턴값 있음, 전달받는 파라미터 값 있음 
	 	리턴타입 메소드명(파라미터타입 변수명, ...) { return 리턴값; }
	******************************************/

}






