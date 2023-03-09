package com.bc.bodycoding.admin.chart;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import global.dto.MemberDTO;
import global.dto.ProductDTO;

@Controller
public class SalesChartController {

	@Autowired
	SalesChartService salesChartdao;
	
	//supMain차트보기
	@GetMapping("supMainChart")
	public String supMainChart(Model model){
		//월별 모든지점총매출액
		model.addAttribute("totalgym_totalsales",salesChartdao.totalgym_totalsales());
//		System.out.println(salesChartdao.totalgym_totalsales());
		//현재 활성화되어있는 지점코드
		List<String> gymList = salesChartdao.enabledGym();
		//모든 지점에 대해 월별 매출액 구하기
		Map<String, List<ProductDTO>> gym_sales = new TreeMap<>();
		for(int i=0; i<gymList.size() ; i++) {
			gym_sales.put("gym_code"+ i, salesChartdao.gym_sales(gymList.get(i)));
		}
		model.addAttribute("gym_sales", gym_sales);
		System.out.println(gym_sales);
		return "admin/chart/supMainChart";
	}
	
	@GetMapping("subMainChart")
	public String subMainChart(Model model){
		//로그인된 아이디 가져오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth != null && auth.getPrincipal() instanceof UserDetails) {
			UserDetails userDetails = (UserDetails) auth.getPrincipal();
			System.out.println("로그인된 아이디: "+userDetails.getUsername());
			//로그인된 아이디로 지점코드 가져오기
			MemberDTO gymInfo = salesChartdao.gym_code(userDetails.getUsername());
			String gym_code =gymInfo.getGym_code();
			String mem_name = gymInfo.getMem_name();
			System.out.println("지점코드: "+gym_code);
			//로그인된 아이디의 지점에 대한 정보: 모든 상품에 대한 월별 매출
			model.addAttribute("totalcategory_totalsales", salesChartdao.totalcategory_totalsales(gym_code));
			model.addAttribute("mem_name", mem_name);
			//로그인된 아이디의 지점에 대한 정보: 각 상품에 대한 월별 매출
			ProductDTO productDTO = new ProductDTO();
			String[] product_category_name = {"GX","헬스","필라테스","PT","요가"};
			String[] product_category = {"gx","health","pilates","pt","yoga"};
			System.out.println(product_category_name.length);
			for(int i=0; i<product_category_name.length ; i++) {
				productDTO.setProduct_category(product_category_name[i]);
				productDTO.setGym_code(gym_code);
				model.addAttribute(product_category[i]+"_sales", salesChartdao.category_sales(productDTO));
			}
		}else {
			System.out.println("로그인 안됨");
		}
		return "admin/chart/subMainChart";
	}
}
