package com.bc.bodycoding.main;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import global.dto.GymDTO;
import global.dto.MemberDTO;
import global.dto.ProductDTO;
import global.dto.ReviewDTO;

@Controller
public class MemberMainController {

	@Autowired
	MemberMainService maindao;

	// 선택된 지점 지도보기
	@RequestMapping("/gymMap.do")
	@ResponseBody
	public GymDTO gymMap(String gym_code) {
		System.out.println(gym_code);
		GymDTO gymList = maindao.gymMap(gym_code);
		System.out.println(gymList);
		return gymList;
	}

	// 회원창에서 지점 정보보기
	@RequestMapping("gym")
	public String gym(Model model) {
		model.addAttribute("gymList", maindao.gymlistSelect());
		model.addAttribute("gymMarker", maindao.mapmarkerSelect());
		return "member/main/gym";
	}

	// 회원창에서 검색된 지점 정보보기
	@RequestMapping("/gymSearch.do")
	@ResponseBody
	public List<MemberDTO> gymSearch(String searchWord) {
		List<MemberDTO> gymList;
		gymList = maindao.gymlistSearch(searchWord);
		System.out.println(gymList);
		return gymList;
	}

	// 회원창에서 체크된 지점 정보보기
	@RequestMapping("/gymCheck.do")
	@ResponseBody
	public List<MemberDTO> gymCheck(HttpServletRequest req) {
		List<MemberDTO> checkmemList;
		// 선택된 값들 순서대로 list에 넣기
		List<List<String>> checkgymList = new ArrayList<>();
		// dao에서 이름과,'Y'으로 뽑기위해 map 이용하여 값 넣어주기
		Map<String, String> checkFacility = new HashMap<>();
		// ajax로 전달한 checkboxVal인 data값 받기
		String checkboxVal = req.getParameter("checkboxVal");
		System.out.println(checkboxVal);
		// 전달받은 checkboxVal에서 "&"와 "="를 이용하여 나눠준후 map에다가 넣어서 dao로 값 구하기
		String[] checkval = checkboxVal.split("&");
		for (int i = 0; i < checkval.length; i++) {
			String[] mapval = checkval[i].split("=");
			checkFacility.put("facility", mapval[0].toString());

			System.out.println("선택된 값" + checkFacility);
			if (mapval[0].toString().equals("facility_parking")) {
				checkgymList.add(maindao.gymcodelistCheck(checkFacility));
			} else if (mapval[0].toString().equals("facility_health")) {
				checkgymList.add(maindao.gymcodelistCheck(checkFacility));
			} else if (mapval[0].toString().equals("facility_yoga")) {
				checkgymList.add(maindao.gymcodelistCheck(checkFacility));
			} else if (mapval[0].toString().equals("facility_gx")) {
				checkgymList.add(maindao.gymcodelistCheck(checkFacility));
			} else if (mapval[0].toString().equals("facility_pilates")) {
				checkgymList.add(maindao.gymcodelistCheck(checkFacility));
			} else if (mapval[0].toString().equals("facility_pt")) {
				checkgymList.add(maindao.gymcodelistCheck(checkFacility));
			} else if (mapval[0].toString().equals("facility_24hour")) {
				checkgymList.add(maindao.gymcodelistCheck(checkFacility));
			} else if (mapval[0].toString().equals("facility_shower")) {
				checkgymList.add(maindao.gymcodelistCheck(checkFacility));
			} else if (mapval[0].toString().equals("facility_wear")) {
				checkgymList.add(maindao.gymcodelistCheck(checkFacility));
			} else if (mapval[0].toString().equals("facility_locker")) {
				checkgymList.add(maindao.gymcodelistCheck(checkFacility));
			}
		}
		System.out.println(checkgymList);
		List<String> checkgymtemp = new ArrayList<>();
		// 전체 gym리스트 뽑아서 선택된 gym이랑 교집합 구하기
		checkgymtemp = maindao.gymlisttemp();
		System.out.println("전체 gym 리스트" + checkgymtemp);
		for (int i = 0; i < checkgymList.size(); i++) {
			checkgymtemp.retainAll(checkgymList.get(i));
		}
		System.out.println("교집합" + checkgymtemp);

		// 교집합인 checkgymtemp(list)를 이용해서 지점 찾기(memberDTO)
		checkmemList = maindao.gymlistCheck(checkgymtemp);

		return checkmemList;
	}

