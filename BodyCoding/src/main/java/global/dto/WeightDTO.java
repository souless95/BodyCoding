package global.dto;

import java.sql.Date;
import lombok.Data;

@Data
public class WeightDTO {
	private String mem_id;
	private Float  mem_weight;
	private Date mem_weight_date;
}
