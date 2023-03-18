package global.dto;

import java.sql.Date;

import com.bc.bodycoding.board.Criteria;

import lombok.Data;

@Data
public class BoardDTO {

	private String board_idx;
	private String board_category;
	private String mem_id;
	private String mem_name;
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
	
	private String reply_idx; //댓글번호
	private String reply_cont; // 댓글내용
	
	//검색필터
    private String type; //검색타입
    private Criteria cri;
		
	
}
