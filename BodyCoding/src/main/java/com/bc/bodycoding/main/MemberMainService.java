package com.bc.bodycoding.main;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import global.dto.MemberDTO;
import global.dto.ProductDTO;

@Mapper
public interface MemberMainService {
	
	public List<MemberDTO> gymlistSelect();
	public List<MemberDTO> trainerALLlistSelect();
	public List<MemberDTO> trainerlistSelect(String gym_code);
	public MemberDTO trainerInfoSelect(MemberDTO memberDTO);
	public String gymInfoSelect(MemberDTO memberDTO);
	public List<ProductDTO> product_categoryALLSelect();
	public List<ProductDTO> product_categorySelect(String product_type);
	public ProductDTO productInfoSelect(int product_idx);

}
