package com.bc.bodycoding.admin.member;


import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.dto.ExDTO;
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
	public String detailM(Model model, MemberDTO memberDTO, Principal principal) {
		String userIdA = principal.getName();
		model.addAttribute("adminName", userIdA);
		
		memberDTO = memberdao.selectOneMember(memberDTO);
		model.addAttribute("dto", memberDTO);
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
		System.out.println(trainer_id);
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
		
	//운동기록 리스트
	@RequestMapping(value="exrecord.do", method= RequestMethod.GET)
	public String exrecord(MemberDTO memberDTO, Model model, HttpSession session) {
		
		String trainer_id = (String)(session.getAttribute("UserEmail").toString());
		System.out.println(trainer_id);
		System.out.println("리스트불러옴");
		memberDTO.setTrainer_id(trainer_id);
		
		model.addAttribute("memberList", memberdao.selectexrecord(memberDTO));
		
		return "member/trainer/exrecord";
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
	
	@RequestMapping(value="addexrecord.do", method=RequestMethod.GET)
	public String shoexrecord(ExDTO exDTO) {
		
		return "/member/trainer/addexrecord";
	}
	
	//운동기록 등록
	@RequestMapping(value="addexrecord.do", method=RequestMethod.POST)
	public String insertexrecord1(ExDTO exDTO, MemberDTO memberDTO, HttpServletRequest req, HttpSession session) {
		
		String trainer_id = (String)(session.getAttribute("UserEmail").toString());
		String user_id = req.getParameter("user_id");
		
		System.out.println(trainer_id);
		System.out.println(user_id);
		System.out.println(memberDTO);
		
		int result = memberdao.insertexrecord(exDTO);
		if(result==1)
			
		System.out.println("운동기록 등록이 완료되었습니다.");
		
		return "redirect:exrecord.do";
		
	}
	
	//운동기록 수정 페이지 진입
	@RequestMapping(value="editexrecord.do", method=RequestMethod.GET)
	public String editrecord(Model model, HttpServletRequest req) {
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = memberdao.selectone(req.getParameter("training_log_idx"));
		
		model.addAttribute("memberList", memberDTO);
				
		return "member/trainer/editexrecord";
		
	}
	
	//운동기록 수정
	@RequestMapping(value="editexrecord.do", method=RequestMethod.POST)
	public String editrecord2(MemberDTO memberDTO) {
		
		System.out.println(memberDTO);
		
		int result = memberdao.editexrecord(memberDTO);
		System.out.println(result);
		
		if(result==1)
		System.out.println("특이사항 정보가 수정되었습니다.");
		System.out.println(result);
		
		return "redirect:exrecord.do";
	}
	
	//운동기록삭제
	@RequestMapping("/deleteexrecord.do")
	public void delete2(MemberDTO memberDTO, HttpServletResponse response) throws IOException {
		
	    int result = memberdao.deleteexrecord(memberDTO);
	    if(result == 1) {
	        System.out.println("정보가 삭제되었습니다.");
	    }
	    response.sendRedirect("exrecord.do");
	}
	
	@RequestMapping("career.do")
	public String career() {
		
		return "member/trainer/career";
	}
	
	
}
