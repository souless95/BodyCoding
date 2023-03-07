package global.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ExDTO {
	
	private String trainer_id;
	private String user_id;
	private String training_comment;
	private String product_name;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date training_date;
	
}
