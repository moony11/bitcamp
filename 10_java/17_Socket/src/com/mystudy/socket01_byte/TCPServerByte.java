package com.mystudy.socket01_byte;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class TCPServerByte {

	public static void main(String[] args) {
		// 서버측 : ServerSocket 객체가 클라이언트 접속을 기다린다
		ServerSocket server = null;
		
		try {
			System.out.println("[서버] 시작 후 클라이언트 접속 대기중~");
			//서버쪽에서 10000번 포트를 열고 서비스하려고 대기
			server = new ServerSocket(10000);
			
			// 서버에서 해당 포트로 접속한 클라이언트의 소켓정보 추출
			Socket socket = server.accept();
			System.out.println("[서버] 1개 클라이언트 접속");
			
			// 소켓에서 Input, Output 스트림 객체 생성
			InputStream is = socket.getInputStream();
			OutputStream os = socket.getOutputStream();
			
			// 데이터 읽기 : 클라이언트에서 보내온 데이터
//			int readValue = is.read();
//			System.out.println("[서버] 클라이언트로 부터 받음 메시지 : " 
//					+ (char)readValue);
			
			byte[] buf = new byte[100];
			is.read(buf);
			System.out.println("[서버] 받은메시지: " + new String(buf));
			
			os.close();
			is.close();
			
			System.out.println(">>> 서버종료");
		} catch (IOException e) {
			e.printStackTrace();
		} 

	}

}
