package com.bc.bodycoding.admin.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import global.dto.BoardDTO;
import global.dto.MemberDTO;

@Controller
public class boardController {

	@Autowired
	boardService boarddao;
	
	//게시글 리스트
	@RequestMapping("/boardList.do")
	public String board1(Model model) {
		model.addAttribute("boardList", boarddao.select());
		
		return "admin/board/boardList";
	}
	
	//게시글 상세보기
	@RequestMapping("/boardDetail.do")
	public String board2(BoardDTO boardDTO, Model model) {
		boardDTO = boarddao.selectOneBoard(boardDTO);
		model.addAttribute("dto", boardDTO);
		System.out.println(boardDTO);
		return "admin/board/boardDetail";
	}
	
	//게시글에 답변달기
	
	//게시글 수정하기
	
	//게시글 삭제하기
	@RequestMapping("/boardDelete.do")
	public String delete(BoardDTO boardDTO) {
		int result = boarddao.delete(boardDTO);
		if(result==1) System.out.println("삭제되었습니다.");
		return "redirect:boardList.do";
	}
}
