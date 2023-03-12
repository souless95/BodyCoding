package com.bc.bodycoding.board;

import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import global.dto.BoardDTO;
import global.dto.ReplyDTO;

@Controller
public class memboardController {
	
	//여기는 멤버의 게시판을 다루는 컨트롤러
	@Autowired
	memboardService memboarddao;
	
	//멤버 게시글 리스트
	@RequestMapping("/Freeboard.do")
	public String board1(Model model) {
		model.addAttribute("Freeboard", memboarddao.memselect());
		
		return "member/board/Freeboard";
	}
	
	//게시글 상세보기
	@RequestMapping("/detailmemberboard.do")
	public String board2(HttpServletRequest req, Model model, HttpSession session) {
		//게시글상세보기 값저장
		BoardDTO boardDTO = new BoardDTO();
		boardDTO = memboarddao.selectone(req.getParameter("board_idx"));
		System.out.println(boardDTO);
		//view페이지에서 쓰기위해서 dto이름에 boardDTO정보저장
		model.addAttribute("dto", boardDTO);
		
		//reply 테이블에 있는 정보 가져오기위해 객체선언
		ReplyDTO replyDTO = new ReplyDTO();
		replyDTO.setBoard_idx(boardDTO.getBoard_idx());
		List<ReplyDTO> replyDTOList = memboarddao.selectreply(replyDTO);
		
		model.addAttribute("rdto", replyDTOList);
		System.out.println(replyDTOList);
		
		//조회수 증가
		int result = memboarddao.updateVisitCount(boardDTO);
		if(result == 1) {
			System.out.println("조회수 증가 성공");
		} else {
			System.out.println("조회수 증가 실패");
		}
		
		System.out.println("선택한 게시글 번호 : " + boardDTO.getBoard_idx());
		System.out.println(replyDTOList);
		String userEmail = (String) session.getAttribute("UserEmail");
		model.addAttribute("mem_id", userEmail);
		System.out.println(userEmail);
					
			return "member/board/detailmemboard";
	}
	
	@RequestMapping("/memboardDelete.do")
	public String delete(BoardDTO boardDTO) {
		int result = memboarddao.deleteboard(boardDTO);
		if(result==1)
		System.out.println("삭제되었습니다.");
		return "redirect:Freeboard.do";
	}
	
	//멤버게시판 게시글 작성페이지로 이동
	@RequestMapping(value="insertboard.do", method=RequestMethod.GET)
	public String shoexrecord() {
		
		return "/member/board/insertboard";
	}
	
	//게시글등록 
	@RequestMapping(value="insertboard.do", method=RequestMethod.POST)
	public String insertexrecord1(BoardDTO boardDTO, HttpSession session) {
		
		String mem_id = (String)session.getAttribute("UserEmail");
		System.out.println(mem_id);
		boardDTO.setMem_id(mem_id);
		
		int result = memboarddao.insertboard(boardDTO);
		if(result==1)
				
		System.out.println("게시글 등록이 완료되었습니다.");
			
		return "redirect:Freeboard.do";
			
	}
	
	//멤버 게시판 수정 페이지 진입
	@RequestMapping(value="updateboard.do", method=RequestMethod.GET)
	public String editrecord(Model model, HttpServletRequest req) {
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO = memboarddao.selectone(req.getParameter("board_idx"));
		model.addAttribute("Freeboard", boardDTO);

		return "member/board/updateboard";
	}
		
	//게시글 실제 수정
	@RequestMapping(value="updateboard.do", method=RequestMethod.POST)
	public String editrecord2(BoardDTO boardDTO) {
		
		int result = memboarddao.updateboard(boardDTO);
		System.out.println(result);
		
		if(result==1)
		System.out.println("게시글이 수정되었습니다.");
		System.out.println(result);
		
		return "redirect:Freeboard.do";
	}
	
