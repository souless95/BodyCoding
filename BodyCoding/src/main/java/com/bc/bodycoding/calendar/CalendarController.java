package com.bc.bodycoding.calendar;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CalendarController {
	
	@Autowired
	CalendarService calendarDAO;
	
	@ResponseBody
	@RequestMapping("/AddCalendar")
	public String addCalendar(HttpServletRequest req, CalendarDTO calendarDTO){
		
		calendarDTO.setTitle(req.getParameter("title"));
		calendarDTO.setStart1(req.getParameter("start"));
		System.out.println(req.getParameter("start"));
		
		int result = calendarDAO.insertSchedule(calendarDTO);
		if(result==1) {
	         System.out.println("업데이트 성공!");
		}
		return "calendar.do";
	}
}
