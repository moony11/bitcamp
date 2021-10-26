package com.mystudy.socket03_echo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class TCPServerEcho {

	public static void main(String[] args) {
		// 서버 : 클라이언트에서 보낸 메시지를 받고 다시 되돌려줌
		ServerSocket server = null;
		
		//데이터를 읽기 위한 객체를 저장할 변수 선언
		InputStream is = null;
		InputStreamReader isr = null;
		BufferedReader br = null;
		
		//데이터를 쓰기 위한 객체 저장할 변수 선언
		OutputStream os = null;
		PrintWriter pw = null;
		
		try {
			System.out.println(">>> 서버 시작");
			server = new ServerSocket(10000);
			
			System.out.println(">>> 대기중....");
			Socket socket = server.accept();
			
			//데이터를 받고, 받은 데이터 되돌려주기
			//데이터 받기
			is = socket.getInputStream();
			isr = new InputStreamReader(is);
			br = new BufferedReader(isr);
			//br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
			
			System.out.println(">>> 메시지 읽기");
			String msg = br.readLine();
			System.out.println("받은 메시지 : " + msg);
			
			//------------------------
			//받은 메시지 클라이언트 쪽으로 보내기
			os = socket.getOutputStream();
			pw = new PrintWriter(os);
			//pw = new PrintWriter(socket.getOutputStream());
			
			pw.println("[서버에서 보냄]" + msg);
			pw.flush();
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (pw != null) pw.close();
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		System.out.println(">>> 서버 종료");
	}

}
