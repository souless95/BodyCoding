package global.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ChatRoomDTO {

	private int roomNumber;
	private String roomName;
	private String mem_name;
	private String content;
	private Date regidate;
	
	@Override
	public String toString() {
		return "Room [roomNumber=" + roomNumber + ", roomName=" + roomName + "]";
	}
}
