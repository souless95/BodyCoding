package com.bc.bodycoding.account;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

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
	
	public MemberDTO gofindid(MemberDTO memberDTO);
	public MemberDTO gofindpass(MemberDTO memberDTO);
	
	public MemberDTO dispMail(MemberDTO memberDTO);
	public MemberDTO execMail(MemberDTO memberDTO);
	
	//비밀번호 찾기할때 아이디,이름,생년 같은지
	public MemberDTO gofindpw(MemberDTO memberDTO);

	//비밀번호 업데이트
	public MemberDTO updatePass(MemberDTO memberDTO);
	public String updatePass(String rnd);
	
}
