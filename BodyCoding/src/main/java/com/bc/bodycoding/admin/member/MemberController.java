package com.bc.bodycoding.admin.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import global.dto.GymDTO;
import global.dto.MemberDTO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberdao;
	
	//admin에서 회원목록 보여주기
	@RequestMapping("/memberList.do")
	public String listM(Model model) {
		//model.addAttribute("mem_type","member");
		model.addAttribute("memberList", memberdao.select());
		return "admin/member/memberList";
	}

	//상세보기
	@RequestMapping("/detail.do")
	public String detailM(Model model, MemberDTO memberDTO) {
		memberDTO = memberdao.selectOneMember(memberDTO);
		model.addAttribute("dto", memberDTO);
		System.out.println(memberDTO);
		return "admin/member/Detail";
	}
	
}
