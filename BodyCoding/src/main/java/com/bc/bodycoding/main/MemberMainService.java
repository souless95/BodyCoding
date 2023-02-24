package com.bc.bodycoding.main;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import global.dto.MemberDTO;

@Mapper
public interface MemberMainService {
	
	public List<MemberDTO> gymlistSelect();
	public List<MemberDTO> trainerlistSelect();
	public MemberDTO trainerInfoSelect(MemberDTO memberDTO);
	public String gymInfoSelect(MemberDTO memberDTO);

}
