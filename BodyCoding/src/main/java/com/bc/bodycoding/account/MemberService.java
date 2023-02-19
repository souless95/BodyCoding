package com.bc.bodycoding.account;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberService {
	
	public List<MemberDTO> select();
	public int insert(MemberDTO memberDTO);
	public MemberDTO selectOne(MemberDTO memberDTO);
	public int update(MemberDTO memberDTO);
	public int delete(MemberDTO memberDTO);

}
