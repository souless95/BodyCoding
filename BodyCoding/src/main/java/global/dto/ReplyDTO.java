package global.dto;

import lombok.Data;

@Data
public class ReplyDTO {
	
	private int reply_idx;
	private int board_idx;
	private String mem_id;
	private String reply_cont;

}
