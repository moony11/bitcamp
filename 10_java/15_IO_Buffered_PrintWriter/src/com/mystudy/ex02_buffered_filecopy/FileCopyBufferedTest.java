package com.mystudy.ex02_buffered_filecopy;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileCopyBufferedTest {

	public static void main(String[] args) {
		// BufferedInputStream, BufferedOutputStream 적용
		// 2가지 방식으로 파일 복사해서 속도 비교
		// 방법1 : byte 단위 읽고, 쓰기 복사
		// 방법2 : 버퍼기능 사용 복사(BufferedInputStream, BufferedOutputStream)
		
		File file = new File("file/test_img.jpg");
		
		//파일로 부터 byte 단위 읽어 처리할 객체를 저장할 변수 선언
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		//버퍼사용을 위한 변수 선언
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		
		try {
			//파일 읽고, 쓰기 객체 생성
			fis = new FileInputStream(file);
			fos = new FileOutputStream("file/test_img_byte_copy.jpg");
			
			//파일 복사
			long startTime = System.currentTimeMillis();
			
			//바이트 단위 파일 읽고, 쓰기 처리
			int readValue = fis.read();
			while (readValue != -1) {
				fos.write(readValue);
				readValue = fis.read();
			}
			
			long endTime = System.currentTimeMillis();
			System.out.println("byte 복사시간: " + (endTime - startTime));
			fos.close();
			fis.close();
			
			//================================================
			//버퍼(buffer) 사용 복사
			bis = new BufferedInputStream(new FileInputStream(file), 1000);
			bos = new BufferedOutputStream(
					new FileOutputStream("file/test_img_bos_copy.jpg"), 1000);
			
			startTime = System.currentTimeMillis();
			//읽고, 쓰기
			int readBis = bis.read();
			while (readBis != -1) {
				bos.write(readBis);
				readBis = bis.read();
			}
			
			endTime = System.currentTimeMillis();
			System.out.println("buffer 복사시간: " + (endTime - startTime));
			bos.close();
			bis.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}







