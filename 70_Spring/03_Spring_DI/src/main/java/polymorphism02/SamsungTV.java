package polymorphism02;

public class SamsungTV implements TV{
	
	private SonySpeaker speaker;
	private int price;
	private int width;
	private int height;
	
	
	public SamsungTV() {
		System.out.println(">> SamsungTV 객체 생성");
	}
	
	public SamsungTV(SonySpeaker speaker) {
		System.out.println(">> SamsungTV(speaker) 객체 생성");
		this.speaker
		= speaker;
	}
	public SamsungTV(SonySpeaker speaker, int price) {
		System.out.println(">> SamsungTV(speaker, price) 객체 생성");
		this.speaker = speaker;
		this.price = price;
	}
	public SamsungTV(SonySpeaker speaker, int width, int height) {
		System.out.println(">> SamsungTV(speaker, width, height) 객체 생성");
		this.speaker = speaker;
		this.width = width;
		this.height = height;
	}
	
	public void powerOn() {
		System.out.println("SamsungTV - 전원ON");
	}

	public void poweroff() {
		
	}
	public void volumeUp() {
		System.out.println("SamsungTV - 소리 크게~~~");
		this.speaker.volumeUp();
	}
	public void volumeDown() {
		System.out.println("SamsungTV - 소리 작게~~~");
		this.speaker.volumeDown();
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
