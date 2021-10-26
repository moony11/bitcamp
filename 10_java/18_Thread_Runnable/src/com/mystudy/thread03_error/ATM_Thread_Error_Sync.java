package com.mystudy.thread03_error;

class ATM_Error_Sync implements Runnable {
	int money;

	ATM_Error_Sync() {}
	ATM_Error_Sync(int money) { this.money = money; }
	//입금
	//synchronized 적용 : 메소드 실행시 동기화 처리
	// 하나의 쓰레드에서 메소드 사용하는 동안 실행을 보장
	// 다른 쓰레드에서 사용하려고 할 때 대기상태가 됨(필드 값에 대한 동기화처리)
	synchronized void add(int money) {
		this.money += money;
		System.out.println(Thread.currentThread() 
				+ " 입금:" + money + ", 잔액: " + this.money);
	}
	//출금
	synchronized void out(int money) {
		this.money -= money;
		System.out.println(Thread.currentThread() 
				+ " 출금:" + money + ", 잔액: " + this.money);
	}
	void bankSleep(int millisecond) {
		try {
			Thread.currentThread().sleep(millisecond);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void run() {
		add(1000);
		bankSleep(1000);
		out(500);
		bankSleep(1000);
		out(300);
		bankSleep(1000);
		out(200);
	}
}

public class ATM_Thread_Error_Sync {

	public static void main(String[] args) {
		System.out.println("--- main() 시작 ----");
		ATM_Error_Sync bank = new ATM_Error_Sync();
		System.out.println("은행잔고 : " + bank.money);
		
		Thread th1 = new Thread(bank, "ATM-1");
		Thread th2 = new Thread(bank, "ATM-2");
		
		th1.start();
		th2.start();
		
		System.out.println("--- main() 끝 ----");

	}

}
