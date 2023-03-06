package com.bc.bodycoding.admin.trainer;

import java.io.File;
import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public String signupT2(MultipartFile mem_img, MemberDTO memberDTO, MultipartHttpServletRequest req) {
		try {
			String origName = mem_img.getOriginalFilename();
			String uuid = UUID.randomUUID().toString();
			String extension = origName.substring(origName.lastIndexOf("."));
			String savedName = uuid + extension;
			String path = ResourceUtils
							.getFile("classpath:static/uploads/trainer")
							.toPath().toString();
			System.out.println("트레이너 사진 저장 경로:"+ path);
			
			File fileInfo = new File(path, savedName);
			
			if(mem_img.isEmpty()) {
				memberDTO.setMem_img("");
			}
			else {
				mem_img.transferTo(fileInfo);
			}
			System.out.println("파일 업로드 성공");
			
			
			System.out.println(req.getParameter("mem_pass"));
			String passwd = PasswordEncoderFactories.createDelegatingPasswordEncoder()
					.encode(req.getParameter("mem_pass"));
			System.out.println(passwd);
			
			memberDTO.setMem_id(req.getParameter("mem_id"));
			memberDTO.setMem_pass(passwd);
			memberDTO.setMem_name(req.getParameter("mem_name"));
			memberDTO.setMem_gender(req.getParameter("mem_gender"));
			memberDTO.setMem_birth(req.getParameter("mem_birth"));
			memberDTO.setMem_phone(req.getParameter("mem_phone"));
			memberDTO.setMem_address(req.getParameter("mem_address"));
			memberDTO.setGym_code(req.getParameter("gym_code"));
			memberDTO.setMem_career(req.getParameter("mem_career"));
			memberDTO.setMem_comment(req.getParameter("mem_comment"));
			
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
	
	@RequestMapping("/trainerDetail.do")
	public String detailT(Model model, MemberDTO memberDTO, HttpServletRequest req) {
		memberDTO = trainerdao.selectOneT(memberDTO);
		model.addAttribute("trainerList",memberDTO);
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
	public String editT(MultipartFile mem_img, MemberDTO memberDTO, MultipartHttpServletRequest req) {
		try {
			String path = ResourceUtils.getFile("classpath:static/uploads/trainer").toPath().toString();
			System.out.println("트레이너 사진 저장 경로:"+ path);
			
			//기존에 있던값 삭제
			String fpath = path + "/"+ req.getParameter("mem_img");
			File file = new File(fpath);
			if(file.exists()) {
				file.delete();
			}
			
			String origName = mem_img.getOriginalFilename();
			String uuid = UUID.randomUUID().toString();
			String extension = origName.substring(origName.lastIndexOf("."));
			String savedName = uuid + extension;
			
			File fileInfo = new File(path, savedName);
			
			mem_img.transferTo(fileInfo);
			System.out.println("파일 업로드 성공");
			memberDTO.setMem_img(savedName);
			memberDTO.setMem_id(req.getParameter("mem_id"));
			memberDTO.setMem_pass(req.getParameter("mem_pass"));
			memberDTO.setMem_name(req.getParameter("mem_name"));
			memberDTO.setMem_gender(req.getParameter("mem_gender"));
			memberDTO.setMem_birth(req.getParameter("mem_birth"));
			memberDTO.setMem_phone(req.getParameter("mem_phone"));
			memberDTO.setMem_address(req.getParameter("mem_address"));
			memberDTO.setEnabled(req.getParameter("enabled"));
			memberDTO.setGym_code(req.getParameter("gym_code"));
			memberDTO.setMem_career(req.getParameter("mem_career"));
			memberDTO.setMem_comment(req.getParameter("mem_comment"));
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
