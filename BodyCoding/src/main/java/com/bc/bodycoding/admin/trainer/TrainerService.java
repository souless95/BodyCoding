package com.bc.bodycoding.admin.trainer;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import global.dto.MemberDTO;

@Mapper
public interface TrainerService {

	public int insertMemberT(MemberDTO memberDTO);
	public List<MemberDTO> selectT();
}