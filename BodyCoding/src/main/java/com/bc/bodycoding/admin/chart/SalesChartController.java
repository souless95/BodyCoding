package com.bc.bodycoding.admin.chart;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import global.dto.ProductDTO;

@Controller
public class SalesChartController {

	@Autowired
	SalesChartService salesChartdao;
	
	//차트보기
	@GetMapping("sup_chart1")
	public String chart(Model model){
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
		return "member/sup_chart1";
	}
}
