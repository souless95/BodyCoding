package com.bc.bodycoding.chatting;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.dto.ChatRoomDTO;
import global.dto.MemberDTO;

@Controller
public class ChattingController {
	
	@Autowired
	chatService chattingdao;
	
	List<ChatRoomDTO> roomList = new ArrayList<ChatRoomDTO>();
	
	static int roomidx = 0;
	
	@ResponseBody
	@RequestMapping("/saveChatLog")
	public String savedb(ChatRoomDTO chatRoomDTO) {
		chattingdao.insertchat(chatRoomDTO);
		System.out.println("성공성공?");
		return "";
	}
	
	@RequestMapping("/chat")
	public String chat(Model model, HttpServletRequest req) {
		model.addAttribute("memberid", req.getParameter("mem_id"));
		model.addAttribute("roomName", req.getParameter("roomName"));
		model.addAttribute("roomidx", req.getParameter("roomidx"));
		return "chatting/chat";
	}
	
	/*방 페이지*/
	@RequestMapping("/room")
	public String room(Model model, HttpServletRequest req, Principal principal, MemberDTO memberDTO) {
		String mem_id = principal.getName();
		memberDTO = chattingdao.selectName(mem_id);
		if(req.getParameter("mtype")!=null) {			
			model.addAttribute("memberid", mem_id);
			model.addAttribute("membername", memberDTO.getMem_name());
			System.out.println("너의 이름은!!!!!!!"+memberDTO.getMem_name());
		}
		else {			
			model.addAttribute("memberid", req.getParameter("mem_id"));
		}
		return "chatting/room";
	}
	
	/*방 생성하기*/
	@RequestMapping("/createRoom")
	public @ResponseBody List<ChatRoomDTO> createRoom(@RequestParam HashMap<Object, Object> params){
		String roomName = (String) params.get("roomName");
		if(roomName != null && !roomName.trim().equals("")) {
			ChatRoomDTO room = new ChatRoomDTO();
			room.setRoomidx(++roomidx);
			room.setRoomName(roomName);
			roomList.add(room);
		}
		return roomList;
	}
	
	/*방 정보가져오기*/
	@RequestMapping("/getRoom")
	public @ResponseBody List<ChatRoomDTO> getRoom(@RequestParam HashMap<Object, Object> params, Model model){
		roomList = chattingdao.selectmemid(params.get("mem_id").toString());
		return roomList;
	}
	
	/*채팅방*/
	@RequestMapping("/moveChating")
	public String chating(@RequestParam HashMap<Object, Object> params, Model model) {
		System.out.println("채팅방 DB 여기서 불러옴?");
		
		List<ChatRoomDTO> cList = new ArrayList<>();
		cList = chattingdao.selectroom(params.get("roomName").toString());
		System.out.println("방 내용"+cList);
	    model.addAttribute("roomName", params.get("roomName"));
	    model.addAttribute("roomidx", params.get("roomidx"));
	    model.addAttribute("memberid", params.get("mem_id"));
	    model.addAttribute("membername", params.get("mem_name"));
	    System.err.println("현재 나의 id?"+params.get("mem_id"));
	    System.err.println("현재 나의 name?"+params.get("mem_name"));
	    model.addAttribute("cList",cList);
	    return "chatting/chat";
	}
}
