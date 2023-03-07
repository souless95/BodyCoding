package global.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ExDTO {
	
	private String TRAINER_ID;
	private String USER_ID;
	private String TRAINING_COMMENT;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date TRAINING_DATE;
	
}
