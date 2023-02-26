package com.bc.bodycoding.purchase;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import global.dto.ProductDTO;

@Controller
public class PurchaseController {
	
	@Autowired
	IPurchaseService purchaseDao;
	
	@RequestMapping("/membershipPurchase.do")
	public String purchaseHome(Model model) {
		model.addAttribute("gymList",purchaseDao.gymSelect());
		return "/member/purchase/purchase";
	}
	
	@ResponseBody
	@RequestMapping("/productLoad.do")
	public List<ProductDTO> productLoad(ProductDTO productDTO) {
		List<ProductDTO> pList;
		pList = purchaseDao.productSelect(productDTO);
		return pList;
	}
	
	//미춰버려... 왜 안돼!!!
	@ResponseBody
	@RequestMapping("/trainerLoad.do")
	public List<ProductDTO> trainerLoad(HttpServletRequest req) {
		System.out.println("메서드 진입");
		System.out.println("짐코드:"+req.getParameter("gym_code"));
		System.out.println("분류:"+req.getParameter("product_category"));
		
		ProductDTO productDTO = new ProductDTO();
		productDTO.setGym_code(req.getParameter("gym_code"));
		productDTO.setProduct_category("헬스");
		
		List<ProductDTO> tList;
		tList = purchaseDao.trainerSelect(productDTO);
		return tList;
	}
	
	@RequestMapping("/purchase.do")
	public String purchase() {
		
		return "/member/purchase/purchaseDone";
	}
}
