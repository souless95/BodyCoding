package com.bc.bodycoding.admin.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import global.dto.GymDTO;
import global.dto.MemberDTO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberdao;
	
	//admin에서 회원목록 보여주기
	@RequestMapping("/memberList.do")
	public String listM(Model model) {
		//model.addAttribute("authority","member");
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
	
	//포인트추가
	@RequestMapping("/addpoint.do")
	@ResponseBody
	public String addpoint(String mem_id, MemberDTO memberDTO) {
		System.out.println(mem_id);
		System.out.println(memberDTO);
		int result = memberdao.pointUpdate(memberDTO); 
		String point = memberdao.selectPoint(mem_id);
		System.out.println(point);
		return point;
	}
	
	@RequestMapping("/memberDelete.do")
	public String delete(MemberDTO memberDTO) {
		int result = memberdao.delete(memberDTO);
		if(result==1)
			System.out.println("삭제되었습니다.");
		return "redirect:/memberList.do";
	}
	
}
