package com.bc.bodycoding.main.mypage;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import global.dto.GymDTO;
import global.dto.MemberDTO;
import global.dto.ProductDTO;
import global.dto.WeightDTO;

@Mapper
public interface MypageService {
	
	public List<MemberDTO> gymlistSelect();
	public List<MemberDTO> trainerALLlistSelect();
	public List<MemberDTO> trainerlistSelect(String gym_code);
	public MemberDTO trainerInfoSelect(MemberDTO memberDTO);
	public String gymInfoSelect(MemberDTO memberDTO);
	
	public MemberDTO gymcheck(String mem_id);
	public MemberDTO basicListM(String gym_code);
	public GymDTO basicListG(String gym_code);
//	public MemberDTO selectOneMember(MemberDTO memberDTO);
//	public int update(MemberDTO memberDTO);
	
	//몸무게 차트 시각화
	public List<WeightDTO> weightchart(String mem_id);
	public int insertWeight(WeightDTO weightDTO);
	
}
