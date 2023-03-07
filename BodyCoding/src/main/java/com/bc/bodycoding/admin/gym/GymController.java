package com.bc.bodycoding.admin.gym;

import java.io.File;
import java.security.Principal;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import global.dto.GymDTO;
import global.dto.MemberDTO;

@Controller
public class GymController {
	
	@Autowired
	GymService gymdao;

	// 지점리스트
	@RequestMapping("/gymadminlist.do")
	public String gym1(Model model) {
		model.addAttribute("gymList", gymdao.select());
		return "admin/gym/gymList";
	}

	// 상세보기
	@RequestMapping("/gymdetail.do")
	public String gym7(GymDTO gymDTO, Model model, MemberDTO memberDTO, Principal principal) {
		memberDTO = gymdao.selectOneMember(memberDTO);
		gymDTO = gymdao.selectOnegym(gymDTO);
		
		String userIdG = principal.getName();		
		model.addAttribute("userIdG", userIdG);
		
		model.addAttribute("memList", memberDTO);
		model.addAttribute("dto", gymDTO);

		return "admin/gym/gymDetail";
	}

	// 지점 등록페이지로 이동
	@RequestMapping("/admin/gym/gymRegist")
	public String registASUB(Model model) {
		
		return "admin/gym/gymRegist";
	}

