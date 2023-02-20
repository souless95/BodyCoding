package com.bc.bodycoding.admin.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	
	@Autowired  
	IProductService dao;
	
	@RequestMapping("/pList.do")
	public String list(Model model) {
		model.addAttribute("pList", dao.select());
		return "/admin/product/pList";
	}
	
	/*
	 * @RequestMapping("/pEdit.do") public String edit() {
	 * 
	 * }
	 */
	
	
	
}
