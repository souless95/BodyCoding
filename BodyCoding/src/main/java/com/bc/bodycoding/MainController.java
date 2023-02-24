package com.bc.bodycoding;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class MainController {
	
	
	
	@RequestMapping("account/myinfo")
	public String myinfo() {
		return "account/myinfo";
	}
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}	
	
	//adimin메인창으로 넘어가기
	@GetMapping("main/admin")
	public String adminmain(HttpSession session) {
		return "admin/main";
	}
	//admin Login 창으로 먼저 슝
	@RequestMapping("login")
	public String adminLogin(HttpSession session) {
		return "admin/login";
	}
	
	//회원메인창으로 넘어가기
	@GetMapping("main")
	public String membermain(HttpSession session) {
		session.getAttribute("UserName");
		return "member/main";
	}
	
	//캘린더창으로 넘어가기
	@GetMapping("calendar.do")
	public String fullCalendar() {
		return "fullCalendar";
	}
	
	
	
	
	//json불러오기 실험
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("/test3") public String test3(){ JsonObject obj =new
	 * JsonObject();
	 * 
	 * obj.addProperty("title", "테스트3"); obj.addProperty("content", "테스트3 내용");
	 * 
	 * JsonObject data = new JsonObject();
	 * 
	 * data.addProperty("time", "12:00");,
	 * 
	 * obj.add("data", data);
	 * 
	 * return obj.toString(); }
	 */
}
