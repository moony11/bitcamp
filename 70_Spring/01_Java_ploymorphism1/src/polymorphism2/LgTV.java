package polymorphism2;

public class LgTV implements TV {
	
	@Override
	public void powerOn() {
		System.out.println("LgTV - 전원ON");
		
	}
	@Override
	public void powerOff() {
		System.out.println("LgTV - 전원off");
		
	}
	@Override
	public void volumeUp() {
		System.out.println("LgTV - 소리 크게~~~");
		
	}
	@Override
	public void volumeDown() {
		System.out.println("LgTV - 소리 작게~~~");
		
	}
}
