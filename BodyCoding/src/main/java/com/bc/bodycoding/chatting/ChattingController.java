package com.bc.bodycoding.chatting;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ChattingController {

	@RequestMapping(value="/Chat/WebSocket.do", method=RequestMethod.GET)
	public String websocket(HttpServletRequest req, Model model) {
		model.addAttribute("member", req.getParameter("mem_id"));
		return "Chat/WebSocket";
	}
	
	@RequestMapping(value="/Chat/WebChat.do", method=RequestMethod.GET)
	public String chatting(HttpServletRequest req, Model model) {
		model.addAttribute("member", req.getParameter("mem_id"));
		return "Chat/WebChat";
	}
	
	@RequestMapping(value="/Chat/02WebChatUI.do", method=RequestMethod.GET)
	public String chatUI() {
		return "Chat/02WebChatUI";
	}
}
