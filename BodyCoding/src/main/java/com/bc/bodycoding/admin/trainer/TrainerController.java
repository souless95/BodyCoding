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
	
	//트레이너 등록 페이지로 이동
	@GetMapping("/trainerRegist.do")
	public String signupT(Model model) {
		model.addAttribute("mem_type","trainer");
		return "admin/trainer/trainerRegist";
	}

	//회원가입 폼 받아서 실행
	@PostMapping("/trainerRegist.do")
	public String signupT2(MemberDTO memberDTO) {
			int result = trainerdao.insertMemberT(memberDTO);
			if(result==1) System.out.println("회원가입이 완료되었습니다.");
		return "redirect:/trainerList.do";
	}
	
	//admin에서 트레이너목록 보여주기
	@RequestMapping("/trainerList.do")
	public String listT(Model model) {
		model.addAttribute("mem_type","trainer");
		model.addAttribute("memberList",trainerdao.selectT());
		return "admin/trainer/trainerList";
	}

}
