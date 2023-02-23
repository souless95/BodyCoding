package com.bc.bodycoding.admin.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.dto.ProductDTO;

@Controller
public class ProductController {

	@Autowired
	IProductService productdao;

	@RequestMapping("/productList.do")
	public String list(Model model) {
		model.addAttribute("pList", productdao.select());
		return "/admin/product/pList";
	}

	@RequestMapping(value = "/productRegist.do", method = RequestMethod.GET) 
	public String regist1() {
		return "/admin/product/pRegist";
	}
	
	@RequestMapping(value = "/productRegist.do", method = RequestMethod.POST)
	public String regist2(ProductDTO productDTO) {
		System.out.println("실행완료");
		int result = productdao.insert(productDTO);
		return "redirect:productList.do";
	}

	/*
	 * @RequestMapping("/pEdit.do") public String edit() {
	 * 
	 * }
	 */

}
