package com.bc.bodycoding.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bc.bodycoding.MemberDTO;

@Controller
public class AccountController {

	@Autowired
	AccountService accountdao;

	//회원가입창으로 넘어가기
	@GetMapping("/signup.do")
	public String signupM(Model model) {
		model.addAttribute("mem_type","member");
		return "member/account/signup";
	}
	
	//회원가입 폼 받아서 실행
	@PostMapping("/signup.do")
	public String signupM2(MemberDTO memberDTO) {
			int result = accountdao.insertMember(memberDTO);
			if(result==1) System.out.println("회원가입이 완료되었습니다.");
			
		return "main";
	}



}
