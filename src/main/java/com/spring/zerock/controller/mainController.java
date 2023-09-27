package com.spring.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/about/*")
public class mainController {

	// 회사소개 페이지 진입
	@RequestMapping(value = "company", method = RequestMethod.GET)
	public void companyGET() {
		log.info("회사소개 페이지 진입");
	}
	
	// 문의하기 페이지 진입
	@RequestMapping(value = "inquire", method = RequestMethod.GET)
	public void inquireGET() {
		log.info("문의하기 페이지 진입");
	}

}
