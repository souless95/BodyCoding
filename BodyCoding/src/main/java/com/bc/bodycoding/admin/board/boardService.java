package com.bc.bodycoding.admin.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import global.dto.BoardDTO;

@Mapper
public interface boardService {

	public List<BoardDTO> select(); //게시글 리스트
	public BoardDTO selectOneBoard(BoardDTO boardDTO); //게시글 상세보기
	public int insert(BoardDTO boardDTO); //게시글 답변달기
	public int update(BoardDTO boardDTO); //게시글 수정하기
	public int delete(BoardDTO boardDTO); //게시글 삭제하기
	
}
