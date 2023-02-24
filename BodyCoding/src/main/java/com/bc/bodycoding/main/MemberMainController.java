package com.bc.bodycoding.main;


import java.net.http.HttpRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import global.dto.MemberDTO;
import global.dto.ProductDTO;

@Controller
public class MemberMainController {
	@Autowired
	MemberMainService maindao;
	
	//회원창에서 트레이너 목록 페이지로 가기(지점선택 select박스관련)
	@RequestMapping("trainer")
	public String trainerpage(Model model) {
		model.addAttribute("gymList",maindao.gymlistSelect());
		return "member/main/trainer";
	}
	//회원창에서 트레이너 목록 보여주기
	@RequestMapping("/trainer.do")
	@ResponseBody
	public List<MemberDTO> trainer(String gym_code) {
		List<MemberDTO> trainerList;
		if(gym_code.equals("-")) {
			trainerList = maindao.trainerALLlistSelect();
		}
		else {
			trainerList = maindao.trainerlistSelect(gym_code);
		}
		return trainerList;
	}	
	
	//회원창에서 트레이너 상세정보 보여주기
	@RequestMapping("trainerInfo")
	public String trainerInfo(Model model, MemberDTO memberDTO) {
		model.addAttribute("gymInfo",maindao.gymInfoSelect(memberDTO));
		model.addAttribute("trainerInfo", maindao.trainerInfoSelect(memberDTO));
		System.out.println(maindao.trainerInfoSelect(memberDTO));
		return "member/main/trainerInfo";
	}
	
	//회원창에서 상품 목록 페이지로 가기
	@RequestMapping("product")
	public String productpage() {
		return "member/main/product";
	}
	
	//회원창에서 상품 목록 보여주기
	@RequestMapping("product.do")
	@ResponseBody
	public List<ProductDTO> product(String product_type){
		List<ProductDTO> productlist;
		if(product_type.equals("-")) {
			productlist = maindao.product_categoryALLSelect();
		}
		else {
			System.out.println("11111");
			productlist = maindao.product_categorySelect(product_type);
			System.out.println("22222");
		}
		return productlist;
	}
	
	//회원창에서 상품 상세정보 보여주기
	@RequestMapping("productInfo")
	public String productInfo(Model model, HttpServletRequest req) {
		int product_idx = Integer.parseInt(req.getParameter("product_idx"));
		model.addAttribute("productInfo",maindao.productInfoSelect(product_idx));
		return "member/main/productInfo";
	}
	
}