	// gym상세보기
	@RequestMapping("gymInfo.do")
	public String gymInfo(GymDTO gymDTO, Model model, MemberDTO memberDTO) {
		gymDTO = maindao.selectOnegym(gymDTO);
		memberDTO = maindao.selectOneMember(memberDTO);
		model.addAttribute("memList", memberDTO);
		model.addAttribute("dto", gymDTO);
		return "member/main/gymInfo";
	}

	// 회원창에서 트레이너 목록 페이지로 가기(지점선택 select박스관련)
	@RequestMapping("trainer")
	public String trainerpage(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String mem_id = (String)session.getAttribute("UserEmail");
		String interest = maindao.interestSelect(mem_id);
		model.addAttribute("gymList", maindao.gymlistSelect());
		model.addAttribute("recomtrainerList", maindao.interestlistSelect(interest));
		return "member/main/trainer";
	}

	// 회원창에서 트레이너 목록 보여주기
	@RequestMapping("/trainer.do")
	@ResponseBody
	public List<MemberDTO> trainer(String gym_code) {
		List<MemberDTO> trainerList;
		// 지점 value가 - 이면 모든 트레이너 보여주기
		if (gym_code.equals("-")) {
			trainerList = maindao.trainerALLlistSelect();
		}
		// 지점에 맞는 트레이너 보여주기
		else {
			trainerList = maindao.trainerlistSelect(gym_code);
		}
		return trainerList;
	}
	
	// 회원창에서 관심사항에 맞는 트레이너 목록 보여주기
	@RequestMapping("/interest.do")
	@ResponseBody
	public List<MemberDTO> interest(String interest) {
		List<MemberDTO> trainerList;
		// 관심사항 선택된 트레이너 보여주기
		trainerList = maindao.interestlistSelect(interest);
		return trainerList;
	}

	// 회원창에서 트레이너 상세정보 보여주기
	@RequestMapping("trainerInfo")
	public String trainerInfo(Model model, MemberDTO memberDTO) {
		// 트레이너 지점이름
		model.addAttribute("gymInfo", maindao.gymInfoSelect(memberDTO.getGym_code()));
		// 트레이너 정보
		model.addAttribute("trainerInfo", maindao.trainerInfoSelect(memberDTO.getMem_id()));
		// 트레이너 평점
		String avg_grade = maindao.gradeSelete(memberDTO.getMem_id());
		System.out.println("평점 평균: " + avg_grade);
		model.addAttribute("avg_grade", maindao.gradeSelete(memberDTO.getMem_id()));

		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		Date now = new Date();
		String now_dt = format.format(now);
		System.out.println(now_dt);
		model.addAttribute("nowdate", now_dt);
		// 리뷰
		model.addAttribute("reviewInfo", maindao.reviewSelect(memberDTO.getMem_id()));
		return "member/main/trainerInfo";
	}

	// 트레이너 후기 작성
	@RequestMapping("trainerReview")
	public String trainerReview(Model model, MemberDTO memberDTO, ReviewDTO reviewDTO) {
		System.out.println(reviewDTO);
		int result = maindao.reviewInsert(reviewDTO);
		if (result == 1) {
			System.out.println("리뷰 등록 완료");
		} else {
			System.out.println("리뷰 등록 실패");
		}
		String gym_code = memberDTO.getGym_code();
		System.out.println(gym_code);
		String mem_id = reviewDTO.getReview_subject();
		return "redirect:trainerInfo?gym_code=" + gym_code + "&mem_id=" + mem_id;
	}

	// 회원창에서 상품 목록 페이지로 가기
	@RequestMapping("product")
	public String productpage() {
		return "member/main/product";
	}

	// 상품 후기 작성
	@RequestMapping("productReview")
	public String productReview(Model model, ProductDTO productDTO, ReviewDTO reviewDTO) {
		int result = maindao.reviewInsertP(reviewDTO);
		if (result == 1) {
			System.out.println("리뷰 등록 완료");
		} else {
			System.out.println("리뷰 등록 실패");
		}
		String product_idx = reviewDTO.getReview_subject();
		System.out.println(product_idx);

		return "redirect:productInfo?product_idx=" + product_idx;
	}

