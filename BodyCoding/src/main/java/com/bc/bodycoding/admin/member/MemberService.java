package com.bc.bodycoding.admin.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import global.dto.ExDTO;
import global.dto.MemberDTO;
import global.dto.RoutineDTO;

@Mapper
public interface MemberService {
	
	public List<MemberDTO> select();
	public MemberDTO selectOneMember(MemberDTO memberDTO);
	public List<MemberDTO> selectFT(MemberDTO memberDTO);
	public MemberDTO selectDT(MemberDTO memberDTO);
	public int pointUpdate(MemberDTO memberDTO);
	public String selectPoint(String mem_id);
	
	public int selectRoutine(RoutineDTO routineDTO);
	public int saveRoutine(RoutineDTO routineDTO);
	public RoutineDTO getRoutine(RoutineDTO routineDTO);
	public int updateRoutine(RoutineDTO routineDTO);
	public int deleteRoutine(RoutineDTO routineDTO);

	public int delete(MemberDTO memberDTO);
	public List<ExDTO> selectExrecord1(ExDTO exDTO);
	public List<ExDTO> selectExrecord2(ExDTO exDTO);

	//운동기록조회
	public MemberDTO selectone(String traing_log_idx);
	//운동기록수정
	public int editExrecord(ExDTO exDTO);
	
	public List<ExDTO> getPrevMEx(ExDTO exDTO);
	public List<ExDTO> getPrevEx(ExDTO exDTO);
	
	public String getName(String user_id);
	
	public int insertTL(ExDTO exDTO);
	public int deleteR(ExDTO exDTO);
	
	public MemberDTO selectinfo(MemberDTO memberDTO);
	
}
