package com.bc.bodycoding.calendar;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import global.dto.MemberDTO;

@Mapper
public interface CalendarService {
	
	public int insertSchedule(CalendarDTO calendarDTO);
	
	public int deleteSchedule(CalendarDTO calendarDTO);
	
	public int updateSchedule(CalendarDTO calendarDTO);
	
	public int updateSchedule2(CalendarDTO calendarDTO);
	
	public List<CalendarDTO> loadCList();

}
