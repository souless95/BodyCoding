package com.bc.bodycoding.calendar;

import lombok.Data;

@Data
public class CalendarDTO {
	
	private String lesson_idx;
	private String trainer_id;
	private String lesson_category;
	private String lesson_name;
	private String lesson_day;
	private String lesson_start_time;
	private String lesson_end_time;
	private String lesson_capacity;
	private String lesson_availability;
	
	private String trainer_name;
	private int rcount;
}
