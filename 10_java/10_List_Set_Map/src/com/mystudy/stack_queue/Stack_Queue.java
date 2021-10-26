package com.mystudy.stack_queue;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;

//큐(Queue) 인터페이스 - LinkedList 클래스
// 형태상 파이프 모양(선입선출 : FIFO - First In First Out)
//------------
//스택(Stack) 클래스
// 형태상으로 바닥이 막힌 통의 형태(후입선출 : LIFO - Last In First Out)

public class Stack_Queue {

	public static void main(String[] args) {
		//큐(Queue) 인터페이스 - LinkedList 클래스 : 선입선출
		System.out.println("--- 큐(Queue) : 선입선출 ----");
		Queue<String> queue = new LinkedList<String>();
		queue.offer("1.첫째");
		queue.add("2.둘째");
		queue.offer("3.셋째");
		queue.offer("4.넷째");
		queue.offer("5.다섯째");
		System.out.println(queue);
		System.out.println("queue.size() : " + queue.size());
		
		//peek() : 데이터를 확인만, 꺼내지는 않음(참조/조회)
		System.out.println("--- peek() ---");
		System.out.println("queue.peek() : " + queue.peek());
		System.out.println("queue.peek() : " + queue.peek());
		System.out.println(queue);
		System.out.println("queue.size() : " + queue.size());
		System.out.println();
		
		//poll() : 데이터를 꺼내기, 데이터가 없으면 null 리턴
		System.out.println("--- poll() ---");
		System.out.println("queue.poll() : " + queue.poll());
		System.out.println("queue.poll() : " + queue.poll());
		System.out.println("queue.poll() : " + queue.poll());
		System.out.println("queue.poll() : " + queue.poll());
		System.out.println("queue.poll() : " + queue.poll());
		System.out.println("queue.poll() : " + queue.poll()); // null
		System.out.println("queue.poll() : " + queue.poll()); // null
		
		System.out.println(queue);
		System.out.println("queue.size() : " + queue.size());
		System.out.println("queue.isEmpty() : " + queue.isEmpty());
		
		System.out.println("--- 큐의 전체 데이터 추출 ---");
		while (!queue.isEmpty()) { //비어있지 않으면
			System.out.println(queue.poll());
		}
		System.out.println("queue.size() : " + queue.size());
		
		System.out.println("====================================");
		System.out.println("==== 스택(Stack : LIFO - 후입선출) =====");
		Stack<String> stack = new Stack<>();
		stack.push("1.첫째");
		stack.push("2.둘째");
		stack.add("3.셋째");
		stack.add("4.넷째");
		System.out.println(stack);
		
		System.out.println("--- peek() ---");
		System.out.println(stack.peek());
		System.out.println(stack.peek());
		System.out.println(stack);
		
		//pop() : 데이터 꺼내기 - 현재 사용할 수 있는 데이터
		//  데이터 없을 때 pop() : 예외발생(EmptyStackException)
		System.out.println("--- pop() ---");
		System.out.println("stack.pop() : " + stack.pop());
		System.out.println("stack.pop() : " + stack.pop());
		System.out.println("stack.pop() : " + stack.pop());
		System.out.println("stack.pop() : " + stack.pop());
//		System.out.println(stack.pop()); //없으면 java.util.EmptyStackException
		
		System.out.println(stack);
		System.out.println("stack.size() : " + stack.size());
		
		System.out.println("---- 스택 전체 데이터 조회 ---");
		while (!stack.empty()) {
			System.out.println(stack.pop());
		}
		System.out.println("stack.size() : " + stack.size());
		
	}

}










