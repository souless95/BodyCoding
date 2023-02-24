package com.bc.bodycoding.admin.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import global.dto.BoardDTO;

@Mapper
public interface boardService {

	public List<BoardDTO> select();
	public BoardDTO selectOneBoard(BoardDTO boardDTO);
	public int update(BoardDTO boardDTO);
	public int delete(BoardDTO boardDTO);
	
}
