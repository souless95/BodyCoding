package com.bc.bodycoding.calendar;

import lombok.Data;

@Data
public class ReservationDTO {

	private String reservaction_idx;
	private String lesson_idx;
	private String user_id;
	private String reservation_date;
}
