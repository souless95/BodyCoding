package com.bc.bodycoding.account;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("login")
	public void getSelectOne() throws Exception{}
	
//	@PostMapping("login")
//	public String getSelectOne(MemberDTO memberDTO, HttpSession session) throws Exception{
//		memberDTO = memberService.getSelectOne(memberDTO);
//		if(memberDTO != null) {
//			session.setAttribute("member", memberDTO);
//		}
//		
//		return "redirect:main";
//	}

}
