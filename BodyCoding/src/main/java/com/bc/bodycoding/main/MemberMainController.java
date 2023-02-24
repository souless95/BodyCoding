package com.bc.bodycoding.main;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import global.dto.MemberDTO;

@Controller
public class MemberMainController {
	@Autowired
	MemberMainService maindao;
	
	
	@RequestMapping("trainer")
	public String trainerpage(Model model) {
		model.addAttribute("gymList",maindao.gymlistSelect());
		return "member/main/trainer";
	}
	//회원창에서 트레이너 목록 보여주기
	@RequestMapping("/trainer.do")
	@ResponseBody
	public List<MemberDTO> trainer(String gym_code) {
		List<MemberDTO> trainerList;
		if(gym_code.equals("-")) {
			trainerList = maindao.trainerALLlistSelect();
		}
		else {
			trainerList = maindao.trainerlistSelect(gym_code);
		}
		return trainerList;
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
