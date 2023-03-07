package com.bc.bodycoding.main;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import global.dto.MemberDTO;
import global.dto.ProductDTO;
import global.dto.ReviewDTO;

@Mapper
public interface MemberMainService {
	
	public List<MemberDTO> gymlistSelect();
	public List<MemberDTO> gymlistSearch(String searchWord);
	public List<String> gymlisttemp();
	public List<String> gymcodelistCheck(Map<String, String> facility);
	public List<MemberDTO> gymlistCheck(List<String> gym_code);
	public List<MemberDTO> trainerALLlistSelect();
	public List<MemberDTO> trainerlistSelect(String gym_code);
	public MemberDTO trainerInfoSelect(String mem_id);
	public Integer gradeSelete(String review_subject);
	public List<ReviewDTO> reviewSelect(String review_subject);
	public int reviewInsert(ReviewDTO reviewDTO);
	public String gymInfoSelect(String gym_code);
	public List<ProductDTO> product_categoryALLSelect();
	public List<ProductDTO> product_categorySelect(String product_type);
	public ProductDTO productInfoSelect(int product_idx);
	public Integer gradeSeleteP(String review_subject);
	public List<ReviewDTO> reviewSelectP(String review_subject);
	public int reviewInsertP(ReviewDTO reviewDTO);
	
	//장바구니
	public List<ProductDTO> cartList(ProductDTO productDTO);
	public ProductDTO cartAddSelect(ProductDTO productDTO); //장바구니에 추가 전 확인용select문
	public int cartAdd(ProductDTO productDTO); //장바구니에 추가
	public int cartAddPlus(ProductDTO productDTO); //장바구니에 갯수 추가
	public int cartDelete(ProductDTO productDTO); //장바구니 삭제
	public int plusMinus(ProductDTO productDTO); //장바구니 수량 증감
	public ProductDTO selectPlusMinus(ProductDTO productDTO); //증감된 거 보여주는 노무쉐끼
}
