package com.bc.bodycoding.admin.product;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.dto.ProductDTO;

@Controller
public class ProductController {

	@Autowired
	IProductService productdao;

	@RequestMapping("/productList.do")
	public String plist(Model model) {
		model.addAttribute("pList", productdao.select());
		return "/admin/product/pList";
	}

	@RequestMapping(value = "/productRegist.do", method = RequestMethod.GET)
	public String regiForm() {
		return "/admin/product/pRegist";
	}

	@RequestMapping(value = "/productRegist.do", method = RequestMethod.POST)
	public String regiAction(ProductDTO productDTO) {
		System.out.println("실행완료");
		int result = productdao.insert(productDTO);
		return "redirect:productList.do";
	}
	
	
	@RequestMapping("/productEdit.do") 
	public String editForm(ProductDTO productDTO, Model model) {
		productDTO = productdao.selectOne(productDTO);
		model.addAttribute("dto",productDTO);
		return "/admin/product/pEdit";
	}
	
	@RequestMapping(value="/productEdit.do", method=RequestMethod.POST) 
	public String editAction(ProductDTO productDTO) {
		int result = productdao.update(productDTO);
		return "redirect:productList.do";
	}
	
	@RequestMapping(value="/stockList.do")
	public String slist(Model model) {
		model.addAttribute("sList", productdao.stockSelect());
		return "/admin/product/stockList";
	}
	
	@ResponseBody
	@RequestMapping(value="/stockUpdate.do", method = RequestMethod.POST)
	public String sUpdate(@RequestBody ProductDTO productDTO) {
		int result = productdao.stockUpdate(productDTO);
		if(result==1) {
			System.out.println("업데이트 성공!");
		}
		return "/admin/product/stockList";
	}
	
	@ResponseBody
	@RequestMapping(value="/stockInsert.do", method = RequestMethod.POST)
	public String sInsert(@RequestBody ProductDTO productDTO) {
		int result = productdao.stockInsert(productDTO);
		if(result==1) {
			System.out.println("인서트 성공!");
		}
		return "/admin/product/stockList";
	}

}
