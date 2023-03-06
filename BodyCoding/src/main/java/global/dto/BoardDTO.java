package global.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardDTO {

	private int board_idx;
	private String board_category;
	private String mem_id;
	private String board_title;
	private String board_contents;
	private String board_ofile;
	private String board_sfile;
	private int board_visitcount;
	private Date board_postdate;
	
	
	
}