	// 회원창에서 상품 목록 보여주기
	@RequestMapping("product.do")
	@ResponseBody
	public List<ProductDTO> product(String product_type) {
		List<ProductDTO> productlist;
		// 모든 상품 보여주기
		if (product_type.equals("-")) {
			productlist = maindao.product_categoryALLSelect();
		}
		// 상품 유형에 맞는 상품 보여주기
		else {
			productlist = maindao.product_categorySelect(product_type);
		}
		return productlist;
	}

	// 회원창에서 상품 상세정보 보여주기
	@RequestMapping("productInfo")
	public String productInfo(Model model, HttpServletRequest req, ProductDTO productDTO) {
		int product_idx = Integer.parseInt(req.getParameter("product_idx"));
		model.addAttribute("productInfo", maindao.productInfoSelect(product_idx));
		// 상품 평점
		String avg_grade = maindao.gradeSeleteP(String.valueOf(productDTO.getProduct_idx()));
		System.out.println("평점:" + avg_grade);
		model.addAttribute("avg_grade", maindao.gradeSeleteP(String.valueOf(productDTO.getProduct_idx())));

		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		Date now = new Date();
		String now_dt = format.format(now);
		System.out.println("현재날짜" + now_dt);
		model.addAttribute("nowdate", now_dt);

		// 리뷰
		model.addAttribute("reviewInfo", maindao.reviewSelectP(String.valueOf(productDTO.getProduct_idx())));
		return "member/main/productInfo";
	}

	// 장바구니로 상품목록
	@RequestMapping("/cartList.do")
	public String cartList(HttpSession session, ProductDTO productDTO, Model model) {

		String user = session.getAttribute("UserEmail").toString();
		productDTO.setMem_id(user);
		maindao.cartStatusInicialize(productDTO);
		model.addAttribute("myCartList", maindao.cartList(productDTO));

		return "member/main/cart";
	}

	// 장바구니에 추가 전 확인용
	@RequestMapping("cartAddSelect.do")
	public String cartAddSelect(ProductDTO productDTO) {

		// 리스트 확인
		ProductDTO result = maindao.cartAddSelect(productDTO);
		productDTO.setProduct_count("1");

		// 상품이 있을경우
		if (result != null) {

			int resultUpdate = maindao.cartAddPlus(productDTO);
			System.out.println("장바구니에 수량이 증가되었습니다.");
		}
		// 상품이 없을 경우
		else {

			int resultAdd = maindao.cartAdd(productDTO);
			System.out.println("장바구니에 새로운 상품이 추가되었습니다.");
		}

		return "redirect:cartList.do";
	}

	// 장바구니 상품 삭제
	@RequestMapping("cartDelete.do")
	public String cartDelete(ProductDTO productDTO) {

		System.out.println();
		int result = maindao.cartDelete(productDTO);
		if (result == 1) {
			System.out.println("장바구니가 삭제되었습니다.");
		}
		return "redirect:cartList.do";
	}

	// 장바구니 수량 증감
	@RequestMapping("/plusMinus.do")
	@ResponseBody
	public String plusMinus(@RequestBody ProductDTO productDTO, Model model) {

		int result = maindao.plusMinus(productDTO);

		if (result == 1) {
			System.out.println("수량변경 성공");
		}

		return "";
	}

	// 구매 예정 화면으로 이동
	@GetMapping("/puchaseExpectInfo.do")
	public String puchaseExpect(HttpServletRequest req, HttpSession session, Model model) {

		ProductDTO productDTO = new ProductDTO();
		List<ProductDTO> pList = new ArrayList<>();
		String chk = req.getParameter("chkArray");
		
		if (chk != null) {
			String chkArray[] = chk.split(",");

			for (int i = 0; i < chkArray.length; i++) {
				productDTO.setCart_idx(chkArray[i]);
				maindao.cartStatusUpdate(productDTO);
			}
			productDTO.setMem_id(session.getAttribute("UserEmail").toString());
			pList = maindao.pExpectSelect(productDTO);
			
			model.addAttribute("cart_arr", req.getParameter("chkArray"));
		}
		
		else {
			ProductDTO pointDTO = new ProductDTO();
			pointDTO = maindao.memPointSelect(req.getParameter("mem_id"));
			productDTO = maindao.productSelect(req.getParameter("product_idx"));
			productDTO.setMem_point(pointDTO.getMem_point());
			productDTO.setProduct_count("1");
			System.out.println(productDTO);
			pList.add(productDTO);
		}

			model.addAttribute("pList", pList);

		return "/member/purchase/puchaseExpectInfo";
	}

}
