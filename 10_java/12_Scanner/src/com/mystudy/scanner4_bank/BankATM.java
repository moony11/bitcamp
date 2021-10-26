package com.mystudy.scanner4_bank;

import java.util.Scanner;

//[실습] 은행의 ATM 기계 만들기
// 1.입금  2.출금  3.통장확인  0.종료
//-----------------------------------
// 계좌를 하나 만들고 입금/출금/통장확인 작업을 처리
public class BankATM {
	private int money; //통장 계좌(금액)
	private Scanner scan = new Scanner(System.in);
	private static final String ERROR_MESSAGE_FALUT_SELECT 
			="[예외발생] 잘못된 값이 입력되었습니다. 메뉴(0~3) 숫자만 입력하세요";

	public void startBank() {
		System.out.println(">> ATM 기계를 사용합니다");
		//isRunningATM();
		while (true) {
			if (!isRunningATM()) {
				scan.close();
				break;
			} 
		}
		System.out.println(">> ATM 기계사용을 종료합니다");
	}
	
	//ATM 기계 동작
	private boolean isRunningATM() {
		boolean isContinue = true;
		
		//1.메뉴 및 선택 메시지 출력
		showMenu();
		
		//2.작업선택하기
		int select = -1;
		try {
			select = Integer.parseInt(scan.nextLine());
			if (select < 0 || select > 3) {
				System.out.println(ERROR_MESSAGE_FALUT_SELECT);
				return true;
			}
		} catch (NumberFormatException e) {
			System.out.println(ERROR_MESSAGE_FALUT_SELECT);
			return true;
		}
		if (select == 0) {
			return false;
		}
		
		//3. 선택된 작업 처리
		if (select == 1) {
			//System.out.println("---입금처리~~~~");
			inputMoney();
			showMoney();
		} else if (select == 2) {
			//System.out.println("---출금처리~~~~");
			outputMoney();
			showMoney();
		} else if (select == 3) {
			//System.out.println("---통장확인~~~~");
			showMoney();
		}
		
		return isContinue;
	}
	private void outputMoney() {
		while (true) {
			System.out.print(">> 출금액 : ");
			try {
				money -= Integer.parseInt(scan.nextLine());
				break; //정상 처리되었을 때
			} catch(NumberFormatException e) {
				System.out.println("[예외발생] 잘못된 값이 입력되었습니다. "
					+ "숫자(0~9)만 입력하세요.");
				//continue; //비정상처리 되었을 때 다시 작업
			}
			System.out.println(">>>> 출금액을 다시 입력하세요~");
		}
		
	}

	private void inputMoney() {
		while (true) {
			System.out.print(">> 입금액 : ");
			try {
				money += Integer.parseInt(scan.nextLine());
				break; //정상 처리되었을 때
			} catch(NumberFormatException e) {
				System.out.println("[예외발생] 잘못된 값이 입력되었습니다. "
					+ "숫자(0~9)만 입력하세요.");
				//continue; //비정상처리 되었을 때 다시 작업
			}
			System.out.println(">>>> 입급액을 다시 입력하세요~");
		}
		
	}
	//통장확인 메소드
	private void showMoney() {
		System.out.println("::통장금액 : " + money + "원");
	}
	
	private void showMenu() {
		System.out.println("----------------------------------");
		System.out.println("1.입금  2.출금  3.통장확인  0.종료");
		System.out.println("----------------------------------");
		System.out.print(">> 작업선택 : ");
	}

}
/*
1.입금  2.출금  3.통장확인  0.종료
>> 작업선택 : 1
>> 입금액 : 10000
::통장금액 : 10000원

1.입금  2.출금  3.통장확인  0.종료
>> 작업선택 : 2
>> 출금액 : 5000
::통장금액 : 5000원

1.입금  2.출금  3.통장확인  0.종료
>> 작업선택 : 3
::통장금액 : 5000원

1.입금  2.출금  3.통장확인  0.종료
>> 작업선택 : 0
>> 작업을 종료합니다
*/








