package global.dto;


import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class GymDTO {

	private String gym_code;
	private String gym_scale;
	//다중파일 등록을 위해 리스트로 만듬
	private String gym_dtail_img;
	private String facility_parking;
	private String facility_health;
	private String facility_yoga;
	private String facility_gx;
	private String facility_pilates;
	private String facility_pt;
	private String facility_24hour;
	private String facility_shower;
	private String facility_wear;
	private String facility_locker;
	private String rtime_week_start;
	private String rtime_week_end;
	private String rtime_sat_start;
	private String rtime_sat_end;
	private String rtime_holy_start;
	private String rtime_holy_end;
	private String gym_lat;
	private String gym_lng;
}
