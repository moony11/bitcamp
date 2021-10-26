package com.mystudy.net_multi;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

//다중 접속을 처리할 수 있는 서버 만들기
public class TCPServerMulti_InnerClass {

	public static void main(String[] args) {
		System.out.println("--- main() 시작 ---");
		new TCPServerMulti_InnerClass();
		System.out.println("--- main() 시작 ---");
	}
	public TCPServerMulti_InnerClass() {
		serverStart();
	}
	private void serverStart() {
		ServerSocket server = null;
		
		try {
			System.out.println(">>> 서버소켓 객체 생성");
			server = new ServerSocket(10000);
			
			while (true) {
				System.out.println(">> 서버 접속 대기중..." 
						+ InetAddress.getLocalHost().getHostAddress()
						+ ":" + server.getLocalPort());
				Socket socket = server.accept();
				System.out.println("[" + socket.getInetAddress() 
						+ ":" + socket.getPort() + "] 접속~");
				
				// 접속된 클라이언트에 대한 처리 : 쓰레드 생성(읽기전용)
				ServerReceiver thr = new ServerReceiver(socket);
				thr.start(); //쓰레드로 동작시키기
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//ServerReceiver : 클라이언트에서 보내온 메시지 수신
	private class ServerReceiver extends Thread {
		Socket socket;
		
		ServerReceiver(Socket socket) {
			this.socket = socket;
		}
		
		@Override
		public void run() {
			System.out.println("---- 쓰레드 시작 ----");
			InputStream is = null;
			InputStreamReader isr = null;
			BufferedReader br = null;
			
			try {
				is = socket.getInputStream();
				isr = new InputStreamReader(is);
				br = new BufferedReader(isr);
				
				System.out.println(">> 읽기 시작");
				while (true) {
					String msg = br.readLine();
					if (msg == null || "exit".equalsIgnoreCase(msg)) {
						break;
					}
					System.out.println(">>> " + msg);
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				System.out.println(">> 클라이언트 종료");
				if (br != null) {
					try {
						br.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
}








