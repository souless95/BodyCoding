package com.bc.bodycoding.admin.trainer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.dto.MemberDTO;

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
	public String listT(Model model, MemberDTO memberDTO) {
		model.addAttribute("trainerList",trainerdao.selectGT(memberDTO));
		return "admin/trainer/trainerList";
	}
	
	@RequestMapping("/trainerDetail.do")
	public String detailT(Model model, MemberDTO memberDTO) {
		memberDTO = trainerdao.selectOneT(memberDTO);
		model.addAttribute("trainerList",memberDTO);
		return "admin/trainer/trainerDetail";
	}

	//수정하기
	@RequestMapping(value="/trainerEdit.do", method=RequestMethod.GET)
	public String editT(Model model, MemberDTO memberDTO) {
		memberDTO = trainerdao.selectOneT(memberDTO);
		model.addAttribute("trainer", memberDTO);
		return "admin/trainer/trainerEdit";
	}
	@RequestMapping(value="/trainerEdit.do", method=RequestMethod.POST)
	public String editT(MemberDTO memberDTO) {
		int result = trainerdao.update(memberDTO);
		System.out.println(result);
		if(result==1) System.out.println("수정되었습니다.");
		return "redirect:trainerList.do";
	}
	
	//삭제
	@RequestMapping("/trainerdelete.do")
	public String deleteT(MemberDTO memberDTO) {
		int result = trainerdao.deleteT(memberDTO);
		if(result==1) System.out.println("삭제되었습니다.");
		return "redirect:trainerList.do";
	}
}
