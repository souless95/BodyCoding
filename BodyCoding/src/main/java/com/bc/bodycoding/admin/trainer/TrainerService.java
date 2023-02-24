package com.bc.bodycoding.admin.trainer;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import global.dto.MemberDTO;

@Mapper
public interface TrainerService {

	public int insertMemberT(MemberDTO memberDTO);
	public List<MemberDTO> selectGT(MemberDTO memberDTO);
	public int update(MemberDTO memberDTO);
	public int deleteT(MemberDTO memberDTO);
	public MemberDTO selectOneT(MemberDTO memberDTO);
}
