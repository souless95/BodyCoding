package global.dto;

import lombok.Data;

@Data
public class ExDTO {
	
	private String training_log_idx;
	private String trainer_id;
	private String exercise_type;
	private String user_id;
	private String training_comment;
	private String training_date;

	private String mem_name;
	private String lesson_start_time;
	private String reservation_idx;
}
