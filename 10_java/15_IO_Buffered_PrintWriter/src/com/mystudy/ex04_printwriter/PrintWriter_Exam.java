package com.mystudy.ex04_printwriter;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class PrintWriter_Exam {

	public static void main(String[] args) {
		// File -> FileWriter -> (BufferedWriter) -> PrintWriter
		FileWriter fw = null;
		BufferedWriter bw = null;
		PrintWriter pw = null;
		
		try {
			fw = new FileWriter(new File("file/pw_out.txt"));
			bw = new BufferedWriter(fw);
			pw = new PrintWriter(bw);
			
			//pw = new PrintWriter(new BufferedWriter(new FileWriter(new File("file/pw_out.txt"))));
			pw.write("안녕하세요~");
			pw.write("반갑습니다\n");
			
			pw.print("지금 자바공부중~~");
			pw.print("잠시후 점심시간~~~");
			
			pw.println("점심 뭐 먹을까????");
			pw.println("-------------------");
			
			pw.printf("%10s %10s %10s \n", "이제", "10분", "남았네요");
			pw.printf("%-50s", "점심식사 맛있게 하시고 오후에 봐요~~");
			
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			pw.close();
		}
	}

}









