package com.mystudy.net_multi;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class TCPClientMulti {

	public static void main(String[] args) {
		//서버쪽으로 메시지 전송만~~~
		System.out.println("--- 클라이언트 시작----");
		Socket socket = null;
		InputStream is = null;
		OutputStream os = null;
		
		PrintWriter pw = null;
		Scanner scan = new Scanner(System.in);
		
		try {
			socket = new Socket("localhost", 10000);
			os = socket.getOutputStream();
			pw = new PrintWriter(os);
			
			while (true) {
				//메시지 쓰기
				System.out.print("메시지입력> ");
				String msg = scan.nextLine();
				
				//메시지 서버로 전송
				pw.println(msg);
				pw.flush(); //버퍼 데이터 출력
				
				if ("exit".equalsIgnoreCase(msg)) {
					System.out.println(">>> 종료합니다");
					break;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (pw != null) pw.close();
			if (socket != null) {
				try {
					socket.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

}










