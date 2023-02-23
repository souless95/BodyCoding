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
	//상세보기(여기 try문 부터 파일업로드 연습임)
	@RequestMapping("/gymdetail.do")
	public String gym7(GymDTO gymDTO, Model model, MemberDTO memberDTO) {
		gymDTO = gymdao.selectOnegym(gymDTO);
		memberDTO = gymdao.selectOneMember(memberDTO);
		model.addAttribute("memList", memberDTO);
		model.addAttribute("dto", gymDTO);
		System.out.println(memberDTO);
		System.out.println(gymDTO);
		
		try {
			String path = ResourceUtils
					.getFile("classpath:static/uploads/").toPath().toString();
			Map<String, Integer> fileMap = new HashMap<String, Integer>();
			
			File file = new File(path);
			File[] fileArray = file.listFiles();
			for(File f : fileArray) {
				//저장된 파일명, 파일 용량을 Map에 저장한다.
				fileMap.put(f.getName(), (int)Math.ceil(f.length()/1024.0));
			}
			model.addAttribute("fileMap", fileMap);
		}
		catch (Exception e) {}
		
		return "admin/gym/gymDetail";
	}
	
	//수정하기
	@RequestMapping(value="/gymedit.do", method=RequestMethod.GET)
	public String gym4(GymDTO gymDTO, Model model) {
		gymDTO = gymdao.selectOnegym(gymDTO);
		model.addAttribute("dto", gymDTO);
		System.out.println(gymDTO);
		return "admin/gym/gymEdit";
	}
	@RequestMapping(value="/gymedit.do", method=RequestMethod.POST)
	public String gym5(GymDTO gymDTO, HttpServletRequest req) {
		int result = gymdao.update(gymDTO);
		if(result==1) System.out.println("수정되었습니다.");
		
		//여기부터 파일업로드 연습임
		int size = 1024 * 1024 * 10; //10M
		
		Map<String, Object> fileMap = new HashMap<>();
		try {
			String path = ResourceUtils
					.getFile("classpath:static/uploads/")
					.toPath().toString();
			System.out.println("물리적경로2:"+path);
			
			MultipartRequest multi = new MultipartRequest(req, path,
					size, "UTF-8", new DefaultFileRenamePolicy());
			
			List<Map<String, String>> fileLists = new ArrayList<>();
			Enumeration files = multi.getFileNames();
			while(files.hasMoreElements()) {
				//파일을 선택했던 input의 name속성을 가져온다.
				String str = (String)files.nextElement();
				
				//JSON객체에 원본파일명과 저장된 파일명을 저장한다.
				Map<String, String> fileObj = new HashMap<>();
				fileObj.put("oriFile", multi.getOriginalFileName(str));
				fileObj.put("saveFile", multi.getFilesystemName(str));
				
				//JSON배열에 파일 하나의 정보를 추가한다.
				fileLists.add(fileObj);
			}
			
			//첨부파일 외 폼값받기
			String title = multi.getParameter("title");
			
			//Map 컬렉션에 모든 정보를 저장한다.
			fileMap.put("fileLists", fileLists);
			fileMap.put("title", title);
			fileMap.put("isSuccess", 1);
			fileMap.put("desc", "업로드 성공");
		} catch (Exception e) {
			e.printStackTrace();
			
			fileMap.put("isSuccess", 0);
			fileMap.put("desc", "업로드 실패");
		}
		
		//해당 정보는 차후 DB에 저장해야 한다.
		System.out.println(fileMap);
		//여기까지 업로드연습임
		
		return "redirect:/admin/gym/gymadminlist.do";
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
				return "redirect:/admin/gym/gymadminlist.do";
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
		return "redirect:/admin/gym/gymadminlist.do";
	}
	
	//파일업로드
	@RequestMapping(value="/fileUpload.do", method=RequestMethod.GET)
	public String upload1() {
		return "admin/gym/gymEdit";
	}
//	@RequestMapping(value="/fileUpload2.do", method=RequestMethod.POST)
//	public String upload2(HttpServletRequest req) {
//		int size = 1024 * 1024 * 10; //10M
//		
//		Map<String, Object> fileMap = new HashMap<>();
//		try {
//			String path = ResourceUtils
//					.getFile("classpath:static/uploads/")
//					.toPath().toString();
//			System.out.println("물리적경로2:"+path);
//			
//			MultipartRequest multi = new MultipartRequest(req, path,
//					size, "UTF-8", new DefaultFileRenamePolicy());
//			
//			List<Map<String, String>> fileLists = new ArrayList<>();
//			Enumeration files = multi.getFileNames();
//			while(files.hasMoreElements()) {
//				//파일을 선택했던 input의 name속성을 가져온다.
//				String str = (String)files.nextElement();
//				
//				//JSON객체에 원본파일명과 저장된 파일명을 저장한다.
//				Map<String, String> fileObj = new HashMap<>();
//				fileObj.put("oriFile", multi.getOriginalFileName(str));
//				fileObj.put("saveFile", multi.getFilesystemName(str));
//				
//				//JSON배열에 파일 하나의 정보를 추가한다.
//				fileLists.add(fileObj);
//			}
//			
//			//첨부파일 외 폼값받기
//			String title = multi.getParameter("title");
//			
//			//Map 컬렉션에 모든 정보를 저장한다.
//			fileMap.put("fileLists", fileLists);
//			fileMap.put("title", title);
//			fileMap.put("isSuccess", 1);
//			fileMap.put("desc", "업로드 성공");
//		} catch (Exception e) {
//			e.printStackTrace();
//			
//			fileMap.put("isSuccess", 0);
//			fileMap.put("desc", "업로드 실패");
//		}
//		
//		//해당 정보는 차후 DB에 저장해야 한다.
//		System.out.println(fileMap);
//		return "redirect:admin/gym/gymDetail";
//	}
	
//	@RequestMapping(value="/flieList.do")
//	public String upload3(HttpServletRequest req, Model model) {
//		try {
//			String path = ResourceUtils
//					.getFile("classpath:static/uploads/").toPath().toString();
//			Map<String, Integer> fileMap = new HashMap<String, Integer>();
//			
//			File file = new File(path);
//			File[] fileArray = file.listFiles();
//			for(File f : fileArray) {
//				//저장된 파일명, 파일 용량을 Map에 저장한다.
//				fileMap.put(f.getName(), (int)Math.ceil(f.length()/1024.0));
//			}
//			model.addAttribute("fileMap", fileMap);
//		}
//		catch (Exception e) {}
//		
//		return "admin/gym/gymDetail";
//	}
}
