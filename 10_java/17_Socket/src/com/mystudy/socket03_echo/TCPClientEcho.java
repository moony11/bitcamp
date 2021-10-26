package com.mystudy.socket03_echo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;

public class TCPClientEcho {

	public static void main(String[] args) {
		System.out.println(">>> 클라이언트 시작~~~~~");
		// 클라이언트 : 메시지를 서버쪽으로 보내고, 서버로부터 메시지 돌려받기
		Socket socket = null;
		
		//입력용 객체 저장 변수 선언
		InputStream is = null;
		InputStreamReader isr = null;
		BufferedReader br = null;
		
		//출력용 객체 저장 변수 선언
		OutputStream os = null;
		PrintWriter pw = null;		
		
		try {
			System.out.println("---- 클라이언트 ----");
			socket = new Socket("localhost", 10000);
			System.out.println(">>> 서버에 접속완료");
			
			is = socket.getInputStream();
			os = socket.getOutputStream();
			
			//서버쪽으로 쓰기(전송-Output/Write)
			System.out.println(">>> 메시지 쓰기(client -> server)");
			pw = new PrintWriter(os);
			
			String msg = "안녕하세요~ 반갑습니다.";
			pw.println(msg);
			pw.flush(); //버퍼에 있는 데이터를 강제로 출력(사용)
			
			System.out.println(">>보낸메시지: " + msg);
			
			//서버에서 보내온 메시지 받기(수신) -----------------
			isr = new InputStreamReader(is);
			br = new BufferedReader(isr);
			
			String receiveMsg = br.readLine();
			System.out.println(">>받은메시지: " + receiveMsg);
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {}
			}
			if (pw != null) pw.close();
			if (socket != null) {
				try {
					socket.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		System.out.println(">>> 클라이언트 종료~~~~~");
	}

}
