package com.mystudy.io2_fileinputstream;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class FileInputStream_Ex1 {

	public static void main(String[] args) {
		File file = new File("temp.txt");
		if (!file.exists()) { // 파일이 없으면
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		// 파일로 부터 읽기 위한 작업 진행
		FileInputStream fis = null;
		try {
			// 전달받은 파일(file)을 이용해서 파일에 있는 데이터 읽어서 처리
			//1. 사용할 객체 생성
			fis = new FileInputStream(file);
			
			//2. 객체 사용
			int readValue = fis.read();
			System.out.println("read() int값: " +  readValue);
			System.out.println(">> char : " + (char)readValue);
			
			System.out.println("--- 전체 데이터 읽어오기 ----");
			while (true) {
				//EOF(End Of File)를 만나면(더이상 읽을 것이 없으면) -1 리턴
				readValue = fis.read();
				if (readValue == -1) break; //파일의 끝이면 읽기 종료
				System.out.println("read() int값: " +  readValue);
				System.out.println(">> char : " + (char)readValue);
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			//3. 객체 사용후 닫기
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("----------- main() 끝 ----------");
	}

}








