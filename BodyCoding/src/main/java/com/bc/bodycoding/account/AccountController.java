package com.bc.bodycoding.account;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.dto.MemberDTO;

@Controller
public class AccountController {

	@Autowired
	AccountService accountdao;

	// 회원가입창으로 넘어가기
	// @GetMapping("/signup.do")
	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public String signupM() {
		return "member/account/signup";
	}

	// 회원가입 폼 받아서 실행
	// @PostMapping("/signup.do")
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public String signupM2(MemberDTO memberDTO) {
		System.out.println(memberDTO);
		
		 int result = accountdao.insertMember(memberDTO); if(result==1)
		 System.out.println("회원가입이 완료되었습니다.");

		return "member/main";
	}

	// 회원 로그인창으로 넘어가기
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login1() {
		return "member/account/login";
	}

	// 회원 로그인 하기
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login1(HttpSession session, MemberDTO memberDTO) {
		System.out.println(memberDTO.getMem_id());
		System.out.println(memberDTO.getMem_pass());
		try {
			session.setAttribute("UserInfo", accountdao.login(memberDTO));
			session.setAttribute("UserName", accountdao.login(memberDTO).getMem_name());
			session.setAttribute("UserEmail", accountdao.login(memberDTO).getMem_id());
			return "redirect:main";
		} catch (Exception e) {
			System.out.println("로그인 중 오류발생");
			return "member/account/login";
		}
	}

	// 회원 로그아웃하기
	@GetMapping("/logout.do")
	public String logout1(HttpSession session) {
		session.invalidate();
		return "redirect:main";
	}

	// 비밀번호 확인 페이지로 넘어가기
	@GetMapping("pwcheck")
	public String pwcheck(HttpServletRequest req) {
		return "member/mypage/pwCheck";
	}

	// 비밀번호 확인후 정보수정 페이지로 넘어가기
	@PostMapping("pwcheck")
	public String pwcheck1(HttpServletRequest req) {
		String mem_passCheck = accountdao.pwCheck(req.getParameter("mem_id"));
		String mem_pass = req.getParameter("mem_pass");
		System.out.println(req.getParameter("mem_pass"));
		System.out.println(mem_pass);
		if (mem_pass.equals(mem_passCheck)) {
			return "redirect:memberEdit.do?mem_id=" + req.getParameter("mem_id");
		}
		return "redirect:pwcheck";
	}

	// 탈퇴페이지 넘어가기
	@GetMapping("delete")
	public String delete() {
		return "member/mypage/delete";
	}

	// 탈퇴하기
	@PostMapping("/delete")
	public String delete1(HttpServletRequest req, HttpSession session) {
		String mem_id = req.getParameter("mem_id");
		System.out.println(mem_id);
		int result = accountdao.deleteMember(mem_id);
		System.out.println(result);

		if(result==1) {
			session.invalidate();
			System.out.println("탈퇴 성공");
			return "redirect:main";
		}
		else {
			System.out.println("탈퇴 실패");
			return "delete";
		}
	}
	
		//아이디찾기 창으로 넘어가기
		@RequestMapping(value="findid", method=RequestMethod.GET)
		public String findid() {
		
			return "member/account/findid";
		}
		
		//아이디 찾기 
		@RequestMapping(value="gofindid", method=RequestMethod.POST)
		public String gofindid(MemberDTO memberDTO, Model model) {
			MemberDTO member = accountdao.gofindid(memberDTO);
			System.out.println(memberDTO);
			if( member == null) {
				model.addAttribute("check", 1);
			}
			else {
				model.addAttribute("check", 0);
				model.addAttribute("mem_id", member.getMem_id());
				
				System.out.println("아이디="+member.getMem_id());
			}
			return "member/account/findid";
				
		}
		
		
		//비밀번호찾기
		@RequestMapping(value="findpass", method=RequestMethod.GET)
		public String findpass() {
		
			return "member/account/findpass";
		}
				
		//비밀번호 찾기 
		@RequestMapping(value="gofindpass", method=RequestMethod.POST)
		public String gofindpass(MemberDTO memberDTO, Model model) {
			MemberDTO member1 = accountdao.gofindpass(memberDTO);
			System.out.println(memberDTO);
			if( member1 == null) {
				model.addAttribute("check", 1);
			}
			else {
				model.addAttribute("check", 0);
				model.addAttribute("mem_pass", member1.getMem_pass());
			}
			return "member/account/findpass";
				
		}
		
		/* 비밀번호 찾기 */
		@RequestMapping(value = "/findpw", method = RequestMethod.GET)
		public void findPwGET() throws Exception{
		}

		@RequestMapping(value = "/findpw", method = RequestMethod.POST)
		public void findPwPOST(@ModelAttribute MemberDTO memberDTO , HttpServletResponse response) throws Exception{
			accountdao.findPw(response, memberDTO);
		}
}
