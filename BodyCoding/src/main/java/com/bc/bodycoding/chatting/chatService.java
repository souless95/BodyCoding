package com.bc.bodycoding.chatting;

import org.apache.ibatis.annotations.Mapper;

import global.dto.ChatRoomDTO;

@Mapper
public interface chatService {
	
	public int insertchat(ChatRoomDTO chatRoomDTO);
}
