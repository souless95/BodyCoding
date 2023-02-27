package com.bc.bodycoding.account;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import global.dto.MemberDTO;

@Mapper
public interface AccountService{

	public int insertMember(MemberDTO memberDTO);
	public MemberDTO login(MemberDTO memberDTO);
	public int kakaoinsert(Map<String, String> map);
	public String kakaoselect(String mem_id);
	public int kakaoupdate(MemberDTO memberDTO);
	
	public String pwCheck(String mem_id);
	public int deleteMember(String mem_id);
	
}
