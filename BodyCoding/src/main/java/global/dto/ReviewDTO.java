package global.dto;

import java.sql.Date;
import lombok.Data;
@Data
public class ReviewDTO {
	
	private int review_idx;
	private String review_type;
	private String review_subject;
	private String review_comment;
	private String mem_id;
	private int review_grade;
	private Date review_regidate;

}
