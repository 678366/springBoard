package com.spring.zerock.domain;

import lombok.Data;

@Data
public class MemberVO {

	private String mId;
	
	private String mPw;
	
	private String mName;
	
	private String mMail;
	
	private String mAddr1;
	
	private String mAddr2;
	
	private String mAddr3;

	private int adminCk;
	
	private int regDate;
	
}
