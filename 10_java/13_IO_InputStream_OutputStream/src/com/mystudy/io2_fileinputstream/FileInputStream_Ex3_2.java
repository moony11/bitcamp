package com.mystudy.io2_fileinputstream;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Arrays;

public class FileInputStream_Ex3_2 {

	public static void main(String[] args) {
		File file = new File("file/test01.txt");

		FileInputStream fis = null;
		try {
			fis = new FileInputStream(file);
			
			byte[] bytes = new byte[10];
			System.out.println("bytes 만든 직후 : " + Arrays.toString(bytes));
			
			/*
			int byteCnt = fis.read(bytes);
			System.out.println("읽어온 갯수 : " + byteCnt);
			System.out.println("읽어온 값 bytes : " + Arrays.toString(bytes));
			for (int i = 0; i < byteCnt; i++) {
				System.out.println("int 값: " + bytes[i] 
						+ ", char: " + (char)bytes[i] );
			}
			*/
			int byteCnt = 0;
			while (true) {
				byteCnt = fis.read(bytes);
				if (byteCnt == -1) break;
				
				System.out.println("읽어온 갯수 : " + byteCnt);
				System.out.println("읽어온 값 bytes : " + Arrays.toString(bytes));
				for (int i = 0; i < byteCnt; i++) {
					System.out.println("int 값: " + bytes[i] 
							+ ", char: " + (char)bytes[i] );
				}
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}







