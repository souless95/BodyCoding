package com.bc.bodycoding.account;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.dto.MemberDTO;

@Controller
public class AccountController {

	@Autowired
	AccountService accountdao;

	//회원가입창으로 넘어가기
	//@GetMapping("/signup.do")
	@RequestMapping(value="/signup.do", method=RequestMethod.GET)
	public String signupM() {
		return "member/account/signup";
	}
	
	//회원가입 폼 받아서 실행
	//@PostMapping("/signup.do")
	@RequestMapping(value="/signup.do", method=RequestMethod.POST)
	public String signupM2(MemberDTO memberDTO) {
			int result = accountdao.insertMember(memberDTO);
			if(result==1) System.out.println("회원가입이 완료되었습니다.");
			
		return "member/main";
	}
	
	//회원 로그인창으로 넘어가기
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login1() {
		return "member/account/login";
	}
	
	//회원 로그인 하기
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login1(HttpSession session, MemberDTO memberDTO) {
		System.out.println(memberDTO.getMem_id());
		System.out.println(memberDTO.getMem_pass());
		try {
			session.setAttribute("UserName", accountdao.login(memberDTO));
			return "redirect:main";
		}
		catch (Exception e) {
			System.out.println("로그인 중 오류발생");
			return "member/account/login";
		}
	}
	
	//회원 로그아웃하기
	@GetMapping("/logout.do")
	public String logout1(HttpSession session) {
		session.invalidate();
		return "redirect:main";
	}



}
