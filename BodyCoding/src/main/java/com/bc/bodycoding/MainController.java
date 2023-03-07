package com.bc.bodycoding;


import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bc.bodycoding.admin.gym.GymService;

import global.dto.MemberDTO;


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
//	@GetMapping("/main/admin")
//	public String adminmain(HttpSession session) {
//		return "admin/main";
//	}
	
//	//admin Login 창으로 먼저 슝
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
	
	@RequestMapping("gx")
	public String gx() {
		return "member/menu/gx";
	}
	@RequestMapping("health")
	public String health() {
		return "member/menu/health";
	}
	@RequestMapping("introgym")
	public String introgym() {
		return "member/menu/introgym";
	}
	@RequestMapping("pila")
	public String pila() {
		return "member/menu/pila";
	}
	@RequestMapping("pt")
	public String pt() {
		return "member/menu/pt";
	}
	@RequestMapping("yoga")
	public String yoga() {
		return "member/menu/yoga";
	}
	
	//시큐리티 로그인용
	@RequestMapping("/main/admin")
	public String adminLogin(Principal principal, Model model, MemberDTO memberDTO) {
		
		String page = "";
		
			try {
				String mem_id = principal.getName();
				model.addAttribute("mem_id", mem_id);
				
				System.out.println(mem_id);
				
				page = "admin/main";
			} 
			catch (Exception e) {
				e.printStackTrace();
				System.out.println("로그인하셔야 합니다.");
				page = "admin/auth/login";
			}
		return page;
	}
	
	//로그인 실패한 경우 출력할 메세지
	@RequestMapping("/adminLoginError.do")
	public String adminLogin2(Model model) {
		model.addAttribute("errorMsg", "로그인에 실패했습니다.");
		return "admin/auth/login";
	}
	
	//권한이 부족한 경우 출력할 메세지
	@RequestMapping("/denied.do")
	public String adminLogin3() {
		return "admin/auth/denied";
	}
	
//	@RequestMapping(value = "admin/auth/updatePwd", method = RequestMethod.GET)
//	public String updatePwd(Principal principal, MemberDTO memberDTO, Model model) {
//		memberDTO = gymdao.selectUpdatePwd(model);
//		
//		System.out.println(memberDTO);
//		
//		return "admin/auth/updatePwd";
//	}
		
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
