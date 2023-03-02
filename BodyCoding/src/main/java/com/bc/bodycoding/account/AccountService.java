package com.bc.bodycoding.account;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Mapper;

import global.dto.MemberDTO;

@Mapper
public interface AccountService{

	public int insertMember(MemberDTO memberDTO);
	public String checkIdDuplicate(MemberDTO memberDTO);
	public MemberDTO login(MemberDTO memberDTO);
	public int kakaoinsert(Map<String, String> map);
	public String kakaoselect(String mem_id);
	public int kakaoupdate(MemberDTO memberDTO);
	
	public String pwCheck(String mem_id);
	public int deleteMember(String mem_id);
	
	public MemberDTO gofindid(MemberDTO memberDTO);
	public MemberDTO gofindpass(MemberDTO memberDTO);
	
	
    public MemberDTO findUserByUserId(MemberDTO memberDTO);
    public MemberDTO updateUserPassword(MemberDTO memberDTO);
    
    public void sendEmail(MemberDTO memberDTO, String email) throws Exception;
    
    public void findPw(HttpServletResponse resp, MemberDTO memberDTO) throws Exception;
    
	
	
}
