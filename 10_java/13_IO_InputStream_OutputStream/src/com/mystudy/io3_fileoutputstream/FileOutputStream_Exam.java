package com.mystudy.io3_fileoutputstream;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;

public class FileOutputStream_Exam {

	public static void main(String[] args) {
		// FileOutputStream : byte 단위로 파일에 저장(출력, 쓰기)
		// - OutputStream 추상클래스를 상속확장(extends)해서 만들어진 클래스
		
		// File에 쓰기 위한 FileOutputStream 타입의 객체 저장을 위한 변수 선언
		FileOutputStream fos = null;
		File file = new File("file/test_out_01.txt");
		
		try {
			//1. 객체(인스턴스) 생성
			//fos = new FileOutputStream(file); //파일내용 삭제후 쓰기
			
			// new FileOutputStream(File, append)
			fos = new FileOutputStream(file, true); //추가하는 형태 출력
			
			//2. 객체 사용
			fos.write('H');
			fos.write('E');
			fos.write('L');
			fos.write('L');
			fos.write('O');
			fos.write('~');
			
			byte[] bytes = "Hello Java!!!".getBytes();
			System.out.println("bytes : " + Arrays.toString(bytes));
			
			// write(바이트배열) : 바이트배열 값을 파일에 출력(쓰기)
			fos.write(bytes);
			
			//write(byte[] b, int off, int len)
			fos.write(bytes, 6, 7);
			fos.write('\n');
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}

}








