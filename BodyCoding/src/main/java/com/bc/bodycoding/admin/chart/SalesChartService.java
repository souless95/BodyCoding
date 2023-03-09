package com.bc.bodycoding.admin.chart;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import global.dto.ProductDTO;


@Mapper
public interface SalesChartService {
	
	//전지점 월별 총매출액
	public List<ProductDTO> totalgym_totalsales();
	//활성화되어있는 지점코드
	public List<String> enabledGym();
	//지점별 월별 매출액
	public List<ProductDTO> gym_sales(String gym_code);
}
