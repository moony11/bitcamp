package com.mystudy.reader_writer;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class FileReaderExam2 {

	public static void main(String[] args) {
		// 문자(Character) 단위 입력 처리
		// FileReader : 파일로 부터 문자단위 데이터 읽기
		// 문자단위 : 1, A, $ - 1 byte 문자
		//      대, 한, 핡 - 2 byte 문자(한글, 중국어, 일본어, 아랍어, 태국어...)
		//---------------------------------------
		
		File file = new File("file/test_char.txt");
		
		FileReader fr = null;
		
		try {
			//1. 객체 생성
			fr = new FileReader(file);
			
			//2. 객체 사용 작업처리
			//[실습] 반복문으로 처리
			while (true) {
				int readChar = fr.read();
				if (readChar == -1) break;
				//System.out.println("int : " + readChar + ", char: " + (char)readChar);
				System.out.print((char)readChar);
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			//System.out.println(">> 읽을 파일이 없습니다~~~");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fr != null) fr.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}

}









