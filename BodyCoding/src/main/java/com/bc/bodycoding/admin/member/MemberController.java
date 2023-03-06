package com.bc.bodycoding.admin.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.dto.ExDTO;
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
	
	
	//운동기록 리스트 페이지
	@RequestMapping(value="exrecordlists.do", method=RequestMethod.GET)
	public String exrecordlists() {
		
		return "member/trainer/exrecordlists";
	}
	
	//운동기록 리스트 페이지 
	@RequestMapping(value="exerecordlists.do", method=RequestMethod.POST)
	public String exrecordlist(Model model, HttpSession session, MemberDTO memberDTO, ExDTO exDTO) {
		String trainer_id = (String)(session.getAttribute("UserEmail").toString());
		memberDTO.setMem_id(trainer_id);
		model.addAttribute("exrecordlist", memberdao.selectDT(memberDTO));
		return "member/trainer/exrecordlists";
	}
	
	
	//운동기록 등록 페이지로 이동
	@RequestMapping(value="exrecord.do", method= RequestMethod.GET)
	public String exrecord() {
		
		return "member/trainer/exrecord";
	}
	
	//운동기록 입력
	@RequestMapping(value="exrecord.do", method=RequestMethod.POST)
	public String insertexrecord(ExDTO exDTO) {
		
		
		System.out.println(exDTO);
		int result = memberdao.insertexrecord(exDTO);
		if(result==1)
			
		System.out.println("운동기록 등록이 완료되었습니다.");
		
		return "redirect:exrecordlists.do";
		
	}
}
