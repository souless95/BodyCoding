package com.bc.bodycoding.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GymController {

	@Autowired
	GymService dao;
	
	@RequestMapping("list.do")
	public String gym1(Model model) {
		model.addAttribute("gymList", dao.select());
		return "admin/list";
	}
}
