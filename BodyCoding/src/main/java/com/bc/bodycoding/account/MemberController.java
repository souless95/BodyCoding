package com.bc.bodycoding.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@Autowired
	MemberService dao;
	
	@RequestMapping("/list.do")
	public String member2(Model model) {
		model.addAttribute("memberList", dao.select());
		return "member/list";
	}
}