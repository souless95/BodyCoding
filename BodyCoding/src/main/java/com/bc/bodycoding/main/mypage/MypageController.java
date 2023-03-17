package com.bc.bodycoding.main.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.dto.GymDTO;
import global.dto.MemberDTO;
import global.dto.ProductDTO;
import global.dto.WeightDTO;

@Controller
public class MypageController {
	@Autowired
	MypageService mydao;
	
	@RequestMapping("mypage.do")
	public String mypage(GymDTO gymDTO, MemberDTO memberDTO,Model model) {
		System.out.println(gymDTO);
		System.out.println(memberDTO);
		gymDTO = mydao.basicListG(gymDTO);
		memberDTO = mydao.basicListM(memberDTO);
		model.addAttribute("basicListG", gymDTO);
		model.addAttribute("basicListM", memberDTO);
		return "member/mypage/mypage";
	}
	
// acconutcontroller로 옮겼습니다
//	@RequestMapping(value="memberEdit.do", method=RequestMethod.GET)
//	public String memberedit(MemberDTO memberDTO, Model model) {
//		memberDTO = mydao.selectOneMember(memberDTO);
//		model.addAttribute("memList", memberDTO);
//		return "member/account/memberEdit";
//	}
//	@RequestMapping(value="memberEdit.do", method=RequestMethod.POST)
//	public String memberedit1(HttpSession session, MemberDTO memberDTO) {
//		if(!(memberDTO.getMem_gender().equals(""))) {
//			memberDTO.setMem_gender(memberDTO.getMem_gender().substring(0, 1));
//		}
//		else if(memberDTO.getMem_disease()!=null||memberDTO.getMem_purpose()!=null||memberDTO.getMem_interest()!=null) {
//			memberDTO.setMem_disease(memberDTO.getMem_disease().replace(",", ""));
//			memberDTO.setMem_purpose(memberDTO.getMem_purpose().replace(",", ""));
//			memberDTO.setMem_interest(memberDTO.getMem_interest().replace(",", ""));
//		}
//		else {
//			memberDTO.setMem_disease("");
//	        memberDTO.setMem_purpose("");
//	        memberDTO.setMem_interest("");
//		}
//		int result = mydao.update(memberDTO);
//		if(result==1) {
//			session.setAttribute("UserInfo", memberDTO);
//			session.setAttribute("UserName", memberDTO.getMem_name());
//			session.setAttribute("UserEmail", memberDTO.getMem_id());
//			
//			System.out.println("수정되었습니다.");
//		}
//		return "redirect:main";
//	}
	
	//트레이너계정으로 로그인했을때 트레이너의 마이페이지로 이동
	@RequestMapping("trainermypage.do")
	public String trainermypage(GymDTO gymDTO, MemberDTO memberDTO,Model model) {
		gymDTO = mydao.basicListG(gymDTO);
		memberDTO = mydao.basicListM(memberDTO);
		model.addAttribute("basicListG", gymDTO);
		model.addAttribute("basicListM", memberDTO);
		return "member/trainer/trainermypage";
	}
	
	//차트보기
	@GetMapping("chart")
	public String chart(Model model, HttpSession session) {
		String mem_id = (String)session.getAttribute("UserEmail");
		model.addAttribute("mem_id",mem_id);
		model.addAttribute("weight",mydao.weightchart(mem_id));
		return "member/mypage/weightChart";
	}
	
	@PostMapping("chart")
	public String chart1(Model model, WeightDTO weightDTO, String mem_id) {
		System.out.println(mem_id);
		mydao.insertWeight(weightDTO);
		return "redirect:chart";
	}
	
} 
