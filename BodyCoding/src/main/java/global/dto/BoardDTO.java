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
	
	//신고용
	private int count; //신고횟수
	
	private int report_idx; //신고번호
	private String reporter; //신고자
	private String report_content; //신고내용
	private String closed_chk; //비공개 여부
	private Date report_date; //신고일
	
	
	
	
}
