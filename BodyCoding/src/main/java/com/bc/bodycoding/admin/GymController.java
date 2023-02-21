package com.bc.bodycoding.admin;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import util.PagingUtil;


@Controller
public class GymController {

	@Autowired
	GymService dao;
	@Autowired
	SqlSession sqlSession;
	
	//지점리스트
	@RequestMapping("/list.do")
	public String gym1(Model model) {
		model.addAttribute("gymList", dao.select());
		return "admin/GymList";
	}	
	
	@RequestMapping("/view.do")
	public String gym7(GymDTO gymDTO, Model model) {
		gymDTO = dao.selectOne(gymDTO);
		model.addAttribute("gymView", gymDTO);
		return "admin/GymView";
	}
	
	//지점등록페이지
	@RequestMapping(value="/regist.do", method=RequestMethod.GET)
	public String gym2() {
		return "admin/regist";
	}
	//지점등록
	@RequestMapping(value="/regist.do", method=RequestMethod.POST)
	public String gym3(GymDTO gymDTO) {
		int result = dao.insert(gymDTO);
		if(result==1) System.out.println("등록되었습니다.");
		return "redirect:list.do";
	}
	
	//수정하기
	@RequestMapping(value="/edit.do", method=RequestMethod.GET)
	public String gym4(GymDTO gymDTO, Model model) {
		gymDTO = dao.selectOne(gymDTO);
		model.addAttribute("dto", gymDTO);
		System.out.println(gymDTO);
		return "admin/edit";
	}
	@RequestMapping(value="/edit.do", method=RequestMethod.POST)
	public String gym5(GymDTO gymDTO) {
		int result = dao.update(gymDTO);
		if(result==1) System.out.println("수정되었습니다.");
		return "redirect:list.do";
	}
	
	//삭제
	@RequestMapping("/delete.do")
	public String gym6(GymDTO gymDTO) {
		int result = dao.delete(gymDTO);
		if(result==1) System.out.println("삭제되었습니다.");
		return "redirect:list.do";
	}
}
