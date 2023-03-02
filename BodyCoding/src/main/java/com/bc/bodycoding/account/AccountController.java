package com.bc.bodycoding.account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.dto.MemberDTO;
import lombok.AllArgsConstructor;


@Controller
public class AccountController {

	@Autowired
	AccountService accountdao;

	//회원가입창으로 넘어가기
	@RequestMapping(value="/signup.do", method=RequestMethod.GET)
	public String signupM() {
		return "member/account/signup";
	}
	
	//회원가입 폼 받아서 실행
	//@PostMapping("/signup.do")
	@RequestMapping(value="/signup.do", method=RequestMethod.POST)
	public String signupM2(MemberDTO memberDTO) {
			int result = accountdao.insertMember(memberDTO);
			if(result==1) System.out.println("회원가입이 완료되었습니다.");
			
		return "member/main";
	}
	
	//회원 로그인창으로 넘어가기
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login1() {
		return "member/account/login";
	}
	
	//회원 로그인 하기
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login1(HttpSession session, MemberDTO memberDTO) {
		System.out.println(memberDTO.getMem_id());
		System.out.println(memberDTO.getMem_pass());
		try {
			session.setAttribute("UserInfo", accountdao.login(memberDTO));
			session.setAttribute("UserName", accountdao.login(memberDTO).getMem_name());
			session.setAttribute("UserEmail", accountdao.login(memberDTO).getMem_id());
			return "redirect:main";
		}
		catch (Exception e) {
			System.out.println("로그인 중 오류발생");
			return "member/account/login";
		}
	}
	
	//회원 로그아웃하기
	@GetMapping("/logout.do")
	public String logout1(HttpSession session) {
		session.invalidate();
		return "redirect:main";
	}
	
	//비밀번호 확인 페이지로 넘어가기
	@GetMapping("pwcheck")
	public String pwcheck(HttpServletRequest req){
		return "member/mypage/pwCheck";
	}
	
	//비밀번호 확인후 정보수정 페이지로 넘어가기
	@PostMapping("pwcheck")
	public String pwcheck1(HttpServletRequest req){
		String mem_passCheck = accountdao.pwCheck(req.getParameter("mem_id"));
		String mem_pass = req.getParameter("mem_pass");
		System.out.println(req.getParameter("mem_pass"));
		System.out.println(mem_pass);
		if(mem_pass.equals(mem_passCheck)) {
			return "redirect:memberEdit.do?mem_id="+req.getParameter("mem_id");
		}
		return "redirect:pwcheck";
	}
	
	//탈퇴페이지 넘어가기
	@GetMapping("delete")
	public String delete() {
		return "member/mypage/delete";
	}
	
	//탈퇴하기
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
		
		
//		//단순히 이메일만 발송
//		@AllArgsConstructor
//		@Controller
//		public class MailController {
//		    private final MailService mailService;
//	
//		    @RequestMapping(value="findpw", method=RequestMethod.GET)
//		    public String dispMail() {
//		        return "member/account/findpw";
//		    }
//	
//		    @RequestMapping(value="findpw", method=RequestMethod.POST)
//		    public String execMail(MailDTO mailDto) {
//		        mailService.mailSend(mailDto);
//		        
//		        
//		        return "member/account/login";
//		    }
//		}
		
		// 이메일 보내기
		@AllArgsConstructor
		@Controller
		public class MailController {
		private final MailService mailService;
		@RequestMapping(value="findpw1", method=RequestMethod.GET)
	    public String dispMail() {
	        return "member/account/findpw";
	    }
		
	    @RequestMapping(value="findpw1", method=RequestMethod.POST)
    	public String execMail(MemberDTO memberDTO) {
	    	
	    	String email = memberDTO.getMem_id();
	    	String newpass = memberDTO.getMem_pass();
	    	System.out.println("컨트롤러에서 값 찍기");
	    	System.out.println(email);
	    	System.out.println(newpass);
	    	
	    	mailService.mailSend(memberDTO);
	    		
		    return "member/account/login";
	    }	
		
	}    

 		//비밀번호 업데이트
		@RequestMapping(value="findpw", method = RequestMethod.GET)
		public String findpw() {
			System.out.println("여기는 get방식");
			return "member/account/findpw";
		}
		
		
		//랜덤함수로 임시비밀번호 만들기
		  @RequestMapping("test")
		  public String getTempPassword(){
		  char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C',
				  'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
				  'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		  
		  String rnd = "";
		  
		  // 문자 배열 길이의 값을 랜덤으로 10개를 뽑아 구문을 작성함
		  int idx = 0; for (int i = 0; i < 10; i++) {
			  idx = (int) (charSet.length * Math.random()); rnd += charSet[idx];
		  }
		  	
		  	System.out.println("임시비번찍힘? : " + rnd);
		  	return rnd;
		}
		 
		  
 		@RequestMapping(value="updatePass", method=RequestMethod.POST)
 		public String updatePass(MemberDTO memberDTO, Model model) {
 			
 			char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C',
 					  'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
 					  'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
 			  
 			  String rnd = "";
 			  
 			  // 문자 배열 길이의 값을 랜덤으로 10개를 뽑아 구문을 작성함
 			  int idx = 0; for (int i = 0; i < 10; i++) {
 				  idx = (int) (charSet.length * Math.random()); rnd += charSet[idx];
 			  }
 			  
 			System.out.println("임시비밀번호: "+ rnd);
 			
 			MemberDTO member1 = accountdao.updatePass(memberDTO);
 			
 			
 			String newpass = accountdao.updatePass(rnd);
 			
 			 			
 			if( member1 == null) {
 				model.addAttribute("check", 1);
 			}
 			else {
 				model.addAttribute("check", 0);
 				model.addAttribute("mem_pass", member1.getMem_pass());
 			}
 			
 			return "member/account/findpw";
 	}
}


