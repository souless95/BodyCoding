package com.bc.bodycoding.admin.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import global.dto.MemberDTO;
import global.dto.RoutineDTO;

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
	public String trainermldeatil(Model model, MemberDTO memberDTO,
			HttpServletRequest req) {
		String uDetail = req.getParameter("mem_id");
		model.addAttribute("mem_id", uDetail);
		
		memberDTO.setMem_id(uDetail);
		model.addAttribute("dto", memberdao.selectDT(memberDTO));
		
		return "member/trainer/memberdetailT";
	}
	
	@RequestMapping("/routine.do")
	public String routine(Model model, HttpServletRequest req) {
		String mem_id = req.getParameter("mem_id");
		model.addAttribute("mem_id", mem_id);
		return "member/trainer/routine";
	}
	
	//새테이블 및 dto 추가된것 확인받기
	@ResponseBody
	@RequestMapping("/saveRoutine")
	public RoutineDTO saveRoutine(RoutineDTO routineDTO) {

		System.out.println(routineDTO);
		String gumjng = routineDTO.getActname();
		if(gumjng.equals(null) || gumjng.equals("")) {
			memberdao.deleteRoutine(routineDTO);
			RoutineDTO routineDTO2 = new RoutineDTO(); 
			routineDTO2.setMem_id("error_id");
			return routineDTO2;
		}
		else {
			RoutineDTO nowRoutine = null;
			int result = memberdao.selectRoutine(routineDTO);
			System.out.println(result);
			System.out.println(routineDTO);
			
			if(result == 0) {
				memberdao.saveRoutine(routineDTO);
				nowRoutine = memberdao.getRoutine(routineDTO);
			}
			else if(result == 1) {
				memberdao.updateRoutine(routineDTO);
				nowRoutine = memberdao.getRoutine(routineDTO);
			}
			else {
				System.out.println("routine 테이블에 문제발생 의심됨.");
			}
			return nowRoutine;
		}
	}
	
	@ResponseBody
	@RequestMapping("/changeYoil")
	public RoutineDTO changeYoil(RoutineDTO routineDTO) {
		
		RoutineDTO nowRoutine = memberdao.getRoutine(routineDTO);
		
		if(nowRoutine == null) {
			RoutineDTO routineDTO2 = new RoutineDTO(); 
			routineDTO2.setMem_id("error_id");
			return routineDTO2;
		}		
		return nowRoutine;
	}
	
	@ResponseBody
	@RequestMapping("/updateRoutine")
	public RoutineDTO updateRoutine(RoutineDTO routineDTO) {
		
		memberdao.updateRoutine(routineDTO);
		RoutineDTO nowRoutine = memberdao.getRoutine(routineDTO);
		System.out.println(nowRoutine);
		return nowRoutine;
	}
}
