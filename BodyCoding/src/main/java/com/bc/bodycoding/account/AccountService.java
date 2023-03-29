package com.bc.bodycoding.account;

import java.util.List;
import java.util.Map;


import org.apache.ibatis.annotations.Mapper;

import global.dto.MemberDTO;
import global.dto.ProductDTO;

@Mapper
public interface AccountService{

	public List<MemberDTO> gymlistSelect();
	public int insertMember(MemberDTO memberDTO);
	public String checkIdDuplicate(MemberDTO memberDTO);
	public MemberDTO login(MemberDTO memberDTO);
	public int kakaoinsert(Map<String, String> map);
	public String kakaoselect(String mem_id);
	public MemberDTO kakaoinfoselect(String mem_id);
	public MemberDTO kakaoUserInfo(String mem_id);
	public int kakaoupdate(MemberDTO memberDTO);
	
	public String pwCheck(String mem_id);
	public MemberDTO selectOneMember(MemberDTO memberDTO);
	public int update(MemberDTO memberDTO);
	public int deleteMember(String mem_id);
	
	public MemberDTO gofindid(MemberDTO memberDTO);
	public MemberDTO gofindpass(MemberDTO memberDTO);
	
	public MemberDTO dispMail(MemberDTO memberDTO);
	public MemberDTO execMail(MemberDTO memberDTO);
	
	//비밀번호 찾기할때 아이디,이름,생년 같은지
	public MemberDTO gofindpw(MemberDTO memberDTO);
	
	//비밀번호 찾기할때 아이디, 이름 같은지
	public int updatePass(MemberDTO memberDTO);
	
	//디비에 임시비밀번호 업데이트
	public int updateuserPass(MemberDTO memberDTO);
	
	public List<ProductDTO> getMInfo(ProductDTO productDTO);
	
	public int getTLog(ProductDTO productDTO);
	
	
	
}
