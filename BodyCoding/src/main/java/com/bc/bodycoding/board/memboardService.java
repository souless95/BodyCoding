package com.bc.bodycoding.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import global.dto.BoardDTO;

@Mapper
public interface memboardService {

	//멤버게시판의 게시글 리스트
	public List<BoardDTO> memselect();
	//페이징 처리 글쓰기
	//public List<BoardDTO> memselectpage(BoardDTO boardDTO);
	
	public int boardListCnt();
	public int boardListCnt1(Criteria cri);
	
	public List<Map<String, Object>> memselect(Criteria cri); 
	public List<Map<String, Object>> memselect1(Criteria cri); 
	
	public BoardDTO memselectOneBoard(BoardDTO boardDTO); //게시글 상세보기
	public int updateboard(BoardDTO boardDTO); //게시글 수정하기
	public int deleteboard(BoardDTO boardDTO); //게시글 삭제하기
	//멤버의 게시판에 글 작성하기
	public int insertboard(BoardDTO boardDTO);
	
	//멤버의 게시판 글 수정할때 기존데이터 가져오기
	public BoardDTO selectone(String board_idx);
	
	public List<BoardDTO> reportList(BoardDTO boardDTO); //신고내용 리스트
	
	//조회수 증가 메서드
	public int updateVisitCount(BoardDTO boardDTO);
	
	//신고하기에서 insert하기
	public int insertreport(BoardDTO boardDTO);
	
	//댓글 작성하기
	public int insertreply(BoardDTO boardDTO);
	
	public List<BoardDTO> selectreply(BoardDTO boardDTO);
	public int deletereply(BoardDTO boardDTO);
	public int updatereply(BoardDTO boardDTO);
	public BoardDTO selectreply(String reply_idx);
	
	public List<Map<String, Object>> searchBoard(Criteria cri);
	
}
