package com.bc.bodycoding;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}	
	
	//회원메인창으로 넘어가기
	@GetMapping("main/admin")
	public String adminmain(HttpSession session) {
		return "admin/main";
	}
	
	//회원메인창으로 넘어가기
	@GetMapping("main")
	public String membermain(HttpSession session) {
		return "member/main";
	}
	
	//캘린더창으로 넘어가기
	@GetMapping("calendar.do")
	public String fullCalendar() {
		return "fullCalendar";
	}
}
