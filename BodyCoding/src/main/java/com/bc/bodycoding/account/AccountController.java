package com.bc.bodycoding.account;


import java.nio.channels.MembershipKey;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.bc.bodycoding.calendar.CalendarDTO;

import global.dto.MemberDTO;
import global.dto.ProductDTO;
import global.dto.TrainingLogDTO;


@Controller
public class AccountController {

   @Autowired
   AccountService accountdao;
   
   @Autowired
   private MailService mailService;

   @RequestMapping(value = "/signup.do", method = RequestMethod.GET)
   public String signupM() {
      return "member/account/signup";
   }

   // 회원가입 폼 받아서 실행
   // @PostMapping("/signup.do")
   @RequestMapping(value = "/signup.do", method = RequestMethod.POST)
   public String signupM2(MemberDTO memberDTO) {
      if(!(memberDTO.getMem_gender().equals(""))) {
         memberDTO.setMem_gender(memberDTO.getMem_gender().substring(0, 1));
      }
      System.out.println(memberDTO);
      
      int result = accountdao.insertMember(memberDTO); 
      if(result==1) System.out.println("회원가입이 완료되었습니다.");
      

      return "member/main";
   }

   // ajax 회원아이디 중복검사
   @ResponseBody
   @RequestMapping("/checkIdDuplicate")
   public String checkIdDuplicate(MemberDTO memberDTO) {
      
      String result = accountdao.checkIdDuplicate(memberDTO);
      
      return result;
   }

   // 회원 로그인창으로 넘어가기
   @RequestMapping(value = "/login.do", method = RequestMethod.GET)
   public String login1() {
      return "member/account/login";
   }

   // 회원 로그인 하기
   @RequestMapping(value = "/login.do", method = RequestMethod.POST)
   public String login1(HttpSession session, MemberDTO memberDTO) {
      
      MemberDTO UserInfo = accountdao.login(memberDTO);
      
      try {
         session.setAttribute("UserInfo", UserInfo);
         session.setAttribute("UserName", accountdao.login(memberDTO).getMem_name());
         session.setAttribute("UserEmail", accountdao.login(memberDTO).getMem_id());
         session.setAttribute("Authority", accountdao.login(memberDTO).getAuthority());
         session.setAttribute("UserGymCode", accountdao.login(memberDTO).getGym_code());
         
         return "redirect:main";
      } 
      catch (Exception e) {
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
      System.out.println(mem_passCheck);
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
   
   //회원권 남은 횟수 확인
   @GetMapping("vdCounting.do")
   public String vdCounting(Model model, HttpSession session, ProductDTO productDTO) {
	   
	   String user_id = (String)session.getAttribute("UserEmail");
	   String user_name = (String)session.getAttribute("UserName");
	   productDTO.setUser_id(user_id);
	   List<ProductDTO> totalVD = accountdao.getMInfo(productDTO);
	   System.out.println(totalVD);
	   
	   List<Map<String, Object>> newVD = new ArrayList<Map<String, Object>>();
	   for (ProductDTO tVD : totalVD) {
		    Map<String, Object> event = new HashMap<String, Object>();
		    
		    event.put("tName", tVD.getTrainer_name());
		    event.put("category", tVD.getProduct_category());
		    tVD.setUser_id(user_id);
		    event.put("count", tVD.getMembership_count()-accountdao.getTLog(tVD));
		    System.out.println(event);
		    newVD.add(event);
	   }
	   model.addAttribute("user_name", user_name);
	   model.addAttribute("newVD", newVD);
	   
      return "member/mypage/vdCounting";
   }
   
   //트레이닝 로그에 기록하기 위한 코멘트작성
   @GetMapping("??")
   public String writeComment() {
	  
	   
      return "member/mypage/??";
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
      } else {
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
      
   //비밀번호찾기 페이지로만 넘김
   @RequestMapping(value="findpass", method=RequestMethod.GET)
   public String findpass() {
   
      return "member/account/findpass";
   }
            
   //비밀번호 찾기 실행
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
      
//      //단순히 이메일만 발송하는 코드 
//      @AllArgsConstructor
//      @Controller
//      public class MailController {
//          private final MailService mailService;
//   
//          @RequestMapping(value="findpw", method=RequestMethod.GET)
//          public String dispMail() {
//              return "member/account/findpw";
//          }
//   
//          @RequestMapping(value="findpw", method=RequestMethod.POST)
//          public String execMail(MailDTO mailDto) {
//              mailService.mailSend(mailDto);
//              
//              
//              return "member/account/login";
//          }
//      }
         
       //이메일로 비밀번호 찾기 GET으로 findpw 페이지로 넘겨만 준다. 
      @RequestMapping(value="findpw", method = RequestMethod.GET)
      public String findpw() {
         return "member/account/findpw";
      }
      
      //랜덤함수로 임시비밀번호 만들기
      @ResponseBody
      @RequestMapping("/validaation")
      public String getTempPassword(MemberDTO memberDTO, HttpServletRequest req){
         memberDTO.setMem_id(req.getParameter("mem_id"));
         memberDTO.setMem_name(req.getParameter("mem_name"));
         
         //findpw에서 아이디, 이름 입력했을때 memberDTO에 입력되는 정보 확인
         //System.out.println(memberDTO);
         
         int result = accountdao.updatePass(memberDTO);
         String rnd = "";
         if(result == 1) {
            char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C',
                    'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
                    'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '@', '%', '^', '&' };
              
            // 문자 배열 길이의 값을 랜덤으로 10개를 뽑아 구문을 작성함
            int idx = 0;
            for (int i = 0; i < 10; i++) {
               idx =  (int) (charSet.length * Math.random());
               rnd += charSet[idx];
            }
            //임시 비밀번호 확인하는 용도 성공해서 주석처리함
            //System.out.println("임시비번찍힘? : " + rnd);
         }
         else {
            //비밀번호 업데이트 실패시 출력
            System.out.println("비밀번호 업데이트 실패");
         }
           return rnd;
      }
        
       //비밀번호 찾기 
      @ResponseBody
      @RequestMapping("/updateuserPass")
      public String updatePass(MemberDTO memberDTO, HttpServletRequest req) {
          memberDTO.setMem_id(req.getParameter("mem_id"));
          memberDTO.setMem_pass(req.getParameter("mem_pass"));
          int result = accountdao.updateuserPass(memberDTO);
          
          if(result == 1) {
              mailService.mailSend(memberDTO);
          }
          else {
              System.out.println("비밀번호 찾기를 실패 하였습니다");
          }
          return "member/account/findpw";
      }
}
