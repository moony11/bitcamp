package com.mystudy.scanner2_caffe;

import java.util.Scanner;

/* 카페만들기
음료의 종류
1.아메리카노(3000)  2.카페라떼(3500)   3.카페모카(4000)  4.과일주스(5000)  0.종료
//입력값 : 메뉴번호, 주문수량, 입금액(고객이 낸 돈)
//출력값 : 입금액, 판매액(단가*수량), 잔액(입금액 - 판매액)
//--------------------------------
<메뉴>
while (true) {
	1.아메리카노(3000)  2.카페라떼(3500)   3.카페모카(4000)  4.과일주스(5000)  0.종료
	>메뉴를 선택하세요(1~4) : 1
	주문수량 : 3
	입금액 : 10000
	===============
	판매액 : 9000
	거스름돈 : 1000 
}
*/
public class MyCaffe {
	private Scanner scan = new Scanner(System.in);
	private static final int AMERICANO = 3000;
	private static final int CAFFE_LATTE = 3500;
	private static final int CAFFE_MOCA = 4000;
	private static final int JUICE = 5000;
	
	private int inMoney; //받은 금액
	private int ea; //수량
	private int change; // 거스름돈(잔액)
	private int totMoney; // 판매액(선택메뉴단가 * 수량)
	private int income; //매출총액(판매총액)
	//-----------
	private String selectedMenuName; //선택 메뉴명
	private int selectedMenuDanga; //선택 메뉴 단가 
	
	public void caffeOpen() {
		System.out.println(">>> 카페 가게를 오픈합니다~~");
		
		while (true) {
			if (!isOpening()) {
				System.out.println("\n===================================");
				System.out.println(">> 오늘 총 판매액 : " + income + "원");
				System.out.println(">> 카페를 닫습니다~~");
				break;
			};
		}
	}
	private boolean isOpening() {
		//1. 메뉴 보여주기
		showMenu();
		
		//2. 메뉴 선택
		String select = scan.nextLine();
		
		if ("0".equals(select)) {
			return false;
		}
		
		//3. 수량 입력
		System.out.print(">주문수량(개) : ");
		ea = scan.nextInt();
		
		//4. 금액입력
		System.out.print(">입금액(원) : ");
		inMoney = scan.nextInt();
		scan.nextLine(); //줄바꿈 문자 위치까지 빈 문자열 읽어서 처리
		
		//5. 계산처리
		//5-1. 판매액 계산(메뉴단가 * 수량)
		computeMoney(select);
		
		//5-2. 잔액(거스름돈) 계산
		change = inMoney - totMoney;
		
		//5-3. 매출총액 계산
		income += totMoney;
		
		//6. 계산결과 화면 출력
		displayCompute();
		
		return true;
	}
	
	private void showMenu() {
		System.out.println("\n==============================");
		System.out.println("1.아메리카노(3000)  2.카페라떼(3500)   3.카페모카(4000)  4.과일주스(5000)  0.종료");
		System.out.print(">>메뉴를 선택하세요(1~4) : ");
	}
	
	private void displayCompute() {
		System.out.println("=================");
		System.out.println("주문메뉴 : " + selectedMenuName + "(" + selectedMenuDanga + ")");
		System.out.println("주문수량 : " + ea + "개");
		System.out.println("입금액 : " + inMoney);
		System.out.println("---------------");
		System.out.println("판매액 : " + totMoney);
		System.out.println("거스름돈 : " + change);
	}
	
	private void computeMoney(String select) {
		if ("1".equals(select)) {
			totMoney = AMERICANO * ea;
			selectedMenuDanga = AMERICANO;
			selectedMenuName = "아메리카노";
		} else if ("2".equals(select)) {
			totMoney = CAFFE_LATTE * ea;
			selectedMenuDanga = CAFFE_LATTE;
			selectedMenuName = "카페라떼";
		} else if ("3".equals(select)) {
			totMoney = CAFFE_MOCA * ea;
			selectedMenuDanga = CAFFE_MOCA;
			selectedMenuName = "카페모카";
		} else if ("4".equals(select)) {
			totMoney = JUICE * ea;
			selectedMenuDanga = JUICE;
			selectedMenuName = "과일주스";
		} 
	}

}








