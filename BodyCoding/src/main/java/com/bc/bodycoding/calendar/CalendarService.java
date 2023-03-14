package com.bc.bodycoding.calendar;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import global.dto.ProductDTO;

@Mapper
public interface CalendarService {
	
	public int insertSchedule(CalendarDTO calendarDTO);
	
	public int deleteSchedule(CalendarDTO calendarDTO);
	
	public int updateSchedule(CalendarDTO calendarDTO);
	
	public int updateSchedule2(CalendarDTO calendarDTO);
	
	public int updateSchedule4(CalendarDTO calendarDTO);
	
	public List<CalendarDTO> loadCList(CalendarDTO calendarDTO);
	
	public CalendarDTO selectSchedule(CalendarDTO calendarDTO);
	
	public List<ProductDTO> getInfo(ProductDTO productDTO);
	
	public int getRcount(String lesson_idx);
	
	public List<CalendarDTO> getScheduleForMem(String user_id, @Param("param1") List<ProductDTO> info);
	
	public int reservating(ReservationDTO reservationDTO);
	
	public List<String> getLesson(ReservationDTO reservationDTO);
	
	public List<CalendarDTO> getMyLesson(List<String> lessons);
	
	public int reservatedDeletion(ReservationDTO reservationDTO);
	
	public List<String> getNames(String lesson_idx);
}
