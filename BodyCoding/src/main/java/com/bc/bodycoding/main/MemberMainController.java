package com.bc.bodycoding.main;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import global.dto.ReviewDTO;

@Controller
public class MemberMainController {
	@Autowired
	MemberMainService maindao;
	
	//회원창에서 지점 정보보기
	@RequestMapping("gym")
	public String gym(Model model) {
		model.addAttribute("gymList",maindao.gymlistSelect());
		return "member/main/gym";
	}
	
	//회원창에서 검색된 지점 정보보기
	@RequestMapping("/gymSearch.do")
	@ResponseBody
	public List<MemberDTO> gymSearch(String searchWord) {
		List<MemberDTO> gymList;
		gymList = maindao.gymlistSearch(searchWord);
		System.out.println(gymList);
		return gymList;
	}
	
	//회원창에서 체크된 지점 정보보기
	@RequestMapping("/gymCheck.do")
	@ResponseBody
	public List<MemberDTO> gymCheck(HttpServletRequest req) {
		List<MemberDTO> checkgymList;
		Map<String, String> checkList = new HashMap<>();
		checkList.put("facility_parking", "N");
		checkList.put("facility_health", "N");
		checkList.put("facility_yoga", "N");
		checkList.put("facility_gx", "N");
		checkList.put("facility_pilates", "N");
		checkList.put("facility_pt", "N");
		checkList.put("facility_24hour", "N");
		checkList.put("facility_shower", "N");
		checkList.put("facility_wear", "N");
		checkList.put("facility_locker", "N");
		String checkboxVal = req.getParameter("chechboxVal");
		String[] checkval = checkboxVal.split("&");
		for(int i=0 ; i< checkval.length ; i++) {
			String[] mapval = checkval[i].split("=");
			checkList.put(mapval[0].toString(), mapval[1].toString());
		}
		System.out.println(checkList);
		checkgymList = maindao.gymlistCheck(checkList);
		
		return checkgymList;
	}
	
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
		//지점 value가 - 이면 모든 트레이너 보여주기
		if(gym_code.equals("-")) {
			trainerList = maindao.trainerALLlistSelect();
		}
		//지점에 맞는 트레이너 보여주기
		else {
			trainerList = maindao.trainerlistSelect(gym_code);
		}
		return trainerList;
	}	
	
	//회원창에서 트레이너 상세정보 보여주기
	@RequestMapping("trainerInfo")
	public String trainerInfo(Model model, MemberDTO memberDTO) {
		//트레이너 지점이름
		model.addAttribute("gymInfo",maindao.gymInfoSelect(memberDTO.getGym_code()));
		//트레이너 정보
		model.addAttribute("trainerInfo", maindao.trainerInfoSelect(memberDTO.getMem_id()));
		
		//트레이너 평점
		Integer avg_grade = 0;
		if(maindao.gradeSelete(memberDTO.getMem_id())!= null) {
			avg_grade = maindao.gradeSelete(memberDTO.getMem_id());
		}
		model.addAttribute("avg_grade", avg_grade);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		Date now = new Date();
		String now_dt = format.format(now);
		System.out.println(now_dt);
		model.addAttribute("nowdate",now_dt);
		//리뷰
		model.addAttribute("reviewInfo", maindao.reviewSelect(memberDTO.getMem_id()));
		return "member/main/trainerInfo";
	}
	
	//트레이너 후기 작성
	@RequestMapping("trainerReview")
	public String trainerReview(Model model, MemberDTO memberDTO, ReviewDTO reviewDTO) {
		int result = maindao.reviewInsert(reviewDTO);
		if(result==1){
			System.out.println("리뷰 등록 완료");
		}
		else {
			System.out.println("리뷰 등록 실패");
		}
		//트레이너 지점이름
		model.addAttribute("gymInfo",maindao.gymInfoSelect(memberDTO.getGym_code()));
		//트레이너 정보
		model.addAttribute("trainerInfo", maindao.trainerInfoSelect(reviewDTO.getReview_subject()));
		
		//트레이너 평점
		Integer avg_grade = 0;
		if(maindao.gradeSelete(reviewDTO.getReview_subject())!= null) {
			avg_grade = maindao.gradeSelete(reviewDTO.getReview_subject());
		}
		model.addAttribute("avg_grade", avg_grade);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		Date now = new Date();
		String now_dt = format.format(now);
		System.out.println(now_dt);
		model.addAttribute("nowdate",now_dt);
		//리뷰
		model.addAttribute("reviewInfo", maindao.reviewSelect(reviewDTO.getReview_subject()));
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
		//모든 상품 보여주기
		if(product_type.equals("-")) {
			productlist = maindao.product_categoryALLSelect();
		}
		//상품 유형에 맞는 상품 	보여주기
		else {
			productlist = maindao.product_categorySelect(product_type);
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
