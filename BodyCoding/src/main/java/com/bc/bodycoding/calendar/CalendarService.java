package com.bc.bodycoding.calendar;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CalendarService {
	
	public int insertSchedule(CalendarDTO calendarDTO);
	
	public List<CalendarDTO> loadCList();

}