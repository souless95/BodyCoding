package com.bc.bodycoding.main.mypage;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import global.dto.MemberDTO;

@Mapper
public interface MypageService {
	
	public List<MemberDTO> gymlistSelect();
	public List<MemberDTO> trainerALLlistSelect();
	public List<MemberDTO> trainerlistSelect(String gym_code);
	public MemberDTO trainerInfoSelect(MemberDTO memberDTO);
	public String gymInfoSelect(MemberDTO memberDTO);

}
