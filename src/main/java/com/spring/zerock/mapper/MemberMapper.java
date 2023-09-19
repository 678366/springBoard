package com.spring.zerock.mapper;

import com.spring.zerock.domain.MemberVO;

public interface MemberMapper {

	// 회원가입
	public void mJoin(MemberVO member);
	
	// 중복 아이디 체크
	public int idCk(String mId);

}
