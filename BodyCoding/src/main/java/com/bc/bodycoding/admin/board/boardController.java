package com.bc.bodycoding.admin.board;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import global.dto.BoardDTO;
import global.dto.GymDTO;
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
	//게시글에 답변(수정) 접근
	@RequestMapping("admin/board/boardEdit")
	public String boardE(BoardDTO boardDTO, Model model) {
		
		boardDTO = boarddao.selectOneBoard(boardDTO);
		model.addAttribute("board", boardDTO);
		
		return "admin/board/boardEdit";
	}
	//게시글 수정
	@RequestMapping("/boardEdit.do")
	public String boardEdit(Principal principal, MultipartFile board_file, MultipartHttpServletRequest req) {
		
		BoardDTO boardDTO = new BoardDTO();
	    String mem_id = principal.getName();
	    
	    System.out.println("수정하는 곳 : "+ mem_id);
	    
	    if (board_file.isEmpty()) {
			boardDTO.setBoard_file("");
		}
	    else {
	    	try {
	    		String origName = board_file.getOriginalFilename();
				String uuid = UUID.randomUUID().toString();
				String extension = origName.substring(origName.lastIndexOf("."));
				String savedName = uuid + extension;
				String path = ResourceUtils
						.getFile("classpath:static/uploads/board")
						.toPath().toString();
				
				System.out.println("파일업로드 경로:"+ path);
				
				File fileInfo = new File(path, savedName);
			
				board_file.transferTo(fileInfo);
				boardDTO.setBoard_file(savedName); //파일
				System.out.println("파일 업로드 성공");
			} 
	    	catch (Exception e) {
	    		e.printStackTrace();
				System.out.println("등록 실패했습니다.");
				return "redirect:/noticeInsert.do";
			}
	    }
	    
	    boardDTO.setBoard_idx(req.getParameter("board_idx")); //idx
	    boardDTO.setMem_id(mem_id); //작성자
	    boardDTO.setBoard_title(req.getParameter("board_title")); //제목
	    boardDTO.setBoard_contents(req.getParameter("board_contents")); //내용
	    
	    int result = boarddao.noticeEdit(boardDTO);
	    
	    if(result==1)
	    System.out.println("게시글이 수정되었습니다.");
	    
		return "redirect:/boardList.do";
	}
	
	
	//자유게시판 삭제하기
	@RequestMapping("/boardDelete.do")
	public String delete(BoardDTO boardDTO) {
		int result = boarddao.delete(boardDTO);
		if(result==1)
		System.out.println("삭제되었습니다.");
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
	
	//공지사항 삭제하기
		@RequestMapping("/noticeDelete.do")
		public String noticeDelete(BoardDTO boardDTO) {
			int result = boarddao.delete(boardDTO);
			if(result==1) System.out.println("삭제되었습니다.");
			return "redirect:noticeList.do";
		}
	
	//공지사항 작성 페이지로 이동
	@RequestMapping(value = "/noticeInsert.do", method = RequestMethod.GET)
	public String noticeIn(Model model, Principal principal) throws Exception {
		
		//작성할 놈 이름 받아오기!
		
		String mem_id = principal.getName();
		model.addAttribute("mem_id", mem_id);
		
		System.out.println("공지작성하기 위해 받아온 이름1 : " + mem_id);
		
		return "admin/board/noticeInsert";
	}
	
	//공지사항 작성
	@RequestMapping(value="/noticeInsert.do", method=RequestMethod.POST)
	public String noticeInsert(Principal principal, MultipartFile board_file, MultipartHttpServletRequest req) {
	    
		BoardDTO boardDTO = new BoardDTO();
	    String mem_id = principal.getName();
//	    boardDTO.setMem_id(mem_id);
	    
	    System.out.println("작성하는 곳에서 받는 이름2 : "+ mem_id);
	      
	    if (board_file.isEmpty()) {
			boardDTO.setBoard_file("");
		}
	    else {
	    	try {
	    		String origName = board_file.getOriginalFilename();
				String uuid = UUID.randomUUID().toString();
				String extension = origName.substring(origName.lastIndexOf("."));
				String savedName = uuid + extension;
				String path = ResourceUtils
						.getFile("classpath:static/uploads/board")
						.toPath().toString();
				
				System.out.println("파일업로드 경로:"+ path);
				
				File fileInfo = new File(path, savedName);
			
				board_file.transferTo(fileInfo);
				boardDTO.setBoard_file(savedName);
				System.out.println("파일 업로드 성공");
			} 
	    	catch (Exception e) {
	    		e.printStackTrace();
				System.out.println("등록 실패했습니다.");
				return "redirect:/noticeInsert.do";
			}
	    }
	    
	    boardDTO.setMem_id(mem_id);
	    boardDTO.setBoard_title(req.getParameter("board_title"));
	    boardDTO.setBoard_contents(req.getParameter("board_contents"));
	    
	    int result = boarddao.noticeInsert(boardDTO);
	    
	    if(result==1)
	    System.out.println("게시글 등록이 완료되었습니다.");
	         
	    return "redirect:/noticeList.do";
	}
	
	//공개 or 비공개 상태 변경
	@RequestMapping("/updateNoticeStatus.do")
	@ResponseBody
	public String updateNoticeStatus(BoardDTO boardDTO, HttpServletRequest req) {
		String board_idx = req.getParameter("board_idx");
		String closed_chk = req.getParameter("closed_chk");
		
		boardDTO.setBoard_idx(board_idx);
		boardDTO.setClosed_chk(closed_chk);
		
		int result = boarddao.updateNoticeStatus(boardDTO);
		if (result == 1) {
			System.out.println("check상태가 변경되었습니다.");
		}
		System.out.println(closed_chk);
		return "success";
	}
	
	//공지사항 수정 페이지 접근
	@RequestMapping("admin/board/noticeEdit")
	public String noticeE(BoardDTO boardDTO, Model model) {
		
		boardDTO = boarddao.selectOneBoard(boardDTO);
		model.addAttribute("board", boardDTO);
		
		return "admin/board/noticeEdit";
	}
	// 공지사항 수정
	@RequestMapping("/noticeEdit.do")
	public String noticeEdit(Principal principal, MultipartFile board_file, MultipartHttpServletRequest req) {
		
		BoardDTO boardDTO = new BoardDTO();
	    String mem_id = principal.getName();
	    
	    System.out.println("수정하는 곳 : "+ mem_id);
	    
	    if (board_file.isEmpty()) {
			boardDTO.setBoard_file("");
		}
	    else {
	    	try {
	    		String origName = board_file.getOriginalFilename();
				String uuid = UUID.randomUUID().toString();
				String extension = origName.substring(origName.lastIndexOf("."));
				String savedName = uuid + extension;
				String path = ResourceUtils
						.getFile("classpath:static/uploads/board")
						.toPath().toString();
				
				System.out.println("파일업로드 경로:"+ path);
				
				File fileInfo = new File(path, savedName);
			
				board_file.transferTo(fileInfo);
				boardDTO.setBoard_file(savedName); //파일
				System.out.println("파일 업로드 성공");
			} 
	    	catch (Exception e) {
	    		e.printStackTrace();
				System.out.println("등록 실패했습니다.");
				return "redirect:/noticeInsert.do";
			}
	    }
	    
	    boardDTO.setBoard_idx(req.getParameter("board_idx")); //idx
	    boardDTO.setMem_id(mem_id); //작성자
	    boardDTO.setBoard_title(req.getParameter("board_title")); //제목
	    boardDTO.setBoard_contents(req.getParameter("board_contents")); //내용
	    
	    int result = boarddao.noticeEdit(boardDTO);
	    
	    if(result==1)
	    System.out.println("게시글이 수정되었습니다.");
	    
		return "redirect:/noticeList.do";
	}

}












































