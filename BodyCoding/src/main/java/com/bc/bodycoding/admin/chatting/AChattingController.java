package com.bc.bodycoding.admin.chatting;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AChattingController {

	@RequestMapping(value="WebSocketA.do", method=RequestMethod.GET)
	public String websocket() {
		return "admin/ChatA/WebSocketA";
	}
	
	@RequestMapping(value="WebChatA.do")
	public ModelAndView chatting(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView("/admin/ChatA/WebChatA");
		return mav;
	}
	
}
