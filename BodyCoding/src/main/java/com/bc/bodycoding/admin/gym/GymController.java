package com.bc.bodycoding.admin.gym;


import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import global.dto.GymDTO;
import global.dto.MemberDTO;

@Controller
public class GymController {

	@Autowired
	GymService gymdao;
	
	//지점리스트
	@RequestMapping("/gymadminlist.do")
	public String gym1(Model model) {
		model.addAttribute("gymList", gymdao.select());
		return "admin/gym/gymList";
	}	
	//상세보기
	@RequestMapping("/gymdetail.do")
	public String gym7(GymDTO gymDTO, Model model, MemberDTO memberDTO, HttpServletRequest req) {
		try {
			String path = ResourceUtils.getFile("classpath:static/uploads/").toPath().toString();
			Map<String, Integer> fileMap = new HashMap<String, Integer>();
			
			File file = new File(path);
			File[] fileArray = file.listFiles();
			for(File f : fileArray) {
				fileMap.put(f.getName(), (int)Math.ceil(f.length()/1024.0));
			}
			model.addAttribute("fileMap", fileMap);
		} catch (Exception e) {}
		
		gymDTO = gymdao.selectOnegym(gymDTO);
		memberDTO = gymdao.selectOneMember(memberDTO);
		model.addAttribute("memList", memberDTO);
		model.addAttribute("dto", gymDTO);
		System.out.println(memberDTO);
		System.out.println(gymDTO);
		
		return "admin/gym/gymDetail";
	}
	
	//수정하기
	@RequestMapping(value="/gymedit.do", method=RequestMethod.GET)
<<<<<<< HEAD
	public String gym4(GymDTO gymDTO, Model model) {
		String rootPath = System.getProperty("user.dir");
		//파일 경로
		String fileDir = rootPath + "\\src\\main\\resources\\static\\uploads";
		System.out.println("fileDir="+fileDir);
		try {
			String path = ResourceUtils.getFile("classpath:static/uploads/").toPath().toString();
		} catch (Exception e) {}
		
=======
	public String gym4(GymDTO gymDTO, Model model, MemberDTO memberDTO) {
>>>>>>> branch 'main' of https://github.com/souless95/BodyCoding.git
		gymDTO = gymdao.selectOnegym(gymDTO);
		memberDTO = gymdao.selectOneMember(memberDTO);
		model.addAttribute("dto", gymDTO);
		model.addAttribute("memList", memberDTO);
		System.out.println(memberDTO);
		System.out.println(gymDTO);
		return "admin/gym/gymEdit";
	}
	@RequestMapping(value="/gymedit.do", method=RequestMethod.POST)
	public String gym5(GymDTO gymDTO, HttpServletRequest req) {
		int size = 1024 * 1024 * 10; //10메가
		//Map 생성
		Map<String, Object> fileMap = new HashMap<>();
		try {
			//ResourceUtils : 파일을 불러올때 쓰는것같음(사실 잘 모름 아는사람 알려주셈)
			String path = ResourceUtils.getFile("classpath:static/uploads/").toPath().toString();
			//DefaultFileRenamePolicy : 똑같은 이름이 있을때 이름뒤에 1,2,3을 자동으로 붙여줌
			MultipartRequest multi = new MultipartRequest(req, path,
					size, "UTF-8", new DefaultFileRenamePolicy());
			
			//List 컬렉션 생성
			List<Map<String, String>> fileLists = new ArrayList<>();
			//Enumeration : 데이터를 한번에 출력할수잇게 해준다는데 이것도 잘모름
			Enumeration files = multi.getFileNames();
			while(files.hasMoreElements()) {
				//파일을 선택했던 input의 name속성을 가져온다.
				String str = (String)files.nextElement();
				
				//Map객체에 원본파일명과 저장된파일명을 저장한다.
				Map<String, String> fileObj = new HashMap<>();
				fileObj.put("gym_dtail_img", multi.getFilesystemName(str));
				
				//Map배열에 파일 하나의 정보를 추가한다.
				fileLists.add(fileObj);
			}
			//Map 컬렉션에 저장
			fileMap.put("fileLists", fileLists);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(fileMap);
//		int resultimg = gymdao.updateimg(fileMap);
		int result = gymdao.update(gymDTO);
		if(result==1) System.out.println("수정되었습니다.");
		return "redirect:/gymadminlist.do";
	}
	
	//지점 등록페이지로 이동
	@GetMapping("/gymRegist.do")
	public String  registASUB(Model model) {
		model.addAttribute("mem_type","admin_sub");
		return "admin/gym/gymRegist";
	}
	
	//지점 등록 폼 받아서 등록
	@PostMapping("/gymRegist.do")
	@Transactional
	public String registASUB2(MemberDTO memberDTO, GymDTO gymDTO) {
		try {
			int count = gymdao.codeCheck(gymDTO);
			if(count==1) { 
				System.out.println("이미 등록된 지점입니다.");
				return "admin/gym/gymRegist";
			}
			else {
				int result1 = gymdao.insertMember1(gymDTO);
				int result = gymdao.insertMemberASUB(memberDTO);
				if(result==1) System.out.println("회원가입이 완료되었습니다.");
				return "redirect:/gymadminlist.do";
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("안됨 ㅋ");
			return "redirect:/gymRegist.do";
		}
	}
	
	//삭제
	@RequestMapping("/gymdelete.do")
	public String gym6(GymDTO gymDTO, MemberDTO memberDTO) {
		int result1 = gymdao.deleteM(memberDTO);
		int result = gymdao.delete(gymDTO);
		if(result==1) System.out.println("삭제되었습니다.");
		return "redirect:/gymadminlist.do";
	}
	
	
	
}
