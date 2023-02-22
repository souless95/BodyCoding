package com.bc.bodycoding.admin.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import global.dto.ProductDTO;

@Mapper
public interface IProductService {
	
	//상품 전체 목록
	public List<ProductDTO> select();
	//상품 등록
	public int insert(ProductDTO productDTO);
	//상품 검색
	public ProductDTO search(ProductDTO productDTO);
	//상품 수정
	public int update(ProductDTO productDTO);
	//상품 삭제
	public int delete(ProductDTO productDTO);
}
