package com.itwillbs.ex;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;

public class TestApp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// "안녕!, 아이티윌" 메세지 출력
//		System.out.println("안녕!, 아이티윌");
		
		
//		MessageBean.sayHello("아이티윌2");
		
		// "안녕!, 아이티윌" 메세지 출력
		// => MessageBean 객체 생성, 기능 sayHello 호출
		// => TestApp 클래스는 MessageBean 클래스 (객체)를 필요로 함
		// => TestApp 클래스는 MessageBean 클래스 (객체)를 의존함
		//    [의존 관계]
		
		// => 의존 관계 구현 (인스턴스 생성, 호출 = 직접 구현 -> 강한 결합)
		MessageBean mb = new MessageBean();
		mb.sayHello("아이티윌");
		
		// 메세지 출력
//		MsgBeanImpl mbi = new MsgBeanImpl(); // 강한결합
		MsgBean mbi = new MsgBeanImpl(); // 업캐스팅 - 다형성, 약한결합 (1)
		mbi.sayHello("아이티윌");
		
		// 메세지 출력 (약한 결합 - 의존 관계 주입)
		// 의존 객체를 직접 생성 X -> 생성된 객체 (스프링)
		
		// 외부 파일 (xml)에 있는 객체 정보를 가져오기 (스프링과 연결)
		// -> 어노테이션을 사용한 처리
		BeanFactory fac = new XmlBeanFactory(new FileSystemResource("springBeans.xml"));
		
		// 객체 정보를 가져오기
//		MsgBean mb2 = (MsgBean) fac.getBean("msgBean");
		MsgBean mb2 = fac.getBean("msgBean", MsgBean.class);
		mb2.sayHello("ITWILL");
	}
}
