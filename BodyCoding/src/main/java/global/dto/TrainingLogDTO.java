package global.dto;

import lombok.Data;

@Data
public class TrainingLogDTO {

	private String training_log_idx;
	private String trainer_id;
	private String exercise_type;
	private String user_id;
	private String training_comment;
	private String training_date;
}
