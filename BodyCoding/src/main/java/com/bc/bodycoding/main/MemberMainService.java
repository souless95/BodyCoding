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
	public List<MemberDTO> gymlistCheck(Map<String, String> checkList);
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
	
	
	//장바구니
	public ProductDTO cartList(ProductDTO productDTO); //장바구니 리스트 보기
	public ProductDTO cartAddSelect(ProductDTO productDTO); //장바구니에 추가 전 확인용select문
	public int cartAdd(ProductDTO productDTO); //장바구니에 추가
	public int cartAddPlus(ProductDTO productDTO); //장바구니에 갯수 추가
	public int cartDelete(ProductDTO productDTO); //장바구니 삭제 
}
