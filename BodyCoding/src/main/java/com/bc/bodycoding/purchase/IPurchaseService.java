package com.bc.bodycoding.purchase;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import global.dto.MemberDTO;
import global.dto.ProductDTO;


@Mapper
public interface IPurchaseService {
	//지점목록
	public List<MemberDTO> gymSelect();
	//이용권 목록
	public List<ProductDTO> productSelect(ProductDTO productDTO);
	//트레이너 목록
	public List<ProductDTO> trainerSelect(ProductDTO productDTO);
	//구매할 멤버쉽 상품 정보 조회
	public ProductDTO payProductSelect(ProductDTO productDTO);
	//주문 데이터 추가
	public int insertOrder(ProductDTO productDTO);
	//멤버쉽 데이터 추가
	public int insertMembership(ProductDTO productDTO);
	//상품 주문 데이터 추가
	public int insertOrderDetail(ProductDTO productDTO);

	//상품 주문 데이터 추가
	public int insertPayAndUpdatePoint(ProductDTO productDTO);
	
	//주문내역
	public List<ProductDTO> selectPayLog(String mem_id);
	public List<ProductDTO> selectPayLogDetail(String order_idx);
	public ProductDTO selectPayLogOne(String order_idx);

}
