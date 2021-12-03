package di_collection;

import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.springframework.context.support.GenericXmlApplicationContext;


public class CollectionBeanClient {

	public static void main(String[] args) {
		System.out.println("------ 스프링 컨테이너 구동전 ------");
		//1. 스프링 컨테이너 구동(스프링 설정 파일 읽어서
		GenericXmlApplicationContext factory 
				= new GenericXmlApplicationContext("applicationContext.xml");
		
		System.out.println("------ 스프링 컨테이너 구동후 ------");
		
		// 2. 스프링 컨테이너 사용 : 생성된 객체 요청(lookup)
		System.out.println("--- 객체 요청전 ----");
		CollectionBean bean = (CollectionBean) factory.getBean("collectionBean");
		
		System.out.println("--- 객체 요청후 ----");
		System.out.println("bean 객체 : " + bean);
		
		
		System.out.println("list 타입 : ");
		List<String> addressList = bean.getAddressList();
		for (String address : addressList) {
			System.out.println(address);
		}
		System.out.println("-----------------");
		
		
		System.out.println("------ Set 타입 ------");
		Set<String> addressSet = bean.getAddressSet();
		for (String address : addressSet) {
			System.out.println(address);
		}
		System.out.println("-----------------");
		
		System.out.println("------ Map 타입 ------");
		Map<String, String> addressMap = bean.getAddressMap();
		System.out.println("addressMap : " + addressMap);
		System.out.println("-----------------");
		
		System.out.println("------ Properties 타입 ------");
		Properties addressProp =  bean.getAddressProp();
		System.out.println("addressProp : "  + addressProp);
		System.out.println("-----------------");
		
		System.out.println("------ 스프링 컨테이너 사용 후 종료처리 ------");
		// 3. 스프링 컨테이너 종료 (close)
		factory.close();
	}

}
