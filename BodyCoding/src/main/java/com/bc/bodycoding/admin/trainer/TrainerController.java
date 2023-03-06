package com.bc.bodycoding.admin.trainer;

import java.io.File;
import java.security.Principal;
import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import global.dto.MemberDTO;

@Controller
public class TrainerController {
	
	@Autowired
	TrainerService trainerdao;
	
	//트레이너 등록 페이지로 이동
	@GetMapping("/admin/trainer/trainerRegist")
	public String signupT(Model model) {
		model.addAttribute("authority","trainer");
		return "admin/trainer/trainerRegist";
	}

	//회원가입 폼 받아서 실행
	@PostMapping("/trainerRegist.do")
	public String signupT2(MemberDTO memberDTO, HttpServletRequest req) {
		try {
			int size = 1024 * 1024 * 10; 
			String path = ResourceUtils
							.getFile("classpath:static/uploads/trainer")
							.toPath().toString();
			System.out.println("트레이너 사진 저장 경로:"+ path);
			
			MultipartRequest multi = new MultipartRequest(req, path, 
						size, "UTF-8", new DefaultFileRenamePolicy());
			
			Enumeration files = multi.getFileNames();
			String str = (String)files.nextElement();
			
//			System.out.println(multi.getParameter("mem_pass"));
//			String passwd = PasswordEncoderFactories.createDelegatingPasswordEncoder()
//					.encode(multi.getParameter("mem_pass"));
//			System.out.println(passwd);
			
			memberDTO.setMem_id(multi.getParameter("mem_id"));
			memberDTO.setMem_pass(multi.getParameter("mem_pass"));
			memberDTO.setMem_name(multi.getParameter("mem_name"));
			memberDTO.setMem_gender(multi.getParameter("mem_gender"));
			memberDTO.setMem_birth(multi.getParameter("mem_birth"));
			memberDTO.setMem_phone(multi.getParameter("mem_phone"));
			memberDTO.setMem_address(multi.getParameter("mem_address"));
			memberDTO.setGym_code(multi.getParameter("gym_code"));
			memberDTO.setMem_career(multi.getParameter("mem_career"));
			memberDTO.setMem_comment(multi.getParameter("mem_comment"));
			if(multi.getOriginalFileName(str)==null) {
				memberDTO.setMem_img("");
			}
			else {
				memberDTO.setMem_img(multi.getOriginalFileName(str));
			}
			System.out.println("파일 업로드 성공");
		}	
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("파일 업로드 실패");
		}
		
		int result = trainerdao.insertMemberT(memberDTO);
		if(result==1) System.out.println("회원가입이 완료되었습니다.");
		
		req.setAttribute("msg", "트레이너 등록이 완료되었습니다.");
		return "redirect:/trainerList.do";
	}
	
	//admin에서 트레이너목록 보여주기
	@RequestMapping("/trainerList.do")
	public String listT(Model model, MemberDTO memberDTO) {
		model.addAttribute("trainerList",trainerdao.selectGT(memberDTO));
		return "admin/trainer/trainerList";
	}
	
	//트레이너 상세보기
	@RequestMapping("/trainerDetail.do")
	public String detailT(Model model, MemberDTO memberDTO, HttpServletRequest req, Principal principal, HttpSession session) {
		memberDTO = trainerdao.selectOneT(memberDTO);
		model.addAttribute("trainerList", memberDTO);
		
		
		//시큐리티 로그인한 아이디 받아오기
		String userIdT = principal.getName();
		model.addAttribute("userIdT", userIdT);
		
//		admin.getGym_code();
		
		MemberDTO admin = trainerdao.selectAdmin(userIdT);
		System.out.println("잘 받아오는 지 확인해보자 "+ admin.getGym_code());
		
		model.addAttribute("adminGym", admin.getGym_code());
		
		
		return "admin/trainer/trainerDetail";
	}

	//수정하기
	@RequestMapping(value="/admin/trainer/trainerEdit", method=RequestMethod.GET)
	public String editT(Model model, MemberDTO memberDTO) {
		memberDTO = trainerdao.selectOneT(memberDTO);
		model.addAttribute("trainer", memberDTO);
		return "admin/trainer/trainerEdit";
	}
	
	@RequestMapping(value="/trainerEdit.do", method=RequestMethod.POST)
	public String editT(MemberDTO memberDTO, HttpServletRequest req) {
		try {
			int size = 1024 * 1024 * 10; 
			String path = ResourceUtils.getFile("classpath:static/uploads/trainer").toPath().toString();
			System.out.println("트레이너 사진 저장 경로:"+ path);
			
			MultipartRequest multi = new MultipartRequest(req, path, size, "UTF-8", new DefaultFileRenamePolicy());
			
			Enumeration files = multi.getFileNames();
			String str = (String)files.nextElement();
			
			String fpath = path + "/"+ multi.getParameter("mem_img");
			File file = new File(fpath);
			if(file.exists()) {
				file.delete();
			}
			
			System.out.println(multi.getParameter("mem_img"));
			System.out.println(multi.getOriginalFileName(str));
			
			memberDTO.setMem_id(multi.getParameter("mem_id"));
			memberDTO.setMem_pass(multi.getParameter("mem_pass"));
			memberDTO.setMem_name(multi.getParameter("mem_name"));
			memberDTO.setMem_gender(multi.getParameter("mem_gender"));
			memberDTO.setMem_birth(multi.getParameter("mem_birth"));
			memberDTO.setMem_phone(multi.getParameter("mem_phone"));
			memberDTO.setMem_address(multi.getParameter("mem_address"));
			memberDTO.setEnabled(multi.getParameter("enabled"));
			memberDTO.setGym_code(multi.getParameter("gym_code"));
			memberDTO.setMem_career(multi.getParameter("mem_career"));
			memberDTO.setMem_comment(multi.getParameter("mem_comment"));
			memberDTO.setMem_img(multi.getOriginalFileName(str));
			System.out.println("파일 업로드 성공");
		}	
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("파일 업로드 실패");
		}
		
		
		int result = trainerdao.update(memberDTO);
		System.out.println(result);
		if(result==1) System.out.println("수정되었습니다.");
		return "redirect:trainerList.do";
	}
	
	//삭제
	@RequestMapping("/trainerdelete.do")
	public String deleteT(MemberDTO memberDTO) {
		int result = trainerdao.deleteT(memberDTO);
	
			if(result==1) System.out.println("삭제되었습니다.");

		return "redirect:trainerList.do";
	}
}
