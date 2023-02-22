package com.bc.bodycoding.admin.member;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import global.dto.MemberDTO;

@Mapper
public interface MemberService {
	
	public List<MemberDTO> select();
	public MemberDTO selectOneMember(MemberDTO memberDTO);
}