	//팝업창에서 insert하는 화면으로 이동
	@RequestMapping(value="/report.do", method = RequestMethod.GET)
	public String report(HttpServletRequest req, Model model, BoardDTO boardDTO,HttpSession session) {
		
		boardDTO = memboarddao.selectone(req.getParameter("board_idx"));
		model.addAttribute("dto", boardDTO);
		System.out.println(boardDTO);
		
		model.addAttribute("dto", boardDTO);
		String userEmail = (String) session.getAttribute("UserEmail");
		model.addAttribute("mem_id", userEmail);
		boardDTO = memboarddao.memselectOneBoard(boardDTO);
		
		return "member/board/report";
	}
	
	@RequestMapping(value="/report.do", method = RequestMethod.POST)
	public String insertreport(BoardDTO boardDTO, Model model, HttpServletRequest req) {
		
		String cont = req.getParameter("report_content");
		System.out.println(cont);
		System.out.println(boardDTO);
		int result = memboarddao.insertreport(boardDTO);
		if(result==1)
		System.out.println("신고하기 완료");
		
		return "redirect:Freeboard.do";
	}
	
	//댓글등록
	@RequestMapping(value="/insertreply.do", method=RequestMethod.POST)
	public String insertreply(ReplyDTO replyDTO, HttpSession session,
			HttpServletRequest req) {
		
		List<ReplyDTO> replyDTOList = memboarddao.selectreply(replyDTO);
		
		String board_idx = req.getParameter("board_idx");
		System.out.println(replyDTO);
		
		int result = memboarddao.insertreply(replyDTO);
	
		if(result==1)
				
		System.out.println("댓글 등록이 완료되었습니다.");
			
		return "redirect:/detailmemberboard.do?board_idx="+board_idx;
			
	}
	
	//댓글 삭제
	@RequestMapping("deletereply.do")
	public String delete(ReplyDTO replyDTO, HttpServletRequest req) {
		
		String board_idx = req.getParameter("board_idx");
		System.out.println(board_idx);
		int result = memboarddao.deletereply(replyDTO);
		if(result==1)
		System.out.println("댓글삭제완료");
		return "redirect:/detailmemberboard.do?board_idx="+board_idx;
	}
	
	//댓글 수정 페이지 진입
	@RequestMapping(value="updatereply.do", method=RequestMethod.GET)
	public String updatereply(Model model, HttpServletRequest req, ReplyDTO replyDTO) {
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO = memboarddao.selectone(req.getParameter("board_idx"));
		int board_idx = boardDTO.getBoard_idx();
		System.out.println(board_idx);
		
		List<ReplyDTO> replyDTOList = memboarddao.selectreply(replyDTO);
		model.addAttribute("rdto", replyDTOList);
		System.out.println(replyDTOList);
		
		//현재 페이지에 머무르기 위해 board_idx,mem_id, dto정보 모델에 추가
		model.addAttribute("board_idx", board_idx);
		model.addAttribute("mem_id", req.getParameter("mem_id"));
		model.addAttribute("dto", boardDTO);
		
		//;
		return "redirect:detailmemberboard.do?board_idx="+Integer.toString(board_idx);
	}
			
	//댓글 수정
	@RequestMapping(value="updatereply.do", method=RequestMethod.POST)
	public String updatereply1(ReplyDTO replyDTO, HttpServletRequest req, Model model) {
		
		System.out.println("dddd");
		BoardDTO boardDTO = new BoardDTO();
		boardDTO = memboarddao.selectone(req.getParameter("board_idx"));
		int board_idx = boardDTO.getBoard_idx();
		System.out.println(board_idx);
		
		replyDTO.setBoard_idx(boardDTO.getBoard_idx());
		replyDTO.setReply_idx(Integer.parseInt(req.getParameter("reply_idx")));
		replyDTO.setBoard_idx(board_idx);
		System.out.println(board_idx);
		
		memboarddao.updatereply(replyDTO);
				
		return "redirect:/detailmemberboard.do?board_idx="+board_idx;
	}
	
	


}
