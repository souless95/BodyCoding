package global.dto;


import lombok.Data;

@Data
public class ChatRoomDTO {

	private int roomidx;
	private String roomName;
	private String send_id;
	private String content;
	private String regidate;
}
