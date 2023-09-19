package com.spring.zerock.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.zerock.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberServiceTests {

	@Autowired
	private MemberService service;
	
	@Test
	public void testJoin() throws Exception {
		
		MemberVO vo = new MemberVO();
		
		vo.setMId("id");
		vo.setMPw("pw");
		vo.setMName("name");
		vo.setMMail("mail");
		vo.setMAddr1("addr1");
		vo.setMAddr2("addr2");
		vo.setMAddr3("addr3");

		service.mJoin(vo);
		
	}
	
}
