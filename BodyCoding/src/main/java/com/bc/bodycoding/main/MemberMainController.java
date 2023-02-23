package com.bc.bodycoding.main;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bc.bodycoding.admin.trainer.TrainerService;

import global.dto.MemberDTO;

@Controller
public class MemberMainController {
	@Autowired
	MemberMainService maindao;
	
	//회원창에서 트레이너 목록 보여주기
	@RequestMapping("trainer")
	public String trainer(Model model) {
		model.addAttribute("gymList",maindao.gymlistSelect());
		
		model.addAttribute("trainerList",maindao.trainerlistSelect());
		return "member/main/trainer";
	}	
	
	//회원창에서 트레이너 상세정보 보여주기
	@RequestMapping("trainerInfo")
	public String trainerInfo(Model model, MemberDTO memberDTO) {
		model.addAttribute("gymInfo",maindao.gymInfoSelect(memberDTO));
		model.addAttribute("trainerInfo", maindao.trainerInfoSelect(memberDTO));
		System.out.println(maindao.trainerInfoSelect(memberDTO));
		return "member/main/trainerInfo";
	}
}
