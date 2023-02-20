package com.bc.bodycoding.account;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberService{

	public int insertMember(MemberDTO memberDTO);
	public int insertMemberT(MemberDTO memberDTO);
	public int insertMemberASUB(MemberDTO memberDTO);
	public List<MemberDTO> select();
	public List<MemberDTO> selectT();
}
