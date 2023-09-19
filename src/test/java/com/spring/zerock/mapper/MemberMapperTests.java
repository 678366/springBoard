package com.spring.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.zerock.domain.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTests {

	@Autowired
	private MemberMapper memberMapper;

//	@Test
//	public void joinTest() throws Exception{
//		MemberVO member = new MemberVO();
//		member.setMId("Tmember");
//		member.setMPw("Tmember");
//		member.setMName("Tmember");
//		member.setMMail("Tmember@gmail.com");
//		member.setMAddr1("Tmember");
//		member.setMAddr2("Tmember");
//		member.setMAddr3("Tmember");
//		
//		memberMapper.mJoin(member); // 쿼리 메서드 실행
//	}
	
	@Test
	public void idCkTest() throws Exception{
		String id = "a";
		String id2 = "a123";
		memberMapper.idCk(id);
		memberMapper.idCk(id2);
	}
	
}
