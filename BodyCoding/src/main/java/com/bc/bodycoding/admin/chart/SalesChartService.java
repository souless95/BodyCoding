package com.bc.bodycoding.admin.chart;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import global.dto.MemberDTO;
import global.dto.ProductDTO;


@Mapper
public interface SalesChartService {
	
	//sup차트 만들기
	//전지점 월별 총매출액
	public List<ProductDTO> totalgym_totalsales();
	//활성화되어있는 지점코드
	public List<String> enabledGym();
	//지점별 월별 매출액
	public List<ProductDTO> gym_sales(String gym_code);
	
	//sub차트 만들기
	//로그인된 아이디의 지점코드 가져오기
	public MemberDTO gym_code(String mem_id);
	//전상품 월별 총매출액
	public List<ProductDTO> totalcategory_totalsales(String gym_code);
	public List<ProductDTO> category_sales(ProductDTO productDTO);
}
