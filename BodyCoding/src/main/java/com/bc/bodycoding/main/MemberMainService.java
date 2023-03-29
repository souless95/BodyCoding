package com.bc.bodycoding.main;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import global.dto.GymDTO;
import global.dto.MemberDTO;
import global.dto.ProductDTO;
import global.dto.ReviewDTO;

@Mapper
public interface MemberMainService {
	//지점 
	public List<GymDTO> mapmarkerSelect();
   	public GymDTO gymMap(String gym_code);
   	public List<MemberDTO> gymlistSelect();
   	public List<MemberDTO> gymlistSearch(String searchWord);
   	public List<String> gymlisttemp();
   	public List<String> gymcodelistCheck(Map<String, String> facility);
   	public List<MemberDTO> gymlistCheck(List<String> gym_code);
   	public GymDTO selectOnegym(GymDTO gymDTO);
   	
   	//트레이너
   	public MemberDTO selectOneMember(MemberDTO memberDTO);
   	public String interestSelect(String mem_id);
   	public List<MemberDTO> trainerALLlistSelect();
   	public List<MemberDTO> trainerlistSelect(String gym_code);
   	public List<MemberDTO> interestlistSelect(String interest);
   	public MemberDTO trainerInfoSelect(String mem_id);
   	public String gymInfoSelect(String gym_code);
   	public String gradeSelete(String review_subject);
   	public List<ReviewDTO> reviewSelect(String review_subject);
   	public int reviewInsert(ReviewDTO reviewDTO);
   	
   	//상품
   	public List<ProductDTO> product_categoryALLSelect();
   	public List<ProductDTO> product_categorySelect(String product_type);
   	public ProductDTO productInfoSelect(int product_idx);
   	public String gradeSeleteP(String review_subject);
    public List<ReviewDTO> reviewSelectP(String review_subject);
    public int reviewInsertP(ReviewDTO reviewDTO);
    
	//장바구니
	public List<ProductDTO> cartList(ProductDTO productDTO);
	public ProductDTO cartAddSelect(ProductDTO productDTO); //장바구니에 추가 전 확인용select문
	public int cartAdd(ProductDTO productDTO); //장바구니에 추가
	public int cartAddPlus(ProductDTO productDTO); //장바구니에 갯수 추가
	public int cartDelete(ProductDTO productDTO); //장바구니 삭제
	public int plusMinus(ProductDTO productDTO); //장바구니 수량 증감
	public int cartStatusUpdate(ProductDTO productDTO); // 장바구니 > 구매 예정으로 상태 변경
	public int cartStatusInicialize(ProductDTO productDTO); // 장바구니 진입 시, status 초기화
	public List<ProductDTO> pExpectSelect(ProductDTO productDTO); // 장바구니 > 구매 예정으로 상태 변경
	public ProductDTO memPointSelect(String mem_point); // 바로 결제 시, 회원 포인트 불러오기
	public ProductDTO productSelect(String product_idx); // 바로 결제 시, 상품 정보 불러오기
}
