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
		
		System.out.println("선택한 게시글 번호 : " + boardDTO.getBoard_idx());
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
	
	//신고게시판 이동
	
	//신고 내용확인 (상세보기) --> 신고된 글 상세페이지로 이동하는 버튼 필요
	
	
	
	//공지사항 리스트
	@RequestMapping("/noticeList.do")
	public String noticeList(Model model) {
		model.addAttribute("noticeList", boarddao.selectNotice());
		
		return "admin/board/noticeList";
	}
	
	//공지사항 상세보기
	
	//공지사항 작성
	
	//공지사항 수정
	
	//공지사항 삭제
	
	
	

}
