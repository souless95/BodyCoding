package com.bc.bodycoding.admin.board;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.Iterator;
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
	//게시글에 답변달기
	
	
	//자유게시판 삭제하기
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
//	@RequestMapping(value="/noticeInsert.do", method=RequestMethod.POST)
//	public String noticeInsert(BoardDTO boardDTO, Principal principal, MultipartFile board_file, MultipartHttpServletRequest req) {
//	      
//	    String mem_id = principal.getName();
//	    boardDTO.setMem_id(mem_id);
//	    
//	    System.out.println("작성하는 곳에서 받는 이름2 : "+ mem_id);
//	      
//	    int result = boarddao.noticeInsert(boardDTO);
//	    if(result==1)
//	    
//		System.out.println("DTO" + boardDTO);
//	    System.out.println("게시글 등록이 완료되었습니다.");
//	         
//	    return "redirect:/noticeList.do";
//	}
//	//공지사항 작성
	@RequestMapping(value="/noticeInsert.do", method=RequestMethod.POST)
	public String noticeInsert(BoardDTO boardDTO, Principal principal) {
		
		String mem_id = principal.getName();
		boardDTO.setMem_id(mem_id);
		
		System.out.println("작성하는 곳에서 받는 이름2 : "+ mem_id);
		
		int result = boarddao.noticeInsert(boardDTO);
		if(result==1)
			
			System.out.println("DTO" + boardDTO);
		System.out.println("게시글 등록이 완료되었습니다.");
		
		return "redirect:/noticeList.do";
	}
	
//	@RequestMapping(value = "/noticeInsert.do", method = RequestMethod.POST)
//	public String noticeInsert(MultipartFile[] uploadfiles, Model model, MultipartHttpServletRequest req, 
//								BoardDTO boardDTO, Principal principal) throws IOException, Exception {
//		
//		String mem_id = principal.getName();
//		boardDTO.setMem_id(mem_id);
//		
//		System.out.println("공지작성하기 위해 받아온 이름2 : " + mem_id);
//		
//		
//		
//		System.out.println("DTO" + boardDTO);
//		
//		try {
//			
//			int result = boarddao.noticeInsert(boardDTO);
//			
//			String board_img = "";
//			if (uploadfiles[0].isEmpty()) {
//				result = boarddao.noticeInsert(boardDTO);
//			}
//			else {
//				for (MultipartFile f : uploadfiles) {
//					System.out.println("파일 이름(uploadfile.getOriginalFilename()) : "+ f.getOriginalFilename());
//					System.out.println("파일 크기(uploadfile.getSize()) : "+ f.getSize());
//					board_img = saveFile(f) + ",";
//				}
//				board_img = board_img.substring(0, board_img.length()-1);
//				boardDTO.setBoard_file(board_img);
//				result = boarddao.noticeInsert(boardDTO);
//			}
//			
//			if (result == 1) {
//				System.out.println("공지사항이 작성되었습니다.");
//			}
//			else {
//				System.out.println("공지사항 작성에 문제가 생겼습니다.");
//			}
//		} 
//		catch (Exception e) {
//			System.out.println("1");
//			e.printStackTrace();
//		}
//		
//		return "redirect:/noticeList.do";
//	}
//	
//	public String saveFile(MultipartFile file) {
//		UUID uuid = UUID.randomUUID();
//		String saveName = uuid + "_" + file.getOriginalFilename();
//		
//		String path = "";
//		try {
//			path = ResourceUtils
//				.getFile("classpath:static/uploads/board/").toPath().toString();
//			System.out.println("물리적경로2:"+path);
//			File fileInfo = new File(path, saveName); // 저장할 폴더 경로, 저장할 파일 이름
//			file.transferTo(fileInfo); // 업로드 파일에 fileInfo이라는 정보를 추가하여 파일을 저장한다.
//		} 
//		catch (Exception e) {
//			e.printStackTrace();
//			System.out.println("1111");
//			return null;
//		}
//		return saveName;
//	} 
	
	//공지사항 수정
	
	
	
	

}
