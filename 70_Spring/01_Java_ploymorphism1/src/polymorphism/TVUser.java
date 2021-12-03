package polymorphism;

public class TVUser {
	public static void main(String[] args) {
		// 삼성 TV tkdyd 
//		SamsungTV tv = new SamsungTV();
//		tv.powerOn();
//		tv.volumeUp();
//		tv.volumeDown();
//		tv.poweroff();
		
		// LgTC 사용형태로 변경 
		LgTV tv = new LgTV();
		tv.on();
		tv.soundUp();
		tv.soundDown();
		tv.off();
	}
}
