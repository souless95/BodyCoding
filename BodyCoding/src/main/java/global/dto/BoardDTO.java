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
	private String board_file;
	private int board_visitcount; //조회수
	private Date board_postdate;
	private String closed_chk; //비공개 여부
	
	//신고용
	private int count; //신고횟수
	private int report_idx; //신고번호
	private String reporter; //신고자
	private String report_content; //신고내용
	private Date report_date; //신고일
	
	private int reply_idx; //댓글번호
	private String reply_cont; // 댓글내용
	
	//페이징처리
	/*
	private int pageNum;
	private int amount;
	
	public BoardDTO() {
		this(1, 10);
	}
	
	public BoardDTO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	*/
	
}
