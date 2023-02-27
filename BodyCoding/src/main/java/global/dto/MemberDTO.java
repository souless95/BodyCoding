package global.dto;

import java.sql.Date;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberDTO {
	
	private String mem_id;
	private String mem_pass;
	private String mem_name;
	private String mem_gender;
	private String mem_birth;
	private String mem_phone;
	private String mem_address;
	private String authority; //mem_type -> authority로 변경
	private String enabled; //mem_status --> enabled 변경
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
}
