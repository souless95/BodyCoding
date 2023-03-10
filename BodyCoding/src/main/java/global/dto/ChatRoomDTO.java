package global.dto;


import lombok.Data;

@Data
public class ChatRoomDTO {

	private int roomNumber;
	private String roomName;
	private String mem_name;
	private String admin_name;
	private String content;
	
	@Override
	public String toString() {
		return "Room [roomNumber=" + roomNumber + ", roomName=" + roomName + "]";
	}
}