	// 지점 등록 폼 받아서 등록
	@RequestMapping(value = "/gymRegist.do", method = RequestMethod.POST)
	@Transactional
	public String registASUB2(MultipartFile mem_img, MultipartHttpServletRequest req) {
		
		int count = gymdao.codeCheck(req.getParameter("gym_code"));
		MemberDTO memberDTO = new MemberDTO();
		if (count == 1) {
			System.out.println("이미 등록된 지점입니다.");
			return "admin/gym/gymRegist";
		} 
		else {
			if(mem_img.isEmpty()) {
				memberDTO.setMem_img("");
			}
			else {
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
				
					mem_img.transferTo(fileInfo);
					memberDTO.setMem_img(savedName);
					System.out.println("파일 업로드 성공");
				} 
				catch (Exception e) {
					e.printStackTrace();
					System.out.println("등록 실패했습니다.");
					return "redirect:/gymRegist.do";
				}
			}
			
			String passwd = PasswordEncoderFactories.createDelegatingPasswordEncoder()
					.encode(req.getParameter("mem_pass"));
			memberDTO.setMem_pass(passwd);
			memberDTO.setMem_id(req.getParameter("mem_id"));
			memberDTO.setMem_name(req.getParameter("mem_name"));
			memberDTO.setMem_phone(req.getParameter("mem_phone"));
			memberDTO.setMem_address(req.getParameter("mem_address"));
			memberDTO.setGym_code(req.getParameter("gym_code"));
			memberDTO.setAuthority(req.getParameter("authority"));
			memberDTO.setEnabled(req.getParameter("enabled"));
			memberDTO.setMem_comment(req.getParameter("mem_comment"));
			
			//gym_detail에 gym_code등록
			int result1 = gymdao.insertMember1(memberDTO);
			//member에 정보 등록
			int result = gymdao.insertMemberASUB(memberDTO);
			if (result == 1) {
				System.out.println("지점등록 완료");
				return "redirect:/gymadminlist.do";
			}
			else {
				System.out.println("지점등록 실패");
				return "redirect:/gymRegist.do";
			}
		}
	}
	
	@RequestMapping(value = "/admin/auth/updatePwd", method = RequestMethod.GET)
	public String adminPwd(Model model, MemberDTO memberDTO) {
		memberDTO = gymdao.selectOneAdmin(memberDTO);
		model.addAttribute("memList", memberDTO);
		System.out.println(memberDTO);
		return "admin/auth/updatePwd";
	}

	// 지점 내용 수정하기 접근
	@RequestMapping(value = "/admin/gym/gymEdit", method = RequestMethod.GET)
	public String gym4(GymDTO gymDTO, Model model, MemberDTO memberDTO) {
		gymDTO = gymdao.selectOnegym(gymDTO);
		memberDTO = gymdao.selectOneMember(memberDTO);
		model.addAttribute("dto", gymDTO);
		model.addAttribute("memList", memberDTO);
		System.out.println(gymDTO);
		System.out.println(memberDTO);
		return "admin/gym/gymEdit";
	}

	//지점 내용 수정
	@Transactional
	@RequestMapping(value = "/gymedit.do", method = RequestMethod.POST)
	public String gym5(MultipartFile[] uploadfiles, Model model, MultipartHttpServletRequest req,
			GymDTO gymDTO, MemberDTO memberDTO) throws Exception {
		
		try {
			
//			암호화된 비밀번호 변경용 
			System.out.println(req.getParameter("mem_pass")); 
			String passwd = PasswordEncoderFactories.createDelegatingPasswordEncoder()
					.encode(req.getParameter("mem_pass")); System.out.println(passwd);
			memberDTO.setMem_pass(passwd);
			
			int result1 = gymdao.updateM(memberDTO);
			int result;
			
			String GYM_DTAIL_IMG = "";
			if(uploadfiles[0].isEmpty()) {
				result = gymdao.update2(gymDTO);
			}
			else {
				for(MultipartFile f: uploadfiles) {
					System.out.println("파일 이름(uploadfile.getOriginalFilename()) : "+ f.getOriginalFilename());
					System.out.println("파일 크기(uploadfile.getSize()) : "+ f.getSize());
					GYM_DTAIL_IMG += saveFile(f) + ",";
				}
				GYM_DTAIL_IMG = GYM_DTAIL_IMG.substring(0, GYM_DTAIL_IMG.length()-1);
				gymDTO.setGym_dtail_img(GYM_DTAIL_IMG);
				result = gymdao.update(gymDTO);
			}
			
			if (result == 1 && result1 == 1)
				System.out.println("수정되었습니다.");
			else {
				System.out.println("뭔가 잘 안됏읍니다.");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/gymadminlist.do";
	}
	
	public String saveFile(MultipartFile file) {
		UUID uuid = UUID.randomUUID();
		String saveName = uuid + "_" + file.getOriginalFilename();
		
		String path = "";
		try {
			path = ResourceUtils
				.getFile("classpath:static/uploads/gym/").toPath().toString();
			System.out.println("물리적경로2:"+path);
			File fileInfo = new File(path, saveName); // 저장할 폴더 경로, 저장할 파일 이름
			file.transferTo(fileInfo); // 업로드 파일에 fileInfo이라는 정보를 추가하여 파일을 저장한다.
		} 
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return saveName;
	} 
		
	//메인 이미지 수정
	@RequestMapping("/mimgedit.do")
	@ResponseBody
	public String imgedit(MultipartFile mem_img, MultipartHttpServletRequest req) {
		
		String str="";
		String path="";
		MemberDTO memberDTO = new MemberDTO();
		try {
			System.out.println(req.getParameter("o_mem_img"));
			//기존에 있던값 삭제
			path = ResourceUtils.getFile("classpath:static/uploads/gym").toPath().toString();
			System.out.println("지점 상세이미지 저장경로:"+ path);
			String fpath = path + "/"+ req.getParameter("o_mem_img");
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
			memberDTO.setMem_img(savedName);
			memberDTO.setMem_id(req.getParameter("mem_id"));
			str = savedName;
			System.out.println("파일업로드 성공");
			
		}
		catch (Exception e) {
			e.printStackTrace();
			str = req.getParameter("o_mem_img");
			System.out.println("파일업로드 실패");
		}
			
		
		//		String str;
//		try {
//			int size = 1024 * 1024 * 10;
//			String path = ResourceUtils.getFile("classpath:static/uploads/gym").toPath().toString();
//			System.out.println("지점 상세이미지 저장경로 :" + path);
//			MultipartRequest multi = new MultipartRequest(req, path, size, "UTF-8", new DefaultFileRenamePolicy());
//			String oPath = path + "/" + multi.getParameter("o_mem_img");
//			File file = new File(oPath);
//			if(file.exists()) {
//				file.delete();
//			}
//			Enumeration files = multi.getFileNames();
//			str = (String)files.nextElement();
//
//			if (str != null) {
//				str = multi.getOriginalFileName(str);
//			} else {
//				str = "";
//			}
//			memberDTO.setMem_id(multi.getParameter("mem_id"));
//			memberDTO.setMem_img(str);
//			System.out.println("파일 업로드 성공");
//			System.out.println(str);
//		} 
//		catch (Exception e) {
//			e.printStackTrace();
//			System.out.println("수정 실패했습니다.");
//			return "redirect:/gymDetail.do";
//		}
//		System.out.println(memberDTO);
		int result = gymdao.updateImg(memberDTO);
		if(result==1) System.out.println("수정되었습니다.");
		return str;
	}

	// 삭제
	@RequestMapping("/gymdelete.do")
	public String gym6(GymDTO gymDTO, MemberDTO memberDTO) {
		int result1 = gymdao.deleteM(memberDTO);
		int result = gymdao.delete(gymDTO);
		if (result == 1)
			System.out.println("삭제되었습니다.");
		return "redirect:/gymadminlist.do";
	}

}