package com.bc.bodycoding.admin.gym;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping("/gymview.do")
	public String gym7(GymDTO gymDTO, Model model) {
		gymDTO = gymdao.selectOne(gymDTO);
		model.addAttribute("dto", gymDTO);
		System.out.println(gymDTO);
		return "admin/gym/gymView";
	}
	
	//지점등록페이지
	@RequestMapping(value="/regist.do", method=RequestMethod.GET)
	public String gym2() {
		return "admin/gym/regist";
	}
	//지점등록
	@RequestMapping(value="/regist.do", method=RequestMethod.POST)
	public String gym3(GymDTO gymDTO) {
		int result = gymdao.insert(gymDTO);
		if(result==1) System.out.println("등록되었습니다.");
		return "redirect:gymadminlist.do";
	}
	
	//수정하기
	@RequestMapping(value="/gymedit.do", method=RequestMethod.GET)
	public String gym4(GymDTO gymDTO, Model model) {
		gymDTO = gymdao.selectOne(gymDTO);
		model.addAttribute("dto", gymDTO);
		System.out.println(gymDTO);
		return "admin/gym/edit";
	}
	@RequestMapping(value="/gymedit.do", method=RequestMethod.POST)
	public String gym5(GymDTO gymDTO) {
		int result = gymdao.update(gymDTO);
		if(result==1) System.out.println("수정되었습니다.");
		return "redirect:gymadminlist.do";
	}
	
	//삭제
	@RequestMapping("/gymdelete.do")
	public String gym6(GymDTO gymDTO) {
		int result = gymdao.delete(gymDTO);
		if(result==1) System.out.println("삭제되었습니다.");
		return "redirect:gymadminlist.do";
	}
}
