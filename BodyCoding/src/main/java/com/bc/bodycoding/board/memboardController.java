package com.bc.bodycoding.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.dto.BoardDTO;
import global.dto.ExDTO;
import global.dto.MemberDTO;

@Controller
public class memboardController {
	
	//여기는 멤버의 게시판을 다루는 컨트롤러
	@Autowired
	memboardService memboarddao;
	
	//멤버 게시글 리스트
	@RequestMapping("/Freeboard.do")
	public String board1(Model model) {
		model.addAttribute("Freeboard", memboarddao.memselect());
		
		System.out.println(memboarddao.memselect());
		
		return "member/board/Freeboard";
	}
	//게시글 상세보기
	@RequestMapping("/detailmemberboard.do")
	public String board2(BoardDTO boardDTO, Model model, HttpSession session) {
		boardDTO = memboarddao.memselectOneBoard(boardDTO);
		
		System.out.println(boardDTO.getMem_id());
		
		//조회수 증가
		int result = memboarddao.updateVisitCount(boardDTO);
		if(result == 1) {
			System.out.println("조회수 증가 성공");
		} else {
			System.out.println("조회수 증가 실패");
		}
		
		model.addAttribute("dto", boardDTO);
				
		System.out.println("선택한 게시글 번호 : " + boardDTO.getBoard_idx());
		
		String userEmail = (String) session.getAttribute("UserEmail");
		model.addAttribute("mem_id", userEmail);
		model.addAttribute("board_idx", boardDTO.getBoard_idx());

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
		
		//BoardDTO boardDTO = new BoardDTO();
		
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
		
		
/*		model.addAttribute("dto", boardDTO);
		String userEmail = (String) session.getAttribute("UserEmail");
		model.addAttribute("mem_id", userEmail);
		boardDTO = memboarddao.memselectOneBoard(boardDTO);
*/		
		String cont = req.getParameter("report_content");
		System.out.println(cont);
		System.out.println("여기까지는 오네.....");
		System.out.println(boardDTO);
		int result = memboarddao.insertreport(boardDTO);
		System.out.println("여기 못오는것 같은데?");
		if(result==1)
		System.out.println("신고하기 완료");
		
		return "redirect:Freeboard.do";
	}
}
