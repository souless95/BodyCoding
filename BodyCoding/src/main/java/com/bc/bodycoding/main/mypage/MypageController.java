package com.bc.bodycoding.main.mypage;


import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.dto.GymDTO;
import global.dto.MemberDTO;

@Controller
public class MypageController {
	@Autowired
	MypageService mydao;
	
	@RequestMapping("mypage.do")
	public String mypage(GymDTO gymDTO, MemberDTO memberDTO,Model model) {
		gymDTO = mydao.basicListG(gymDTO);
		memberDTO = mydao.basicListM(memberDTO);
		model.addAttribute("basicListG", gymDTO);
		model.addAttribute("basicListM", memberDTO);
		return "member/mypage/mypage";
	}
	
	@RequestMapping(value="memberEdit.do", method=RequestMethod.GET)
	public String memberedit(MemberDTO memberDTO, Model model) {
		memberDTO = mydao.selectOneMember(memberDTO);
		model.addAttribute("memList", memberDTO);
		return "member/account/memberEdit";
	}
	@RequestMapping(value="memberEdit.do", method=RequestMethod.POST)
	public String memberedit1(MemberDTO memberDTO) {
		int result = mydao.update(memberDTO);
		if(result==1) System.out.println("수정되었습니다.");
		return "redirect:mypage.do";
	}
	

} 
