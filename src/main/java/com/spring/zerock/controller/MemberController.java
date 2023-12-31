package com.spring.zerock.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.zerock.domain.MemberVO;
import com.spring.zerock.service.MemberService;

import lombok.extern.log4j.Log4j;
import sun.util.logging.resources.logging;

@Log4j
@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private JavaMailSender mailsender2;
	
	// 회원가입 페이지 이동
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public void loginGET() {
		log.info("회원가입 페이지 진입");
	}
	
	// 로그인 페이지 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void joinGET() {
		log.info("로그인 페이지 진입");
	}
	
	// 회원가입
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception {
		memberservice.mJoin(member);
		log.info("view에서 넘어오나?");
		return "redirect:/member/joinsuccess";
	}
	
	// 회원가입 완료 페이지 이동
	@RequestMapping(value = "joinsuccess", method = RequestMethod.GET)
	public void joinsuccess() {
		log.info("회원가입 완료");
	}
	
	// 아이디 중복 검사
	@ResponseBody
	@RequestMapping(value = "memberIdCk", method = RequestMethod.POST)
	public String memberIdCkPOST(String mId) throws Exception {
		
		if (mId == null || mId == "") {
			log.info("결과 : " + mId);
			return "null";
		} else {
			int result = memberservice.idCk(mId);
			if (result != 0) {
				log.info("중복 : " + result);
				return "fail"; // 중복 아이디 존재
			} else {
				log.info("중복없음 : " + result);
				return "success"; // 중복아이디 없음
			}	
		}
	}
	
	
	// 이메일 인증
	@ResponseBody
	@RequestMapping(value = "mailCk", method = RequestMethod.GET)
	public String mailCkGET(String email) throws Exception{
		log.info("이메일 데이터 확인");
		log.info("이메일" + email);
		
		// 인증번호 난수 생성
		Random random = new Random();
		// 111111 ~ 999999 범위의 숫자
		int ckNum = random.nextInt(888888) + 111111;
		log.info("인증번호" + ckNum);
		
//		String setFrom = "e-mail";
//		String toMail = email;
//		String title = "회원가입 인증 이메일입니다.";
//		String content = "홈페이지를 방문해 주셔서 감사합니다." +
//						 "<br><br>" +
//					 	 "인증 번호는 " + ckNum + "입니다." +
//					 	 "<br>" +
//					 	 "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
//		try {
//			
//			MimeMessage message = mailsender2.createMimeMessage();
//			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
//			helper.setFrom(setFrom);
//			helper.setTo(toMail);
//			helper.setSubject(title);
//			helper.setText(content, true);
//			log.info("toMail : " + toMail);
//			mailsender2.send(message);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		String num = Integer.toString(ckNum);
		return num;
	}
	
	// 로그인
	// 파라미터 MemberVO(데이터 전달),
	// HttpServletPequest(로그인 성공>session저장),
	// RedirectAttributes(로그인 실패 redirect 실패 데이터 전송)
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
		System.out.println("login 진입");
		System.out.println("전달 데이터: " + member);
		
		HttpSession session = request.getSession(); // 첫번째 변수
		MemberVO lvo = memberservice.mLogin(member);
		// service의 mLogin 초기화. 메서드를 요청하면 mapper를 지나 쿼리 실행. 결과 값을 MemberVO 객체 반환 받아 변수에 저장
		// lvo 값은 아이디, 비밀번호 존재할 경우 member의 데이터가 담긴 MemberVO 객체 저장. 존재X > null 
		log.info("로그인POST");
		if (lvo == null) {
			log.info("if문 넘어오나");
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/login";
		}
		session.setAttribute("member", lvo);
		
		return "redirect:/";
	}
	
}
