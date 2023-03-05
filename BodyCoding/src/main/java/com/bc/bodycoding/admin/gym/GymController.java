package com.bc.bodycoding.admin.gym;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
	public String gym7(GymDTO gymDTO, Model model, MemberDTO memberDTO) {
		gymDTO = gymdao.selectOnegym(gymDTO);
		memberDTO = gymdao.selectOneMember(memberDTO);
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
	public String registASUB2(MemberDTO memberDTO, GymDTO gymDTO, HttpServletRequest req) {
		try {
			int size = 1024 * 1024 * 10;
			String path = ResourceUtils.getFile("classpath:static/uploads/gym").toPath().toString();
			System.out.println("지점 상세이미지 저장경로 :" + path);
			MultipartRequest multi = new MultipartRequest(req, path, size, "UTF-8", new DefaultFileRenamePolicy());

			Enumeration files = multi.getFileNames();
			String str = (String)files.nextElement();

			if (str != null) {
				str = multi.getOriginalFileName(str);
			} else {
				str = "";
			}

			int count = gymdao.codeCheck(multi.getParameter("gym_code"));
			if (count == 1) {
				System.out.println("이미 등록된 지점입니다.");
				return "admin/gym/gymRegist";
			} else {

				System.out.println(multi.getParameter("mem_pass"));
				String passwd = PasswordEncoderFactories.createDelegatingPasswordEncoder()
						.encode(multi.getParameter("mem_pass"));
				System.out.println(passwd);

				memberDTO.setMem_id(multi.getParameter("mem_id"));
				memberDTO.setMem_pass(passwd);
				memberDTO.setMem_name(multi.getParameter("mem_name"));
				memberDTO.setMem_phone(multi.getParameter("mem_phone"));
				memberDTO.setMem_address(multi.getParameter("mem_address"));
				memberDTO.setGym_code(multi.getParameter("gym_code"));
				memberDTO.setAuthority(multi.getParameter("authority"));
				memberDTO.setEnabled(multi.getParameter("enabled"));
				memberDTO.setMem_comment(multi.getParameter("mem_comment"));
				memberDTO.setMem_img(str);
				System.out.println("파일 업로드 성공");
				System.out.println(str);
				int result1 = gymdao.insertMember1(memberDTO);
				int result = gymdao.insertMemberASUB(memberDTO);
				if (result == 1)
					System.out.println("등록이 완료되었습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("등록 실패했습니다.");
			return "redirect:/gymRegist.do";
		}
		return "redirect:/gymadminlist.do";
	}

	// 수정하기
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

	@Transactional
	@RequestMapping(value = "/gymedit.do", method = RequestMethod.POST)
	public String gym5(MultipartFile[] uploadfiles, Model model, MultipartHttpServletRequest req,
			GymDTO gymDTO, MemberDTO memberDTO) throws Exception {
		
		try {
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
	public String imgedit(Model model, MemberDTO memberDTO, HttpServletRequest req) {
		String str;
		try {
			int size = 1024 * 1024 * 10;
			String path = ResourceUtils.getFile("classpath:static/uploads/gym").toPath().toString();
			System.out.println("지점 상세이미지 저장경로 :" + path);
			MultipartRequest multi = new MultipartRequest(req, path, size, "UTF-8", new DefaultFileRenamePolicy());
			String oPath = path + "/" + multi.getParameter("o_mem_img");
			File file = new File(oPath);
			if(file.exists()) {
				file.delete();
			}
			Enumeration files = multi.getFileNames();
			str = (String)files.nextElement();

			if (str != null) {
				str = multi.getOriginalFileName(str);
			} else {
				str = "";
			}
			memberDTO.setMem_id(multi.getParameter("mem_id"));
			memberDTO.setMem_img(str);
			System.out.println("파일 업로드 성공");
			System.out.println(str);
		} 
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("수정 실패했습니다.");
			return "redirect:/gymDetail.do";
		}
		System.out.println(memberDTO);
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