package com.bc.bodycoding.admin.gym;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import global.dto.GymDTO;
import global.dto.MemberDTO;


@Mapper
public interface GymService {

	public List<MemberDTO> select();
	public int insert(GymDTO gymDTO);
	public GymDTO selectOne(GymDTO gymDTO);
	public int update(GymDTO gymDTO);
	public int delete(GymDTO gymDTO);
	public int insertMemberASUB(MemberDTO memberDTO);
	public int insertMember1(MemberDTO memberDTO);
}
