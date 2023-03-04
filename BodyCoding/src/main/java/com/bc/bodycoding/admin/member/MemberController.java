package com.bc.bodycoding.admin.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
	//trainer계정으로 로그인했을때 회원목록 보여주기
	@RequestMapping("/memberlistT.do")
	public String trainerml(Model model, HttpSession session, MemberDTO memberDTO) {
		String trainer_id = (String)(session.getAttribute("UserEmail").toString());
		memberDTO.setMem_id(trainer_id);
		model.addAttribute("memberList", memberdao.selectFT(memberDTO));
		return "member/trainer/memberlistT";
	}

	//상세보기 ml = memberlist
	@RequestMapping("/memberdetailT.do")
	public String trainermldeatil(Model model, HttpSession session, MemberDTO memberDTO, HttpServletRequest req) {
		String uDetail = req.getParameter("mem_id");
		memberDTO.setMem_id(uDetail);
		model.addAttribute("dto", memberdao.selectDT(memberDTO));
		return "member/trainer/memberdetailT";
	}
	
	
	
	
	
	
	
}
