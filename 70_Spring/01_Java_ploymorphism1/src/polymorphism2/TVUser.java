package polymorphism2;

public class TVUser {
	public static void main(String[] args) {
		// 삼성 TV tkdyd 
//		TV tv = new SamsungTV();

		
		// LgTV사용형태로 변경
		TV tv = new LgTV();
		tv.powerOn();
		tv.volumeUp();
		tv.volumeDown();
		tv.powerOff();
		
	}
}
