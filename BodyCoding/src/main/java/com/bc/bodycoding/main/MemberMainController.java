package com.bc.bodycoding.main;

import java.util.HashMap;
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
	
	//회원창에서 트레이너 목록 보여주기
	@RequestMapping("trainer")
	public String trainer(Model model) {
		model.addAttribute("gymList",maindao.gymlistSelect());
		
		model.addAttribute("trainerList",maindao.trainerlistSelect());
		return "member/main/trainer";
	}	
	
	//회원창에서 트레이너 상세정보 보여주기
	@RequestMapping("trainerInfo")
	@ResponseBody
	public Map<String, Object> trainerInfo(MemberDTO memberDTO) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("gymInfo",maindao.gymInfoSelect(memberDTO));
		map.put("trainerInfo", maindao.trainerInfoSelect(memberDTO));
		return map;
	}
}
