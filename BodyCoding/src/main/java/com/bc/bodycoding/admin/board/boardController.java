package com.bc.bodycoding.admin.board;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
		model.addAttribute("reportList", boarddao.reportList(boardDTO)); //신고내용 보기
		
		System.out.println("선택한 게시글 번호 : " + boardDTO.getBoard_idx());
		System.out.println("신고내용이 뜨냐" + boarddao.reportList(boardDTO));
		
		return "admin/board/boardDetail";
	}
	//게시글에 답변달기
	
	//게시글 수정하기
	
	//게시글 삭제하기(자유게시판, 공지사항, 이벤트)
	@RequestMapping("/boardDelete.do")
	public String delete(BoardDTO boardDTO) {
		int result = boarddao.delete(boardDTO);
		if(result==1) System.out.println("삭제되었습니다.");
		return "redirect:boardList.do";
	}
	
	//공지사항 리스트
	@RequestMapping("/noticeList.do")
	public String noticeList(Model model) {
		model.addAttribute("noticeList", boarddao.select());
		
		return "admin/board/noticeList";
	}
	
	//공지사항 상세보기
	@RequestMapping("/noticeDetail.do")
	public String noticeDetail(BoardDTO boardDTO, Model model) {
		boardDTO = boarddao.selectOneBoard(boardDTO);
		
		model.addAttribute("dto", boardDTO);
		
		System.out.println("선택한 게시글 번호 : " + boardDTO.getBoard_idx());
		
		return "admin/board/noticeDetail";
	}
	
	//공지사항 작성 페이지로 이동
	@RequestMapping(value = "admin/board/noticeInsert", method = RequestMethod.GET)
	public String noticeIn(Model model, BoardDTO boardDTO, Principal principal) throws Exception {
		
		//작성할 놈 이름 받아오기!
		
		String mem_id = principal.getName();
		model.addAttribute("mem_id", mem_id);
		
		System.out.println("공지작성하기 위해 받아온 이름 : " + mem_id);
		
		return "admin/board/noticeInsert";
	}
	
	//공지사항 작성
	@RequestMapping(value = "/noticeInsert.do", method = RequestMethod.POST)
	public String noticeInsert(MultipartFile board_file, MultipartHttpServletRequest req) throws IOException, Exception {
		
		
		return "redirect:/noticeList.do";
	}
	
	
	//공지사항 수정
	
	
	
	

}
