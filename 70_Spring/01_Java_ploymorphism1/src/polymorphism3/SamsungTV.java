package polymorphism3;

public class SamsungTV implements TV{
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
}
