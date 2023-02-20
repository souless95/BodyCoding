package com.bc.bodycoding.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@Autowired
	MemberService memberdao;

	//회원가입창으로 넘어가기
	@GetMapping("/signup.do")
	public String signupM(Model model) {
		model.addAttribute("mem_type","member");
		return "member/account/signup";
	}
	
	@GetMapping("/signupT.do")
	public String signupT(Model model) {
		model.addAttribute("mem_type","trainer");
		return "member/account/signup";
	}
	
	@GetMapping("/signupASUB.do")
	public String signupASUB(Model model) {
		model.addAttribute("mem_type","admin_sub");
		return "member/account/signup";
	}
	
	//회원가입 폼 받아서 실행
	@PostMapping("/signup.do")
	public String signupM2(MemberDTO memberDTO) {
			int result = memberdao.insertMember(memberDTO);
			if(result==1) System.out.println("회원가입이 완료되었습니다.");
			
		return "main";
	}
	
	//회원가입 폼 받아서 실행
	@PostMapping("/signupT.do")
	public String signupT2(MemberDTO memberDTO) {
			int result = memberdao.insertMemberT(memberDTO);
			if(result==1) System.out.println("회원가입이 완료되었습니다.");
		return "main";
	}
	
	//회원가입 폼 받아서 실행
	@PostMapping("/signupASUB.do")
	public String signupASUB2(MemberDTO memberDTO) {
		int result = memberdao.insertMemberASUB(memberDTO);
		if(result==1) System.out.println("회원가입이 완료되었습니다.");
		return "main";
	}
	
	//admin에서 회원목록 보여주기
	@RequestMapping("/memberlistM.do")
	public String listM(Model model) {
		model.addAttribute("mem_type","member");
		model.addAttribute("memberList",memberdao.select());
		return "admin/memberlist";
	}
	
	//admin에서 트레이너목록 보여주기
	@RequestMapping("/memberlistT.do")
	public String listT(Model model) {
		model.addAttribute("mem_type","trainer");
		model.addAttribute("memberList",memberdao.selectT());
		return "admin/memberlist";
	}
}
