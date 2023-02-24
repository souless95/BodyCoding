package com.bc.bodycoding.main.mypage;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	@Autowired
	MypageService mydao;
	
	@RequestMapping("mypage.do")
	public String mypage() {
		return "member/mypage/mypage";
	}
}
