package com.bc.bodycoding.main.chatting;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MChattingController {

	@RequestMapping(value="WebSocketM.do", method=RequestMethod.GET)
	public String websocket(HttpServletRequest req, Model model) {
		model.addAttribute("member", req.getParameter("mem_id"));
		return "member/ChatM/WebSocketM";
	}
	
	@RequestMapping(value="WebChatM.do", method=RequestMethod.GET)
	public String chatting(HttpServletRequest req, Model model) {
		model.addAttribute("member", req.getParameter("mem_id"));
		return "member/ChatM/WebChatM";
	}
	
	@RequestMapping(value="/ChaMt/02WebChatUIM.do", method=RequestMethod.GET)
	public String chatUI() {
		return "ChatM/02WebChatUIM";
	}
}
