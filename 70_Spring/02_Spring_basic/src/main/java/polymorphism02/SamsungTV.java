package polymorphism02;

public class SamsungTV implements TV{
	
	
	
	public SamsungTV() {
		System.out.println(">> SamsungTV 객체 생성");
	}
	
	public void powerOn() {
		System.out.println("SamsungTV - 전원ON");
	}
	public void poweroff() {
		
	}
	public void volumeUp() {
		System.out.println("SamsungTV - 소리 크게~~~");
	}
	public void volumeDown() {
		System.out.println("SamsungTV - 소리 작게~~~");
	}
	@Override
	public void powerOff() {
		System.out.println("SamsungTV - 전원off");	
	}
	
	
	//-----------------------------
	public void initMethod() {
		System.out.println(">> SamsungTV - initMethod() 실행");
	}
	
	public void destroyMethod() {
		System.out.println(">> SamsungTV - destroyMethod() 실행");
	}
	
	
}
