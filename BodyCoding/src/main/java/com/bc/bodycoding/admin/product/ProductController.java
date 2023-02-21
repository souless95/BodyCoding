package com.bc.bodycoding.admin.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

	@Autowired
	IProductService productdao;

	@RequestMapping("/pList.do")
	public String list(Model model) {
		model.addAttribute("pList", productdao.select());
		return "/admin/product/pList";
	}

	@RequestMapping("/pRegist.do") 
	public String regist(ProductDTO productDTO) {
		return "/admin/product/pRegist";
	}
	

	/*
	 * @RequestMapping("/pEdit.do") public String edit() {
	 * 
	 * }
	 */

}
