package com.spring.zerock.service;

import com.spring.zerock.domain.MemberVO;

public interface MemberService {

	// 회원가입
		public void mJoin(MemberVO member) throws Exception;
	
	// 아이디 중복 체크
		public int idCk(String memberId) throws Exception;

	// 로그인
		public MemberVO mLogin(MemberVO member) throws Exception;
}
