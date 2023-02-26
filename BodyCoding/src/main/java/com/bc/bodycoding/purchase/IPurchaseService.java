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
}
