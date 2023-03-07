package com.bc.bodycoding.admin.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import global.dto.ExDTO;
import global.dto.MemberDTO;

@Mapper
public interface MemberService {
	
	public List<MemberDTO> select();
	public MemberDTO selectOneMember(MemberDTO memberDTO);
	public List<MemberDTO> selectFT(MemberDTO memberDTO);
	public MemberDTO selectDT(MemberDTO memberDTO);
	public int pointUpdate(MemberDTO memberDTO);
	public String selectPoint(String mem_id);
	public int delete(MemberDTO memberDTO);
	public List<MemberDTO> selectexrecord(MemberDTO memberDTO);
	//운동기록등록 
	public int insertexrecord(ExDTO exDTO);
	//운동기록조회
	public MemberDTO selectone(String traing_log_idx);
	//운동기록수정
	public int editexrecord(MemberDTO memberDTO);
	//운동기록 삭제
	public int deleteexrecord(MemberDTO memberDTO);
	
	
	
	
	
}
