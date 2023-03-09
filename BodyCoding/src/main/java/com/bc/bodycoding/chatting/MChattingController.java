package com.bc.bodycoding.chatting;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.dto.ChatRoomDTO;

@Controller
public class MChattingController {
		
	List<ChatRoomDTO> roomList = new ArrayList<ChatRoomDTO>();
	/*for(ChatRoomDTO a : roomList) {
		a.getRoomName();
		a.getContent();
		a.getRoomNumber();
		a.getRegidate();
	}*/
	
	static int roomNumber = 0;
	
	
	@RequestMapping("/chat")
	public String chat(Model model, HttpServletRequest req) {
		model.addAttribute("membername", req.getParameter("mem_name"));
		return "chat";
	}
	
	/*방 페이지*/
	@RequestMapping("/room")
	public String room(Model model, HttpServletRequest req) {
		model.addAttribute("membername", req.getParameter("mem_name"));
		return "room";
	}
	
	/*방 생성하기*/
	@RequestMapping("/createRoom")
	public @ResponseBody List<ChatRoomDTO> createRoom(@RequestParam HashMap<Object, Object> params){
		String roomName = (String) params.get("roomName");
		if(roomName != null && !roomName.trim().equals("")) {
			ChatRoomDTO room = new ChatRoomDTO();
			room.setRoomNumber(++roomNumber);
			room.setRoomName(roomName);
			roomList.add(room);
		}
		return roomList;
	}
	
	/*방 정보가져오기*/
	@RequestMapping("/getRoom")
	public @ResponseBody List<ChatRoomDTO> getRoom(@RequestParam HashMap<Object, Object> params){
		return roomList;
	}
	
	/*채팅방*/
	@RequestMapping("/moveChating")
	public String chating(@RequestParam HashMap<Object, Object> params, Model model) {
		int roomNumber = Integer.parseInt((String) params.get("roomNumber"));
		List<ChatRoomDTO> new_list = roomList.stream().filter(o -> o.getRoomNumber() == roomNumber).collect(Collectors.toList());
		if (new_list != null && new_list.size() > 0) {
		    model.addAttribute("roomName", params.get("roomName"));
		    model.addAttribute("roomNumber", params.get("roomNumber"));
		    return "chat";
		} else {
	    return "room";
		}
	}
}
