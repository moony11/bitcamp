package di_annotation;

import org.springframework.stereotype.Component;

@Component("apple")
public class AppleSpeaker implements Speaker {

	public AppleSpeaker() {
		System.out.println("--->> AppleSpeaker() - 객체 생성");
	}
	
	@Override
	public void volumnUp() {
		System.out.println(">> AppleSpeaker - 소리크게!!!");
	}

	@Override
	public void volumnDown() {
		System.out.println(">> AppleSpeaker - 소리작게!!!");
	}

}
