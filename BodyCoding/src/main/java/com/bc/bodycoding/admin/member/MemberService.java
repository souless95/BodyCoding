package com.bc.bodycoding.admin.member;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.bc.bodycoding.MemberDTO;

@Mapper
public interface MemberService {
	
	public List<MemberDTO> select();

}
