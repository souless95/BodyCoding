package com.bc.bodycoding.main.mypage;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		System.out.println(gymDTO);
		System.out.println(memberDTO);
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
	public String memberedit1(HttpSession session, MemberDTO memberDTO) {
		if(!(memberDTO.getMem_gender().equals(""))||!(memberDTO.getMem_purpose().equals(""))||!(memberDTO.getMem_interest().equals(""))) {
			memberDTO.setMem_gender(memberDTO.getMem_gender().substring(0, 1));
			//여기 마지막을 자르면 널이 안들어감 이거 수정해야해
			memberDTO.setMem_purpose(memberDTO.getMem_purpose().substring(0, memberDTO.getMem_purpose().length()-1));
			memberDTO.setMem_interest(memberDTO.getMem_interest().substring(0, memberDTO.getMem_interest().length()-1));
		}
		System.out.println("여기가"+memberDTO);
		int result = mydao.update(memberDTO);
		if(result==1) {
			session.setAttribute("UserInfo", memberDTO);
			session.setAttribute("UserName", memberDTO.getMem_name());
			session.setAttribute("UserEmail", memberDTO.getMem_id());
			
			System.out.println("수정되었습니다.");
		}
		return "redirect:main";
	}
	

} 
