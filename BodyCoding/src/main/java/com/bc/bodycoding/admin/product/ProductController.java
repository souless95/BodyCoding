package com.bc.bodycoding.admin.product;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import global.dto.ProductDTO;

@Controller
public class ProductController {

	@Autowired
	IProductService productdao;

	@RequestMapping("/productList.do")
	public String plist(Model model) {
		model.addAttribute("pList", productdao.select());
		return "/admin/product/productList";
	}

	@RequestMapping(value = "/admin/product/productReigst", method = RequestMethod.GET)
	public String regiForm() {
		return "/admin/product/productRegist";
	}

	@RequestMapping(value = "/productRegist.do", method = RequestMethod.POST)
	public String regiAction(HttpServletRequest req) {
		
		int size = 1024 * 1024 * 10;
		
		ProductDTO productDTO = new ProductDTO();
		
		try {
			String path = ResourceUtils
					.getFile("classpath:static/uploads/product/")
					.toPath().toString();
			MultipartRequest multi = new MultipartRequest(req, path, 
					size, "UTF-8", new DefaultFileRenamePolicy());
			
			Enumeration files = multi.getFileNames();
				
			String str = (String)files.nextElement();
	           
			if(str == null) {
				str = multi.getOriginalFileName(str);
			}
			else {
				str = "";
			}
			
			productDTO.setProduct_img(str);
			productDTO.setProduct_type(multi.getParameter("product_type"));
			productDTO.setProduct_category(multi.getParameter("product_category"));
			productDTO.setMembership_period(Integer.parseInt(multi.getParameter("membership_period")));
			productDTO.setMembership_count(Integer.parseInt(multi.getParameter("membership_count")));
			productDTO.setProduct_name(multi.getParameter("product_name"));
			productDTO.setProduct_description(multi.getParameter("product_description"));
			productDTO.setProduct_price(Integer.parseInt(multi.getParameter("product_price")));
			
			int result = productdao.insert(productDTO);
			System.out.println("실행완료");
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:productList.do";
	}
	
	
	@GetMapping("/productEdit.do") 
	public String editForm(ProductDTO productDTO, Model model) {
		productDTO = productdao.selectOne(productDTO);
		model.addAttribute("dto",productDTO);
		return "/admin/product/productEdit";
	}
	
	@PostMapping("/productEdit.do") 
	public String editAction(HttpServletRequest req) {
		
		int size = 1024 * 1024 * 10;
		
		ProductDTO productDTO = new ProductDTO();
		
		try {
			String path = ResourceUtils
					.getFile("classpath:static/uploads/product/")
					.toPath().toString();
			
			//기존에 업로드된 이미지 파일 있는지 확인 후 삭제
			String oPath = path+"/"+req.getParameter("o_product_img");
			File file = new File(oPath);
			if(file.exists()) {
				file.delete();
			}
			
			//파일 등록 로직과 동일
			MultipartRequest multi = new MultipartRequest(req, path, 
					size, "UTF-8", new DefaultFileRenamePolicy());
			
			Enumeration files = multi.getFileNames();
				
			String str = (String)files.nextElement();
			
			if(str == null) {
				str = multi.getOriginalFileName(str);
			}
			else {
				str = "";
			}
			
			productDTO.setProduct_img(str);
			productDTO.setProduct_type(multi.getParameter("product_type"));
			productDTO.setProduct_category(multi.getParameter("product_category"));
			productDTO.setMembership_period(Integer.parseInt(multi.getParameter("membership_period")));
			productDTO.setMembership_count(Integer.parseInt(multi.getParameter("membership_count")));
			productDTO.setProduct_name(multi.getParameter("product_name"));
			productDTO.setProduct_description(multi.getParameter("product_description"));
			productDTO.setProduct_price(Integer.parseInt(multi.getParameter("product_price")));
			
			int result = productdao.update(productDTO);
			System.out.println("실행완료");
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:productList.do";
	}
	
	//재고관리 리스트
	@RequestMapping(value="/admin/product/stockList")
	public String slist(Model model) {
		model.addAttribute("sList", productdao.stockSelect());
		return "/admin/product/stockList";
	}
	
	@ResponseBody
	@RequestMapping(value="/stockUpdate.do", method = RequestMethod.POST)
	public String sUpdate(@RequestBody ProductDTO productDTO, Model model) {
		System.out.println(productDTO);
		int result = productdao.stockUpdate(productDTO);
		if(result==1) {
			System.out.println("업데이트 성공!");
		}
		return "";
	}       
	
	@ResponseBody
	@RequestMapping(value="/stockInsert.do", method = RequestMethod.POST)
	public String sInsert(@RequestBody ProductDTO productDTO) {
		int result = productdao.stockInsert(productDTO);
		if(result==1) {
			System.out.println("인서트 성공!");
		}
		return "";
	}

}
