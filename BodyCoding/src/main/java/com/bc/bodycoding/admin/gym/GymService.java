package com.bc.bodycoding.admin.gym;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import global.dto.GymDTO;
import global.dto.MemberDTO;


@Mapper
public interface GymService {

	public List<MemberDTO> select();
	public GymDTO selectOnegym(GymDTO gymDTO);
	public MemberDTO selectOneMember(MemberDTO memberDTO);
	public int update(GymDTO gymDTO);
	public int updateM(MemberDTO memberDTO);
	public int delete(GymDTO gymDTO);
	public int deleteM(MemberDTO memberDTO);
	public int insertMemberASUB(MemberDTO memberDTO);
	public int insertMember1(MemberDTO memberDTO);
	public int codeCheck(String gym_code);
}
