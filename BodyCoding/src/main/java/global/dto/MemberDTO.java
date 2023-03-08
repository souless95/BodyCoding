package global.dto;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
	
	private String mem_id;
	private String mem_pass;
	private String mem_name;
	private String mem_gender;
	private String mem_birth;
	private String mem_phone;
	private String mem_address;
	private String authority;
	private String enabled;
	private String gym_code;
	private Float  mem_height;
	private Float  mem_weight;
	private String mem_disease;
	private String mem_purpose;
	private String mem_interest;
	private String mem_inflow;
	private int mem_point;
	private String mem_career;
	private String mem_comment;
	private String mem_img;
	private Date mem_regidate;
	private String product_type;
	private String product_name;
	private String product_description;
	
	//운동기록 추가를 위해 새로 추가함 
	private String trainer_id;
	private String training_comment;
	private String user_id;
	private String training_log_idx;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date training_date;
		
	//메일관련
	private String title;
	private String message;
	
	public void setTraining_date(String training_date) {
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    try {
	        this.training_date = new java.sql.Date(format.parse(training_date).getTime());
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }
	}
}
