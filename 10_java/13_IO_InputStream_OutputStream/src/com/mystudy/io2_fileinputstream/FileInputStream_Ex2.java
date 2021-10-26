package com.mystudy.io2_fileinputstream;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class FileInputStream_Ex2 {

	public static void main(String[] args) {
		File file = new File("file/test01.txt");

		FileInputStream fis = null;
		try {
			//1. 사용할 객체 생성
			fis = new FileInputStream(file);
			
			//2. 객체 사용
			/*
			int readValue = fis.read();
			while (readValue != -1) {
				System.out.println("read() int값: " +  readValue);
				System.out.println(">> char : " + (char)readValue);
				readValue = fis.read();
			}
			*/
			
			int readValue = -1;
			while ((readValue = fis.read()) != -1) {
				System.out.println("read() int값: " +  readValue);
				System.out.println(">> char : " + (char)readValue);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			//3. 객체 close
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("--- main() 끝 ---");
	
	}

}
