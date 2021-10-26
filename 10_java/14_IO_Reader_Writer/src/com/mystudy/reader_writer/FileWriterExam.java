package com.mystudy.reader_writer;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class FileWriterExam {

	public static void main(String[] args) {
		// FileWriter : 파일에 문자단위 쓰기
		File file = new File("file/test_char_out.txt");
		
		FileWriter fw = null;
		try {
			// 사용할 객체 생성
			fw = new FileWriter(file);
			
			// 객체 사용
			fw.write('대'); //char -> int
			fw.write("한"); //String
			fw.write("민국");
			
			fw.flush(); //버퍼에 있는 데이터를 강제로 Output 처리
			
			fw.write("Hello Java!!!!");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// 객체 close
			try {
				fw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		

	}

}
