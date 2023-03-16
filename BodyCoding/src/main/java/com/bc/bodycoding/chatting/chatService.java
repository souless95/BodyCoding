package com.bc.bodycoding.chatting;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import global.dto.ChatRoomDTO;

@Mapper
public interface chatService {
	
	public int insertchat(ChatRoomDTO chatRoomDTO);
	public List<ChatRoomDTO> selectmemid(String send_id);
	public List<ChatRoomDTO> selectALL();
	/* public HashMap<String, ChatRoomDTO> selectroom(String roomname); */
	public List<ChatRoomDTO> selectroom(String roomname);
	
}
