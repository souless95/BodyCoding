package com.bc.bodycoding.account;

import org.apache.ibatis.annotations.Mapper;

import global.dto.MemberDTO;

@Mapper
public interface AccountService{

	public int insertMember(MemberDTO memberDTO);
	public String login(MemberDTO memberDTO);
	
}