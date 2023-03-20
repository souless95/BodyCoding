package com.bc.bodycoding.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bc.bodycoding.admin.member.MemberService;

import global.dto.BoardDTO;
import global.dto.MemberDTO;

@Controller
public class memboardController {
	
	//여기는 멤버의 게시판을 다루는 컨트롤러
	@Autowired
	memboardService memboarddao;
	@Autowired
	MemberService memberdao;
	
	//게시글 리스트 페이징 
	@RequestMapping("/Freeboard.do")
	public String board1(Criteria cri, Model model) {
		
		//model.addAttribute("Freeboard", memboarddao.memselect());
		// 전체 글 개수
        int boardListCnt = memboarddao.boardListCnt();
        // 페이징 객체
        Paging paging = new Paging();
        paging.setCri(cri);
        paging.setTotalCount(boardListCnt);    
        
        List<Map<String, Object>> list = memboarddao.memselect(cri);
        
        model.addAttribute("list", list);    
        model.addAttribute("paging", paging);  
		return "member/board/Freeboard";
	}
	
	//검색기능
	/*
	@RequestMapping("/searchmemberboard.do")
	public String searchBoard(@ModelAttribute("cri") Criteria cri, Model model) {
	    int boardListCnt = memboarddao.searchBoardCnt(cri);
	    Paging paging = new Paging();
	    paging.setCri(cri);
	    paging.setTotalCount(boardListCnt);    
	    List<Map<String, Object>> list = memboarddao.searchBoard(cri);
	    model.addAttribute("list", list);    
	    model.addAttribute("paging", paging);  
	    return "member/board/Freeboard";
	}	*/
	
	
//	@RequestMapping(value = "/searchmemberboard.do", method = RequestMethod.GET)
//	public String searchMemberBoard(@RequestParam("searchType") String searchType,
//	                                      @RequestParam("searchKeyword") String searchKeyword,
//	                                      Criteria cri, Model model) throws Exception {
//			int boardListCnt = memboarddao.boardListCnt();
//	        // 페이징 객체
//	        Paging paging = new Paging();
//	        // 검색 조건을 Criteria 객체에 설정
//	        cri.setSearchType(searchType);
//	        cri.setSearchKeyword(searchKeyword);
//	        
//	        paging.setCri(cri);
//	        paging.setTotalCount(boardListCnt);    
//	
//		    // 게시글 리스트를 가져오는 코드 등
//		    List<Map<String, Object>> list = memboarddao.memselect(cri);
//	        model.addAttribute("list", list);    
//	        model.addAttribute("paging", paging); 
//			return "member/board/Freeboard";
//		
//	}
	
	//검색어 있을때 처리
	@RequestMapping(value = "/searchmemberboard.do", method = RequestMethod.GET)
	public String searchMemberBoard(@RequestParam("searchType") String searchType,
			@RequestParam("searchKeyword") String searchKeyword,
			Criteria cri, Model model) throws Exception {
		if(searchKeyword != null) {
			int boardListCnt = memboarddao.boardListCnt1(cri);
	        // 페이징 객체
	        Paging paging = new Paging();
	        // 검색 조건을 Criteria 객체에 설정
	        cri.setSearchType(searchType);
	        cri.setSearchKeyword(searchKeyword);
	        paging.setCri(cri);
	        paging.setTotalCount(boardListCnt);    
		    // 게시글 리스트를 가져오는 코드 등
		    List<Map<String, Object>> list = memboarddao.memselect1(cri);
	        model.addAttribute("list", list);    
	        model.addAttribute("paging", paging);
		}
		return "member/board/Freeboard";
	}
	
	//게시글 상세보기
	@RequestMapping("/detailmemberboard.do")
	public String board2(HttpServletRequest req, Model model, HttpSession session) {
		//게시글상세보기 값저장
		String userEmail = (String) session.getAttribute("UserEmail");
		model.addAttribute("mem_id", userEmail);
		
		//로그인한 사용자 정보를 가져옴
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMem_id(userEmail);
		memberDTO = memberdao.selectinfo(memberDTO);
		model.addAttribute("mdto", memberDTO);
		System.out.println(memberDTO);
		
		//선택한 게시글 정보를 가져옴
		BoardDTO boardDTO = new BoardDTO();
		boardDTO = memboarddao.selectone(req.getParameter("board_idx"));
		System.out.println(boardDTO);
		model.addAttribute("dto", boardDTO);
		
		//댓글 목록을 가져옴
		boardDTO.setBoard_idx(boardDTO.getBoard_idx());
		List<BoardDTO> replyDTOList = memboarddao.selectreply(boardDTO);
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
		System.out.println(boardDTO);

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
	public String insertreply(BoardDTO boardDTO, HttpSession session,
			HttpServletRequest req, Model model) {
				
		List<BoardDTO> replyDTOList = memboarddao.selectreply(boardDTO);
		
		String board_idx = req.getParameter("board_idx");
		System.out.println(boardDTO);
		
		int result = memboarddao.insertreply(boardDTO);
		if(result==1)
		System.out.println("댓글 등록이 완료되었습니다.");
			
		return "redirect:/detailmemberboard.do?board_idx="+board_idx;
			
	}
	
	//댓글 삭제
	@RequestMapping("deletereply.do")
	public String delete(BoardDTO boardDTO, HttpServletRequest req) {
		
		String board_idx = req.getParameter("board_idx");
		System.out.println(board_idx);
		int result = memboarddao.deletereply(boardDTO);
		if(result==1)
		System.out.println("댓글삭제완료");
		return "redirect:/detailmemberboard.do?board_idx="+board_idx;
	}
	
	//댓글 수정 페이지 진입
	@RequestMapping(value="updatereply.do", method=RequestMethod.GET)
	public String updatereply(Model model, HttpServletRequest req) {
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO = memboarddao.selectone(req.getParameter("board_idx"));
		String board_idx = boardDTO.getBoard_idx();
		System.out.println(board_idx);
		
		List<BoardDTO> replyDTOList = memboarddao.selectreply(boardDTO);
		model.addAttribute("rdto", replyDTOList);
		System.out.println(replyDTOList);
		
		//현재 페이지에 머무르기 위해 board_idx,mem_id, dto정보 모델에 추가
		model.addAttribute("board_idx", board_idx);
		model.addAttribute("mem_id", req.getParameter("mem_id"));
		model.addAttribute("dto", boardDTO);
		
		//;
		return "redirect:detailmemberboard.do?board_idx="+ board_idx;
	}
			
	//댓글 수정
	@RequestMapping(value="updatereply.do", method=RequestMethod.POST)
	public String updatereply1(HttpServletRequest req, Model model) {
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO = memboarddao.selectone(req.getParameter("board_idx"));
		String board_idx = boardDTO.getBoard_idx();
		System.out.println(board_idx);
		
		boardDTO.setBoard_idx(boardDTO.getBoard_idx());
		boardDTO.setReply_idx(req.getParameter("reply_idx"));
		boardDTO.setBoard_idx(board_idx);
		boardDTO.setReply_cont(req.getParameter("reply_cont"));
		
		memboarddao.updatereply(boardDTO);
				
		return "redirect:/detailmemberboard.do?board_idx="+board_idx;
	}

	
}
