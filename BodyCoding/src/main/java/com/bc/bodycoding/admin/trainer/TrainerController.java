package com.bc.bodycoding.admin.trainer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bc.bodycoding.MemberDTO;

@Controller
public class TrainerController {
	
	@Autowired
	TrainerService trainerdao;
	
	@GetMapping("/trainerRegist.do")
	public String signupT(Model model) {
		model.addAttribute("mem_type","trainer");
		return "admin/trainer/trainerRegist";
	}

//	admin_sub/gym이랑 회의 후 수정
//	@GetMapping("/registASUB.do")
//	public String signupASUB(Model model) {
//		model.addAttribute("mem_type","admin_sub");
//		return "member/account/signup";
//	}
	
	//회원가입 폼 받아서 실행
	@PostMapping("/trainerRegist.do")
	public String signupT2(MemberDTO memberDTO) {
			int result = trainerdao.insertMemberT(memberDTO);
			if(result==1) System.out.println("회원가입이 완료되었습니다.");
		return "main/admin";
	}
	
	
//	admin_sub/gym이랑 회의 후 수정
//	//회원가입 폼 받아서 실행
//	@PostMapping("/registASUB.do")
//	public String signupASUB2(MemberDTO memberDTO) {
//		int result = trainerdao.insertMemberASUB(memberDTO);
//		if(result==1) System.out.println("회원가입이 완료되었습니다.");
//		return "main";
//	}
	
	//admin에서 트레이너목록 보여주기
	@RequestMapping("/trainerList.do")
	public String listT(Model model) {
		model.addAttribute("mem_type","trainer");
		model.addAttribute("memberList",trainerdao.selectT());
		return "admin/trainer/trainerList";
	}

}
