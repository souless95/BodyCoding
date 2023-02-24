package com.bc.bodycoding.calendar;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CalendarService {
	
	public int insertSchedule(CalendarDTO calendarDTO);

}
