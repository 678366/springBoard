package com.spring.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.zerock.domain.MemberVO;
import com.spring.zerock.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper mapper;
	
	// 회원가입
	@Override
	public void mJoin(MemberVO member) throws Exception {
		
		mapper.mJoin(member);

		log.info("회원가입 완료!" + member);
		
	}

	// 아이디 중복 체크
	@Override
	public int idCk(String mId) throws Exception {
		return mapper.idCk(mId);
	}

	// 로그인
	@Override
	public MemberVO mLogin(MemberVO member) throws Exception {
		
		return mapper.mLogin(member);
	}

}
