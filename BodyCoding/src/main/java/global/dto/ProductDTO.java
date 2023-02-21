package global.dto;


import java.sql.Date;

import lombok.Data;

@Data
public class ProductDTO {
	private int product_idx;
	private String product_type;
	private String product_category;
	private int membership_count;
	private int membership_period;
	private String product_name;
	private String product_description;
	private String product_img;
	private int product_price;
	private Date product_regidate;
}
